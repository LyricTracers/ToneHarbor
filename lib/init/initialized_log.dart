part of "initialized.dart";

class LogEntry {
  final DateTime timestamp;
  final Level level;
  final String message;

  LogEntry({
    required this.timestamp,
    required this.level,
    required this.message,
  });
}

class MemoryLogOutput extends LogOutput {
  final _logController = StreamController<LogEntry>.broadcast();

  Stream<LogEntry> get stream => _logController.stream;

  @override
  void output(OutputEvent event) {
    final entry = LogEntry(
      timestamp: DateTime.now(),
      level: event.level,
      message: event.origin.message.toString(),
    );

    _logController.add(entry);
  }

  @override
  Future<void> destroy() async {
    await _logController.close();
    await super.destroy();
  }
}

late final MemoryLogOutput memoryLogOutput;

Future<List<LogEntry>> readLogFile() async {
  final filePath = await getLogFilePath();
  final file = File(filePath);
  if (!await file.exists()) {
    return [];
  }

  final lines = await file.readAsLines();
  final logPattern = RegExp(
    r'^\[(\d+)-(\d+)-(\d+)\s*\|\s*(\d+):(\d+):(\d+)\]\s*(.*)$',
  );

  return lines.map((line) {
    final match = logPattern.firstMatch(line);
    if (match != null) {
      final day = int.parse(match.group(1)!);
      final month = int.parse(match.group(2)!);
      final year = int.parse(match.group(3)!);
      final hour = int.parse(match.group(4)!);
      final minute = int.parse(match.group(5)!);
      final second = int.parse(match.group(6)!);
      final rawMessage = match.group(7)!;

      final timestamp = DateTime(year, month, day, hour, minute, second);

      Level level = Level.info;
      String message = rawMessage;

      final levelPattern = RegExp(r'^\[([TDIWEF])\]\s*');
      final levelMatch = levelPattern.firstMatch(rawMessage);
      if (levelMatch != null) {
        final levelChar = levelMatch.group(1)!;
        level = switch (levelChar) {
          'T' => Level.trace,
          'D' => Level.debug,
          'I' => Level.info,
          'W' => Level.warning,
          'E' => Level.error,
          'F' => Level.fatal,
          _ => Level.info,
        };
        message = rawMessage.substring(levelMatch.end);
      }

      return LogEntry(timestamp: timestamp, level: level, message: message);
    }
    return LogEntry(
      timestamp: DateTime.now(),
      level: Level.info,
      message: line,
    );
  }).toList();
}

class LoggingInterceptor extends Interceptor {
  final Logger? logger;

  LoggingInterceptor({this.logger});
  @override
  Future<InterceptorResult<HttpRequest>> beforeRequest(
    HttpRequest request,
  ) async {
    logger?.i("【beforeRequest】【URL】:${request.url}");

    if (request.body != null) {
      switch (request.body!) {
        case HttpBodyText bodyText:
          logger?.i("【Request Body】${bodyText.text}");
          break;
        case HttpBodyForm bodyForm:
          logger?.i(
            "【Request Body】${bodyForm.form.entries.map((entry) => '${entry.key}=${entry.value}').join('&')}",
          );
          break;
        case HttpBodyJson bodyJson:
          logger?.i("【Request Body】${bodyJson.json}");
          break;
        default:
      }
    }
    logger?.i(
      "【Headers】:${request.headers?.toMapList().entries.map((entry) => '${entry.key}=${entry.value.join(' ')}').join('&')}",
    );
    return Interceptor.next();
  }

  @override
  Future<InterceptorResult<HttpResponse>> afterResponse(
    HttpResponse response,
  ) async {
    var message =
        "【afterResponse】url:${response.request.url},statusCode:${response.statusCode}";
    if (response.statusCode >= 400) {
      logger?.e(message);
    } else {
      logger?.i(message);
    }

    switch (response) {
      case HttpTextResponse textResponse:
        final body = textResponse.body;
        if (body.isNotEmpty) {
          final preview = body.length > 200 ? body.substring(0, 200) : body;
          logger?.i("Body length:${body.length}, body:$preview");
        }
        break;
      default:
    }
    return Interceptor.next();
  }
}

class FileLogOutput extends LogOutput {
  late String logFilePath;
  late IOSink _sink;
  final _logQueue = <String>[];
  final _lock = Lock();
  bool _initialized = false;
  bool _isProcessing = false;

  @override
  Future<void> init() async {
    logFilePath = await getLogFilePath();
    debugPrint("logFilePath = $logFilePath");
    final File file = File(logFilePath);
    if (await file.exists()) {
      await file.delete();
    }
    _sink = file.openWrite(mode: FileMode.append);
    _initialized = true;
    return super.init();
  }

  @override
  void output(OutputEvent event) async {
    final DateTime currentDate = DateTime.now();
    final String dateString =
        "${currentDate.day}-${currentDate.month}-${currentDate.year}";

    final levelPrefix = switch (event.level) {
      Level.trace => '[T]',
      Level.debug => '[D]',
      Level.info => '[I]',
      Level.warning => '[W]',
      Level.error => '[E]',
      Level.fatal => '[F]',
      _ => '[?]',
    };

    final logLine =
        "[$dateString | ${currentDate.hour}:${currentDate.minute}:${currentDate.second}] $levelPrefix ${event.origin.message}";

    await _lock.synchronized(() {
      _logQueue.add(logLine);
    });

    _processQueue();
  }

  Future<void> _processQueue() async {
    if (_isProcessing) {
      return;
    }

    await _lock.synchronized(() async {
      if (_isProcessing || _logQueue.isEmpty) {
        return;
      }
      _isProcessing = true;
    });

    try {
      while (true) {
        String? logLine;
        await _lock.synchronized(() {
          if (_logQueue.isNotEmpty) {
            logLine = _logQueue.removeAt(0);
          }
        });

        if (logLine == null) {
          break;
        }

        _sink.writeln(logLine);
      }

      await _sink.flush();
    } finally {
      await _lock.synchronized(() {
        _isProcessing = false;
      });
    }
  }

  @override
  Future<void> destroy() async {
    await _processQueue();
    await _lock.synchronized(() async {
      if (_initialized) {
        await _sink.close();
        _initialized = false;
      }
    });
    await super.destroy();
  }
}

class ShowLogFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return true;
  }
}

late final Logger logger;
void initLogger() {
  memoryLogOutput = MemoryLogOutput();
  logger = Logger(
    filter: ShowLogFilter(),
    level: Level.all,
    output: MultiOutput([ConsoleOutput(), FileLogOutput(), memoryLogOutput]),
    printer: HybridPrinter(
      SimplePrinter(colors: true, printTime: true),
      warning: PrettyPrinter(),
      error: PrettyPrinter(),
      fatal: PrettyPrinter(),
    ),
  );
}

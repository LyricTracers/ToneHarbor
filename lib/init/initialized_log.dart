part of "initialized.dart";

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

    final logLine =
        "[$dateString | ${currentDate.hour}:${currentDate.minute}:${currentDate.second}] ${event.origin.message}";

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

late final Logger logger;
void initLogger() {
  logger = Logger(
    level: Level.all,
    output: MultiOutput([ConsoleOutput(), FileLogOutput()]),
    printer: HybridPrinter(
      SimplePrinter(colors: true, printTime: true),
      warning: PrettyPrinter(),
      error: PrettyPrinter(),
      fatal: PrettyPrinter(),
    ),
  );
}

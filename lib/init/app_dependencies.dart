import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lyricskit/lyricskit.dart';
import 'package:logger/logger.dart';
import 'package:metadata_god/metadata_god.dart';
import 'package:toneharbor/utils/base_utils.dart';
import 'package:toneharbor/init/initialized.dart';

class AppDependencies {
  static final AppDependencies _instance = AppDependencies._internal();

  factory AppDependencies() => _instance;

  AppDependencies._internal();

  final logger = Logger();

  ColorScheme? _defaultColorScheme;
  ImageProvider? _defaultSongIconProvider;
  HttpClientWrapper? _httpClientWrapper;
  HttpClientWrapper? _downloadHttpClientWrapper;
  HttpClientWrapper? _coverDownloadHttpClientWrapper;
  HttpClientWrapper? _translateHttpClientWrapper;
  PersistentApiCache<Map<String, dynamic>>? _audioStationRequestCache;
  PersistentApiCache<Map<String, dynamic>>? _lyricCache;
  String? _placeholderErrorIconString;

  ColorScheme get defaultColorScheme {
    return _defaultColorScheme ??= _initDefaultColorScheme();
  }

  ImageProvider get defaultSongIconProvider {
    return _defaultSongIconProvider ??= const AssetImage(bgPlaceholder);
  }

  HttpClientWrapper get httpClientWrapper {
    return _httpClientWrapper ??= _initHttpClientWrapper();
  }

  HttpClientWrapper get downloadHttpClientWrapper {
    return _downloadHttpClientWrapper ??= _initDownloadHttpClientWrapper();
  }

  HttpClientWrapper get coverDownloadHttpClientWrapper {
    return _coverDownloadHttpClientWrapper ??=
        _initCoverDownloadHttpClientWrapper();
  }

  HttpClientWrapper get translateHttpClientWrapper {
    return _translateHttpClientWrapper ??= _initTranslateHttpClientWrapper();
  }

  PersistentApiCache<Map<String, dynamic>> get audioStationRequestCache {
    return _audioStationRequestCache ??= _initAudioStationRequestCache();
  }

  PersistentApiCache<Map<String, dynamic>> get lyricCache {
    return _lyricCache ??= _initLyricCache();
  }

  String get placeholderErrorIconString {
    return _placeholderErrorIconString ??= '';
  }

  Future<void> initColorScheme() async {
    _defaultSongIconProvider = const AssetImage(bgPlaceholder);
    _defaultColorScheme = await FrostedColorSchemeGenerator.generate(
      imageProvider: _defaultSongIconProvider!,
      schemeVariant: DynamicSchemeVariant.rainbow,
      contrastLevel: 0,
    );
  }

  Future<void> initPlaceholderErrorIconString() async {
    _placeholderErrorIconString = await rootBundle.loadString(
      placeholderErrorIcon,
    );
  }

  ColorScheme _initDefaultColorScheme() {
    return _defaultColorScheme ??= const ColorScheme.light();
  }

  HttpClientWrapper _initHttpClientWrapper() {
    return HttpClientWrapper(
      settings: const ClientSettings(
        timeoutSettings: TimeoutSettings(
          timeout: Duration(seconds: 60),
          connectTimeout: Duration(seconds: 15),
        ),
      ),
      retryInterceptor: RetryInterceptor(
        maxRetries: 3,
        delay: (attempt) => Duration(milliseconds: 500 * (attempt + 1)),
        beforeRetry: (attempt, request, response, exception) async {
          logger.w('after【Retrying $attempt count】 throw $exception');
          return request;
        },
      ),
      loggingInterceptor: LoggingInterceptor(logger: logger),
    );
  }

  HttpClientWrapper _initDownloadHttpClientWrapper() {
    return HttpClientWrapper(
      settings: const ClientSettings(
        timeoutSettings: TimeoutSettings(
          timeout: Duration(minutes: 30),
          connectTimeout: Duration(seconds: 30),
        ),
      ),
      retryInterceptor: RetryInterceptor(maxRetries: 0),
      loggingInterceptor: LoggingInterceptor(logger: logger),
    );
  }

  HttpClientWrapper _initCoverDownloadHttpClientWrapper() {
    return HttpClientWrapper(
      settings: const ClientSettings(
        timeoutSettings: TimeoutSettings(
          timeout: Duration(minutes: 1),
          connectTimeout: Duration(seconds: 30),
        ),
      ),
      retryInterceptor: RetryInterceptor(maxRetries: 1),
    );
  }

  HttpClientWrapper _initTranslateHttpClientWrapper() {
    return HttpClientWrapper(
      settings: const ClientSettings(
        timeoutSettings: TimeoutSettings(
          timeout: Duration(minutes: 5),
          connectTimeout: Duration(seconds: 30),
        ),
      ),
      retryInterceptor: RetryInterceptor(maxRetries: 0),
      loggingInterceptor: LoggingInterceptor(logger: logger),
    );
  }

  PersistentApiCache<Map<String, dynamic>> _initAudioStationRequestCache() {
    return PersistentApiCache<Map<String, dynamic>>(
      'audio_station_api',
      options: const CacheOptions(
        enabled: true,
        defaultDuration: Duration(minutes: 30),
      ),
    );
  }

  PersistentApiCache<Map<String, dynamic>> _initLyricCache() {
    return PersistentApiCache<Map<String, dynamic>>(
      'lyrics_cache',
      options: const CacheOptions(
        enabled: true,
        defaultDuration: Duration(days: 365),
      ),
      backend: CacheStorageBackend.file,
    );
  }
}

final appDependencies = AppDependencies();

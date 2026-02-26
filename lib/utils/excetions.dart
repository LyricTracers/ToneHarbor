class AudioStationException implements Exception {
  final String message;
  final int? statusCode;
  final dynamic originalError;
  final bool needRelogin;

  AudioStationException({
    required this.message,
    this.statusCode,
    this.originalError,
    this.needRelogin = false,
  });

  @override
  String toString() {
    if (statusCode != null) {
      return 'AudioStationException: $message (状态码: $statusCode)';
    }
    return 'AudioStationException: $message';
  }
}

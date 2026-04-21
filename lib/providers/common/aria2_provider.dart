import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'dart:convert';
import 'package:rhttp/rhttp.dart' as rhttp;
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';
import 'package:toneharbor/services/cloud_music/song_url.dart';
part 'aria2_provider.g.dart';

@riverpod
class Aria2Enabled extends _$Aria2Enabled {
  @override
  bool build() {
    return SharedPreferencesUtils.getAria2Enabled();
  }

  Future<void> setEnabled(bool value) async {
    state = value;
    await SharedPreferencesUtils.setAria2Enabled(value);
  }
}

@riverpod
class Aria2Host extends _$Aria2Host {
  @override
  String build() {
    return SharedPreferencesUtils.getAria2Host();
  }

  Future<void> setHost(String value) async {
    state = value;
    await SharedPreferencesUtils.setAria2Host(value);
  }
}

@riverpod
class Aria2Port extends _$Aria2Port {
  @override
  int build() {
    return SharedPreferencesUtils.getAria2Port();
  }

  Future<void> setPort(int value) async {
    state = value;
    await SharedPreferencesUtils.setAria2Port(value);
  }
}

@riverpod
class Aria2Secret extends _$Aria2Secret {
  @override
  String? build() {
    return SharedPreferencesUtils.getAria2Secret();
  }

  Future<void> setSecret(String? value) async {
    state = value;
    await SharedPreferencesUtils.setAria2Secret(value);
  }
}

@riverpod
class Aria2UseHttps extends _$Aria2UseHttps {
  @override
  bool build() {
    return SharedPreferencesUtils.getAria2UseHttps();
  }

  Future<void> setUseHttps(bool value) async {
    state = value;
    await SharedPreferencesUtils.setAria2UseHttps(value);
  }
}

@riverpod
class Aria2DownloadDir extends _$Aria2DownloadDir {
  @override
  String? build() {
    return SharedPreferencesUtils.getAria2DownloadDir();
  }

  Future<void> setDownloadDir(String? value) async {
    state = value;
    await SharedPreferencesUtils.setAria2DownloadDir(value);
  }
}

@riverpod
class Aria2Client extends _$Aria2Client {
  late String host;
  late int port;
  late String? secret;
  late bool useHttps;

  String get _baseUrl {
    final scheme = useHttps ? 'https' : 'http';
    return '$scheme://$host:$port/jsonrpc';
  }

  @override
  void build() {
    ref.keepAliveFor(Duration(minutes: 2));
    host = ref.watch(aria2HostProvider);
    port = ref.watch(aria2PortProvider);
    secret = ref.watch(aria2SecretProvider);
    useHttps = ref.watch(aria2UseHttpsProvider);
  }

  Future<Map<String, dynamic>> _request(
    String method,
    List<dynamic> params,
  ) async {
    final payload = jsonEncode({
      'jsonrpc': '2.0',
      'id': DateTime.now().millisecondsSinceEpoch,
      'method': method,
      'params': secret != null ? ['token:$secret', ...params] : params,
    });

    logger.d('Aria2 request: $method, url: $_baseUrl, payload: $payload');

    try {
      final response = await httpClientWrapper.post(
        _baseUrl,
        headers: rhttp.HttpHeaders.rawMap({'Content-Type': 'application/json'}),
        body: rhttp.HttpBody.text(payload),
      );

      if (response.statusCode != 200) {
        throw Exception('Aria2 request failed: ${response.statusCode}');
      }

      final result = jsonDecode(response.body) as Map<String, dynamic>;
      if (result.containsKey('error')) {
        throw Exception('Aria2 error: ${result['error']['message']}');
      }

      return result;
    } catch (e) {
      logger.e('Aria2 request error: $e');
      rethrow;
    }
  }

  Future<(bool, String)> addDownloadTask(
    ToneHarborTrackObjectCloudMusic track,
  ) async {
    final cloudMusicSongUrlData = await getSongUrl(
      ref,
      songId: int.parse(track.id),
      quality: CloudMusicQuality.lossless,
    );
    if (cloudMusicSongUrlData == null) {
      return (false, 'Failed to get song URL');
    }
    return await _addUri(
      cloudMusicSongUrlData.url,
      savePath: ref.read(aria2DownloadDirProvider),
      fileName:
          '${track.artist.replaceAll('/', '.')}_${track.title}.${cloudMusicSongUrlData.fileExtension}',
    );
  }

  Future<(bool, String)> _addUri(
    String url, {
    String? savePath,
    String? fileName,
    Map<String, String>? headers,
  }) async {
    if (url.isEmpty) {
      return (false, 'URL cannot be empty');
    }

    try {
      final options = <String, dynamic>{};
      if (savePath != null && savePath.isNotEmpty) {
        options['dir'] = savePath;
      }
      if (fileName != null && fileName.isNotEmpty) {
        options['out'] = fileName;
      }
      if (headers != null && headers.isNotEmpty) {
        options['header'] = headers.entries
            .map((e) => '${e.key}: ${e.value}')
            .toList();
      }

      final params = [
        [url],
        options.isNotEmpty ? options : null,
      ].where((e) => e != null).toList();

      final result = await _request('aria2.addUri', params);
      final gid = result['result'] as String;
      return (
        true,
        'Download task[$fileName] added successfully with gid $gid',
      );
    } catch (e) {
      logger.e('Aria2 addUri error: $e');
      return (false, e.toString());
    }
  }

  Future<Map<String, dynamic>> getStatus(String gid) async {
    final result = await _request('aria2.tellStatus', [gid]);
    return result['result'] as Map<String, dynamic>;
  }

  Future<List<Map<String, dynamic>>> getAllActive() async {
    final result = await _request('aria2.tellActive', []);
    final active = result['result'] as List<dynamic>;
    return active.cast<Map<String, dynamic>>();
  }

  Future<(bool, String)> testConnection() async {
    try {
      final result = await _request('aria2.getVersion', []);
      logger.d('Aria2 getVersion result: $result');

      final version = result['result']?['version'] ?? 'unknown';
      return (true, 'Connected to Aria2 $version');
    } catch (e) {
      final errorMsg = e.toString();
      return (false, 'Connection failed: $errorMsg');
    }
  }
}

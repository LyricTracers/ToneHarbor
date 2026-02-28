import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_utils.dart';
import 'package:toneharbor/widgets/base_bg_layout.dart';

class TestLayout extends BaseBgLayout {
  const TestLayout({super.key});

  @override
  Widget buildContent(BuildContext context, WidgetRef ref, bool requestFlag) {
    final requestHistory = useState<List<Map<String, dynamic>>>([]);

    void addRequest(Map<String, dynamic> request) {
      requestHistory.value = [request, ...requestHistory.value];
    }

    void updateRequest({
      required String requestId,
      required String status,
      required String response,
    }) {
      requestHistory.value = requestHistory.value.map((req) {
        if (req['id'] == requestId) {
          return {...req, 'status': status, 'response': response};
        }
        return req;
      }).toList();
    }

    String formatErrorMessage(dynamic error) {
      if (error is AudioStationException) {
        return '错误码: ${error.statusCode ?? '未知'}\n错误信息: ${error.message}';
      }
      return error.toString();
    }

    Future<void> handleGetSongs() async {
      final requestId = DateTime.now().millisecondsSinceEpoch.toString();
      addRequest({
        'id': requestId,
        'name': '获取歌曲列表',
        'url': 'N/A',
        'method': 'POST',
        'status': 'loading',
        'response': '请求中...',
        'timestamp': DateTime.now(),
      });

      try {
        final result = await ref.read(songsProvider().future);
        updateRequest(
          requestId: requestId,
          status: 'success',
          response: '获取成功，歌曲数量: ${result.data?.total ?? 0}',
        );
      } catch (e) {
        final errorMessage = formatErrorMessage(e);
        updateRequest(
          requestId: requestId,
          status: 'error',
          response: errorMessage,
        );
      }
    }

    Future<void> handleGetRandomSongs() async {
      final requestId = DateTime.now().millisecondsSinceEpoch.toString();
      addRequest({
        'id': requestId,
        'name': '获取随机歌曲',
        'url': 'N/A',
        'method': 'POST',
        'status': 'loading',
        'response': '请求中...',
        'timestamp': DateTime.now(),
      });

      try {
        final result = await ref.read(randomSongsProvider().future);
        updateRequest(
          requestId: requestId,
          status: 'success',
          response: '获取成功，歌曲数量: ${result.data?.total ?? 0}',
        );
      } catch (e) {
        final errorMessage = formatErrorMessage(e);
        updateRequest(
          requestId: requestId,
          status: 'error',
          response: errorMessage,
        );
      }
    }

    Future<void> handleGetLyrics() async {
      final requestId = DateTime.now().millisecondsSinceEpoch.toString();
      addRequest({
        'id': requestId,
        'name': '获取歌词',
        'url': 'N/A',
        'method': 'POST',
        'status': 'loading',
        'response': '请求中...',
        'timestamp': DateTime.now(),
      });

      try {
        final result = await ref.read(
          lyricsProvider(id: 'music_785331').future,
        );
        updateRequest(
          requestId: requestId,
          status: 'success',
          response: '获取成功，歌词长度: ${result.data?.lyrics.length ?? 0}',
        );
      } catch (e) {
        final errorMessage = formatErrorMessage(e);
        updateRequest(
          requestId: requestId,
          status: 'error',
          response: errorMessage,
        );
      }
    }

    Future<void> handleSearchLyrics() async {
      final requestId = DateTime.now().millisecondsSinceEpoch.toString();
      addRequest({
        'id': requestId,
        'name': '搜索歌词',
        'url': 'N/A',
        'method': 'POST',
        'status': 'loading',
        'response': '请求中...',
        'timestamp': DateTime.now(),
      });

      try {
        final result = await ref.read(
          searchLyricsProvider(
            title: 'Dive',
            artist: 'Ed Sheeran',
            limit: 10,
          ).future,
        );
        updateRequest(
          requestId: requestId,
          status: 'success',
          response: '搜索成功，找到 ${result.data?.lyrics.length ?? 0} 条结果',
        );
      } catch (e) {
        final errorMessage = formatErrorMessage(e);
        updateRequest(
          requestId: requestId,
          status: 'error',
          response: errorMessage,
        );
      }
    }

    Future<void> handleGetSongInfo() async {
      final requestId = DateTime.now().millisecondsSinceEpoch.toString();
      addRequest({
        'id': requestId,
        'name': '获取歌曲信息',
        'url': 'N/A',
        'method': 'POST',
        'status': 'loading',
        'response': '请求中...',
        'timestamp': DateTime.now(),
      });

      try {
        final result = await ref.read(
          songInfoProvider(id: 'music_785331').future,
        );
        updateRequest(
          requestId: requestId,
          status: 'success',
          response:
              '获取成功，歌曲: ${result.data.songs.isNotEmpty == true ? result.data.songs.first.title : '未知'}',
        );
      } catch (e) {
        final errorMessage = formatErrorMessage(e);
        updateRequest(
          requestId: requestId,
          status: 'error',
          response: errorMessage,
        );
      }
    }

    Future<void> handleSetRating() async {
      final requestId = DateTime.now().millisecondsSinceEpoch.toString();
      addRequest({
        'id': requestId,
        'name': '设置评分（喜欢）',
        'url': 'N/A',
        'method': 'POST',
        'status': 'loading',
        'response': '请求中...',
        'timestamp': DateTime.now(),
      });

      try {
        await setRating(ref: ref, id: 'music_785331', rating: 5);
        updateRequest(
          requestId: requestId,
          status: 'success',
          response: '设置成功',
        );
      } catch (e) {
        final errorMessage = formatErrorMessage(e);
        updateRequest(
          requestId: requestId,
          status: 'error',
          response: errorMessage,
        );
      }
    }

    Future<void> handleGetFolders() async {
      final requestId = DateTime.now().millisecondsSinceEpoch.toString();
      addRequest({
        'id': requestId,
        'name': '获取文件夹列表',
        'url': 'N/A',
        'method': 'POST',
        'status': 'loading',
        'response': '请求中...',
        'timestamp': DateTime.now(),
      });

      try {
        final result = await ref.read(foldersProvider().future);
        updateRequest(
          requestId: requestId,
          status: 'success',
          response: '获取成功，文件夹数量: ${result.data?.items.length ?? 0}',
        );
      } catch (e) {
        final errorMessage = formatErrorMessage(e);
        updateRequest(
          requestId: requestId,
          status: 'error',
          response: errorMessage,
        );
      }
    }

    Future<void> handleGetAlbums() async {
      final requestId = DateTime.now().millisecondsSinceEpoch.toString();
      addRequest({
        'id': requestId,
        'name': '获取专辑列表',
        'url': 'N/A',
        'method': 'POST',
        'status': 'loading',
        'response': '请求中...',
        'timestamp': DateTime.now(),
      });

      try {
        final result = await ref.read(albumsProvider().future);
        updateRequest(
          requestId: requestId,
          status: 'success',
          response: '获取成功，专辑数量: ${result.data?.albums?.length ?? 0}',
        );
      } catch (e) {
        final errorMessage = formatErrorMessage(e);
        updateRequest(
          requestId: requestId,
          status: 'error',
          response: errorMessage,
        );
      }
    }

    Future<void> handleGetRecentAlbums() async {
      final requestId = DateTime.now().millisecondsSinceEpoch.toString();
      addRequest({
        'id': requestId,
        'name': '获取最近专辑',
        'url': 'N/A',
        'method': 'POST',
        'status': 'loading',
        'response': '请求中...',
        'timestamp': DateTime.now(),
      });

      try {
        final result = await ref.read(recentAlbumsProvider().future);
        updateRequest(
          requestId: requestId,
          status: 'success',
          response: '获取成功，专辑数量: ${result.data?.albums?.length ?? 0}',
        );
      } catch (e) {
        final errorMessage = formatErrorMessage(e);
        updateRequest(
          requestId: requestId,
          status: 'error',
          response: errorMessage,
        );
      }
    }

    Future<void> handleSearchAlbums() async {
      final requestId = DateTime.now().millisecondsSinceEpoch.toString();
      addRequest({
        'id': requestId,
        'name': '搜索专辑',
        'url': 'N/A',
        'method': 'POST',
        'status': 'loading',
        'response': '请求中...',
        'timestamp': DateTime.now(),
      });

      try {
        final result = await ref.read(
          searchAlbumsProvider(filter: 'Test', limit: 10).future,
        );
        updateRequest(
          requestId: requestId,
          status: 'success',
          response: '搜索成功，找到 ${result.data?.albums?.length ?? 0} 条结果',
        );
      } catch (e) {
        final errorMessage = formatErrorMessage(e);
        updateRequest(
          requestId: requestId,
          status: 'error',
          response: errorMessage,
        );
      }
    }

    Future<void> handleGetArtists() async {
      final requestId = DateTime.now().millisecondsSinceEpoch.toString();
      addRequest({
        'id': requestId,
        'name': '获取艺术家列表',
        'url': 'N/A',
        'method': 'POST',
        'status': 'loading',
        'response': '请求中...',
        'timestamp': DateTime.now(),
      });

      try {
        final result = await ref.read(artistsProvider().future);
        updateRequest(
          requestId: requestId,
          status: 'success',
          response: '获取成功，艺术家数量: ${result.data?.artists?.length ?? 0}',
        );
      } catch (e) {
        final errorMessage = formatErrorMessage(e);
        updateRequest(
          requestId: requestId,
          status: 'error',
          response: errorMessage,
        );
      }
    }

    Future<void> handleSearchArtists() async {
      final requestId = DateTime.now().millisecondsSinceEpoch.toString();
      addRequest({
        'id': requestId,
        'name': '搜索艺术家',
        'url': 'N/A',
        'method': 'POST',
        'status': 'loading',
        'response': '请求中...',
        'timestamp': DateTime.now(),
      });

      try {
        final result = await ref.read(
          searchArtistsProvider(filter: 'Test', limit: 10).future,
        );
        updateRequest(
          requestId: requestId,
          status: 'success',
          response: '搜索成功，找到 ${result.data?.artists?.length ?? 0} 条结果',
        );
      } catch (e) {
        final errorMessage = formatErrorMessage(e);
        updateRequest(
          requestId: requestId,
          status: 'error',
          response: errorMessage,
        );
      }
    }

    Future<void> handleGetPlaylists() async {
      final requestId = DateTime.now().millisecondsSinceEpoch.toString();
      addRequest({
        'id': requestId,
        'name': '获取播放列表',
        'url': 'N/A',
        'method': 'POST',
        'status': 'loading',
        'response': '请求中...',
        'timestamp': DateTime.now(),
      });

      try {
        final result = await ref.read(playlistsProvider().future);
        updateRequest(
          requestId: requestId,
          status: 'success',
          response: '获取成功，播放列表数量: ${result.data?.playlists?.length ?? 0}',
        );
      } catch (e) {
        final errorMessage = formatErrorMessage(e);
        updateRequest(
          requestId: requestId,
          status: 'error',
          response: errorMessage,
        );
      }
    }

    Future<void> handleCreatePlaylist() async {
      final requestId = DateTime.now().millisecondsSinceEpoch.toString();
      addRequest({
        'id': requestId,
        'name': '创建播放列表',
        'url': 'N/A',
        'method': 'POST',
        'status': 'loading',
        'response': '请求中...',
        'timestamp': DateTime.now(),
      });

      try {
        final result = await createPlaylist(
          ref: ref,
          name: 'Test Playlist ${DateTime.now().millisecondsSinceEpoch}',
        );
        updateRequest(
          requestId: requestId,
          status: 'success',
          response: '创建成功，ID: ${result.data?.id ?? '未知'}',
        );
      } catch (e) {
        final errorMessage = formatErrorMessage(e);
        updateRequest(
          requestId: requestId,
          status: 'error',
          response: errorMessage,
        );
      }
    }

    Future<void> handleGetStreamUrl() async {
      final requestId = DateTime.now().millisecondsSinceEpoch.toString();
      addRequest({
        'id': requestId,
        'name': '获取音频流 URL',
        'url': 'N/A',
        'method': 'POST',
        'status': 'loading',
        'response': '请求中...',
        'timestamp': DateTime.now(),
      });

      try {
        final url = await getStreamUrl(ref: ref, id: 'music_785331');
        updateRequest(
          requestId: requestId,
          status: 'success',
          response: '获取成功\nURL: $url',
        );
      } catch (e) {
        final errorMessage = formatErrorMessage(e);
        updateRequest(
          requestId: requestId,
          status: 'error',
          response: errorMessage,
        );
      }
    }

    Future<void> handleGetCoverUrl() async {
      final requestId = DateTime.now().millisecondsSinceEpoch.toString();
      addRequest({
        'id': requestId,
        'name': '获取封面 URL',
        'url': 'N/A',
        'method': 'POST',
        'status': 'loading',
        'response': '请求中...',
        'timestamp': DateTime.now(),
      });

      try {
        final url = await getCoverUrl(
          ref: ref,
          albumName: 'Unknown Album',
          albumArtistName: 'Unknown Artist',
        );
        updateRequest(
          requestId: requestId,
          status: 'success',
          response: '获取成功\nURL: $url',
        );
      } catch (e) {
        final errorMessage = formatErrorMessage(e);
        updateRequest(
          requestId: requestId,
          status: 'error',
          response: errorMessage,
        );
      }
    }

    Future<void> handleDownloadSong() async {
      final requestId = DateTime.now().millisecondsSinceEpoch.toString();
      addRequest({
        'id': requestId,
        'name': '下载歌曲',
        'url': 'N/A',
        'method': 'POST',
        'status': 'loading',
        'response': '请求中...',
        'timestamp': DateTime.now(),
      });

      try {
        final directory = await getApplicationDocumentsDirectory();
        final fileName = 'music_785331.mp3';
        final filePath = '${directory.path}/$fileName';

        final fileSize = await downloadSong(
          ref: ref,
          id: 'music_785331',
          filePath: filePath,
        );
        updateRequest(
          requestId: requestId,
          status: 'success',
          response: '下载成功，文件大小: $fileSize 字节\n已保存到: $filePath',
        );
      } catch (e) {
        final errorMessage = formatErrorMessage(e);
        updateRequest(
          requestId: requestId,
          status: 'error',
          response: errorMessage,
        );
      }
    }

    Future<void> handleDownloadCover() async {
      final requestId = DateTime.now().millisecondsSinceEpoch.toString();
      addRequest({
        'id': requestId,
        'name': '下载封面',
        'url': 'N/A',
        'method': 'POST',
        'status': 'loading',
        'response': '请求中...',
        'timestamp': DateTime.now(),
      });

      try {
        final directory = await getApplicationDocumentsDirectory();
        final fileName = 'cover_785331.jpg';
        final filePath = '${directory.path}/$fileName';

        final coverData = await downloadCover(
          ref: ref,
          albumName: 'Unknown Album',
          albumArtistName: 'Unknown Artist',
        );
        final file = File(filePath);
        await file.writeAsBytes(coverData);
        updateRequest(
          requestId: requestId,
          status: 'success',
          response: '下载成功，文件大小: ${coverData.length} 字节\n已保存到: $filePath',
        );
      } catch (e) {
        final errorMessage = formatErrorMessage(e);
        updateRequest(
          requestId: requestId,
          status: 'error',
          response: errorMessage,
        );
      }
    }

    Future<void> handleGetAudioStationInfo() async {
      final requestId = DateTime.now().millisecondsSinceEpoch.toString();
      addRequest({
        'id': requestId,
        'name': '获取服务器信息',
        'url': 'N/A',
        'method': 'POST',
        'status': 'loading',
        'response': '请求中...',
        'timestamp': DateTime.now(),
      });

      try {
        final result = await ref.read(audioStationInfoProvider().future);
        updateRequest(
          requestId: requestId,
          status: 'success',
          response: '获取成功\n版本: ${result.data?.version ?? '未知'}',
        );
      } catch (e) {
        final errorMessage = formatErrorMessage(e);
        updateRequest(
          requestId: requestId,
          status: 'error',
          response: errorMessage,
        );
      }
    }

    Future<void> handleGetDSMInfo() async {
      final requestId = DateTime.now().millisecondsSinceEpoch.toString();
      addRequest({
        'id': requestId,
        'name': '获取 DSM 信息',
        'url': 'N/A',
        'method': 'POST',
        'status': 'loading',
        'response': '请求中...',
        'timestamp': DateTime.now(),
      });

      try {
        final result = await ref.read(dsmInfoProvider().future);
        updateRequest(
          requestId: requestId,
          status: 'success',
          response: '获取成功\n版本: ${result.data?.version ?? '未知'}',
        );
      } catch (e) {
        final errorMessage = formatErrorMessage(e);
        updateRequest(
          requestId: requestId,
          status: 'error',
          response: errorMessage,
        );
      }
    }

    Future<void> handleGetNumberOfPlugIns() async {
      final requestId = DateTime.now().millisecondsSinceEpoch.toString();
      addRequest({
        'id': requestId,
        'name': '获取插件数量',
        'url': 'N/A',
        'method': 'POST',
        'status': 'loading',
        'response': '请求中...',
        'timestamp': DateTime.now(),
      });

      try {
        final result = await ref.read(numberOfPlugInsProvider().future);
        updateRequest(
          requestId: requestId,
          status: 'success',
          response: '获取成功，插件数量: ${result.hasPlugIn}',
        );
      } catch (e) {
        final errorMessage = formatErrorMessage(e);
        updateRequest(
          requestId: requestId,
          status: 'error',
          response: errorMessage,
        );
      }
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'API 测试',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      ElevatedButton.icon(
                        onPressed: handleGetSongs,
                        icon: const Icon(Icons.music_note),
                        label: const Text('获取歌曲列表'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: handleGetRandomSongs,
                        icon: const Icon(Icons.shuffle),
                        label: const Text('获取随机歌曲'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: handleGetLyrics,
                        icon: const Icon(Icons.format_quote),
                        label: const Text('获取歌词'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: handleSearchLyrics,
                        icon: const Icon(Icons.search),
                        label: const Text('搜索歌词'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: handleGetSongInfo,
                        icon: const Icon(Icons.music_note),
                        label: const Text('获取歌曲信息'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purpleAccent,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: handleSetRating,
                        icon: const Icon(Icons.favorite),
                        label: const Text('设置评分（喜欢）'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: handleGetFolders,
                        icon: const Icon(Icons.folder),
                        label: const Text('获取文件夹列表'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: handleGetAlbums,
                        icon: const Icon(Icons.album),
                        label: const Text('获取专辑列表'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: handleGetRecentAlbums,
                        icon: const Icon(Icons.album),
                        label: const Text('获取最近专辑'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: handleSearchAlbums,
                        icon: const Icon(Icons.search),
                        label: const Text('搜索专辑'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigoAccent,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: handleGetArtists,
                        icon: const Icon(Icons.person),
                        label: const Text('获取艺术家列表'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                            255,
                            168,
                            133,
                            222,
                          ),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: handleSearchArtists,
                        icon: const Icon(Icons.search),
                        label: const Text('搜索艺术家'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: handleGetPlaylists,
                        icon: const Icon(Icons.playlist_play),
                        label: const Text('获取播放列表'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                            255,
                            104,
                            180,
                            111,
                          ),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: handleCreatePlaylist,
                        icon: const Icon(Icons.add),
                        label: const Text('创建播放列表'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: handleGetStreamUrl,
                        icon: const Icon(Icons.audiotrack),
                        label: const Text('获取音频流 URL'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.cyan,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: handleGetCoverUrl,
                        icon: const Icon(Icons.image),
                        label: const Text('获取封面 URL'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: handleDownloadSong,
                        icon: const Icon(Icons.download),
                        label: const Text('下载歌曲'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.cyan,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: handleDownloadCover,
                        icon: const Icon(Icons.image),
                        label: const Text('下载封面'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: handleGetAudioStationInfo,
                        icon: const Icon(Icons.info),
                        label: const Text('获取服务器信息'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: handleGetDSMInfo,
                        icon: const Icon(Icons.computer),
                        label: const Text('获取 DSM 信息'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: handleGetNumberOfPlugIns,
                        icon: const Icon(Icons.extension),
                        label: const Text('获取插件数量'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '请求历史',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () => requestHistory.value = [],
                        child: const Text('清空'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  if (requestHistory.value.isEmpty)
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.all(32),
                        child: Text('暂无请求记录'),
                      ),
                    )
                  else
                    ...requestHistory.value.map((request) {
                      final status = request['status'] as String;
                      final statusColor = status == 'success'
                          ? Colors.green
                          : status == 'error'
                          ? Colors.red
                          : Colors.orange;
                      final statusIcon = status == 'success'
                          ? Icons.check_circle
                          : status == 'error'
                          ? Icons.error
                          : Icons.hourglass_empty;

                      return Card(
                        margin: const EdgeInsets.only(bottom: 8),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    statusIcon,
                                    color: statusColor,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      request['name'] as String,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    (request['timestamp'] as DateTime)
                                        .toString()
                                        .substring(0, 19),
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  // color: Colors.grey[100],
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: SelectableText(
                                  request['response'] as String,
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

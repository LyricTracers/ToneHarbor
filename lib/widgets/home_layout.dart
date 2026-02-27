import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/widgets/base_bg_layout.dart';

class HomeLayout extends BaseBgLayout {
  final Widget child;
  const HomeLayout({super.key, required this.child});

  @override
  Widget buildContent(BuildContext context, WidgetRef ref, bool requestFlag) {
    var l10n = AppLocalizations.of(context)!;

    // 监听 artists 状态
    final artistsState = ref.watch(artistsStateProvider);
    // 监听 albums 状态
    final albumsState = ref.watch(albumsStateProvider);
    // 监听 folders 状态
    final foldersState = ref.watch(foldersStateProvider);
    // 监听 songs 状态
    final songsState = ref.watch(songsStateProvider);

    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(l10n.appSubtitle),
            const SizedBox(height: 20),

            // 测试 artists 功能
            ElevatedButton(
              onPressed: () async {
                try {
                  await ref.read(artistsStateProvider.notifier).fetchArtists();
                  if (!context.mounted) return;
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text('获取艺术家列表成功')));
                } catch (e) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('错误: $e')));
                }
              },
              child: const Text('测试获取艺术家列表'),
            ),
            const SizedBox(height: 20),

            // 显示结果
            artistsState == null
                ? const Text('点击按钮获取艺术家列表')
                : Column(
                    children: [
                      Text('艺术家数量: ${artistsState.data?.total ?? 0}'),
                      const SizedBox(height: 10),
                      if (artistsState.data?.artists != null &&
                          artistsState.data!.artists!.isNotEmpty)
                        Text('第一个艺术家: ${artistsState.data!.artists![0].name}'),
                    ],
                  ),

            const SizedBox(height: 40),

            // 搜索艺术家功能
            ElevatedButton(
              onPressed: () async {
                try {
                  final results = await ref.read(
                    searchArtistsProvider(
                      filter: '周深',
                      library: 'all',
                      limit: 100,
                    ).future,
                  );
                  if (!context.mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('搜索成功，找到 ${results.data?.total ?? 0} 个艺术家'),
                    ),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('错误: $e')));
                }
              },
              child: const Text('搜索艺术家：周深'),
            ),
            const SizedBox(height: 20),

            // 其他测试按钮
            ElevatedButton(
              onPressed: () async {
                final headers = await getAuthHeadersWithWidgetRef(ref);
                if (!context.mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Auth Headers: ${headers != null ? '成功' : '失败'}',
                    ),
                  ),
                );
              },
              child: const Text('测试认证 Headers'),
            ),
            const SizedBox(height: 40),

            // 测试 albums 功能
            ElevatedButton(
              onPressed: () async {
                try {
                  await ref.read(albumsStateProvider.notifier).fetchAlbums();
                  if (!context.mounted) return;
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text('获取专辑列表成功')));
                } catch (e) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('错误: $e')));
                }
              },
              child: const Text('测试获取专辑列表'),
            ),
            const SizedBox(height: 20),

            // 显示专辑结果
            albumsState == null
                ? const Text('点击按钮获取专辑列表')
                : Column(
                    children: [
                      Text('专辑数量: ${albumsState.data?.total ?? 0}'),
                      const SizedBox(height: 10),
                      if (albumsState.data?.albums != null &&
                          albumsState.data!.albums!.isNotEmpty)
                        Text('第一个专辑: ${albumsState.data!.albums![0].name}'),
                    ],
                  ),

            const SizedBox(height: 20),

            // 测试获取最近添加的专辑
            ElevatedButton(
              onPressed: () async {
                try {
                  final results = await ref.read(
                    recentAlbumsProvider(limit: 50).future,
                  );
                  if (!context.mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        '获取最近专辑成功，找到 ${results.data?.total ?? 0} 个专辑',
                      ),
                    ),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('错误: $e')));
                }
              },
              child: const Text('测试获取最近添加的专辑'),
            ),
            const SizedBox(height: 20),

            // 搜索专辑功能
            ElevatedButton(
              onPressed: () async {
                try {
                  final results = await ref.read(
                    searchAlbumsProvider(filter: '周杰伦', limit: 100).future,
                  );
                  if (!context.mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        '搜索专辑成功，找到 ${results.data?.total ?? 0} 个专辑',
                      ),
                    ),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('错误: $e')));
                }
              },
              child: const Text('搜索专辑：周杰伦'),
            ),
            const SizedBox(height: 40),

            // 测试 folders 功能
            ElevatedButton(
              onPressed: () async {
                try {
                  await ref.read(foldersStateProvider.notifier).fetchFolders();
                  if (!context.mounted) return;
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text('获取文件夹列表成功')));
                } catch (e) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('错误: $e')));
                }
              },
              child: const Text('测试获取文件夹列表'),
            ),
            const SizedBox(height: 20),

            // 显示文件夹结果
            foldersState == null
                ? const Text('点击按钮获取文件夹列表')
                : Column(
                    children: [
                      Text('文件夹数量: ${foldersState.data?.total ?? 0}'),
                      const SizedBox(height: 10),
                      if (foldersState.data?.items != null &&
                          foldersState.data!.items!.isNotEmpty)
                        Text('第一个文件夹: ${foldersState.data!.items![0].title}'),
                    ],
                  ),
            const SizedBox(height: 40),

            // 测试获取 Audio Station 服务器信息
            ElevatedButton(
              onPressed: () async {
                try {
                  final result = await ref.read(
                    audioStationInfoProvider().future,
                  );
                  if (!context.mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        '获取服务器信息成功，版本: ${result.data?.versionString ?? '未知'}',
                      ),
                    ),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('错误: $e')));
                }
              },
              child: const Text('测试获取 Audio Station 服务器信息'),
            ),
            const SizedBox(height: 20),

            // 测试获取 DSM 信息
            ElevatedButton(
              onPressed: () async {
                try {
                  final result = await ref.read(dsmInfoProvider().future);
                  if (!context.mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        '获取 DSM 信息成功，型号: ${result.data?.model ?? '未知'}',
                      ),
                    ),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('错误: $e')));
                }
              },
              child: const Text('测试获取 DSM 信息'),
            ),
            const SizedBox(height: 40),

            // 测试 songs 功能
            ElevatedButton(
              onPressed: () async {
                try {
                  await ref.read(songsStateProvider.notifier).fetchSongs();
                  if (!context.mounted) return;
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text('获取歌曲列表成功')));
                } catch (e) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('错误: $e')));
                }
              },
              child: const Text('测试获取歌曲列表'),
            ),
            const SizedBox(height: 20),

            // 显示歌曲结果
            songsState == null
                ? const Text('点击按钮获取歌曲列表')
                : Column(
                    children: [
                      Text('歌曲数量: ${songsState.data?.total ?? 0}'),
                      const SizedBox(height: 10),
                      if (songsState.data?.songs != null &&
                          songsState.data!.songs!.isNotEmpty)
                        Text('第一个歌曲: ${songsState.data!.songs![0].title}'),
                    ],
                  ),

            const SizedBox(height: 20),

            // 测试获取随机歌曲
            ElevatedButton(
              onPressed: () async {
                try {
                  final results = await ref.read(
                    randomSongsProvider(limit: 10).future,
                  );
                  if (!context.mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        '获取随机歌曲成功，找到 ${results.data?.total ?? 0} 首歌曲',
                      ),
                    ),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('错误: $e')));
                }
              },
              child: const Text('测试获取随机歌曲'),
            ),
            const SizedBox(height: 20),

            // 搜索歌曲功能
            ElevatedButton(
              onPressed: () async {
                try {
                  final results = await ref.read(
                    searchSongsProvider(title: '光年之外', limit: 100).future,
                  );
                  if (!context.mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        '搜索歌曲成功，找到 ${results.data?.total ?? 0} 首歌曲',
                      ),
                    ),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('错误: $e')));
                }
              },
              child: const Text('搜索歌曲：光年之外'),
            ),
            const SizedBox(height: 20),

            // 测试获取艺术家的歌曲
            ElevatedButton(
              onPressed: () async {
                try {
                  final results = await ref.read(
                    artistSongsProvider(artist: '周深', limit: 10).future,
                  );
                  if (!context.mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        '获取艺术家歌曲成功，找到 ${results.data?.total ?? 0} 首歌曲',
                      ),
                    ),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('错误: $e')));
                }
              },
              child: const Text('测试获取艺术家歌曲：周深'),
            ),
            const SizedBox(height: 20),

            // 测试获取歌词
            ElevatedButton(
              onPressed: () async {
                try {
                  final results = await ref.read(
                    lyricsProvider(id: 'music_785331').future,
                  );
                  if (!context.mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        '获取歌词成功，歌词长度: ${results.data?.lyrics?.length ?? 0}',
                      ),
                    ),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('错误: $e')));
                }
              },
              child: const Text('测试获取歌词'),
            ),
            const SizedBox(height: 20),

            // 搜索歌词功能
            ElevatedButton(
              onPressed: () async {
                try {
                  final results = await ref.read(
                    searchLyricsProvider(title: '光年之外', limit: 10).future,
                  );
                  if (!context.mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        '搜索歌词成功，找到 ${results.data?.lyrics?.length ?? 0} 条歌词',
                      ),
                    ),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('错误: $e')));
                }
              },
              child: const Text('搜索歌词：光年之外'),
            ),
            const SizedBox(height: 20),

            // 测试获取歌曲信息
            ElevatedButton(
              onPressed: () async {
                try {
                  final results = await ref.read(
                    songInfoProvider(id: 'music_785331').future,
                  );
                  if (!context.mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        '获取歌曲信息成功，歌曲数量: ${results.data?.songs?.length ?? 0}',
                      ),
                    ),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('错误: $e')));
                }
              },
              child: const Text('测试获取歌曲信息'),
            ),
            const SizedBox(height: 20),

            // 测试设置歌曲评分
            ElevatedButton(
              onPressed: () async {
                try {
                  final results = await ref.read(
                    setRatingProvider(id: 'music_785331', rating: 5).future,
                  );
                  if (!context.mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        '设置评分成功: ${results?.success == true ? '成功' : '失败'}',
                      ),
                    ),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('错误: $e')));
                }
              },
              child: const Text('测试设置歌曲评分'),
            ),
            const SizedBox(height: 20),

            // 测试获取插件数量
            ElevatedButton(
              onPressed: () async {
                try {
                  final results = await ref.read(
                    numberOfPlugInsProvider().future,
                  );
                  if (!context.mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        '获取插件数量成功，插件数量: ${results?.hasPlugIn ?? 0}',
                      ),
                    ),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('错误: $e')));
                }
              },
              child: const Text('测试获取插件数量'),
            ),
          ],
        ),
      ),
    );
  }
}

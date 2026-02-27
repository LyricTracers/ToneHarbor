import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/providers/audio_station/artists_provider.dart';
import 'package:toneharbor/providers/audio_station/auth_provider.dart';
import 'package:toneharbor/widgets/base_bg_layout.dart';

class HomeLayout extends BaseBgLayout {
  final Widget child;
  const HomeLayout({super.key, required this.child});

  @override
  Widget buildContent(BuildContext context, WidgetRef ref, bool requestFlag) {
    var l10n = AppLocalizations.of(context)!;

    // 监听 artists 状态
    final artistsState = ref.watch(artistsStateProvider);

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
                  final results = await ref.read(searchArtistsProvider(
                    filter: '周深',
                    library: 'all',
                    limit: 100,
                  ).future);
                  if (!context.mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        '搜索成功，找到 ${results.data?.total ?? 0} 个艺术家',
                      ),
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
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/models/audio_station/auth.dart';
import 'package:toneharbor/providers/audio_station/auth_provider.dart';
import 'package:toneharbor/widgets/base_bg_layout.dart';

class HomeLayout extends BaseBgLayout {
  final Widget child;
  const HomeLayout({super.key, required this.child});

  @override
  Widget buildContent(BuildContext context, WidgetRef ref, bool requestFlag) {
    var l10n = AppLocalizations.of(context)!;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(l10n.appTitle),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              ref
                  .read(audioStationCookiesInfoProvider.notifier)
                  .setCookies(
                    AudioStationCookies(
                      id: '',
                      idExpires: 0,
                      did: '',
                      didExpires: 0,
                    ),
                  );
              ref.read(synoTokenProvider.notifier).clear();
              ref.invalidate(authTokenProvider);
            },
            child: const Text('删除 Cookie 和 Token'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () async {
              await ref
                  .read(audioStationCookiesInfoProvider.notifier)
                  .setCookies(
                    AudioStationCookies(
                      id: 'test',
                      idExpires: 0,
                      did: 'test',
                      didExpires: 0,
                    ),
                  );
              ref.invalidate(authTokenProvider);
            },
            child: const Text('设置过期 Cookie'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              ref.read(synoTokenProvider.notifier).clear();
              ref.invalidate(authTokenProvider);
            },
            child: const Text('删除 Token'),
          ),
        ],
      ),
    );
  }
}

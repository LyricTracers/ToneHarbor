import "dart:math";

import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:go_router/go_router.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:toneharbor/providers/providers.dart";
import "package:toneharbor/utils/base_funs.dart";
import "package:toneharbor/utils/responsive.dart";
import "package:toneharbor/widgets/layouts/playing_detail_mix.dart";
import "package:toneharbor/widgets/widgets.dart";

class PlayingDetailLayout extends BaseBgLayout with PlayingDetailMix {
  const PlayingDetailLayout({super.key, super.appbar = false});

  @override
  Widget buildContent(BuildContext context, WidgetRef ref, bool requestFlag) {
    final audioPlayerState = ref.watch(audioPlayerStateProvider);
    final colorScheme = getColorSchemeWhenReady(ref);
    final activeTrack = audioPlayerState.activeTrack;

    if (activeTrack == null) {
      return Column(
        children: [
          AppBar(
            automaticallyImplyLeading: false,
            leading: IconButton(
              onPressed: () {
                ref.context.pop();
              },
              icon: Icon(Icons.keyboard_arrow_down_rounded),
            ),
          ),
          buildErrorView(ref.context, ref, colorScheme, () {}),
        ],
      );
    }
    final showTranslated = useState(false);
    var size = MediaQuery.of(ref.context).size;
    final l10n = ref.watch(l10nProvider);

    useEffect(() {
      ref.invalidate(translateTextProvider);
      return null;
    }, [activeTrack.id]);
    final tabController = useTabController(initialLength: 2);
    return Stack(
      children: [
        if (size.isXs)
          Positioned(
            left: 20,
            top: 0,
            child: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: Icon(Icons.keyboard_arrow_down_rounded, size: 24),
            ),
          ),
        Column(
          children: [
            if (size.lgAndUp)
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: buildMusic(
                        ref,
                        activeTrack,
                        colorScheme,
                        showTranslated,
                        size,
                        size.height > size.width / 2
                            ? size.width / 2
                            : size.height,
                      ),
                    ),
                    Expanded(flex: 1, child: buildLyrics(ref, showTranslated)),
                  ],
                ),
              ),
            if (size.mdAndDown) ...[
              Center(
                child: Material(
                  color: colorScheme.tertiary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(30),
                  clipBehavior: Clip.antiAlias,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: 200 * size.multiplier2,
                      maxHeight: 40 * size.multiplier2,
                    ),
                    child: TabBar(
                      controller: tabController,
                      labelColor: colorScheme.primary,
                      labelStyle: TextStyle(
                        fontSize: 15 * size.multiplier2,
                        fontWeight: FontWeight.bold,
                      ),
                      unselectedLabelStyle: TextStyle(
                        fontSize: 14 * size.multiplier2,
                        fontWeight: FontWeight.normal,
                      ),
                      unselectedLabelColor: colorScheme.onSurface,
                      indicatorColor: colorScheme.primary,
                      tabs: [
                        Tab(text: l10n.music),
                        Tab(text: l10n.lyrics),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    buildMusic(
                      ref,
                      activeTrack,
                      colorScheme,
                      showTranslated,
                      size,
                      min(size.width * 0.8, size.height * 0.75),
                    ),
                    buildLyrics(ref, showTranslated),
                  ],
                ),
              ),
            ],
            BottomPlayer(showArrowType: ShowArrowType.down),
          ],
        ),
      ],
    );
  }
}

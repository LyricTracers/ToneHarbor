import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/widgets/layouts/base_bg_layout.dart';
import 'package:toneharbor/widgets/pages/bottom_player.dart';

class MobileFullLayout extends BaseBgLayout {
  final Widget child;
  const MobileFullLayout({super.key, required this.child});

  @override
  Widget buildContent(BuildContext context, WidgetRef ref, bool requestFlag) {
    return Column(
      children: [
        Expanded(child: child),
        const BottomPlayer(),
      ],
    );
  }
}

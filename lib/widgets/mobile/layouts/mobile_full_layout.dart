import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/widgets/layouts/base_bg_layout.dart';

class MobileFullLayout extends BaseBgLayout {
  final Widget child;
  const MobileFullLayout({super.key, required this.child});

  @override
  Widget buildContent(BuildContext context, WidgetRef ref, bool requestFlag) {
    return child;
  }
}

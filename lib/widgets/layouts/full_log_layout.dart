import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/widgets/widgets.dart';

class FullLogLayout extends BaseBgLayout {
  const FullLogLayout({super.key});
  @override
  Widget buildContent(BuildContext context, WidgetRef ref, bool requestFlag) {
    return LogPage();
  }
}

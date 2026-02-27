import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/widgets/base_bg_layout.dart';

class HomeLayout extends BaseBgLayout {
  final Widget child;
  const HomeLayout({super.key, required this.child});

  @override
  Widget buildContent(BuildContext context, WidgetRef ref, bool requestFlag) {
    var l10n = AppLocalizations.of(context)!;
    return Text(l10n.appSubtitle);
  }
}

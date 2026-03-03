import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class BaseContentPage extends HookConsumerWidget {
  const BaseContentPage({super.key});

  PreferredSizeWidget buildAppBar(BuildContext context, WidgetRef ref);

  Widget buildContent(BuildContext context, WidgetRef ref);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        buildAppBar(context, ref),
        Expanded(child: buildContent(context, ref)),
      ],
    );
  }
}

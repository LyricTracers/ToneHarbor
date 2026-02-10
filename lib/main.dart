import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lyricskit/lyricskit.dart';
import 'init/initialized.dart';
import 'utils/base_utils.dart';

void main() async {
  await initialized();
  runApp(
    ProviderScope(
      overrides: [httpClientProvider.overrideWithValue(httpClientWrapper)],
      child: const MyApp(),
    ),
  );
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final colorScheme = getColorSchemeWhenReady(ref);
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //   ),
    //   home: const MyHomePage(title: 'Flutter Demo Home Page'),
    // );
    return const Text("data");
  }
}

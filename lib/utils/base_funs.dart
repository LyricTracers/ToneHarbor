import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/providers/theme_data_provider.dart';
import 'package:toneharbor/utils/consts.dart';
part 'base_funs_sp.dart';
part 'base_funs_theme.dart';

T getValueWhenReadyWithWidgetRef<T>(
  WidgetRef ref,
  ProviderListenable<AsyncValue<T>> provider,
  T defaultValue,
) {
  final asyncValue = ref.watch(provider);
  return asyncValue.when(
    data: (value) => value,
    loading: () => defaultValue,
    error: (_, __) => defaultValue,
  );
}

T getValueWhenReadyWithRef<T>(
  Ref ref,
  ProviderListenable<AsyncValue<T>> provider,
  T defaultValue,
) {
  final asyncValue = ref.watch(provider);
  return asyncValue.when(
    data: (value) => value,
    loading: () => defaultValue,
    error: (_, __) => defaultValue,
  );
}

ColorScheme getColorSchemeWhenReady(WidgetRef ref) {
  return getValueWhenReadyWithWidgetRef(
    ref,
    getColorSchemeProvider,
    defaultColorScheme,
  );
}

void showSnackBar(String text, BuildContext context, Color color) {
  if (text.isEmpty) {
    return;
  }
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          Icon(Icons.check_circle, size: 20),
          SizedBox(width: 8),
          Expanded(child: Text(text)),
        ],
      ),
      duration: const Duration(seconds: 1),
      backgroundColor: color,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  );
}

void copyToClipboard(String text, BuildContext context, Color color) {
  if (text.isEmpty) {
    return;
  }
  Clipboard.setData(ClipboardData(text: text));
  showSnackBar(
    '${AppLocalizations.of(context)!.has_copy} $text',
    context,
    color,
  );
}

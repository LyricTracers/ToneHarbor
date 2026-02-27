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

bool isValidServerUrl(String url) {
  final ipPortPattern = RegExp(r'^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}:\d{1,5}$');
  final domainPortPattern = RegExp(
    r'^[a-zA-Z0-9][a-zA-Z0-9\-\.]+\.[a-zA-Z0-9\-]+:\d{1,5}$',
  );
  final localhostPattern = RegExp(r'^localhost:\d{1,5}$');

  return ipPortPattern.hasMatch(url) ||
      domainPortPattern.hasMatch(url) ||
      localhostPattern.hasMatch(url);
}

Map<String, dynamic> parseJsonResponse(String body) {
  try {
    return json.decode(body) as Map<String, dynamic>;
  } catch (e) {
    try {
      final decoded = json.decode(body);
      if (decoded is String) {
        return json.decode(decoded) as Map<String, dynamic>;
      }
      throw Exception('Unable to parse response: $body');
    } catch (e2) {
      throw Exception('Unable to parse response: $body');
    }
  }
}

String getAudioReuqestErrorMessage(
  AppLocalizations l10n,
  String defaultMessage,
  int? errorCode,
) {
  switch (errorCode) {
    case 100:
      return l10n.error_syno_request_100;
    case 101:
      return l10n.error_syno_request_101;
    case 102:
      return l10n.error_syno_request_102;
    case 103:
      return l10n.error_syno_request_103;
    case 104:
      return l10n.error_syno_request_104;
    case 105:
      return l10n.error_syno_request_105;
    case 106:
      return l10n.error_syno_request_106;
    case 114:
      return l10n.error_syno_request_114;
    case 150:
      return l10n.error_syno_request_150;
    default:
      return defaultMessage;
  }
}

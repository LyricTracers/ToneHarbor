import 'dart:ui';

import 'package:rhttp/rhttp.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/models/audio_station/syno_api_info.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_utils.dart';

part 'info_provider.dependence.dart';
part 'info_provider.g.dart';

@riverpod
Future<SynoAPIInfoResponse> queryAPI(
  Ref ref, {
  String query = 'all',
  Duration? cacheDuration = const Duration(days: 365),
  Duration? keepAliveDuration,
}) async {
  final link = ref.keepAliveFor(keepAliveDuration);
  try {
    return await _queryAPI(
      ref: ref,
      query: query,
      cacheDuration: cacheDuration,
    );
  } finally {
    if (keepAliveDuration == null) {
      link.close();
    }
  }
}

@riverpod
Future<Map<String, dynamic>> testConnection(Ref ref) async {
  final link = ref.keepAlive();
  try {
    return await _testConnection(ref: ref);
  } finally {
    link.close();
  }
}

@riverpod
Future<AudioStationInfoResponse> audioStationInfo(
  Ref ref, {
  Duration? cacheDuration,
  Duration? keepAliveDuration,
}) async {
  final link = ref.keepAliveFor(keepAliveDuration);
  try {
    return await _getAudioStationInfo(ref: ref, cacheDuration: cacheDuration);
  } finally {
    if (keepAliveDuration == null) {
      link.close();
    }
  }
}

@riverpod
Future<DSMInfoResponse> dsmInfo(
  Ref ref, {
  Duration? cacheDuration,
  Duration? keepAliveDuration,
}) async {
  final link = ref.keepAliveFor(keepAliveDuration);
  try {
    return await _getDSMInfo(ref: ref, cacheDuration: cacheDuration);
  } finally {
    if (keepAliveDuration == null) {
      link.close();
    }
  }
}

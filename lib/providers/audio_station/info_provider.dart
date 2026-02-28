import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rhttp/rhttp.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/models/audio_station/syno_api_info.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_utils.dart';
import 'package:toneharbor/utils/excetions.dart';

part 'info_provider.dependence.dart';
part 'info_provider.g.dart';

@riverpod
Future<AudioStationInfoResponse> audioStationInfo(
  Ref ref, {
  Duration? cacheDuration,
}) async {
  return await _getAudioStationInfo(ref: ref, cacheDuration: cacheDuration);
}

@riverpod
Future<DSMInfoResponse> dsmInfo(Ref ref, {Duration? cacheDuration}) async {
  return await _getDSMInfo(ref: ref, cacheDuration: cacheDuration);
}

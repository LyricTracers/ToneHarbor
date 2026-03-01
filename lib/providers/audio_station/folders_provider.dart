import 'dart:ui';

import 'package:rhttp/rhttp.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/models/audio_station/folder.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_utils.dart';

part 'folders_provider.dependence.dart';
part 'folders_provider.g.dart';

@riverpod
Future<FolderResponse> folders(
  Ref ref, {
  String? id,
  int limit = 1000,
  int offset = 0,
  String library = 'shared',
  String sortBy = 'song_rating',
  String sortDirection = 'DESC',
  String additional = 'song_tag,song_audio,song_rating',
  Duration? cacheDuration = const Duration(minutes: 5),
}) async {
  return await _getFolders(
    ref: ref,
    id: id,
    limit: limit,
    offset: offset,
    library: library,
    sortBy: sortBy,
    sortDirection: sortDirection,
    additional: additional,
    cacheDuration: cacheDuration,
  );
}

@riverpod
class FoldersState extends _$FoldersState {
  @override
  FolderResponse? build() {
    return null;
  }

  Future<void> fetchFolders({
    String? id,
    int limit = 1000,
    int offset = 0,
    String library = 'shared',
    String sortBy = 'song_rating',
    String sortDirection = 'DESC',
    String additional = 'song_tag,song_audio,song_rating',
    Duration? cacheDuration = const Duration(minutes: 5),
  }) async {
    state = null;
    try {
      final response = await _getFolders(
        ref: ref,
        id: id,
        limit: limit,
        offset: offset,
        library: library,
        sortBy: sortBy,
        sortDirection: sortDirection,
        additional: additional,
        cacheDuration: cacheDuration,
      );
      state = response;
    } catch (e) {
      logger.e('获取文件夹列表失败: $e');
      rethrow;
    }
  }
}

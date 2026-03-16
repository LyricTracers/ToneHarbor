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
class Folders extends _$Folders with ExtraProvider<FolderResponse> {
  @override
  Future<FolderResponse> build({
    String? id,
    int limit = 100,
    int offset = 0,
    String library = 'shared',
    String sortBy = 'title',
    String sortDirection = 'ASC',
    String additional = 'song_tag,song_audio,song_rating',
    Duration? cacheDuration = const Duration(minutes: 100),
  }) async {
    ref.keepAliveFor(Duration(minutes: 5));
    duration = cacheDuration;
    groupKey = 'folders';
    if (extraSortBy.isEmpty && extraSortDirection.isEmpty) {
      extraSortBy = sortBy;
      extraSortDirection = sortDirection;
    }
    return await _getFolders(
      ref: ref,
      id: id,
      limit: limit,
      offset: offset,
      library: library,
      sortBy: extraSortBy,
      sortDirection: extraSortDirection,
      additional: additional,
      cacheDuration: cacheDuration,
      groupKey: groupKey,
    );
  }

  @override
  Future<void> setSort({
    required String sortBy,
    required String sortDirection,
  }) async {
    if (extraSortBy == sortBy && extraSortDirection == sortDirection) {
      return;
    }

    final oldState = state.value;
    state = AsyncLoading();
    try {
      final newState = await _getFolders(
        ref: ref,
        id: id,
        limit: limit,
        offset: offset,
        library: library,
        sortBy: sortBy,
        sortDirection: sortDirection,
        additional: additional,
        cacheDuration: cacheDuration,
        groupKey: groupKey,
      );
      state = AsyncData(newState);
    } catch (e) {
      logger.e('set Sort folders失败: $e');
      state = AsyncData(oldState!);
    } finally {
      extraSortBy = sortBy;
      extraSortDirection = sortDirection;
    }
  }

  @override
  Future<void> loadMore() async {
    if (state.value == null) return;
    final currentData = state.value!.data;
    if (currentData == null) return;

    final currentTotal = currentData.total;
    final currentFolders = currentData.items;

    if (currentFolders.length >= currentTotal) return;

    final oldState = state.value;
    try {
      final newState = await _getFolders(
        ref: ref,
        id: id,
        limit: limit,
        offset: currentFolders.length,
        library: library,
        sortBy: extraSortBy,
        sortDirection: extraSortDirection,
        additional: additional,
        cacheDuration: cacheDuration,
        groupKey: groupKey,
      );

      final newFolders = newState.data?.items ?? [];
      final mergedFolders = [...currentFolders, ...newFolders];

      state = AsyncData(
        newState.copyWith(
          data: newState.data?.copyWith(
            items: mergedFolders,
            total: currentTotal,
          ),
        ),
      );
    } catch (e) {
      logger.e('加载更多folders失败: $e');
      state = AsyncData(oldState!);
    }
  }
}

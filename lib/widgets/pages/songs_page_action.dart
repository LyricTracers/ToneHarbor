part of 'songs_page.dart';

enum SongsPageSortAction { none, titleName, artistName, time, all }

extension _SongsPageActionExtension on SongsPage {
  List<PopupMenuItem> _sortMenuItmes(
    WidgetRef ref,
    AppLocalizations l10n,
    TextEditingController searchController,
  ) {
    return [
      if (sortAction == SongsPageSortAction.all ||
          sortAction == SongsPageSortAction.titleName) ...[
        getActionMenuItem(
          () {
            searchController.clear();
            ref
                .read(baseProvider.notifier)
                .setSort(sortBy: 'title', sortDirection: 'ASC');
          },
          l10n.sort_name,
          Icons.arrow_upward_rounded,
        ),
        getActionMenuItem(
          () {
            searchController.clear();
            ref
                .read(baseProvider.notifier)
                .setSort(sortBy: 'title', sortDirection: 'DESC');
          },
          l10n.sort_name,
          Icons.arrow_downward_rounded,
        ),
      ],
      if (sortAction == SongsPageSortAction.all ||
          sortAction == SongsPageSortAction.time) ...[
        getActionMenuItem(
          () {
            searchController.clear();
            ref
                .read(baseProvider.notifier)
                .setSort(sortBy: 'time', sortDirection: 'ASC');
          },
          l10n.sort_time,
          Icons.arrow_upward_rounded,
        ),
        getActionMenuItem(
          () {
            searchController.clear();
            ref
                .read(baseProvider.notifier)
                .setSort(sortBy: 'time', sortDirection: 'DESC');
          },
          l10n.sort_time,
          Icons.arrow_downward_rounded,
        ),
      ],
      if (sortAction == SongsPageSortAction.all ||
          sortAction == SongsPageSortAction.artistName) ...[
        getActionMenuItem(
          () {
            searchController.clear();
            ref
                .read(baseProvider.notifier)
                .setSort(sortBy: 'artist', sortDirection: 'ASC');
          },
          l10n.sort_artist_name,
          Icons.arrow_upward_rounded,
        ),
        getActionMenuItem(
          () {
            searchController.clear();
            ref
                .read(baseProvider.notifier)
                .setSort(sortBy: 'artist', sortDirection: 'DESC');
          },
          l10n.sort_artist_name,
          Icons.arrow_downward_rounded,
        ),
      ],
    ];
  }

  Widget _buildSortAction(
    WidgetRef ref,
    AppLocalizations l10n,
    TextEditingController searchController,
  ) {
    switch (sortAction) {
      case SongsPageSortAction.none:
        return SizedBox.shrink();
      default:
        return PopupMenuButton(
          itemBuilder: (context) {
            return _sortMenuItmes(ref, l10n, searchController);
          },
          icon: Icon(Icons.sort, size: 18),
          tooltip: l10n.sort,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        );
    }
  }
}

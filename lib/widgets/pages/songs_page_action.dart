part of 'songs_page.dart';

enum SongsPageSortAction { none, titleName, artistName, time, all }

extension _SongsPageActionExtension on SongsPage {
  PopupMenuItem _getActionMenuItem(
    Function() onPressed,
    String sortName,
    IconData icon,
  ) {
    return PopupMenuItem(
      onTap: onPressed,
      child: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Icon(icon, size: 18),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(sortName),
          ),
        ],
      ),
    );
  }

  Widget _buildSortAction(WidgetRef ref, AppLocalizations l10n) {
    switch (sortAction) {
      case SongsPageSortAction.none:
        return SizedBox.shrink();
      default:
        return PopupMenuButton(
          itemBuilder: (context) {
            return [
              if (sortAction == SongsPageSortAction.all ||
                  sortAction == SongsPageSortAction.titleName) ...[
                _getActionMenuItem(
                  () => {
                    ref
                        .read(baseProvider.notifier)
                        .setSort(sortBy: 'title', sortDirection: 'ASC'),
                  },
                  l10n.sort_name,
                  Icons.arrow_upward_rounded,
                ),
                _getActionMenuItem(
                  () => {
                    ref
                        .read(baseProvider.notifier)
                        .setSort(sortBy: 'title', sortDirection: 'DESC'),
                  },
                  l10n.sort_name,
                  Icons.arrow_downward_rounded,
                ),
              ],
              if (sortAction == SongsPageSortAction.all ||
                  sortAction == SongsPageSortAction.time) ...[
                _getActionMenuItem(
                  () => {
                    ref
                        .read(baseProvider.notifier)
                        .setSort(sortBy: 'time', sortDirection: 'ASC'),
                  },
                  l10n.sort_time,
                  Icons.arrow_upward_rounded,
                ),
                _getActionMenuItem(
                  () => {
                    ref
                        .read(baseProvider.notifier)
                        .setSort(sortBy: 'time', sortDirection: 'DESC'),
                  },
                  l10n.sort_time,
                  Icons.arrow_downward_rounded,
                ),
              ],
              if (sortAction == SongsPageSortAction.all ||
                  sortAction == SongsPageSortAction.artistName) ...[
                _getActionMenuItem(
                  () => {
                    ref
                        .read(baseProvider.notifier)
                        .setSort(sortBy: 'artist', sortDirection: 'ASC'),
                  },
                  l10n.sort_artist_name,
                  Icons.arrow_upward_rounded,
                ),
                _getActionMenuItem(
                  () => {
                    ref
                        .read(baseProvider.notifier)
                        .setSort(sortBy: 'artist', sortDirection: 'DESC'),
                  },
                  l10n.sort_artist_name,
                  Icons.arrow_downward_rounded,
                ),
              ],
            ];
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

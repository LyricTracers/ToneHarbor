import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/models/audio_player/song_selection_state.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';
import 'package:toneharbor/providers/providers.dart';

class SongItem extends HookConsumerWidget {
  final int index;
  final ToneHarborTrackObject song;
  final ColorScheme colorScheme;
  final AppLocalizations l10n;
  final String? activeSongId;
  final bool isFavorite;
  final SongSelectionState selectionState;
  final Function onTap;
  const SongItem({
    super.key,
    required this.index,
    required this.song,
    required this.activeSongId,
    required this.colorScheme,
    required this.l10n,
    required this.isFavorite,
    required this.onTap,
    this.selectionState = const SongSelectionState(
      selectionType: false,
      ids: {},
      boxState: false,
    ),
  });
  static const double itemHeight = 66.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bitrate = (song.bitrate / 1000).round();
    var container = song.container;
    var artist = song.artist;
    var album = song.album;

    var isHovered = useState(false);
    var localSelected = useState(false);

    useEffect(() {
      localSelected.value = ref
          .read(songSelectionProvider.notifier)
          .isSelected(song.id);
      return null;
    }, [selectionState.selectionType]);

    useEffect(() {
      localSelected.value = ref
          .read(songSelectionProvider.notifier)
          .isSelected(song.id);
      return null;
    }, [selectionState.boxState]);
    void updateState() {
      localSelected.value = !ref
          .read(songSelectionProvider.notifier)
          .isSelected(song.id);
      var flag = localSelected.value;
      Future.microtask(() {
        if (flag) {
          ref.read(songSelectionProvider.notifier).select(song.id);
        } else {
          ref.read(songSelectionProvider.notifier).deSelect(song.id);
        }
      });
    }

    return MouseRegion(
      onEnter: (event) => isHovered.value = true,
      onExit: (event) => isHovered.value = false,
      child: Stack(
        children: [
          if (isFavorite)
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: colorScheme.primary,
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(8),
                  ),
                ),
                child: Text(
                  l10n.favorite,
                  style: TextStyle(
                    color: colorScheme.onPrimary,
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          Container(
            height: itemHeight,
            color: isHovered.value
                ? colorScheme.outline.withValues(alpha: .1)
                : Colors.transparent,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onDoubleTap: () {
                if (!selectionState.selectionType) {
                  onTap();
                }
              },
              onTap: () {
                updateState();
              },
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 20,
                  top: 4,
                  bottom: 4,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    activeSongId == song.id
                        ? SvgPicture.string(
                            placeholderErrorIconString,
                            width: 24,
                            height: 24,
                            fit: BoxFit.fitWidth,
                            colorFilter: ColorFilter.mode(
                              colorScheme.primary,
                              BlendMode.srcIn,
                            ),
                          )
                        : Text(
                            '${index + 1}',
                            style: TextStyle(
                              fontSize: 14,
                              color: colorScheme.primary,
                            ),
                          ),
                    const SizedBox(width: 15),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            song.title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 4,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  '$container ${bitrate}k',
                                  style: TextStyle(
                                    fontSize: 9,
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15),
                              Expanded(
                                child: Text(
                                  '$artist-$album',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    if (selectionState.selectionType)
                      Checkbox(
                        shape: const CircleBorder(),
                        value: localSelected.value,
                        onChanged: (_) {
                          updateState();
                        },
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

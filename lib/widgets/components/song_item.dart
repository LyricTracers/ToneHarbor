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
  final double multiplier;
  const SongItem({
    super.key,
    required this.index,
    required this.song,
    required this.activeSongId,
    required this.colorScheme,
    required this.l10n,
    required this.isFavorite,
    required this.onTap,
    required this.multiplier,
    this.selectionState = const SongSelectionState(
      selectionType: false,
      ids: {},
      boxState: false,
    ),
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bitrate = (song.bitrate / 1000).round();
    var container = song.container;
    var artist = song.artist;
    var album = song.album;
    double itemHeight = 66.0 * multiplier;
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
                padding: EdgeInsets.symmetric(
                  horizontal: 6 * multiplier,
                  vertical: 2 * multiplier,
                ),
                decoration: BoxDecoration(
                  color: colorScheme.primary,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(8 * multiplier),
                  ),
                ),
                child: Text(
                  l10n.favorite,
                  style: TextStyle(
                    color: colorScheme.onPrimary,
                    fontSize: 8 * multiplier,
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
                padding: EdgeInsets.only(
                  left: 15 * multiplier,
                  right: 20 * multiplier,
                  top: 4 * multiplier,
                  bottom: 4 * multiplier,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    activeSongId == song.id
                        ? SvgPicture.string(
                            placeholderErrorIconString,
                            width: 24 * multiplier,
                            height: 24 * multiplier,
                            fit: BoxFit.fitWidth,
                            colorFilter: ColorFilter.mode(
                              colorScheme.primary,
                              BlendMode.srcIn,
                            ),
                          )
                        : Text(
                            '${index + 1}',
                            style: TextStyle(
                              fontSize: 14 * multiplier,
                              color: colorScheme.primary,
                            ),
                          ),
                    SizedBox(width: 15 * multiplier),
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
                            style: TextStyle(
                              fontSize: 16 * multiplier,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4 * multiplier),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 4 * multiplier,
                                  vertical: 2 * multiplier,
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
                                    fontSize: 9 * multiplier,
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ),
                              SizedBox(width: 15 * multiplier),
                              Expanded(
                                child: Text(
                                  '$artist-$album',
                                  style: TextStyle(
                                    fontSize: 12 * multiplier,
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

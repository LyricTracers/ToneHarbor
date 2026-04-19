import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/models/audio_player/song_selection_state.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';
import 'package:toneharbor/models/cloud_music/cloud_music_models.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_funs.dart';

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
    var isPressed = useState(false);

    bool isPlayable = true;
    String? notPlayableReason;

    if (song.isCloudMusic) {
      final cloudSong = song as ToneHarborTrackObjectCloudMusic;
      final isLoggedIn = ref.watch(cloudMusicAuthStateProvider);
      final userVipType = ref.watch(
        cloudUserInfoProvider.select((value) => value.value?.vipType ?? 0),
      );
      final cloudSongData = CloudMusicSongData(
        songId: int.tryParse(cloudSong.id) ?? 0,
        name: cloudSong.title,
        ar: cloudSong.ar,
        al: cloudSong.al,
        dt: cloudSong.duration.inMilliseconds,
        fee: cloudSong.fee,
        noCopyrightRcmd: cloudSong.noCopyrightRcmd,
        privilege: cloudSong.privilege,
      );
      final result = isCloudTrackPlayable(
        cloudSongData,
        l10n,
        isLoggedIn: isLoggedIn,
        userVipType: userVipType,
      );
      isPlayable = result.playable;
      notPlayableReason = result.reason;
    }

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
          if (!isPlayable && notPlayableReason != null)
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
                  notPlayableReason,
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
            color: isHovered.value || isPressed.value
                ? colorScheme.outline.withValues(alpha: .1)
                : Colors.transparent,
            child: InkWell(
              onDoubleTap: () {
                if (!selectionState.selectionType && isPlayable) {
                  isPressed.value = false;
                  onTap();
                }
              },
              onTapDown: (details) => isPressed.value = true,
              onTapUp: (details) => isPressed.value = false,
              onTapCancel: () => isPressed.value = false,
              onTap: () {
                isPressed.value = false;
                if (selectionState.selectionType) {
                  updateState();
                }
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
                              color: isPlayable
                                  ? colorScheme.primary
                                  : Colors.grey,
                            ),
                          ),
                    SizedBox(width: 15 * multiplier),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                child: Text(
                                  song.title,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontSize: 16 * multiplier,
                                    fontWeight: FontWeight.bold,
                                    color: isPlayable
                                        ? colorScheme.onSurface
                                        : Colors.grey,
                                  ),
                                ),
                              ),
                              if (isFavorite)
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 4 * multiplier,
                                  ),
                                  child: Icon(
                                    Icons.favorite_rounded,
                                    size: 14 * multiplier,
                                    color: Colors.red,
                                  ),
                                ),
                            ],
                          ),
                          SizedBox(height: 4 * multiplier),
                          Row(
                            children: [
                              if (bitrate > 0)
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 4 * multiplier,
                                    vertical: 2 * multiplier,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: isPlayable
                                          ? colorScheme.onSurfaceVariant
                                          : Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    '$container ${bitrate}k',
                                    style: TextStyle(
                                      fontSize: 9 * multiplier,
                                      color: isPlayable
                                          ? colorScheme.onSurfaceVariant
                                          : Colors.grey,
                                    ),
                                  ),
                                ),
                              if (bitrate > 0) SizedBox(width: 15 * multiplier),
                              Expanded(
                                child: Text(
                                  '$artist-$album',
                                  style: TextStyle(
                                    fontSize: 12 * multiplier,
                                    color: isPlayable
                                        ? colorScheme.onSurfaceVariant
                                        : Colors.grey,
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

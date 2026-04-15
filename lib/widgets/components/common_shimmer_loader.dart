import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:toneharbor/utils/responsive.dart';

class CommonShimmerLoader {
  static Widget songList({
    required ColorScheme colorScheme,
    required Size size,
    int itemCount = 6,
  }) {
    final itemHeight = 66.0 * size.multiplier2;

    return Shimmer.fromColors(
      baseColor: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
      highlightColor: colorScheme.surface.withValues(alpha: 1.0),
      child: ListView.builder(
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return Container(
            height: itemHeight,
            padding: EdgeInsets.only(
              left: 15 * size.multiplier,
              right: 20 * size.multiplier,
              top: 4 * size.multiplier,
              bottom: 4 * size.multiplier,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 24 * size.multiplier2,
                  height: 24 * size.multiplier2,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                SizedBox(width: 15 * size.multiplier),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 16 * size.multiplier2,
                        width: size.width * 0.5,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      SizedBox(height: 4 * size.multiplier),
                      Row(
                        children: [
                          Container(
                            width: 60 * size.multiplier2,
                            height: 14 * size.multiplier2,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          SizedBox(width: 15 * size.multiplier),
                          Container(
                            height: 12 * size.multiplier2,
                            width: size.width * 0.3,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  static Widget folderList({
    required ColorScheme colorScheme,
    required Size size,
    int itemCount = 6,
  }) {
    final itemHeight = 44.0 * size.multiplier2;

    return Shimmer.fromColors(
      baseColor: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
      highlightColor: colorScheme.surface.withValues(alpha: 1.0),
      child: ListView.builder(
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20 * size.multiplier,
              vertical: 4 * size.multiplier,
            ),
            child: Row(
              children: [
                Container(
                  width: 16 * size.multiplier2,
                  height: 16 * size.multiplier2,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                SizedBox(width: 15 * size.multiplier),
                Container(
                  width: 20 * size.multiplier2,
                  height: 20 * size.multiplier2,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                SizedBox(width: 10 * size.multiplier),
                Expanded(
                  child: Container(
                    height: 16 * size.multiplier2,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

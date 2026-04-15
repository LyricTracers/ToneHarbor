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

  static Widget albumGrid({
    required ColorScheme colorScheme,
    required Size size,
    int itemCount = 50,
  }) {
    return Shimmer.fromColors(
      baseColor: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
      highlightColor: colorScheme.surface.withValues(alpha: 1.0),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: itemCount,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 180,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AspectRatio(
                  aspectRatio: 1.0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  height: 14,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  height: 12,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  static Widget artistGrid({
    required ColorScheme colorScheme,
    required Size size,
    int itemCount = 50,
  }) {
    return Shimmer.fromColors(
      baseColor: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
      highlightColor: colorScheme.surface.withValues(alpha: 1.0),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: itemCount,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 150,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AspectRatio(
                  aspectRatio: 1.0,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  height: 12,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  static Widget playlistList({
    required ColorScheme colorScheme,
    required Size size,
    int itemCount = 6,
  }) {
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

  static Widget storageList({
    required ColorScheme colorScheme,
    required Size size,
    int itemCount = 6,
  }) {
    final isLargeScreen = size.lgAndUp;

    return Shimmer.fromColors(
      baseColor: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
      highlightColor: colorScheme.surface.withValues(alpha: 1.0),
      child: isLargeScreen
          ? Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ListView(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 16,
                                width: 80,
                                color: Colors.white,
                              ),
                              Container(
                                height: 16,
                                width: 60,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        ...List.generate(itemCount, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 12,
                                      height: 12,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 14,
                                            width: size.width * 0.15,
                                            color: Colors.white,
                                          ),
                                          const SizedBox(height: 4),
                                          Container(
                                            height: 12,
                                            width: size.width * 0.1,
                                            color: Colors.white,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 24,
                                      height: 24,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: ListView(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(height: 16, width: 80, color: Colors.white),
                        Container(height: 16, width: 60, color: Colors.white),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  ...List.generate(itemCount, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            children: [
                              Container(
                                width: 12,
                                height: 12,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 14,
                                      width: size.width * 0.3,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(height: 4),
                                    Container(
                                      height: 12,
                                      width: size.width * 0.2,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 24,
                                height: 24,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
    );
  }

  static Widget accountList({
    required ColorScheme colorScheme,
    required Size size,
  }) {
    return Shimmer.fromColors(
      baseColor: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
      highlightColor: colorScheme.surface.withValues(alpha: 1.0),
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: 14, width: 60, color: Colors.white),
            const SizedBox(height: 4),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                children: List.generate(5, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 16,
                              width: 80,
                              color: Colors.white,
                            ),
                            Container(
                              height: 14,
                              width: size.width * 0.35,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        if (index < 4) ...[
                          const SizedBox(height: 8),
                          Container(height: 1, color: Colors.white),
                          const SizedBox(height: 8),
                        ],
                      ],
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 20),
            Container(height: 14, width: 60, color: Colors.white),
            const SizedBox(height: 4),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                children: List.generate(4, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 16,
                              width: 80,
                              color: Colors.white,
                            ),
                            Container(
                              height: 14,
                              width: size.width * 0.35,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        if (index < 3) ...[
                          const SizedBox(height: 8),
                          Container(height: 1, color: Colors.white),
                          const SizedBox(height: 8),
                        ],
                      ],
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 20),
            Container(height: 14, width: 60, color: Colors.white),
            const SizedBox(height: 4),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Center(
                child: Container(height: 16, width: 60, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget lyricsList({
    required ColorScheme colorScheme,
    required Size size,
    int itemCount = 20,
  }) {
    const itemHeight = 56.0;

    return Shimmer.fromColors(
      baseColor: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
      highlightColor: colorScheme.surface.withValues(alpha: 1.0),
      child: ListView.builder(
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return SizedBox(
            height: itemHeight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Container(width: 24, height: 16, color: Colors.white),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 16,
                          width: size.width * 0.4,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 4),
                        Container(
                          height: 12,
                          width: size.width * 0.25,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Container(width: 40, height: 12, color: Colors.white),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  static Widget artistHorizontalList({
    required ColorScheme colorScheme,
    required Size size,
    int itemCount = 5,
  }) {
    final multiplier = size.multiplier2;

    return Shimmer.fromColors(
      baseColor: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
      highlightColor: colorScheme.surface.withValues(alpha: 1.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(itemCount, (index) {
            return Padding(
              padding: EdgeInsets.only(
                left: index == 0 ? 20 * multiplier : 0,
                right: 16 * multiplier,
              ),
              child: Column(
                children: [
                  Container(
                    width: 100 * multiplier,
                    height: 100 * multiplier,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(height: 8 * multiplier),
                  Container(
                    height: 14 * multiplier,
                    width: 80 * multiplier,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  static Widget albumHorizontalList({
    required ColorScheme colorScheme,
    required Size size,
    int itemCount = 5,
  }) {
    final multiplier = size.multiplier2;

    return Shimmer.fromColors(
      baseColor: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
      highlightColor: colorScheme.surface.withValues(alpha: 1.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(itemCount, (index) {
            return Padding(
              padding: EdgeInsets.only(
                left: index == 0 ? 20 * multiplier : 0,
                right: 16 * multiplier,
              ),
              child: Column(
                children: [
                  Container(
                    width: 100 * multiplier,
                    height: 100 * multiplier,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8 * multiplier),
                    ),
                  ),
                  SizedBox(height: 8 * multiplier),
                  Container(
                    height: 14 * multiplier,
                    width: 80 * multiplier,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  SizedBox(height: 4 * multiplier),
                  Container(
                    height: 12 * multiplier,
                    width: 60 * multiplier,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  static Widget searchSongList({
    required ColorScheme colorScheme,
    required Size size,
    int itemCount = 6,
  }) {
    final multiplier = size.multiplier2;

    return Shimmer.fromColors(
      baseColor: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
      highlightColor: colorScheme.surface.withValues(alpha: 1.0),
      child: Column(
        children: List.generate(itemCount, (index) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16 * multiplier,
              vertical: 8 * multiplier,
            ),
            child: Row(
              children: [
                Container(
                  width: 40 * multiplier,
                  height: 40 * multiplier,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4 * multiplier),
                  ),
                ),
                SizedBox(width: 12 * multiplier),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 16 * multiplier,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      SizedBox(height: 4 * multiplier),
                      Container(
                        height: 12 * multiplier,
                        width: 150 * multiplier,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 12 * multiplier),
                Container(
                  height: 12 * multiplier,
                  width: 40 * multiplier,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

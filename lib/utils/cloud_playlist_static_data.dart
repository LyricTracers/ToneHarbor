class CloudPlaylistCategory {
  final String name;
  final int category;
  final bool hot;
  final bool enabled;

  const CloudPlaylistCategory({
    required this.name,
    required this.category,
    this.hot = false,
    this.enabled = false,
  });
}

class CloudPlaylistStaticData {
  static const List<CloudPlaylistCategory> staticCategories = [
    CloudPlaylistCategory(name: '全部', category: -1, enabled: true),
    CloudPlaylistCategory(name: '精品歌单', category: -2, enabled: true),
    CloudPlaylistCategory(name: '排行榜', category: -3, enabled: true),
    CloudPlaylistCategory(name: '官方', category: -4, enabled: true),
  ];

  static const Map<int, String> categoryGroups = {
    0: '语种',
    1: '风格',
    2: '场景',
    3: '情感',
    4: '主题',
  };

  static const List<CloudPlaylistCategory> subCategories = [
    CloudPlaylistCategory(name: '华语', category: 0, hot: true, enabled: true),
    CloudPlaylistCategory(name: '欧美', category: 0, hot: true, enabled: true),
    CloudPlaylistCategory(name: '日语', category: 0, hot: true),
    CloudPlaylistCategory(name: '韩语', category: 0, hot: true),
    CloudPlaylistCategory(name: '粤语', category: 0),
    CloudPlaylistCategory(name: '流行', category: 1, hot: true, enabled: true),
    CloudPlaylistCategory(name: '摇滚', category: 1, hot: true, enabled: true),
    CloudPlaylistCategory(name: '民谣', category: 1, hot: true),
    CloudPlaylistCategory(name: '电子', category: 1, hot: true, enabled: true),
    CloudPlaylistCategory(name: '舞曲', category: 1),
    CloudPlaylistCategory(name: '说唱', category: 1, hot: true, enabled: true),
    CloudPlaylistCategory(name: '轻音乐', category: 1),
    CloudPlaylistCategory(name: '爵士', category: 1),
    CloudPlaylistCategory(name: '乡村', category: 1),
    CloudPlaylistCategory(name: 'R&B/Soul', category: 1),
    CloudPlaylistCategory(name: '古典', category: 1),
    CloudPlaylistCategory(name: '民族', category: 1),
    CloudPlaylistCategory(name: '英伦', category: 1),
    CloudPlaylistCategory(name: '金属', category: 1),
    CloudPlaylistCategory(name: '朋克', category: 1),
    CloudPlaylistCategory(name: '蓝调', category: 1),
    CloudPlaylistCategory(name: '雷鬼', category: 1),
    CloudPlaylistCategory(name: '世界音乐', category: 1),
    CloudPlaylistCategory(name: '拉丁', category: 1),
    CloudPlaylistCategory(name: 'New Age', category: 1),
    CloudPlaylistCategory(name: '古风', category: 1),
    CloudPlaylistCategory(name: '后摇', category: 1),
    CloudPlaylistCategory(name: 'Bossa Nova', category: 1),
    CloudPlaylistCategory(name: '清晨', category: 2),
    CloudPlaylistCategory(name: '夜晚', category: 2),
    CloudPlaylistCategory(name: '学习', category: 2, hot: true),
    CloudPlaylistCategory(name: '工作', category: 2),
    CloudPlaylistCategory(name: '午休', category: 2),
    CloudPlaylistCategory(name: '下午茶', category: 2),
    CloudPlaylistCategory(name: '地铁', category: 2),
    CloudPlaylistCategory(name: '驾车', category: 2),
    CloudPlaylistCategory(name: '运动', category: 2, hot: true),
    CloudPlaylistCategory(name: '旅行', category: 2),
    CloudPlaylistCategory(name: '散步', category: 2),
    CloudPlaylistCategory(name: '酒吧', category: 2),
    CloudPlaylistCategory(name: '怀旧', category: 3),
    CloudPlaylistCategory(name: '清新', category: 3),
    CloudPlaylistCategory(name: '浪漫', category: 3),
    CloudPlaylistCategory(name: '伤感', category: 3, hot: true),
    CloudPlaylistCategory(name: '治愈', category: 3, hot: true),
    CloudPlaylistCategory(name: '放松', category: 3),
    CloudPlaylistCategory(name: '孤独', category: 3),
    CloudPlaylistCategory(name: '感动', category: 3),
    CloudPlaylistCategory(name: '兴奋', category: 3),
    CloudPlaylistCategory(name: '快乐', category: 3),
    CloudPlaylistCategory(name: '安静', category: 3),
    CloudPlaylistCategory(name: '思念', category: 3),
    CloudPlaylistCategory(name: '综艺', category: 4),
    CloudPlaylistCategory(name: '影视原声', category: 4, hot: true),
    CloudPlaylistCategory(name: 'ACG', category: 4, hot: true, enabled: true),
    CloudPlaylistCategory(name: '儿童', category: 4),
    CloudPlaylistCategory(name: '校园', category: 4),
    CloudPlaylistCategory(name: '游戏', category: 4),
    CloudPlaylistCategory(name: '70后', category: 4),
    CloudPlaylistCategory(name: '80后', category: 4),
    CloudPlaylistCategory(name: '90后', category: 4),
    CloudPlaylistCategory(name: '网络歌曲', category: 4),
    CloudPlaylistCategory(name: 'KTV', category: 4),
    CloudPlaylistCategory(name: '经典', category: 4),
    CloudPlaylistCategory(name: '翻唱', category: 4),
    CloudPlaylistCategory(name: '吉他', category: 4),
    CloudPlaylistCategory(name: '钢琴', category: 4),
    CloudPlaylistCategory(name: '器乐', category: 4),
    CloudPlaylistCategory(name: '榜单', category: 4),
    CloudPlaylistCategory(name: '00后', category: 4),
  ];

  static List<CloudPlaylistCategory> get allCategories => [
    ...staticCategories,
    ...subCategories,
  ];

  static List<CloudPlaylistCategory> get hotCategories =>
      subCategories.where((c) => c.hot).toList();

  static List<CloudPlaylistCategory> get enabledCategories =>
      allCategories.where((c) => c.enabled).toList();

  static List<CloudPlaylistCategory> getByCategory(int category) =>
      subCategories.where((c) => c.category == category).toList();

  static List<CloudPlaylistCategory> getCategoriesByGroup(String groupName) {
    final categoryId = categoryGroups.entries
        .firstWhere(
          (e) => e.value == groupName,
          orElse: () => const MapEntry(-1, ''),
        )
        .key;
    if (categoryId == -1) return [];
    return getByCategory(categoryId);
  }
}

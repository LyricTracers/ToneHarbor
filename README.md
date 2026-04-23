# ToneHarbor

**拾音坞** · 一坞藏万乐，双耳遇知音

一款功能丰富的群晖 Audio Station 客户端，同时支持云音乐 API，提供高品质音乐流媒体、离线下载、智能歌词管理等特性。

## ⚠️ 重要说明

### 平台支持
当前**仅支持 iOS 和 macOS 平台**。其他平台（Android、Windows、Linux）未积极维护，可能无法正常工作。

### Flutter 版本限制
由于 [media-kit hot restart 崩溃问题](https://github.com/media-kit/media-kit/pull/1392) 影响 Flutter 3.38+，**本项目必须使用 Flutter 3.35.7 或更低版本编译**。

该问题导致 Flutter 3.38+ 在热重启时发生 SIGABRT 崩溃，原因是 Flutter 销毁了 NativeCallable 跳板，但原生 mpv 线程仍在运行并调用已失效的回调。修复已合并到 media-kit 但尚未发布稳定版。

## ✨ 核心特性

### 🎵 双音乐源支持
**ToneHarbor 最大的特点是同时支持两种音乐源：**

#### 群晖 Audio Station
- 连接 Synology NAS 上的 Audio Station 服务
- 浏览文件夹、艺术家、专辑、播放列表
- 支持多音质选择（128/192/320kbps/无损）
- 歌曲评分和收藏功能

#### 云音乐 API
- 支持类似网易云音乐的 API 接口
- 每日推荐歌单和歌曲
- 热门歌手榜和新碟上架
- 云搜索功能
- 登录同步个人歌单

### 🎤 智能歌词系统
- **多源歌词获取**：支持嵌入式歌词和在线歌词搜索
- **AI 歌词翻译**：集成智谱 AI，支持中英文歌词互译
- **歌词缓存**：本地缓存翻译结果，节省 API 调用
- **状态栏歌词**：macOS 菜单栏实时显示当前歌词
- **双语对照**：原文与译文同步显示

### 📥 强大的下载管理
- **多音质下载**：可选择不同音质进行下载
- **Aria2 集成**：支持将下载任务分发到远程 Aria2 服务器
- **后台下载**：预加载模式后台下载
- **断点续传**：暂停、恢复、取消下载
- **下载历史**：完整的下载记录追踪
- **自动缓存管理**：智能清理过期缓存

### 🎨 精美界面设计
- **Material Design 3**：采用最新设计规范，动态配色
- **响应式布局**：桌面端侧边栏导航，移动端全屏体验
- **动态背景**：从专辑封面提取主色调作为背景
- **明暗主题**：自动跟随系统或手动切换
- **封面展示**：精美的专辑封面和元数据显示

### 💻 桌面深度集成
- **系统托盘**：macOS 托盘图标，快速控制播放
- **菜单栏歌词**：macOS 状态栏实时显示歌词
- **全局媒体键**：支持键盘媒体键控制
- **系统媒体控制**：集成系统媒体传输控制
- **桌面通知**：歌曲切换时显示通知

### ⚙️ 丰富的设置选项
- **多语言支持**：中文/英文界面
- **存储管理**：可视化缓存占用，一键清理
- **音频输出**：支持 AirPlay、蓝牙等输出设备
- **Replay Gain**：音量标准化支持
- **代理设置**：播放代理 URL 配置

## 🏗️ 技术架构

### 核心技术栈

| 类别 | 技术方案 |
|------|----------|
| 框架 | Flutter 3.35.7 |
| 状态管理 | Riverpod + Hooks |
| 音频播放 | media_kit (基于 mpv) |
| 本地数据库 | Drift (SQLite) |
| 路由 | GoRouter |
| HTTP 客户端 | rhttp |
| AI 翻译 | 智谱 AI |
| 歌词解析 | lyricskit |

### 架构设计

```
lib/
├── init/                    # 应用初始化
├── l10n/                    # 国际化 (中/英)
├── models/                  # 数据模型
│   ├── audio_player/        # 播放器状态、曲目、本地歌曲
│   ├── audio_station/       # 群晖 API 模型
│   ├── cloud_music/         # 云音乐 API 模型
│   └── database/            # Drift SQLite 表定义
├── providers/               # Riverpod 状态管理
│   ├── audio_player/        # 播放器、下载、本地歌曲
│   ├── audio_station/       # 群晖 API providers
│   ├── cloud_music/         # 云音乐 providers
│   └── common/              # 主题、存储、设置、Aria2
├── services/                # 业务逻辑层
│   ├── audio_player/        # 播放服务、连接检测
│   ├── cloud_music/         # 云音乐 API 服务
│   ├── server/              # 本地流媒体服务器
│   └── translate/           # 翻译服务
├── utils/                   # 工具类
└── widgets/                 # UI 组件
    ├── components/          # 可复用组件
    ├── layouts/             # 页面布局
    └── pages/               # 页面
```

### 关键技术亮点

#### 1. 本地流媒体代理
通过本地 HTTP 服务器代理群晖 NAS 的音频流，实现：
- 统一的音频流处理
- 支持本地歌曲和在线歌曲无缝切换
- 封面图片动态获取

#### 2. 双音乐源架构
设计统一的 `ToneHarborTrackObject` 抽象层，支持：
- 群晖 Audio Station 曲目
- 云音乐 API 曲目
- 本地音乐文件
- 统一的播放队列管理

#### 3. 智能缓存系统
- API 响应缓存（使用 Hive）
- 歌词缓存
- 封面图片缓存
- 支持缓存过期和手动清理

#### 4. 响应式设计
基于断点的响应式布局系统：
- `isXs`: 超小屏 (< 600px)
- `isSm`: 小屏 (600-904px)
- `isMd`: 中屏 (904-1239px)
- `isLg`: 大屏 (1240-1439px)
- `isXl`: 超大屏 (>= 1440px)

## 🚀 安装指南

### 环境要求
- **Flutter SDK**: 3.35.7（**不兼容 Flutter 3.38+**）
- **Dart**: 3.9.2
- **平台**: iOS 14+ / macOS 11+

### macOS 安装
```bash
git clone <repository-url>
cd ToneHarbor
flutter pub get
flutter run -d macos
```

### iOS 安装
```bash
git clone <repository-url>
cd ToneHarbor
flutter pub get
flutter run -d ios
```

## 🔧 配置说明

### 群晖 Audio Station 设置
1. 输入 NAS 服务器地址（如 `192.168.1.100:5000`）
2. 输入用户名和密码
3. 登录前测试连接
4. 可选启用 HTTPS

### 云音乐 API 设置
1. 进入设置 → 云音乐 API 设置
2. 配置 API 服务地址
3. 可选择将其设为主页

### 歌词翻译设置
1. 进入设置 → AI 翻译设置
2. 输入智谱 AI API 密钥
3. 选择翻译目标语言

### Aria2 远程下载设置
1. 进入设置 → Aria2 设置
2. 输入 Aria2 服务器地址和密钥
3. 测试连接
4. 下载任务将分发到远程服务器

## 📖 开发指南

### 代码生成
```bash
dart run build_runner build --delete-conflicting-outputs
```

### 构建发布版本

**macOS:**
```bash
flutter build macos --release
```

**iOS:**
```bash
flutter build ios --release
```

**iOS IPA 打包:**
```bash
./build_ipa.sh [名称]
# 示例: ./build_ipa.sh ToneHarbor
# 将生成 ToneHarbor.ipa 文件
```

> 脚本会自动执行 `flutter build ios --release --no-codesign` 并打包成 IPA 文件，适用于越狱设备或侧装。

### 项目依赖说明
项目使用了多个自定义维护的 fork 版本：
- `media_kit`: 修复 hot restart 崩溃问题
- `tray_manager` / `window_manager`: macOS 特定优化
- `lyricskit`: 歌词解析库
- `flutter_lyric`: 歌词显示组件

## 📸 应用截图

<p align="center">
  <img src="./extra_image/CleanShot%202026-04-23%20at%2008.12.06@2x.png" width="45%" alt="主界面">
  <img src="./extra_image/CleanShot%202026-04-23%20at%2008.12.35@2x.png" width="45%" alt="播放详情">
</p>

<p align="center">
  <img src="./extra_image/CleanShot%202026-04-23%20at%2008.12.51@2x.png" width="45%" alt="歌单列表">
  <img src="./extra_image/CleanShot%202026-04-23%20at%2008.13.13@2x.png" width="45%" alt="推荐页面">
</p>

<p align="center">
  <img src="./extra_image/CleanShot%202026-04-23%20at%2008.13.36@2x.png" width="45%">
  <img src="./extra_image/CleanShot%202026-04-23%20at%2008.13.59@2x.png" width="45%">
</p>

<p align="center">
  <img src="./extra_image/CleanShot%202026-04-23%20at%2008.14.37@2x.png" width="45%">
  <img src="./extra_image/CleanShot%202026-04-23%20at%2008.14.56@2x.png" width="45%">
</p>

<p align="center">
  <img src="./extra_image/CleanShot%202026-04-23%20at%2008.15.26@2x.png" width="45%">
  <img src="./extra_image/CleanShot%202026-04-23%20at%2008.17.03@2x.png" width="45%">
</p>

<p align="center">
  <img src="./extra_image/CleanShot%202026-04-23%20at%2008.17.52@2x.png" width="45%">
  <img src="./extra_image/CleanShot%202026-04-23%20at%2008.18.16@2x.png" width="45%">
</p>

<p align="center">
  <img src="./extra_image/CleanShot%202026-04-23%20at%2008.18.32@2x.png" width="45%">
</p>

## 📄 许可证

MIT License

## 🙏 致谢

- [Synology Audio Station API](https://www.synology.com/)
- [media_kit](https://github.com/media-kit/media-kit)
- [lyricskit](https://github.com/LyricTracers/lyricskit)
- 所有开源贡献者
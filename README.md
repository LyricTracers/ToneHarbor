# ToneHarbor

**ToneHarbor** · Your music, all in harbor.

A feature-rich Audio Station client for Synology NAS, supporting high-quality music streaming, offline downloads, and intelligent lyrics management.

## Features

### 🎵 Music Playback
- Stream music from Synology Audio Station
- Play local downloaded music without internet connection
- Multiple quality options: Low (128kbps), Medium (192kbps), High (320kbps), Original
- Smart preload - automatically preload next track for seamless playback
- Shuffle and repeat modes
- Playlist queue management (up to 1000 songs)
- Favorite songs collection (up to 100 songs)

### 📥 Download Manager
- Download songs for offline playback
- Selectable audio quality (Low/Medium/High/Original)
- Preload mode for background downloading
- Pause, resume, and cancel downloads
- Download history tracking
- Automatic cache management

### 🎤 Lyrics
- Display embedded lyrics
- Online lyrics search from multiple sources
- AI-powered lyrics translation (Chinese ↔ English)
- Save translated lyrics locally
- Status bar lyrics display (macOS)

### 🎨 Beautiful UI
- Material Design 3 with dynamic color scheme
- Light/Dark theme
- Dynamic background from album art
- Auto/Manual background switching
- Responsive layout - sidebar for desktop, full-screen for mobile
- Cover art display with metadata
- Search with history

### 💻 Desktop Integration
- System tray support (macOS/Windows/Linux)
- Status bar lyrics on menu bar (macOS)
- Global media key shortcuts
- System media transport controls (Windows)
- Desktop notifications

### ⚙️ Settings
- Multi-language support (English/Chinese)
- Storage cache management
- Audio output device selection (AirPlay, Bluetooth)
- Replay Gain support
- Playback proxy URL configuration

## Screenshots

> *(Add your screenshots here)*

## Installation

### macOS
```bash
git clone <repository-url>
cd toneharbor
flutter pub get
flutter run -d macos
```

### Windows
```bash
flutter pub get
flutter run -d windows
```

### Linux
```bash
flutter pub get
flutter run -d linux
```

### Android
```bash
flutter pub get
flutter run -d android
```

## Configuration

### Server Settings
1. Enter your Synology NAS server URL (e.g., `192.168.1.100:5000`)
2. Enter your username and password
3. Test connection before logging in
4. Optionally enable HTTPS

### Download Quality
- **Low**: 128kbps - Save storage space
- **Medium**: 192kbps - Balanced
- **High**: 320kbps - Best quality
- **Original**: Lossless - Maximum quality

### Lyrics Translation
1. Go to Settings → AI Translate Settings
2. Enter your Zhipu AI API key
3. Select target language for translation

## Architecture

```
lib/
├── init/                    # App initialization
├── l10n/                    # Localization (English/Chinese)
├── models/                  # Data models
│   ├── audio_player/        # Player state, tracks, local songs
│   ├── audio_station/       # Synology API models
│   └── database/            # Drift SQLite tables
├── providers/               # Riverpod state management
│   ├── audio_player/        # Player, download, local songs
│   ├── audio_station/       # API providers
│   └── common/             # Theme, storage, settings
├── services/               # Business logic
│   ├── audio_player/       # Playback service, connection checker
│   └── translate/          # Translation service
├── utils/                   # Utilities, helpers
└── widgets/                # UI components
    ├── components/         # Reusable widgets
    ├── layouts/            # Page layouts
    └── pages/              # App pages
```

## Tech Stack

- **Framework**: Flutter 3.35.7
- **State Management**: Riverpod + Hooks
- **Audio Playback**: media_kit
- **Local Database**: Drift (SQLite)
- **Routing**: GoRouter
- **HTTP Client**: rhttp
- **AI Translation**: Zhipu AI

## Development

### Prerequisites
- Flutter SDK 3.35.7
- Dart 3.9.2
- Platform-specific requirements:
  - **macOS**: Xcode
  - **Windows**: Visual Studio
  - **Linux**: GTK

### Generate Code
```bash
dart run build_runner build --delete-conflicting-outputs
```

## License

MIT License

## Acknowledgments

- [Synology Audio Station API](https://www.synology.com/)
- [media_kit](https://github.com/media-kit/media-kit)
- All open source contributors

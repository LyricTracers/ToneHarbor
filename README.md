# ToneHarbor

**ToneHarbor** · Your music, all in harbor.

A feature-rich Audio Station client for Synology NAS, with support for local music playback, offline downloads, and beautiful lyrics display.

## Features

### 🎵 Music Playback
- Stream music from Synology Audio Station
- Play local downloaded music without internet
- Gapless playback support
- Playlist queue management
- Shuffle and repeat modes

### 📥 Download Manager
- Download songs for offline playback
- Multiple quality options
- Pause, resume, and cancel downloads
- Download queue management
- Automatic cache management

### 🎤 Lyrics
- Embedded lyrics display
- Online lyrics search
- Lyrics translation (Chinese ↔ English)
- Desktop system tray lyrics (macOS)

### 🎨 Beautiful UI
- Material Design 3
- Light/Dark theme
- Responsive layout for desktop and mobile
- Cover art display
- Search with history

### 💻 Desktop Integration
- System tray support (macOS/Windows/Linux)
- Global media key shortcuts
- Mini player mode
- Desktop notifications

## Screenshots

> *(Add your screenshots here)*

## Installation

### macOS
```bash
# Clone the repository
git clone https://github.com/yourusername/toneharbor.git
cd toneharbor

# Install dependencies
flutter pub get

# Run the app
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

### Download Quality
- Supports multiple audio qualities
- Choose based on your network and storage preferences

## Architecture

```
lib/
├── init/                    # App initialization
├── l10n/                    # Localization
├── models/                  # Data models
│   ├── audio_player/        # Player state, tracks
│   ├── audio_station/       # Synology API models
│   └── database/             # Database tables
├── providers/               # Riverpod providers
│   ├── audio_player/        # Player, download, local songs
│   ├── audio_station/       # API providers
│   └── common/              # Theme, storage
├── services/                # Business logic
│   ├── audio_player/        # Playback service
│   └── translate/           # Translation service
├── utils/                   # Utilities
└── widgets/                 # UI components
    ├── components/          # Reusable widgets
    ├── layouts/             # Page layouts
    └── pages/               # App pages
```

## Tech Stack

- **Framework**: Flutter
- **State Management**: Riverpod + Hooks
- **Audio Playback**: media_kit
- **Local Database**: Drift (SQLite)
- **Routing**: GoRouter
- **API Client**: rhttp

## Development

### Prerequisites
- Flutter SDK 3.9+
- Dart 3.9+
- Platform-specific requirements:
  - **macOS**: Xcode
  - **Windows**: Visual Studio
  - **Linux**: GTK

### Generate Code
```bash
# Generate freezed, json_serializable, and riverpod files
dart run build_runner build --delete-conflicting-outputs
```

## License

MIT License

## Acknowledgments

- [Synology Audio Station API](https://www.synology.com/)
- [media_kit](https://github.com/media-kit/media-kit)
- All open source contributors

# Copilot Instructions for Print Label Barcode Scanner

## Project Overview

This is a **Flutter-based barcode scanner** app designed for cross-platform deployment (Android, iOS, Web). The project is in **early development stage** with a minimal working implementation focused on barcode scanning functionality using the `ai_barcode_scanner` package.

**Key characteristic**: Most files in `/lib` are **empty placeholders** for future features. Only `main.dart` and `screens/barcode_scanner_screen.dart` contain actual working code.

## Architecture

### Entry Point
- `lib/main.dart`: Standard Flutter counter demo app with integrated barcode scanner button
- Barcode scanner launches via `BarcodeScannerScreen` and returns scanned value to home screen

### Core Dependencies
- `ai_barcode_scanner: ^7.1.0`: Primary barcode scanning functionality (wraps mobile_scanner)
- `shared_preferences: ^2.2.2`: Local storage (not yet implemented)
- `cupertino_icons: ^1.0.8`: iOS-style icons

### Project Structure
```
lib/
├── main.dart                     # ✅ Main app entry (working)
├── main_clean.dart               # ⚠️ Empty placeholder
├── screens/
│   ├── barcode_scanner_screen.dart  # ✅ Barcode UI (working)
│   └── [13 other screens]        # ⚠️ All empty placeholders
├── models/                       # ⚠️ All empty (label_product, label_settings, etc.)
├── services/                     # ⚠️ All empty (auth, print, batch, etc.)
├── providers/                    # ⚠️ Empty (label_provider)
└── widgets/                      # ⚠️ All empty (label widgets)
```

### Platform-Specific Setup

**Android** (`android/app/src/main/AndroidManifest.xml`):
- Camera permission: `<uses-permission android:name="android.permission.CAMERA" />`

**iOS** (`ios/Runner/Info.plist`):
- Camera usage: `NSCameraUsageDescription` - "This app uses the camera to scan barcodes."
- Microphone usage: `NSMicrophoneUsageDescription` (inherited from ai_barcode_scanner)

**Web**: Camera requires HTTPS (handled by deployment platforms)

## Build & Development Workflows

### Standard Commands
```bash
# Get dependencies
flutter pub get

# Run development (debug mode)
flutter run

# Build for web (production)
flutter build web --release

# Analyze code
flutter analyze

# Run tests
flutter test
```

### Important Build Notes
- **Web builds** are committed to `build/web/` directory for static hosting deployment
- Multiple `pubspec` variants exist:
  - `pubspec.yaml`: Primary config
  - `pubspec_apk.yaml`: Android-specific overrides (empty placeholder)
  - `pubspec_backup.yaml`: Backup config (empty placeholder)

## Deployment Strategy

This project prioritizes **web deployment** over native apps. Three deployment paths are documented:

1. **Vercel** (Primary, recommended): Git-based deployment from `build/web/`
   - Config: `vercel.json` routes to `build/web/` directory
   - Auto-deploys on GitHub push
   - No build command needed (pre-built files committed)

2. **GitHub Pages**: Manual gh-pages branch deployment
   - Requires `.nojekyll` file
   - May need base href adjustment in index.html

3. **Firebase Hosting**: Alternative option (documented but not configured)

### Deployment Scripts
- `deploy-github-pages.ps1`: PowerShell script for GitHub Pages deployment
- `deploy-vercel.ps1`: PowerShell script for Vercel deployment
- `update-deployment.ps1`: Update existing deployment

**Critical**: Always run `flutter build web --release` before deploying web builds.

## Testing Conventions

Minimal test infrastructure exists:
- `test/widget_test.dart`: Basic counter increment test (standard Flutter template)
- `test/csv_parsing_test.dart`: Empty placeholder
- `test/print_service_test.dart`: Empty placeholder
- `test/template_switching_test.dart`: Empty placeholder
- `test/guest_navigation_test.dart`: Empty placeholder

When adding tests, follow Flutter's standard `flutter_test` patterns.

## Code Conventions

### Current State
- Standard Flutter/Dart conventions via `flutter_lints: ^5.0.0`
- Analysis options use default `package:flutter_lints/flutter.yaml`
- Most files are empty stubs awaiting implementation

### When Implementing Features
1. **Check empty files first**: Many screens/services/widgets exist as 0-byte placeholders
2. **Camera permissions**: Already configured for Android/iOS - don't duplicate
3. **Barcode scanning**: Use existing `ai_barcode_scanner` patterns from `barcode_scanner_screen.dart`:
   ```dart
   AiBarcodeScanner(
     onDetect: (BarcodeCapture capture) {
       final String? scannedValue = capture.barcodes.first.rawValue;
       // Handle scanned value
     },
     controller: MobileScannerController(
       detectionSpeed: DetectionSpeed.noDuplicates,
     ),
   )
   ```

## Key Documentation Files

- `DEPLOYMENT_GUIDE.md`: Comprehensive multi-platform deployment guide (4.4KB)
- `VERCEL_DEPLOYMENT.md`: Detailed Vercel-specific instructions (6.3KB)
- `GIT_AND_VERCEL_GUIDE.md`: Git basics + Vercel workflow (18KB) 
- `IPHONE_USAGE_GUIDE.md`: iOS-specific camera testing (7.8KB)
- `README_GUIDES.md`: Documentation index and navigation (8.1KB)
- `MANUAL_DEPLOYMENT_STEPS.txt`: Step-by-step GitHub Pages setup

Most other `.md` files are empty placeholders for future documentation.

## Common Pitfalls

1. **Empty file trap**: Don't assume screens/services/models are implemented - verify file content
2. **Web camera HTTPS**: Camera only works on HTTPS (localhost exception). All deployment platforms auto-provide HTTPS
3. **Build directory**: Web builds in `build/web/` are intentionally committed for static hosting
4. **Flutter SDK**: Not available in standard CI/CD - commit pre-built web files instead
5. **Multiple main files**: Only `main.dart` is the real entry point; `main_clean.dart` is unused

## Development Priorities

Based on empty placeholders, planned features include:
- Label printing system (models, widgets, services all stubbed)
- Product database management (screens exist as stubs)
- Template management system (widgets and screens stubbed)
- Authentication (login/signup screens stubbed)
- Bluetooth scanning (screen stubbed)
- Batch operations (service stubbed)

When implementing, start with models → services → screens → widgets pattern.

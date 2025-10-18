# Print Label Barcode Scanner

A Flutter-based barcode scanner application that works on web, iOS, and Android.

## 🚀 Features

- **Barcode Scanning**: Scan barcodes using device camera
- **Web Support**: Fully functional on web browsers with HTTPS
- **Cross-Platform**: Works on iOS, Android, and Web
- **Camera Integration**: Uses ai_barcode_scanner for reliable scanning

## 📱 Live Demo

- **Vercel**: `https://print-label-barcode-scanner.vercel.app`
- **GitHub Pages**: `https://alosralimited.github.io/print-label-barcode-scanner/`

## 🛠️ Getting Started

### Prerequisites

- Flutter SDK 3.24.0 or higher
- For iOS development: Xcode
- For Android development: Android Studio

### Installation

1. Clone the repository:
```bash
git clone https://github.com/alosralimited/print-label-barcode-scanner.git
cd print-label-barcode-scanner
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
# For web
flutter run -d chrome

# For iOS
flutter run -d ios

# For Android
flutter run -d android
```

### Building for Web

```bash
flutter build web --release
```

## 📚 Documentation

- **[Git & Vercel Guide](GIT_AND_VERCEL_GUIDE.md)**: Complete guide for Git setup and Vercel deployment
- **[Vercel Deployment](VERCEL_DEPLOYMENT.md)**: Focused Vercel deployment instructions
- **[iPhone Usage Guide](IPHONE_USAGE_GUIDE.md)**: How to use the app on iPhone
- **[Deployment Guide](DEPLOYMENT_GUIDE.md)**: General deployment information
- **[README Guides](README_GUIDES.md)**: Navigation guide for all documentation

## 🔧 Configuration

The app is configured to work with:
- Base URL for GitHub Pages: `/print-label-barcode-scanner/`
- Supports both Vercel and GitHub Pages deployment
- HTTPS required for camera access on mobile devices

## 📦 Dependencies

- `flutter`: SDK
- `cupertino_icons`: iOS-style icons
- `shared_preferences`: Local data storage
- `ai_barcode_scanner`: Barcode scanning functionality

## 🚀 Deployment

### GitHub Actions

The repository includes a GitHub Actions workflow that automatically builds and deploys to GitHub Pages on push to the main branch.

### Vercel

For Vercel deployment, see [VERCEL_DEPLOYMENT.md](VERCEL_DEPLOYMENT.md) for detailed instructions.

## 📄 License

This project is a Flutter application for barcode scanning and label printing.

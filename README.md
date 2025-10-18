# 📸 Print Label Barcode Scanner

A Flutter-based barcode scanner application for web, iOS, and Android platforms.

---

## 🚀 Quick Start

### Deployment Status
**✅ The app is READY for deployment!**

📊 **See [STATUS_UPDATE.md](STATUS_UPDATE.md) for complete deployment status and next steps.**

### Available Guides
- 📘 **[README_GUIDES.md](README_GUIDES.md)** - Complete documentation index
- 🚀 **[VERCEL_DEPLOYMENT.md](VERCEL_DEPLOYMENT.md)** - Step-by-step Vercel deployment
- 📖 **[GIT_AND_VERCEL_GUIDE.md](GIT_AND_VERCEL_GUIDE.md)** - Complete Git & Vercel guide
- 📱 **[IPHONE_USAGE_GUIDE.md](IPHONE_USAGE_GUIDE.md)** - iPhone-specific instructions
- 🔧 **[DEPLOYMENT_GUIDE.md](DEPLOYMENT_GUIDE.md)** - Multi-platform deployment options

---

## 🎯 Features

- ✅ Real-time barcode scanning using device camera
- ✅ Support for multiple barcode formats
- ✅ Web-based (works on any device with a browser)
- ✅ Mobile-optimized UI
- ✅ Instant deployment to cloud platforms
- ✅ HTTPS support for camera access
- ✅ PWA capabilities

---

## 🌐 Deployment Options

### Option 1: Vercel (Recommended)
1. Go to https://vercel.com/new
2. Import repository: `alosralimited/print-label-barcode-scanner`
3. Set Output Directory: `build/web`
4. Deploy!

**Full guide:** [VERCEL_DEPLOYMENT.md](VERCEL_DEPLOYMENT.md)

### Option 2: GitHub Actions (Automated)
- Push to `main` branch automatically deploys to GitHub Pages
- Workflow: `.github/workflows/deploy-web.yml`

### Option 3: Other Platforms
- Firebase Hosting
- Netlify
- GitHub Pages (manual)

**See:** [DEPLOYMENT_GUIDE.md](DEPLOYMENT_GUIDE.md)

---

## 🛠️ Development

### Prerequisites
- Flutter SDK 3.x or higher
- Dart SDK
- Git

### Local Setup
```bash
# Clone the repository
git clone https://github.com/alosralimited/print-label-barcode-scanner.git
cd print-label-barcode-scanner

# Install dependencies
flutter pub get

# Run the app (web)
flutter run -d chrome

# Build for production
flutter build web --release
```

### Project Structure
```
print_label_barcode_scanner/
├── lib/
│   ├── main.dart                 # App entry point
│   ├── screens/                  # UI screens
│   ├── widgets/                  # Reusable widgets
│   ├── models/                   # Data models
│   ├── providers/                # State management
│   └── services/                 # Business logic
├── build/web/                    # Built web app (deployable)
├── .github/workflows/            # CI/CD pipelines
└── documentation files (.md)     # Guides and references
```

---

## 📱 Testing

### Web Testing
```bash
flutter run -d chrome
```

### Mobile Testing
- **iOS:** Requires Xcode (see [IPHONE_USAGE_GUIDE.md](IPHONE_USAGE_GUIDE.md))
- **Android:** Connect device or emulator, run `flutter run`

### Production Testing
After deployment, test on:
- Desktop browsers (Chrome, Firefox, Safari, Edge)
- Mobile browsers (iOS Safari, Android Chrome)
- Verify camera permissions work correctly
- Test barcode scanning functionality

---

## 🔍 Troubleshooting

### Camera not working?
- Ensure HTTPS is enabled (all deployment platforms provide this)
- Check browser permissions
- Use Safari on iOS for best compatibility

### Deployment issues?
- Check [STATUS_UPDATE.md](STATUS_UPDATE.md) for current status
- See platform-specific guides for detailed troubleshooting
- Verify `build/web` directory exists and contains all files

### Build errors?
```bash
# Clean build
flutter clean
flutter pub get
flutter build web --release
```

---

## 📞 Support & Documentation

- **Full Documentation:** [README_GUIDES.md](README_GUIDES.md)
- **Deployment Status:** [STATUS_UPDATE.md](STATUS_UPDATE.md)
- **Quick Reference:** All `.md` files in the root directory

---

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

---

## 🎉 Ready to Deploy!

The application is fully built and ready for deployment. Choose your preferred platform and follow the corresponding guide to get your barcode scanner live!

**Start here:** [STATUS_UPDATE.md](STATUS_UPDATE.md)

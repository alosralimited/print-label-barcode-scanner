# Print Label Barcode Scanner

A Flutter barcode scanner application for Windows, iOS, and web platforms.

## 🚀 Quick Deploy to GitHub Pages

**Want to deploy your app online? Choose your method:**

- **[Quick Start Guide](QUICK_START_DEPLOYMENT.md)** - Get started in 5 minutes!
- **[Detailed GitHub Pages Guide](GITHUB_PAGES_DEPLOYMENT.md)** - Complete deployment documentation
- **[All Deployment Options](DEPLOYMENT_GUIDE.md)** - Vercel, Firebase, Netlify, and more

### Fastest Way:
1. Enable GitHub Actions in Settings → Pages
2. Push to main branch
3. Your app is live! ✨

---

## 📱 Features

- Barcode scanning using device camera
- Support for multiple barcode formats
- Works on Windows, iOS, and web browsers
- Clean and intuitive interface

## 🛠️ Development Setup

### Prerequisites
- Flutter SDK (3.9.2 or higher)
- Dart SDK
- Git

### Getting Started

1. **Clone the repository:**
   ```bash
   git clone https://github.com/YOUR_USERNAME/print-label-barcode-scanner.git
   cd print-label-barcode-scanner
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run the app:**
   ```bash
   # For web
   flutter run -d chrome
   
   # For Windows
   flutter run -d windows
   
   # For iOS (requires Mac)
   flutter run -d ios
   ```

## 📦 Building

### Web Build
```bash
flutter build web --release
```

### Windows Build
```bash
flutter build windows --release
```

### iOS Build (requires Mac)
```bash
flutter build ios --release
```

## 🌐 Deployment

This app can be deployed to:
- **GitHub Pages** (recommended for web) - See [Quick Start](QUICK_START_DEPLOYMENT.md)
- **Vercel** - Drag and drop deployment
- **Netlify** - Continuous deployment
- **Firebase Hosting** - Google's hosting solution

Full deployment guides available in the [DEPLOYMENT_GUIDE.md](DEPLOYMENT_GUIDE.md).

## 📱 Testing on Mobile Devices

### iPhone/iPad Testing
1. Deploy to a web hosting service (GitHub Pages, Vercel, etc.)
2. Open Safari on your iPhone/iPad
3. Navigate to your deployed URL
4. Grant camera permissions when prompted
5. Tap "Scan Barcode" to start

**Note:** Camera access requires HTTPS, which is automatically provided by GitHub Pages and other hosting services.

## 🔧 Troubleshooting

### Camera not working on web?
- Ensure you're using HTTPS
- Check browser permissions
- Test on Safari for iOS devices

### Build failing?
- Run `flutter clean`
- Run `flutter pub get`
- Check Flutter version: `flutter --version`

## 📚 Documentation

- [QUICK_START_DEPLOYMENT.md](QUICK_START_DEPLOYMENT.md) - Quick deployment guide
- [GITHUB_PAGES_DEPLOYMENT.md](GITHUB_PAGES_DEPLOYMENT.md) - Detailed GitHub Pages guide
- [DEPLOYMENT_GUIDE.md](DEPLOYMENT_GUIDE.md) - All deployment options
- [IPHONE_USAGE_GUIDE.md](IPHONE_USAGE_GUIDE.md) - iPhone usage instructions

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🆘 Support

Having issues? Check out:
- The troubleshooting section above
- [GitHub Issues](https://github.com/alosralimited/print-label-barcode-scanner/issues)
- [Flutter Documentation](https://docs.flutter.dev/)


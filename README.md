# print-label-barcode-scanner

[![Deploy Flutter Web to GitHub Pages](https://github.com/alosralimited/print-label-barcode-scanner/actions/workflows/deploy-github-pages.yml/badge.svg?branch=main)](https://github.com/alosralimited/print-label-barcode-scanner/actions/workflows/deploy-github-pages.yml)
[![Website](https://img.shields.io/website?url=https%3A%2F%2Falosralimited.github.io%2Fprint-label-barcode-scanner%2F&up_message=Live&down_message=Offline&label=GitHub%20Pages)](https://alosralimited.github.io/print-label-barcode-scanner/)

Flutter web app for scanning barcodes and printing labels.

## Live

- App URL: [https://alosralimited.github.io/print-label-barcode-scanner/](https://alosralimited.github.io/print-label-barcode-scanner/)

## Try it on iPad/iPhone

- Open Safari and visit the live URL above
- Tap Share → Add to Home Screen
- Open from your home screen and allow Camera permission when prompted

More details: see `DEPLOYMENT_READY.md` (Testing on iPad/iPhone section).

## Development

- Build web locally (release): `flutter build web --release`
- Run tests: `flutter test`

## Email Configuration

For email setup and DNS configuration related to the alosralimited.com domain:

- **[Email Documentation Index](EMAIL_DOCS_INDEX.md)** - Start here for all email documentation
- [Quick Start Guide](EMAIL_QUICK_START.md) - 10-minute email setup
- [Email Setup Guide](EMAIL_SETUP.md) - Complete guide for MX, SPF, DKIM, DMARC records
- [Email Alias Configuration](EMAIL_ALIAS_GUIDE.md) - Managing email aliases (sales@, info@)
- [DNS Configuration Reference](DNS_CONFIGURATION.md) - DNS records and troubleshooting

## Troubleshooting

- If the app doesn’t load right after a push, wait 2–3 minutes for deployment
- Hard refresh if changes don’t appear
- Ensure camera permissions are granted on iOS

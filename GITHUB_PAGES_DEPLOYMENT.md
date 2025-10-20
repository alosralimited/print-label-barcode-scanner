# GitHub Pages Deployment Guide

## 🚀 Automated Deployment (Recommended)

### Setup GitHub Pages

1. **Enable GitHub Pages in your repository:**
   - Go to your GitHub repository
   - Click **Settings** → **Pages**
   - Under **Source**, select **GitHub Actions**

2. **Push your code to GitHub:**

   ```bash
   git add .
   git commit -m "Add GitHub Actions deployment workflow"
   git push origin main
   ```

3. **Wait for deployment:**
   - The GitHub Actions workflow will automatically build and deploy
   - Check the **Actions** tab to monitor progress
   - Your app will be available at: `https://alosralimited.github.io/print-label-barcode-scanner/`

### Access on iPad/iPhone

Once deployed, you can access your app directly on iPad/iPhone:

1. Open Safari on your iPad/iPhone
2. Navigate to: `https://alosralimited.github.io/print-label-barcode-scanner/`
3. Tap the **Share** button → **Add to Home Screen**
4. Your Flutter app will now work like a native app!

## 📱 Testing on Mobile Devices

### iPad/iPhone Features

- ✅ **Full touch support** - Optimized for touch interface
- ✅ **Camera access** - For barcode scanning (requires HTTPS)
- ✅ **Responsive design** - Adapts to different screen sizes
- ✅ **PWA support** - Can be installed as a web app
- ✅ **Offline capable** - Works with service workers

### Camera Permissions

To use the barcode scanner on iPad/iPhone:

1. The app must be served over HTTPS (GitHub Pages provides this)
2. When prompted, allow camera access in Safari settings

## 🔧 Manual Deployment (Alternative)

If you prefer to deploy manually:

```powershell
# Run from project root
.\deploy-github-pages.ps1
```

This script will:

1. Build the Flutter web app with correct base-href
2. Create gh-pages branch
3. Deploy to GitHub Pages
4. Add .nojekyll and 404.html for proper routing

## 🛠️ Configuration Details

### Base HREF

The app is configured with base-href: `/print-label-barcode-scanner/`

If you change the repository name, update:

- `.github/workflows/deploy-github-pages.yml` (line 38)
- `deploy-github-pages.ps1` (line 8)

### Web Renderer

Using **CanvasKit** renderer for:

- Better performance
- Consistent rendering across devices
- Full Flutter features support

### Important Files

- `.nojekyll` - Prevents GitHub Pages from processing files with Jekyll
- `404.html` - Enables client-side routing for Flutter SPA

## 🔍 Troubleshooting

### Build Fails

```bash
flutter clean
flutter pub get
flutter build web --release --web-renderer canvaskit --base-href /print-label-barcode-scanner/
```

### Camera Not Working on iPad

- Ensure you're using HTTPS (GitHub Pages provides this)
- Check Safari permissions: Settings → Safari → Camera
- Try in private/incognito mode first

### App Not Loading

- Clear browser cache on iPad/iPhone
- Check GitHub Actions build status
- Verify GitHub Pages is enabled in repository settings

## 📊 Monitoring

### GitHub Actions

- View deployment status: Repository → Actions tab
- Each push to `main` triggers automatic deployment
- Build takes ~2-3 minutes

### Live URL

Your app is live at: `https://alosralimited.github.io/print-label-barcode-scanner/`

## 🌐 Custom Domain Setup

### Configure Custom Domain (alosralimited.com)

This repository includes a CNAME file configured for the custom domain **alosralimited.com**.

#### Steps to Complete Custom Domain Setup

1. **DNS Configuration on Squarespace:**
   - Log into your Squarespace account
   - Navigate to your domain DNS settings: [alosralimited.com DNS Settings](https://account.squarespace.com/domains/managed/alosralimited.com/dns/dns-settings)
   - Add the following DNS records:

   **For apex domain (alosralimited.com):**

   ```dns
   Type: A
   Host: @
   Points to: 185.199.108.153
   
   Type: A
   Host: @
   Points to: 185.199.109.153
   
   Type: A
   Host: @
   Points to: 185.199.110.153
   
   Type: A
   Host: @
   Points to: 185.199.111.153
   ```

   **For www subdomain (recommended):**

   ```dns
   Type: CNAME
   Host: www
   Points to: alosralimited.github.io
   ```

2. **GitHub Pages Custom Domain Configuration:**
   - Go to your repository settings: Settings → Pages
   - Under "Custom domain", enter: `alosralimited.com`
   - Click "Save"
   - Wait for DNS check to complete (can take up to 24-48 hours)
   - Once verified, enable "Enforce HTTPS"

3. **Verify DNS Propagation:**
   - Use [dnschecker.org](https://dnschecker.org) to check if your CNAME record is visible globally
   - Check for: `alosralimited.com` → should point to `alosralimited.github.io`
   - DNS changes can take 24-48 hours to fully propagate

#### Troubleshooting Custom Domain

- **CNAME record not visible**: Ensure you've saved changes in Squarespace DNS settings and wait for propagation
- **"Domain is improperly configured"**: Verify all A records and CNAME records are correct
- **HTTPS not working**: Wait for DNS to fully propagate, then enable "Enforce HTTPS" in GitHub Pages settings
- **404 errors**: The CNAME file is automatically deployed with your site, no manual action needed

#### Important Notes

- The CNAME file is located at `web/CNAME` and contains the domain name
- The GitHub Actions workflow automatically copies this file to the deployment
- Do not remove or modify the CNAME file unless changing domains
- After DNS is configured, your site will be accessible at both:
  - `https://alosralimited.com`
  - `https://www.alosralimited.com` (if www CNAME is configured)

## 🔄 Updates

To update your deployed app:

1. Make changes to your code
2. Commit and push to `main` branch
3. GitHub Actions automatically rebuilds and deploys
4. Changes appear live in ~2-3 minutes

## 🎯 Next Steps

1. **Test on iPad/iPhone** - Open the deployed URL in Safari
2. **Add to Home Screen** - Install as PWA for app-like experience
3. **Test barcode scanning** - Verify camera permissions work
4. **Check all features** - Ensure label printing functions correctly

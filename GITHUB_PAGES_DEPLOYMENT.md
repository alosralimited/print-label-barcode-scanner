# GitHub Pages Deployment Guide

This guide explains how to deploy the Flutter barcode scanner app to GitHub Pages.

## 🚀 Automated Deployment (Recommended)

The repository includes a GitHub Actions workflow that automatically deploys to GitHub Pages when you push to the `main` branch.

### Setup Steps:

1. **Enable GitHub Pages in your repository settings:**
   - Go to: `https://github.com/YOUR_USERNAME/print-label-barcode-scanner/settings/pages`
   - Under **Source**, select **GitHub Actions**
   - Save the settings

2. **Push to the main branch:**
   ```bash
   git add .
   git commit -m "Your commit message"
   git push origin main
   ```

3. **Wait for deployment:**
   - The GitHub Actions workflow will automatically build and deploy your app
   - Check the **Actions** tab to monitor the deployment progress
   - Your site will be available at: `https://YOUR_USERNAME.github.io/print-label-barcode-scanner/`

### Workflow Features:

- ✅ Automatically builds Flutter web app with correct base-href
- ✅ Includes `.nojekyll` file for proper Flutter web routing
- ✅ Deploys to GitHub Pages using official actions
- ✅ Runs on every push to main branch
- ✅ Can also be triggered manually from the Actions tab

## 🔧 Manual Deployment (PowerShell Script)

If you prefer manual deployment or don't want to use GitHub Actions:

### Prerequisites:
- Flutter SDK installed
- Git installed
- PowerShell (Windows) or adapt commands for bash (Linux/Mac)

### Steps:

1. **Run the deployment script:**
   ```powershell
   .\deploy-github-pages.ps1
   ```

2. **Enter your GitHub username when prompted**

3. **Configure GitHub Pages:**
   - Go to: `https://github.com/YOUR_USERNAME/print-label-barcode-scanner/settings/pages`
   - Under **Source**, select **Deploy from a branch**
   - Select **gh-pages** branch and **/ (root)** folder
   - Click **Save**

4. **Access your site:**
   - Your site will be available at: `https://YOUR_USERNAME.github.io/print-label-barcode-scanner/`

### What the script does:
1. Builds the Flutter web app with correct base-href
2. Creates/updates the gh-pages branch
3. Copies build files to gh-pages branch
4. Adds `.nojekyll` file
5. Pushes to GitHub

## 📱 Testing on Mobile Devices

Once deployed, you can test the barcode scanner on your iPhone or iPad:

1. Open Safari on your iPhone/iPad
2. Navigate to: `https://YOUR_USERNAME.github.io/print-label-barcode-scanner/`
3. Grant camera permissions when prompted
4. Tap "Scan Barcode" to start scanning

**Note:** Camera access requires HTTPS, which GitHub Pages provides automatically.

## 🔍 Troubleshooting

### Workflow fails?
- Check the Actions tab for error details
- Ensure you have enabled GitHub Pages in repository settings
- Verify that the repository is public (required for free GitHub Pages)

### Blank page after deployment?
- Wait 2-3 minutes for GitHub Pages to fully deploy
- Clear your browser cache
- Check browser console for errors
- Verify that `.nojekyll` file exists in gh-pages branch

### Camera not working?
- Ensure you're using HTTPS (GitHub Pages provides this)
- Grant camera permissions in browser
- Test specifically on Safari for iPhone/iPad

### 404 errors?
- Verify the base-href is set correctly: `/print-label-barcode-scanner/`
- Check that all files from `build/web` were deployed
- Ensure GitHub Pages is enabled and pointing to the correct branch

## 📝 Updating Your Deployment

### Using GitHub Actions (Automatic):
Just push your changes to the main branch:
```bash
git add .
git commit -m "Update app"
git push origin main
```

The workflow will automatically rebuild and redeploy.

### Using PowerShell Script (Manual):
Run the deployment script again:
```powershell
.\deploy-github-pages.ps1
```

## 🎯 Best Practices

1. **Use GitHub Actions** for automated deployments
2. **Test locally** before deploying: `flutter run -d chrome`
3. **Monitor deployments** in the Actions tab
4. **Keep dependencies updated** with `flutter pub upgrade`
5. **Test on target devices** (iPhone/iPad) after deployment

## 📚 Additional Resources

- [GitHub Pages Documentation](https://docs.github.com/pages)
- [Flutter Web Deployment](https://docs.flutter.dev/deployment/web)
- [GitHub Actions for Flutter](https://github.com/marketplace/actions/flutter-action)

## 💡 Alternative Deployment Options

If you prefer not to use GitHub Pages, consider:
- **Vercel**: Easy drag-and-drop deployment
- **Netlify**: Continuous deployment from Git
- **Firebase Hosting**: Google's hosting solution

See `DEPLOYMENT_GUIDE.md` for more options.

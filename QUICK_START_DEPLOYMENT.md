# Quick Start: Deploy to GitHub Pages

The fastest way to get your barcode scanner app online!

## 🚀 Option 1: Automatic (GitHub Actions)

**Best for:** Most users, continuous deployment

1. **Enable GitHub Pages:**
   - Go to: Settings → Pages (in your GitHub repository)
   - Under "Source", select **GitHub Actions**
   - Click Save

2. **Push your code:**
   ```bash
   git push origin main
   ```

3. **Done!** 
   - Check the "Actions" tab for deployment status
   - Your app will be live at: `https://YOUR_USERNAME.github.io/print-label-barcode-scanner/`

---

## 💻 Option 2: PowerShell Script

**Best for:** One-time deployment, no Actions

1. **Run the script:**
   ```powershell
   .\deploy-github-pages.ps1
   ```

2. **Enter your GitHub username when prompted**

3. **Configure GitHub Pages:**
   - Go to: Settings → Pages
   - Select branch: **gh-pages**
   - Click Save

4. **Access your site:**
   `https://YOUR_USERNAME.github.io/print-label-barcode-scanner/`

---

## 📱 Testing on iPhone/iPad

1. Open Safari on your device
2. Navigate to your deployed URL
3. Grant camera permissions
4. Tap "Scan Barcode"
5. Point at a barcode to scan

---

## ❓ Need Help?

- **Detailed Guide:** See `GITHUB_PAGES_DEPLOYMENT.md`
- **Troubleshooting:** Check the Actions tab for errors
- **Camera not working?** Ensure HTTPS is enabled (automatic on GitHub Pages)

---

## 🎯 What Happens Next?

### With GitHub Actions (Option 1):
- Every push to `main` triggers automatic deployment
- No manual steps needed after initial setup
- Check deployment status in the Actions tab

### With PowerShell Script (Option 2):
- Run the script again whenever you want to deploy updates
- Manual process each time

---

**Recommended:** Use Option 1 (GitHub Actions) for easiest maintenance!

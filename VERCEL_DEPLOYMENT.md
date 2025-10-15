# VERCEL DEPLOYMENT GUIDE

## 🚀 Deploy Your Barcode Scanner to Vercel (Step-by-Step)

**Note:** Vercel has removed drag-and-drop upload. Deployment is now done via Git (GitHub/GitLab/Bitbucket).

---

## PART 1: Push Your Code to GitHub ✅

### Step 1: Commit Your Latest Changes

Open PowerShell in your project folder and run:

```powershell
git add .
git commit -m "Update deployment files and Flutter plugins"
git push origin main
```

**What this does:**
- `git add .` - Stages all changed files (including build/web folder)
- `git commit` - Saves changes locally with a message
- `git push` - Uploads changes to GitHub

**Wait 10 seconds** for GitHub to receive your files.

---

## PART 2: Deploy to Vercel 🚀

### Step 2: Go to Vercel Import Page

Open this link: **https://vercel.com/new**

**What you'll see:**
- A page titled "Import Git Repository" or "Let's build something new"
- Options to connect with GitHub, GitLab, or Bitbucket

### Step 3: Connect Your GitHub Account

1. Click **"Continue with GitHub"** (or "Add GitHub Account" if you see it)
2. A popup will ask you to authorize Vercel
3. Click **"Authorize Vercel"**
4. If asked, enter your GitHub password

**What this does:**
- Gives Vercel permission to read your GitHub repositories
- You only need to do this once

### Step 4: Import Your Repository

1. After authorization, you'll see a list of your GitHub repositories
2. Find **"alosralimited/print-label-barcode-scanner"**
3. Click **"Import"** next to it

**If you don't see your repository:**
- Click "Adjust GitHub App Permissions"
- Select "All repositories" or just your repository
- Click "Install"

### Step 5: Configure Build Settings

You'll see a configuration page with these fields:

**Project Name:**
- Leave as default or change it (e.g., "barcode-scanner")

**Framework Preset:**
- Click the dropdown
- Select **"Other"** (Flutter is not in the list, so choose "Other")

**Root Directory:**
- Leave as **"./"** (default)

**Build Command:**
- Enter: `flutter build web --release`
- **What this does:** Tells Vercel to build your Flutter app for the web

**Output Directory:**
- Enter: `build/web`
- **What this does:** Tells Vercel where to find your built files
- **IMPORTANT:** This is the key setting! Make sure it says `build/web`

**Install Command:**
- Leave empty or enter: `flutter pub get`

### Step 6: Deploy!

1. Click the big blue **"Deploy"** button
2. Vercel will start building your app
3. You'll see a progress screen with logs

**What's happening:**
- Vercel is downloading your code from GitHub
- Running `flutter build web --release`
- Uploading the `build/web` folder to Vercel servers

**This takes 2-5 minutes.**

### Step 7: Get Your Live URL

When deployment finishes, you'll see:

**🎉 Congratulations! Your project has been deployed!**

You'll see:
- A preview image of your site
- A URL like: `https://print-label-barcode-scanner.vercel.app`
- Or: `https://your-project-name-xxxxx.vercel.app`

**Click the URL** to open your live barcode scanner!

### Step 8: Test Your App

1. Open the URL on your iPhone or computer
2. Click "Scan Barcode"
3. Allow camera permissions
4. Point camera at a barcode
5. The scanner should work!

---

## 📋 TROUBLESHOOTING

### Problem: "Build failed" on Vercel

**Solution 1:** Deploy the pre-built files instead
1. In Vercel settings, change:
   - Build Command: Leave **empty** (delete the command)
   - Output Directory: `build/web`
2. Click "Redeploy"

**Why this works:**
- Your `build/web` folder is already built and pushed to GitHub
- Vercel doesn't need to rebuild it, just serve the files

**Solution 2:** Check Flutter version
- Vercel might not have Flutter installed
- Use Solution 1 above (deploy pre-built files)

### Problem: Blank page or "404 Not Found"

**Check:**
1. Output Directory is set to `build/web` (not just `build`)
2. Your `build/web/index.html` exists in GitHub
3. Redeploy after changing settings

### Problem: Camera doesn't work

**On iPhone:**
- iOS requires HTTPS (Vercel provides this automatically ✅)
- Make sure you clicked "Allow" when prompted for camera access
- Try Safari browser (works best on iOS)

**On Computer:**
- Some browsers block camera on localhost
- Vercel's HTTPS URL should work fine

---

## ✅ BENEFITS OF VERCEL

- ✅ No base href issues (unlike GitHub Pages!)
- ✅ Automatic HTTPS (required for camera on iPhone)
- ✅ Fast global CDN
- ✅ Free SSL certificate
- ✅ Auto-deploys when you push to GitHub
- ✅ Easy to set up custom domains

---

## 🔄 UPDATING YOUR APP LATER

When you make changes to your Flutter app:

1. **Build the updated app:**
   ```powershell
   flutter build web --release
   ```

2. **Push to GitHub:**
   ```powershell
   git add .
   git commit -m "Update app"
   git push origin main
   ```

3. **Vercel automatically redeploys!**
   - No need to do anything else
   - Wait 2 minutes, your site is updated

**OR manually trigger a redeploy:**
- Go to your Vercel dashboard
- Click your project
- Click "Redeploy"

---

## 📞 NEED HELP?

If deployment still doesn't work:
1. Share the Vercel deployment logs (copy/paste the error)
2. Share your live URL
3. Describe what you see (blank page, error message, etc.)

---

**Good luck! 🚀**
- ✅ Automatic HTTPS
- ✅ Better performance
- ✅ Simpler setup

---

## 📱 After Deployment

1. Open URL on iPhone
2. Grant camera permissions
3. Test barcode scanner
4. Should work perfectly!

---

## 🔧 Alternative: Vercel CLI

If you want to use command line:

```powershell
# Install Vercel CLI (requires Node.js)
npm install -g vercel

# Deploy
cd build/web
vercel --prod

# Follow prompts - Done!
```

---

## 🌐 Your Deployment URLs

- Vercel (new): `https://print-label-barcode-scanner.vercel.app`
- GitHub Pages (has issues): `https://alosralimited.github.io/print-label-barcode-scanner/`

Use Vercel for production! 🎉

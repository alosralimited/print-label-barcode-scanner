# 🚀 Complete Git & Vercel Deployment Guide

## Table of Contents

1. [Git Setup & Basics](#git-setup--basics)
2. [GitHub Setup](#github-setup)
3. [Vercel Setup & Deployment](#vercel-setup--deployment)
4. [Updating Your App](#updating-your-app)
5. [Troubleshooting](#troubleshooting)

---

## 📚 Part 1: Git Setup & Basics

### What is Git?
Git is a version control system that tracks changes to your code. Think of it like "Save Points" in a video game - you can always go back to previous versions.

### Check if Git is Installed

Open PowerShell and run:
```powershell
git --version
```

**Expected output:** `git version 2.xx.x`

**If not installed:**

1. Download from: https://git-scm.com/download/win
2. Run the installer
3. Use default settings
4. Restart PowerShell

---

### Configure Git (First Time Only)

Set your name and email (used for commit history):

```powershell
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

**Example:**
```powershell
git config --global user.name "John Doe"
git config --global user.email "john@example.com"
```

**Verify your settings:**
```powershell
git config --global --list
```

---

### Basic Git Commands Explained

#### 1. Check Status
See what files have changed:
```powershell
git status
```

**What it shows:**

- Red files = changed but not staged
- Green files = staged and ready to commit
- Untracked files = new files Git doesn't know about

#### 2. Stage Files (Prepare to Save)
Add files to be committed:
```powershell
git add .
```

- The `.` means "add all changed files"
- Or add specific file: `git add filename.txt`

**Force add ignored files:**
```powershell
git add -f build/web
```
(Useful when you need to commit files that are in `.gitignore`)

#### 3. Commit (Save Changes)
Save your staged changes with a message:
```powershell
git commit -m "Your message describing what changed"
```

**Good commit messages:**

- ✅ `git commit -m "Add camera permission for Android"`
- ✅ `git commit -m "Fix barcode scanner on iOS"`
- ✅ `git commit -m "Update deployment guide"`
- ❌ `git commit -m "fixed stuff"` (too vague)
- ❌ `git commit -m "asdf"` (meaningless)

#### 4. Push (Upload to GitHub)
Send your commits to GitHub:
```powershell
git push origin main
```

- `origin` = your GitHub repository
- `main` = the branch name

#### 5. Pull (Download from GitHub)
Get latest changes from GitHub:
```powershell
git pull origin main
```

#### 6. View History
See past commits:
```powershell
git log --oneline
```

Press `q` to exit the log view.

---

### Common Git Workflows

#### Workflow 1: Save and Upload Your Changes
```powershell
# 1. See what changed
git status

# 2. Add all changes
git add .

# 3. Commit with a message
git commit -m "Describe what you changed"

# 4. Upload to GitHub
git push origin main
```

#### Workflow 2: Undo Uncommitted Changes
```powershell
# Undo changes to a specific file
git restore filename.txt

# Undo all changes (careful!)
git restore .
```

#### Workflow 3: Temporarily Save Work (Stash)
```powershell
# Save current work without committing
git stash

# Do other work...

# Get your work back
git stash pop
```

---

## 🌐 Part 2: GitHub Setup

### What is GitHub?
GitHub is a website that hosts Git repositories online. It's like Google Drive for code.

### Create a GitHub Account

1. Go to https://github.com
2. Click **"Sign up"**
3. Enter your email, password, username
4. Verify your email
5. Choose the **Free** plan

---

### Create a New Repository on GitHub

#### Method 1: Via GitHub Website

1. **Go to GitHub**: https://github.com/new
2. **Fill in details**:
   - **Repository name**: `print-label-barcode-scanner`
   - **Description**: (optional) "Flutter barcode scanner app"
   - **Visibility**: 
     - ✅ **Public** (free, anyone can see)
     - Or **Private** (only you can see)
   - **DO NOT check** "Add a README file"
   - **DO NOT check** "Add .gitignore"
   - **DO NOT check** "Choose a license"
3. **Click "Create repository"**

You'll see a page with setup instructions - **ignore them** and use our commands below.

---

### Connect Your Local Project to GitHub

Your project already has Git initialized. Now connect it to GitHub:

```powershell
# Navigate to your project folder
cd C:\Users\44740\OneDrive\Desktop\cache\print_label_barcode_scanner

# Check current remote (should already be set)
git remote -v

# If it shows your repo URL, you're good!
# If not, add the remote:
git remote add origin https://github.com/alosralimited/print-label-barcode-scanner.git

# Push your code to GitHub
git push -u origin main
```

**What `-u` means:** Sets `origin main` as the default, so next time you can just type `git push`

---

### GitHub Authentication

When you push for the first time, GitHub will ask for credentials:

#### Option 1: Personal Access Token (Recommended)

1. **Generate Token**:
   - Go to: https://github.com/settings/tokens
   - Click **"Generate new token (classic)"**
   - Name it: "Windows PC"
   - Select scopes: Check **`repo`** (full control of private repositories)
   - Click **"Generate token"**
   - **Copy the token** (you won't see it again!)

2. **Use Token as Password**:
   - When `git push` asks for username: enter your GitHub username
   - When it asks for password: **paste your token** (not your GitHub password)

3. **Save Credentials** (so you don't type it every time):
   ```powershell
   git config --global credential.helper manager
   ```

#### Option 2: GitHub Desktop (Easiest)

1. Download GitHub Desktop: https://desktop.github.com
2. Install and sign in with your GitHub account
3. Add your local repository
4. Push/pull with a button click (no command line needed)

---

### View Your Repository Online

After pushing:

1. Go to: `https://github.com/alosralimited/print-label-barcode-scanner`
2. You'll see all your files, commits, and history
3. Share this URL with anyone to show your code

---

## ☁️ Part 3: Vercel Setup & Deployment

### What is Vercel?
Vercel is a hosting platform that deploys your web app to the internet. It's free for personal projects and provides:

- ✅ Fast global CDN
- ✅ Automatic HTTPS (required for camera on iPhone)
- ✅ Auto-deploy when you push to GitHub
- ✅ Custom domains

---

### Step 1: Create Vercel Account

1. **Go to Vercel**: https://vercel.com/signup
2. **Click "Continue with GitHub"** (recommended)
3. **Authorize Vercel** to access your GitHub account
4. **Complete signup**

**Why use GitHub login?** Vercel can automatically deploy when you push code to GitHub.

---

### Step 2: Import Your Repository to Vercel

1. **Go to**: https://vercel.com/new
2. **You'll see "Import Git Repository"**
3. **Find your repo**:
   - If you see `alosralimited/print-label-barcode-scanner`, click **"Import"**
   - If you don't see it:
     - Click **"Adjust GitHub App Permissions"**
     - Select **"All repositories"** or select `print-label-barcode-scanner`
     - Click **"Install & Authorize"**
     - Go back to https://vercel.com/new
     - Now click **"Import"** next to your repo

---

### Step 3: Configure Project Settings

You'll see a configuration page. **This is the most important step!**

#### Project Name

- Leave as default: `print-label-barcode-scanner`
- Or rename to anything you like (this becomes part of your URL)

#### Framework Preset

- Click the dropdown
- Select: **"Other"**
- Why: Flutter isn't in the list, and we're deploying static files

#### Root Directory

- Leave as: **`./`** (default)
- Don't change this

#### Build Settings - ⚠️ CRITICAL SETTINGS

**Build Command:**

- **LEAVE THIS EMPTY** (delete any text)
- Why: We're deploying pre-built files from `build/web`. Vercel doesn't have Flutter installed, so it can't build.

**Output Directory:**

- Enter exactly: **`build/web`**
- This is where your built website files are
- ⚠️ If this is wrong, you'll get a 404 error!

**Install Command:**

- **LEAVE THIS EMPTY**
- Why: No need to install dependencies when serving static files

#### Environment Variables

- Skip this (not needed for static sites)

---

### Step 4: Deploy!

1. **Click the big blue "Deploy" button**
2. **Wait 1-2 minutes** while Vercel:
   - Downloads your code from GitHub
   - Finds the `build/web` folder
   - Uploads files to Vercel's CDN
   - Creates your live site

3. **You'll see progress logs** scrolling by
4. **When done**, you'll see: 🎉 **"Congratulations! Your project has been deployed!"**

---

### Step 5: Get Your Live URL

After deployment:

1. **You'll see a preview** of your site
2. **Your URL** will be something like:
   - `https://print-label-barcode-scanner.vercel.app`
   - Or: `https://print-label-barcode-scanner-xxxxx.vercel.app`

3. **Click the URL** to open your live site
4. **Test it**:
   - Should show your Flutter app
   - Click "Scan Barcode"
   - Allow camera (if on mobile)
   - Scan a barcode!

---

### Step 6: Vercel Dashboard Overview

After deployment, explore your dashboard:

**Deployments Tab:**

- See all past deployments
- Each push to GitHub creates a new deployment
- Click any deployment to see logs

**Settings Tab:**

- Change domain name
- Update build settings
- Delete project

**Domains Tab:**

- Your free `.vercel.app` domain
- Add custom domains (e.g., `mybarcodeapp.com`)

---

### Understanding Vercel's Auto-Deploy

**How it works:**

1. You push code to GitHub: `git push origin main`
2. Vercel detects the change (via webhook)
3. Vercel automatically deploys the new version
4. Your live site updates in ~1-2 minutes

**See it in action:**

1. Make a change to your app
2. Commit and push: `git push origin main`
3. Go to Vercel dashboard → Deployments
4. You'll see a new deployment starting!

**Disable auto-deploy:**

- Settings → Git → Disable "Automatic deployments from GitHub"

---

## 🔄 Part 4: Updating Your App

### Complete Update Workflow

Every time you make changes to your app:

#### Option 1: Manual Commands

```powershell
# 1. Build the Flutter web app
flutter build web --release

# 2. Force-add the build folder (it's in .gitignore)
git add -f build/web

# 3. Also add any other changes
git add .

# 4. Commit with a message
git commit -m "Update: describe what changed"

# 5. Push to GitHub
git push origin main

# 6. Wait 1-2 minutes - Vercel auto-deploys!
```

#### Option 2: Use the Deploy Script (Easiest!)

I created `deploy-vercel.ps1` for you. Just run:

```powershell
.\deploy-vercel.ps1
```

**Or with a custom message:**
```powershell
.\deploy-vercel.ps1 -Message "Fixed camera on iPhone"
```

**What it does automatically:**

1. ✅ Builds Flutter web (release mode)
2. ✅ Stages build/web folder
3. ✅ Commits changes
4. ✅ Pushes to GitHub
5. ✅ Vercel auto-deploys

---

### Verify Deployment

After pushing:

1. **Check GitHub**:
   - Go to: `https://github.com/alosralimited/print-label-barcode-scanner`
   - Click "Commits"
   - You should see your latest commit

2. **Check Vercel**:
   - Go to: https://vercel.com/dashboard
   - Click your project
   - Deployments tab should show "Building..." then "Ready"

3. **Test the Live Site**:
   - Open your Vercel URL
   - Test your changes
   - Open on iPhone to test mobile

---

## 🔧 Part 5: Troubleshooting

### Git Issues

#### Problem: "Permission denied" when pushing

**Solution:**
```powershell
# Use personal access token instead of password
# Generate one: https://github.com/settings/tokens
# Use token as password when git asks
```

#### Problem: "Repository not found"

**Solution:**
```powershell
# Check remote URL
git remote -v

# Should show: https://github.com/alosralimited/print-label-barcode-scanner.git
# If wrong, update it:
git remote set-url origin https://github.com/alosralimited/print-label-barcode-scanner.git
```

#### Problem: Merge conflicts

**Solution:**
```powershell
# See conflicted files
git status

# Edit files to fix conflicts (look for <<<<<<< markers)
# Then:
git add .
git commit -m "Resolve merge conflicts"
git push origin main
```

#### Problem: "Your branch is behind"

**Solution:**
```powershell
# Get latest changes from GitHub
git pull origin main

# If there are conflicts, see above
# Then push your changes
git push origin main
```

---

### Vercel Issues

#### Problem: 404 Not Found on Live Site

**Root Cause:** Output Directory is wrong or build/web folder is missing

**Solution 1: Check Output Directory**

1. Vercel Dashboard → Your Project → Settings
2. Build & Development Settings
3. Output Directory must be: `build/web`
4. Save → Deployments → Redeploy

**Solution 2: Ensure build/web is in GitHub**
```powershell
# Check if build/web is in your repo
git ls-files build/web

# If empty, add it:
git add -f build/web
git commit -m "Add build/web folder"
git push origin main
```

#### Problem: "Build failed" or "Exit code 127"

**Root Cause:** Vercel is trying to run a build command, but Flutter isn't installed

**Solution:**

1. Vercel Dashboard → Settings → Build & Development Settings
2. **Build Command:** Delete everything, leave EMPTY
3. **Install Command:** Leave EMPTY
4. **Output Directory:** `build/web`
5. Save → Redeploy

#### Problem: Camera doesn't work on iPhone

**Root Cause:** Site isn't HTTPS, or permissions not granted

**Solution:**

- ✅ Vercel provides HTTPS automatically
- ✅ Make sure you're using Safari on iPhone
- ✅ When prompted, tap "Allow" for camera
- ✅ Check Settings → Safari → Camera is enabled

#### Problem: Blank page on mobile

**Root Cause:** JavaScript errors or base href issues

**Solution:**
```powershell
# Rebuild without base href
flutter build web --release

# Commit and push
git add -f build/web
git commit -m "Rebuild web without base href"
git push origin main
```

#### Problem: Old version still showing after deploy

**Root Cause:** Browser cache

**Solution:**

- Hard refresh: `Ctrl + Shift + R` (Windows) or `Cmd + Shift + R` (Mac)
- Or clear browser cache
- Or open in incognito/private browsing mode

---

### Common Questions

**Q: How much does Vercel cost?**
A: Free for personal projects! Includes:

- Unlimited deployments
- HTTPS
- 100 GB bandwidth/month
- Custom domains

**Q: Can I use a custom domain?**
A: Yes! In Vercel:

1. Settings → Domains
2. Add your domain (e.g., mybarcodeapp.com)
3. Update DNS at your domain registrar
4. Done!

**Q: How do I delete a deployment?**
A: 

1. Vercel Dashboard → Deployments
2. Click "..." next to deployment → Delete

**Q: How do I delete the whole project?**
A:

1. Settings → General → scroll to bottom
2. "Delete Project" → Type project name → Delete

**Q: Can I have multiple environments (staging/production)?**
A: Yes!

1. Create a new branch: `git checkout -b staging`
2. Push: `git push origin staging`
3. Vercel auto-creates a separate deployment for that branch

**Q: Where can I see deployment logs?**
A:

1. Vercel Dashboard → Deployments
2. Click any deployment
3. See build logs, runtime logs, errors

---

## 📖 Quick Reference

### Git Cheat Sheet

```powershell
# Status
git status                          # See changed files
git log --oneline                   # See commit history

# Save changes
git add .                           # Stage all changes
git add -f build/web                # Force-add ignored files
git commit -m "message"             # Commit with message
git push origin main                # Upload to GitHub

# Undo
git restore filename.txt            # Undo changes to file
git restore .                       # Undo all changes
git reset HEAD~1                    # Undo last commit (keep changes)

# Branches
git branch                          # List branches
git checkout -b new-branch          # Create and switch to branch
git checkout main                   # Switch to main branch
git merge other-branch              # Merge branch into current

# Remote
git remote -v                       # Show remote URLs
git pull origin main                # Download from GitHub
git push origin main                # Upload to GitHub
```

### Vercel Deployment Checklist

Before deploying:

- [ ] Code pushed to GitHub
- [ ] `build/web` folder exists in repo
- [ ] Vercel project created
- [ ] Build Command: EMPTY
- [ ] Install Command: EMPTY
- [ ] Output Directory: `build/web`
- [ ] Framework: Other

After deploying:

- [ ] Deployment shows "Ready"
- [ ] Live URL loads without errors
- [ ] Test "Scan Barcode" button
- [ ] Test camera on mobile (HTTPS required)
- [ ] Add to home screen (optional)

---

## 🎯 Summary

### You now know how to:

**Git:**

- ✅ Initialize and configure Git
- ✅ Stage, commit, and push changes
- ✅ Connect to GitHub
- ✅ Manage branches and history

**GitHub:**

- ✅ Create repositories
- ✅ Authenticate with tokens
- ✅ View code online
- ✅ Collaborate with others

**Vercel:**

- ✅ Create account and link GitHub
- ✅ Import and configure projects
- ✅ Deploy static sites
- ✅ Use auto-deploy on push
- ✅ Troubleshoot common issues

**Workflow:**

- ✅ Make changes → Build → Commit → Push → Auto-deploy!

---

## 📚 Resources

- **Git Documentation**: https://git-scm.com/doc
- **GitHub Guides**: https://guides.github.com
- **Vercel Docs**: https://vercel.com/docs
- **Flutter Web**: https://flutter.dev/web
- **Your Repository**: https://github.com/alosralimited/print-label-barcode-scanner
- **Your Live Site**: Check Vercel dashboard for URL

---

**You're all set! 🚀**

Any questions? Check the troubleshooting section or create an issue on GitHub!

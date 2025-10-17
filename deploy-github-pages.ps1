# Quick Deploy to GitHub Pages
# Run this script from the project root

Write-Host "🚀 Deploying to GitHub Pages..." -ForegroundColor Cyan

# Prompt for GitHub username
$username = Read-Host "Enter your GitHub username"
$repoName = "print-label-barcode-scanner"

# Build the web app with correct base-href
Write-Host "🔨 Building Flutter web app..." -ForegroundColor Yellow
flutter build web --release --base-href="/$repoName/"

if (-Not (Test-Path "build\web")) {
    Write-Host "❌ Error: Build failed!" -ForegroundColor Red
    exit 1
}

# Initialize git if needed
if (-Not (Test-Path ".git")) {
    Write-Host "📦 Initializing git repository..." -ForegroundColor Yellow
    git init
    git add .
    git commit -m "Initial commit"
}

Write-Host "📤 Setting up remote repository..." -ForegroundColor Yellow
git remote remove origin 2>$null
git remote add origin "https://github.com/$username/$repoName.git"

# Push main branch
Write-Host "📤 Pushing to main branch..." -ForegroundColor Yellow
git branch -M main
git push -u origin main -f

# Create and deploy gh-pages
Write-Host "📄 Creating gh-pages branch..." -ForegroundColor Yellow
git checkout --orphan gh-pages
git rm -rf . 2>$null

# Copy web files
Write-Host "📋 Copying web files..." -ForegroundColor Yellow
Copy-Item -Path "build\web\*" -Destination "." -Recurse -Force

# Create .nojekyll for Flutter
New-Item -Path ".nojekyll" -ItemType File -Force | Out-Null

# Commit and push
Write-Host "📤 Deploying to GitHub Pages..." -ForegroundColor Yellow
git add .
git commit -m "Deploy to GitHub Pages"
git push origin gh-pages -f

# Switch back to main
git checkout main

Write-Host ""
Write-Host "✅ Deployment complete!" -ForegroundColor Green
Write-Host ""
Write-Host "🌐 Your site will be available at:" -ForegroundColor Cyan
Write-Host "   https://$username.github.io/$repoName/" -ForegroundColor White
Write-Host ""
Write-Host "⚙️  Next steps:" -ForegroundColor Yellow
Write-Host "   1. Go to: https://github.com/$username/$repoName/settings/pages"
Write-Host "   2. Under 'Source', select 'Deploy from a branch'"
Write-Host "   3. Select 'gh-pages' branch and '/ (root)' folder"
Write-Host "   4. Click 'Save'"
Write-Host "   5. Wait 1-2 minutes for deployment"
Write-Host ""
Write-Host "💡 Tip: Use GitHub Actions for automatic deployment!" -ForegroundColor Cyan
Write-Host "   The repository includes a workflow file that will auto-deploy on push to main."
Write-Host ""

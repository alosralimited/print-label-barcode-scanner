# Update GitHub Pages Deployment Script
Write-Host "🚀 Updating GitHub Pages deployment..." -ForegroundColor Cyan

# Step 1: Build with correct base href
Write-Host "📦 Building web app with correct base href..." -ForegroundColor Yellow
flutter build web --release --base-href "/print-label-barcode-scanner/"

if (-Not $?) {
    Write-Host "❌ Build failed!" -ForegroundColor Red
    exit 1
}

# Step 2: Copy build to temp location
Write-Host "📋 Copying build files to temp..." -ForegroundColor Yellow
$tempDir = "$env:TEMP\flutter_web_build_$(Get-Date -Format 'yyyyMMddHHmmss')"
New-Item -ItemType Directory -Path $tempDir -Force | Out-Null
Copy-Item -Path "build\web\*" -Destination $tempDir -Recurse -Force

# Step 3: Switch to gh-pages
Write-Host "🔄 Switching to gh-pages branch..." -ForegroundColor Yellow
git add .
git stash
git checkout gh-pages

# Step 4: Clear and update
Write-Host "🗑️  Clearing old files..." -ForegroundColor Yellow
git rm -rf .
Copy-Item -Path "$tempDir\*" -Destination "." -Recurse -Force
New-Item -Path ".nojekyll" -ItemType File -Force | Out-Null

# Step 5: Commit and push
Write-Host "📤 Deploying to GitHub Pages..." -ForegroundColor Yellow
git add .
git commit -m "Update deployment with correct base href"
git push origin gh-pages

# Step 6: Clean up and switch back
Write-Host "🧹 Cleaning up..." -ForegroundColor Yellow
Remove-Item -Path $tempDir -Recurse -Force
git checkout main
git stash pop

Write-Host ""
Write-Host "✅ Deployment complete!" -ForegroundColor Green
Write-Host "🌐 Your site: https://alosralimited.github.io/print-label-barcode-scanner/" -ForegroundColor Cyan
Write-Host ""

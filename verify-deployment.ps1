# Deployment Verification Script
# Run this to verify everything is ready for GitHub Pages deployment

Write-Host "🔍 Verifying GitHub Pages Deployment Setup..." -ForegroundColor Cyan
Write-Host ""

$allGood = $true

# Check 1: GitHub Actions workflow
Write-Host "✓ Checking GitHub Actions workflow..." -ForegroundColor Yellow
if (Test-Path ".github\workflows\deploy-github-pages.yml") {
    Write-Host "  ✅ Workflow file exists" -ForegroundColor Green
} else {
    Write-Host "  ❌ Workflow file missing!" -ForegroundColor Red
    $allGood = $false
}

# Check 2: Build output
Write-Host "✓ Checking build output..." -ForegroundColor Yellow
if (Test-Path "build\web\index.html") {
    Write-Host "  ✅ Web build exists" -ForegroundColor Green
    
    # Check base-href
    $indexContent = Get-Content "build\web\index.html" -Raw
    if ($indexContent -match 'base href="/print-label-barcode-scanner/"') {
        Write-Host "  ✅ Base-href correctly set" -ForegroundColor Green
    } else {
        Write-Host "  ⚠️  Base-href might not be correct" -ForegroundColor Yellow
    }
} else {
    Write-Host "  ❌ Web build missing - run: flutter build web --release --base-href /print-label-barcode-scanner/" -ForegroundColor Red
    $allGood = $false
}

# Check 3: .nojekyll file
Write-Host "✓ Checking .nojekyll file..." -ForegroundColor Yellow
if (Test-Path "build\web\.nojekyll") {
    Write-Host "  ✅ .nojekyll file exists" -ForegroundColor Green
} else {
    Write-Host "  ⚠️  .nojekyll file missing - will be created during deployment" -ForegroundColor Yellow
}

# Check 4: 404.html for SPA routing
Write-Host "✓ Checking 404.html..." -ForegroundColor Yellow
if (Test-Path "build\web\404.html") {
    Write-Host "  ✅ 404.html exists" -ForegroundColor Green
} else {
    Write-Host "  ⚠️  404.html missing - will be created during deployment" -ForegroundColor Yellow
}

# Check 5: Git repository
Write-Host "✓ Checking Git repository..." -ForegroundColor Yellow
if (Test-Path ".git") {
    Write-Host "  ✅ Git repository initialized" -ForegroundColor Green
    
    # Check remote
    $remote = git remote get-url origin 2>$null
    if ($remote) {
        Write-Host "  ✅ Git remote configured: $remote" -ForegroundColor Green
    } else {
        Write-Host "  ⚠️  Git remote not configured" -ForegroundColor Yellow
    }
} else {
    Write-Host "  ❌ Git repository not initialized!" -ForegroundColor Red
    $allGood = $false
}

# Check 6: Documentation
Write-Host "✓ Checking documentation..." -ForegroundColor Yellow
$docs = @(
    "DEPLOYMENT_SUMMARY.md",
    "DEPLOYMENT_READY.md",
    "GITHUB_PAGES_DEPLOYMENT.md"
)
foreach ($doc in $docs) {
    if (Test-Path $doc) {
        Write-Host "  ✅ $doc exists" -ForegroundColor Green
    }
}

Write-Host ""
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan

if ($allGood) {
    Write-Host "✅ ALL CHECKS PASSED!" -ForegroundColor Green
    Write-Host ""
    Write-Host "🚀 Ready to deploy!" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Next steps:" -ForegroundColor Yellow
    Write-Host "1. git add ." -ForegroundColor White
    Write-Host "2. git commit -m 'Configure GitHub Pages deployment'" -ForegroundColor White
    Write-Host "3. git push origin main" -ForegroundColor White
    Write-Host ""
    Write-Host "Your app will be live at:" -ForegroundColor Yellow
    Write-Host "https://alosralimited.github.io/print-label-barcode-scanner/" -ForegroundColor Cyan
} else {
    Write-Host "⚠️  Some checks failed. Please fix the issues above." -ForegroundColor Yellow
}

Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan

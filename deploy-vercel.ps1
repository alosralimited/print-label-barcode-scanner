# Deploy Flutter web to Vercel (static)
# - Builds the Flutter web app
# - Commits the build/web folder
# - Pushes to main (Vercel auto-redeploys)

param(
  [string]$Message = "deploy: update Flutter web build"
)

Write-Host "📦 Building Flutter web (release)" -ForegroundColor Yellow
flutter build web --release
if (-not $?) { Write-Host "❌ Flutter build failed" -ForegroundColor Red; exit 1 }

Write-Host "➕ Staging build/web (force include despite .gitignore)" -ForegroundColor Yellow
git add -f build/web

Write-Host "📝 Committing" -ForegroundColor Yellow
git commit -m $Message
if (-not $?) { Write-Host "ℹ️ Nothing to commit (web build unchanged)" -ForegroundColor DarkYellow }

Write-Host "⬆️ Pushing to origin/main" -ForegroundColor Yellow
git push origin main
if (-not $?) { Write-Host "❌ Push failed" -ForegroundColor Red; exit 1 }

Write-Host "🚀 Done. Vercel will auto-redeploy within ~1–2 minutes." -ForegroundColor Green

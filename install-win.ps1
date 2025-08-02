# PowerShell Oh My Posh Installation Script (Windows)
$ErrorActionPreference = "Stop"

Write-Host "🔧 Installing Oh My Posh via WinGet..."
winget install JanDeDobbeleer.OhMyPosh --source winget --scope machine --force

# Define config location
$repositoryUrl = "https://raw.githubusercontent.com/Jose-AE/oh-my-posh-template-powerline-prism/main"

$configDir = "$HOME\.oh-my-posh"
$configPath = Join-Path $configDir "powerline_prism.omp.json"
$configUrl = "$repositoryUrl/powerline_prism.omp.json"
$profileUrl = "$repositoryUrl/ps-profile.ps1"



Write-Host "📁 Creating config directory at $configDir..."
New-Item -ItemType Directory -Path $configDir -Force | Out-Null

Write-Host "⬇️ Downloading theme config..."
Invoke-WebRequest -Uri $configUrl -OutFile $configPath -UseBasicParsing

# Load PowerShell profile path
$profilePath = $PROFILE

Write-Host "🧪 Checking if Oh My Posh is already initialized in your PowerShell profile..."
if (-not (Test-Path $profilePath)) {
    Write-Host "📄 Creating PowerShell profile at $profilePath..."
    New-Item -ItemType File -Path $profilePath -Force | Out-Null
}


Write-Host "⬇️ Downloading and updating your PowerShell profile from the repository..."
Invoke-WebRequest -Uri $profileUrl -OutFile $profilePath -UseBasicParsing


Write-Host "🎉Done! Restart PowerShell to see your new prompt."

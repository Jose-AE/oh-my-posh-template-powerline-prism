# $global:StartTime = Get-Date



# Your profile contents...
#Set-PSDebug -Trace 1
# oh-my-posh init pwsh --config 'C:\Users\josel\.oh-my-posh\powerline_prism.omp.json' | Invoke-Expression
# Import-Module Terminal-Icons
# Import-Module PSReadLine
# Set-PSReadLineOption -PredictionSource History
# Set-PSReadLineOption -EditMode Windows
# $env:VIRTUAL_ENV_DISABLE_PROMPT = 0
#Set-PSDebug -Trace 0


# oh-my-posh with cache for faster load time
$global:__ohMyPoshLoaded = $false
$global:__originalPrompt = $function:prompt

function prompt {
    if (-not $global:__ohMyPoshLoaded) {
        $configDir = Join-Path $HOME ".oh-my-posh"
        $configPath = Join-Path $configDir "powerline_prism.omp.json"
        $configUrl = "https://raw.githubusercontent.com/Jose-AE/oh-my-posh-template-powerline-prism/main/powerline_prism.omp.json"

        # Create directory if it doesn't exist
        if (-not (Test-Path $configDir)) {
            New-Item -ItemType Directory -Path $configDir -Force | Out-Null
        }

        # Download config file if it doesn't exist
        if (-not (Test-Path $configPath)) {
            Invoke-WebRequest -Uri $configUrl -OutFile $configPath
        }

        # Initialize Oh My Posh with the config
        oh-my-posh init pwsh --config $configPath | Invoke-Expression
        $global:__ohMyPoshLoaded = $true
    }

    & $function:prompt
}





# $global:EndTime = Get-Date
# Write-Host ("Profile load duration: {0} ms" -f ($EndTime - $StartTime).TotalMilliseconds)

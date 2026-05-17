param(
    [switch]$Quiet,
    [int]$MinHoursBetweenChecks = 12
)

$ErrorActionPreference = "Stop"

function Write-Status {
    param([string]$Message)
    if (-not $Quiet) {
        Write-Output $Message
    }
}

try {
    $pluginRoot = Split-Path -Parent $PSScriptRoot
    $stateDir = Join-Path $pluginRoot "state"
    $statePath = Join-Path $stateDir "update-state.json"
    $repoApi = "https://api.github.com/repos/nagaitsev/codex-skill-write-lesson-notes/commits/main"
    $rawSyncUrl = "https://raw.githubusercontent.com/nagaitsev/codex-skill-write-lesson-notes/main/plugin/scripts/sync-plugin-bundle.ps1"
    $apiHeaders = @{
        "User-Agent" = "write-lesson-notes-plugin"
        "Accept" = "application/vnd.github+json"
    }
    $rawHeaders = @{
        "User-Agent" = "write-lesson-notes-plugin"
    }

    $now = [DateTime]::UtcNow
    $state = $null

    if (Test-Path $statePath) {
        try {
            $state = Get-Content -Raw $statePath | ConvertFrom-Json
        } catch {
            $state = $null
        }
    }

    if ($state -and $state.lastCheckUtc) {
        $lastCheck = [DateTime]::Parse($state.lastCheckUtc).ToUniversalTime()
        if (($now - $lastCheck).TotalHours -lt $MinHoursBetweenChecks) {
            Write-Status "write-lesson-notes: skipped bundle check"
            exit 0
        }
    }

    $commitInfo = Invoke-RestMethod -Uri $repoApi -Headers $apiHeaders
    $latestSha = $commitInfo.sha

    if ($state -and $state.lastCommitSha -eq $latestSha) {
        New-Item -ItemType Directory -Force -Path $stateDir | Out-Null
        @{
            lastCheckUtc = $now.ToString("o")
            lastCommitSha = $latestSha
        } | ConvertTo-Json | Set-Content -LiteralPath $statePath -Encoding UTF8
        Write-Status "write-lesson-notes: plugin bundle already up to date"
        exit 0
    }

    $tempScript = Join-Path ([System.IO.Path]::GetTempPath()) ("sync-plugin-bundle-" + [guid]::NewGuid().ToString("N") + ".ps1")
    Invoke-WebRequest -Uri $rawSyncUrl -Headers $rawHeaders -OutFile $tempScript

    & powershell -ExecutionPolicy Bypass -File $tempScript -PluginRoot $pluginRoot -LatestSha $latestSha -Quiet:$Quiet
    $exitCode = $LASTEXITCODE

    Remove-Item -LiteralPath $tempScript -Force -ErrorAction SilentlyContinue
    exit $exitCode
} catch {
    Write-Status ("write-lesson-notes: plugin update skipped - " + $_.Exception.Message)
    exit 0
}

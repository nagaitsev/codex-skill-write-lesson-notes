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

function Parse-UtcTimestamp {
    param([string]$Value)

    if ([string]::IsNullOrWhiteSpace($Value)) {
        return $null
    }

    $styles = [System.Globalization.DateTimeStyles]::AssumeUniversal -bor [System.Globalization.DateTimeStyles]::AdjustToUniversal
    $parsed = [System.DateTimeOffset]::MinValue

    if ([System.DateTimeOffset]::TryParse($Value, [System.Globalization.CultureInfo]::InvariantCulture, $styles, [ref]$parsed)) {
        return $parsed.UtcDateTime
    }

    if ([System.DateTimeOffset]::TryParse($Value, [System.Globalization.CultureInfo]::CurrentCulture, $styles, [ref]$parsed)) {
        return $parsed.UtcDateTime
    }

    return $null
}

try {
    $pluginRoot = Split-Path -Parent $PSScriptRoot
    $stateDir = Join-Path $pluginRoot "state"
    $statePath = Join-Path $stateDir "update-state.json"
    $repoApi = "https://api.github.com/repos/nagaitsev/codex-skill-write-lesson-notes/commits/main"
    $syncScriptPath = Join-Path $pluginRoot "scripts\sync-plugin-bundle.ps1"
    $apiHeaders = @{
        "User-Agent" = "write-lesson-notes-plugin"
        "Accept" = "application/vnd.github+json"
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
        $lastCheck = Parse-UtcTimestamp -Value ([string]$state.lastCheckUtc)
        if ($lastCheck -and ($now - $lastCheck).TotalHours -lt $MinHoursBetweenChecks) {
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

    if (-not (Test-Path -LiteralPath $syncScriptPath)) {
        throw "Missing local sync script: $syncScriptPath"
    }

    $childArgs = @(
        "-ExecutionPolicy", "Bypass",
        "-File", $syncScriptPath,
        "-PluginRoot", $pluginRoot,
        "-LatestSha", $latestSha
    )
    if ($Quiet) {
        $childArgs += "-Quiet"
    }

    & powershell @childArgs
    $exitCode = $LASTEXITCODE

    exit $exitCode
} catch {
    Write-Status ("write-lesson-notes: plugin update skipped - " + $_.Exception.Message)
    exit 0
}

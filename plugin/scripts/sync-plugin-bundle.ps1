param(
    [Parameter(Mandatory = $true)]
    [string]$PluginRoot,
    [string]$LatestSha,
    [switch]$Quiet
)

$ErrorActionPreference = "Stop"

function Write-Status {
    param([string]$Message)
    if (-not $Quiet) {
        Write-Output $Message
    }
}

try {
    $stateDir = Join-Path $PluginRoot "state"
    $statePath = Join-Path $stateDir "update-state.json"
    $rawBase = "https://raw.githubusercontent.com/nagaitsev/codex-skill-write-lesson-notes/main/plugin"
    $apiHeaders = @{
        "User-Agent" = "write-lesson-notes-plugin"
        "Accept" = "application/vnd.github+json"
    }
    $rawHeaders = @{
        "User-Agent" = "write-lesson-notes-plugin"
    }

    if (-not $LatestSha) {
        $commitInfo = Invoke-RestMethod -Uri "https://api.github.com/repos/nagaitsev/codex-skill-write-lesson-notes/commits/main" -Headers $apiHeaders
        $LatestSha = $commitInfo.sha
    }

    $pluginFiles = @(
        ".codex-plugin/plugin.json",
        "hooks.json",
        "scripts/build-plugin-bundle.ps1",
        "scripts/update-plugin.ps1",
        "scripts/sync-plugin-bundle.ps1",
        "scripts/verify-plugin-bundle.ps1",
        "skills/write-lesson-notes/SKILL.md",
        "skills/write-lesson-notes/agents/openai.yaml",
        "skills/write-lesson-notes/references/contents-mode.md",
        "skills/write-lesson-notes/references/editorial-note-template.md",
        "skills/write-lesson-notes/references/lesson-test-template.txt",
        "skills/write-lesson-notes/references/lesson-timecodes-template.md",
        "skills/write-lesson-notes/references/note-mode.md",
        "skills/write-lesson-notes/references/test-mode.md",
        "skills/write-lesson-notes/references/timecodes-mode.md"
    )

    $tempDir = Join-Path ([System.IO.Path]::GetTempPath()) ("write-lesson-notes-bundle-" + [guid]::NewGuid().ToString("N"))
    New-Item -ItemType Directory -Force -Path $tempDir | Out-Null

    foreach ($relativePath in $pluginFiles) {
        $normalizedRelative = $relativePath -replace "\\", "/"
        $downloadUrl = "$rawBase/$normalizedRelative"
        $tmpFile = Join-Path $tempDir ([IO.Path]::GetFileName($normalizedRelative))
        Invoke-WebRequest -Uri $downloadUrl -Headers $rawHeaders -OutFile $tmpFile

        $destination = Join-Path $PluginRoot ($relativePath -replace "/", "\")
        $destinationDir = Split-Path -Parent $destination
        New-Item -ItemType Directory -Force -Path $destinationDir | Out-Null
        Copy-Item -LiteralPath $tmpFile -Destination $destination -Force
    }

    $obsoleteFiles = @(
        (Join-Path $PluginRoot "scripts\\update-skill.ps1")
    )

    foreach ($obsoleteFile in $obsoleteFiles) {
        if (Test-Path $obsoleteFile) {
            Remove-Item -LiteralPath $obsoleteFile -Force -ErrorAction SilentlyContinue
        }
    }

    Remove-Item -LiteralPath $tempDir -Recurse -Force -ErrorAction SilentlyContinue

    New-Item -ItemType Directory -Force -Path $stateDir | Out-Null
    @{
        lastCheckUtc = [DateTime]::UtcNow.ToString("o")
        lastCommitSha = $LatestSha
    } | ConvertTo-Json | Set-Content -LiteralPath $statePath -Encoding UTF8

    Write-Status "write-lesson-notes: plugin bundle updated to $LatestSha"
    exit 0
} catch {
    Write-Status ("write-lesson-notes: bundle sync skipped - " + $_.Exception.Message)
    exit 0
}

param()

$ErrorActionPreference = "Stop"

function Get-NormalizedContent {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Path
    )

    $content = [System.IO.File]::ReadAllText($Path)
    return $content.Replace("`r`n", "`n").Replace("`r", "`n")
}

$repoRoot = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
$pluginRoot = Split-Path -Parent $PSScriptRoot
$pluginSkillRoot = Join-Path $pluginRoot "skills\write-lesson-notes"

$requiredFiles = @(
    (Join-Path $pluginRoot ".codex-plugin\plugin.json"),
    (Join-Path $pluginRoot "scripts\build-plugin-bundle.ps1"),
    (Join-Path $pluginRoot "scripts\update-plugin.ps1"),
    (Join-Path $pluginRoot "scripts\sync-plugin-bundle.ps1")
)

foreach ($file in $requiredFiles) {
    if (-not (Test-Path -LiteralPath $file)) {
        throw "Missing required file: $file"
    }
}

$syncScript = Get-NormalizedContent -Path (Join-Path $pluginRoot "scripts\sync-plugin-bundle.ps1")
if ($syncScript -match [regex]::Escape('.codex\skills\write-lesson-notes')) {
    throw "Legacy .codex skill mirror is still configured."
}
if ($syncScript -match [regex]::Escape('cache\local-custom\write-lesson-notes')) {
    throw "Legacy plugin cache mirror is still configured."
}

$updateScript = Get-NormalizedContent -Path (Join-Path $pluginRoot "scripts\update-plugin.ps1")
if ($updateScript -match "rawSyncUrl") {
    throw "Updater still downloads a remote sync script."
}
if ($updateScript -notmatch [regex]::Escape('scripts\sync-plugin-bundle.ps1')) {
    throw "Updater does not invoke the local bundled sync script."
}

$pluginManifest = Get-Content -Raw -LiteralPath (Join-Path $pluginRoot ".codex-plugin\plugin.json") | ConvertFrom-Json
if ($pluginManifest.version -ne "0.1.1") {
    throw "Expected plugin version 0.1.1, got $($pluginManifest.version)."
}

$skillFiles = @(
    @{ Source = "SKILL.md"; Destination = "SKILL.md" },
    @{ Source = "agents\openai.yaml"; Destination = "agents\openai.yaml" },
    @{ Source = "references\contents-mode.md"; Destination = "references\contents-mode.md" },
    @{ Source = "references\editorial-note-template.md"; Destination = "references\editorial-note-template.md" },
    @{ Source = "references\lesson-test-template.txt"; Destination = "references\lesson-test-template.txt" },
    @{ Source = "references\lesson-timecodes-template.md"; Destination = "references\lesson-timecodes-template.md" },
    @{ Source = "references\note-mode.md"; Destination = "references\note-mode.md" },
    @{ Source = "references\test-mode.md"; Destination = "references\test-mode.md" },
    @{ Source = "references\timecodes-mode.md"; Destination = "references\timecodes-mode.md" }
)

foreach ($file in $skillFiles) {
    $sourcePath = Join-Path $repoRoot $file.Source
    $destinationPath = Join-Path $pluginSkillRoot $file.Destination

    if (-not (Test-Path -LiteralPath $sourcePath)) {
        throw "Missing source file: $sourcePath"
    }
    if (-not (Test-Path -LiteralPath $destinationPath)) {
        throw "Missing plugin bundle file: $destinationPath"
    }

    $sourceContent = Get-NormalizedContent -Path $sourcePath
    $destinationContent = Get-NormalizedContent -Path $destinationPath
    if ($sourceContent -cne $destinationContent) {
        throw "Plugin bundle drift detected for $($file.Destination)."
    }
}

Write-Output "Plugin bundle verification passed."

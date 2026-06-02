param(
    [switch]$Quiet
)

$ErrorActionPreference = "Stop"

function Write-Status {
    param([string]$Message)
    if (-not $Quiet) {
        Write-Output $Message
    }
}

$pluginRoot = Split-Path -Parent $PSScriptRoot
$repoRoot = Split-Path -Parent $pluginRoot
$pluginSkillRoot = Join-Path $pluginRoot "skills\write-lesson-notes"

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

    $destinationDir = Split-Path -Parent $destinationPath
    New-Item -ItemType Directory -Force -Path $destinationDir | Out-Null
    Copy-Item -LiteralPath $sourcePath -Destination $destinationPath -Force
}

Write-Status "write-lesson-notes: plugin bundle refreshed from repository root"

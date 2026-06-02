# Plugin-Only Delivery Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Remove legacy multi-source skill delivery and make the repository ship `write-lesson-notes` through the plugin bundle only.

**Architecture:** Keep the repository root as the authoring source for `SKILL.md`, `agents/openai.yaml`, and `references/*`. Add a local build step that copies those files into `plugin/skills/write-lesson-notes`, then make the runtime updater refresh only the installed plugin bundle instead of mirroring into `.codex\skills` or plugin cache.

**Tech Stack:** Markdown, JSON, PowerShell 5+, Git

---

### Task 1: Add regression verification first

**Files:**
- Create: `plugin/scripts/verify-plugin-bundle.ps1`
- Test: `plugin/scripts/verify-plugin-bundle.ps1`

- [ ] **Step 1: Write the failing verification script**

```powershell
param()

$requiredFiles = @(
    "plugin/scripts/build-plugin-bundle.ps1",
    "plugin/scripts/update-plugin.ps1",
    "plugin/scripts/sync-plugin-bundle.ps1",
    "plugin/.codex-plugin/plugin.json"
)

foreach ($file in $requiredFiles) {
    if (-not (Test-Path -LiteralPath $file)) {
        throw "Missing required file: $file"
    }
}

$syncScript = Get-Content -Raw -LiteralPath "plugin/scripts/sync-plugin-bundle.ps1"
if ($syncScript -match "\.codex\\skills\\write-lesson-notes") {
    throw "Legacy .codex skill mirror still present"
}
if ($syncScript -match "cache\\local-custom\\write-lesson-notes") {
    throw "Legacy cache mirror still present"
}
```

- [ ] **Step 2: Run verification to confirm RED**

Run: `powershell -ExecutionPolicy Bypass -File .\plugin\scripts\verify-plugin-bundle.ps1`
Expected: FAIL because the build script does not exist yet and legacy mirror targets are still present.

### Task 2: Add canonical build pipeline

**Files:**
- Create: `plugin/scripts/build-plugin-bundle.ps1`
- Modify: `plugin/skills/write-lesson-notes/SKILL.md`
- Modify: `plugin/skills/write-lesson-notes/agents/openai.yaml`
- Modify: `plugin/skills/write-lesson-notes/references/contents-mode.md`
- Modify: `plugin/skills/write-lesson-notes/references/editorial-note-template.md`
- Modify: `plugin/skills/write-lesson-notes/references/lesson-test-template.txt`
- Modify: `plugin/skills/write-lesson-notes/references/lesson-timecodes-template.md`
- Modify: `plugin/skills/write-lesson-notes/references/note-mode.md`
- Modify: `plugin/skills/write-lesson-notes/references/test-mode.md`
- Modify: `plugin/skills/write-lesson-notes/references/timecodes-mode.md`

- [ ] **Step 1: Implement bundle build script**

```powershell
$repoRoot = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
$pluginSkillRoot = Join-Path (Split-Path -Parent $PSScriptRoot) "skills\write-lesson-notes"

$mappings = @(
    @{ Source = "SKILL.md"; Destination = "SKILL.md" },
    @{ Source = "agents/openai.yaml"; Destination = "agents/openai.yaml" },
    @{ Source = "references/contents-mode.md"; Destination = "references/contents-mode.md" }
)

foreach ($mapping in $mappings) {
    Copy-Item -LiteralPath (Join-Path $repoRoot $mapping.Source) `
        -Destination (Join-Path $pluginSkillRoot $mapping.Destination) -Force
}
```

- [ ] **Step 2: Run build script**

Run: `powershell -ExecutionPolicy Bypass -File .\plugin\scripts\build-plugin-bundle.ps1`
Expected: PASS and refresh plugin bundle files from the root source.

### Task 3: Simplify runtime updater

**Files:**
- Modify: `plugin/scripts/update-plugin.ps1`
- Modify: `plugin/scripts/sync-plugin-bundle.ps1`
- Modify: `plugin/.codex-plugin/plugin.json`

- [ ] **Step 1: Stop downloading and executing remote scripts**

```powershell
$syncScriptPath = Join-Path $pluginRoot "scripts\sync-plugin-bundle.ps1"
if (-not (Test-Path -LiteralPath $syncScriptPath)) {
    throw "Missing local sync script: $syncScriptPath"
}

& powershell -ExecutionPolicy Bypass -File $syncScriptPath -PluginRoot $pluginRoot -LatestSha $latestSha
```

- [ ] **Step 2: Remove legacy mirror targets from sync**

```powershell
$pluginFiles = @(
    ".codex-plugin/plugin.json",
    "hooks.json",
    "scripts/update-plugin.ps1",
    "scripts/sync-plugin-bundle.ps1"
)
```

`sync-plugin-bundle.ps1` should only refresh files inside the plugin root and write the plugin state file.

- [ ] **Step 3: Bump plugin version**

Set `plugin/.codex-plugin/plugin.json` version from `0.1.0` to `0.1.1`.

### Task 4: Document the new operating model

**Files:**
- Modify: `README.md`

- [ ] **Step 1: Update docs**

Document:
- root files are canonical authoring sources
- `plugin/scripts/build-plugin-bundle.ps1` refreshes the plugin bundle
- plugin updater refreshes only the installed plugin bundle
- legacy duplicates in `.agents\skills` and `.codex\skills` should be cleaned manually once

- [ ] **Step 2: Re-run verification to confirm GREEN**

Run: `powershell -ExecutionPolicy Bypass -File .\plugin\scripts\verify-plugin-bundle.ps1`
Expected: PASS with normalized content parity and no legacy mirror targets.

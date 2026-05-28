---
name: write-lesson-notes
description: Use when Codex needs to create a lesson note, lesson test, contents block, or subtitle-based timecodes from user-provided lesson materials.
---

# Write Lesson Notes

## Overview

This skill supports four explicit commands:

- `Напиши конспект занятия`
- `Сделай тест`
- `Сделай содержание` or `Сгенери содержание`
- `Сделай таймкоды`

Keep the mode-specific rules separate:

- lesson notes -> [references/note-mode.md](references/note-mode.md)
- tests -> [references/test-mode.md](references/test-mode.md)
- contents generation -> [references/contents-mode.md](references/contents-mode.md)
- timecodes -> [references/timecodes-mode.md](references/timecodes-mode.md)

Use the matching template together with the matching mode file.

## Mandatory Output Rules

- For `Напиши конспект занятия`, always produce the result in Markdown and write it to a `.md` file by default.
- For `Сделай тест`, always produce the result as a `.txt` file by default.
- For `Сделай таймкоды`, always produce the result as a `.md` file by default.
- By default, create the result as a file instead of only printing it in chat.
- Treat the written file as the primary final artifact.
- When the environment supports Canvas and the user asked `Сделай тест`, prepare the test in Canvas as well, but the `.txt` file remains mandatory.
- Always present the output as direct study material rather than as a retelling of what happened in class.

## Shared Workflow

1. Read the files the user explicitly attached, named, linked, or approved for the current task.
2. Detect the requested mode from the user's command.
3. Use the matching mode file and template before drafting.
4. Draft only from the user-approved materials for this run.
5. Verify externally checkable details.
6. Run the required final validation for the active mode.
7. Save the final result to the required file format unless the user explicitly asked for chat-only output.

## Input Scope Rule

Use only the files the user explicitly attached, named, linked, or otherwise approved for this task.
Do not automatically inspect or incorporate nearby files from the same folder just because they look related.
Do not automatically open or use neighboring PDFs, presentations, screenshots, transcripts, markdown files, or other materials unless the user explicitly provided them or confirmed that they should be used.

If the user attaches or mentions one file, but the same folder contains another likely related lesson file, stop before drafting and ask whether to use both files or only the attached or mentioned file.
This clarification is mandatory.

Use this rule especially when transcript parts are split across nearby files such as `1.txt` and `2.txt`, `part_000.txt` and `part_001.txt`, or similarly named lesson fragments.
Folder proximity is not permission to use a file.

## Shared Verification Rules

Verify externally checkable details after drafting and before final output.

Check these items:

- term spelling and product names
- product versions and model names
- hotkeys and shortcut combinations
- site names, service names, and URLs
- feature names that may have changed or be easy to confuse

Prefer official documentation, vendor sites, product pages, and first-party help centers.
Use other reputable sources only when official sources are insufficient.
If internet search is unavailable in the current environment, state that external verification could not be completed instead of claiming the result was verified.

When verification finds a mismatch:

1. Keep the lesson's conceptual explanation.
2. Correct the externally verifiable surface detail.
3. Do not silently invent tools, steps, or links that were never part of the lesson.
4. If a mention is too ambiguous to verify, keep it but mark it as unverified rather than fabricating certainty.

## Conflict Resolution

When transcript wording and supplemental materials differ:

1. Prefer the transcript for what was actually taught.
2. Use the materials to recover names, filenames, examples, slide structure, or screenshots when the transcript is noisy.
3. Use web verification only for facts that can be checked externally.
4. Do not add new ideas that were not present in the lesson.
5. Do not replace the lesson with a generic web summary or external reframing of the topic.

## Reference Files

Use the active pair for the current mode:

- notes -> [references/note-mode.md](references/note-mode.md) and [references/editorial-note-template.md](references/editorial-note-template.md)
- tests -> [references/test-mode.md](references/test-mode.md) and [references/lesson-test-template.txt](references/lesson-test-template.txt)
- contents -> [references/contents-mode.md](references/contents-mode.md)
- timecodes -> [references/timecodes-mode.md](references/timecodes-mode.md) and [references/lesson-timecodes-template.md](references/lesson-timecodes-template.md)

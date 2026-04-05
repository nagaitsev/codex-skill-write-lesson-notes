# Codex Skill: Write Lesson Notes

Editorial-style Codex skill for turning lesson transcripts and supporting materials into compact Markdown notes.

## What It Does

- generates lesson notes in Markdown
- builds `# Содержание` from final level-1 headings
- writes direct subject-matter notes instead of retelling the lesson
- supports practical section titles and compact subsection structure
- allows optional images from local materials or the web
- verifies terms, product names, hotkeys, and URLs before finalizing

## Files

- `SKILL.md` - main skill instructions
- `agents/openai.yaml` - UI metadata
- `references/editorial-note-template.md` - reference template and checklist

## Intended Trigger

Use for requests like `Напиши конспект занятия` or `Сгенери содержание`.

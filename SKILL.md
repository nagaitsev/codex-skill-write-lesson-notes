---
name: write-lesson-notes
description: Create an editorial-style lesson note in Markdown from a lesson transcript and supplemental materials such as slides, links, handouts, screenshots, or PDFs. Use when Codex receives a request like "Напиши конспект занятия" and the user expects a polished thematic note with a contents block, practical section titles, short meaningful subheadings, integrated definitions and workflows, optional images from the lesson materials or the web, and a final list of links and services mentioned in the lesson. Verify externally checkable terms, product names, hotkeys, and URLs before finalizing the note, preferring official sources.
---

# Write Lesson Notes

## Overview

Turn a transcript and lesson materials into a readable editorial note, not into a dry checklist.
Preserve the lesson's meaning, terminology, and structure, but present them as a clean study text in simple language without direct speech, teacher references, or quote formatting.

## Mandatory Requirement

Always produce the lesson note in Markdown format.
Always present the content as direct study material, not as a retelling of what happened in class.

## Core Principle

Default to the style shown in the user's preferred examples:

- if there are editorial or verification notes, place them before `# Содержание`
- start with `# Содержание`
- generate the contents only from the real topical level-1 `#` headings of the lesson
- then move quickly into the substance of the lesson
- optionally add the lesson title and one or two short intro subsections if they improve readability
- build the note through thematic sections with practical titles
- inside each section, use short meaningful `###` subheadings with prose underneath
- end with `Ссылки на сайты и сервисы`
- add `Использованные ресурсы` only when there are concrete materials, tools, files, demos, or source artifacts worth listing separately

Do not default to rigid report sections like `Ключевые идеи и определения`, `Важные шаги и последовательности`, or `Термины и инструменты` unless the user explicitly asks for that format.

## Workflow

1. Read the full transcript and all supplemental materials before drafting.
2. Reconstruct the real map of the lesson from the transcript: the major blocks, their internal sub-blocks, and the order in which they were taught.
3. Identify the real themes of the lesson, not abstract reporting buckets.
4. Build the note around those themes in the clearest editorial order while preserving the factual teaching order of the lesson.
4. Draft from the lesson content first.
5. If there are editorial notes, verification notes, or a short summary of corrections, place them before `# Содержание`.
6. Generate `# Содержание` from the final set of substantive level-1 `#` headings only.
7. Exclude service blocks and non-lesson blocks from the contents.
8. Verify externally checkable details such as terms, product names, versions, hotkeys, and URLs.
9. Correct factual surface details if needed, while preserving the lesson's substance.

## Explicit Command: Generate Contents

If the user explicitly asks `Сгенери содержание` and provides a Markdown document:

1. Read the existing Markdown document.
2. Find all level-1 headings that begin with `# `.
3. Ignore the `# Содержание` heading itself if it already exists.
4. Ignore service or support headings such as `# Использованные ресурсы`, `# Ссылки на сайты и сервисы`, and other clearly non-topical blocks.
5. Create or refresh the contents block at the top of the document.
6. Represent each included level-1 heading as a flat bullet list item in the same order as it appears in the document.
7. Do not rewrite the body of the note unless the user asked for broader editing.

## Structure Rules

Use this default structure unless the user asks for another one:

1. `# Содержание`
2. Flat bullet list of the main thematic sections, generated from the final set of substantive level-1 lesson headings
3. Optional opening block:
   - `---`
   - `# <название курса или занятия>`
   - optional short intro subsections such as `### Общая тема занятия` or `### Главный вывод занятия`
4. Repeating thematic blocks:
   - `---`
   - `# <тема блока>`
   - several `### <смысловой подзаголовок>` subsections
   - 1 to 3 short paragraphs or a small flat list under each subsection
5. Optional supporting blocks when useful:
   - screenshot or image from the provided materials
   - short commands, filenames, or paths in backticks
   - compact comparison lists
6. Final service sections:
   - optional `---`
   - optional `# Использованные ресурсы`
   - `---`
   - `# Ссылки на сайты и сервисы`

Put `---` before every thematic `#` heading after the contents section.
Do not include service sections or editorial notes in the contents block.

## Writing Rules

- Always produce the final note in Markdown format.
- Use `#` for major sections and `###` for local subsections.
- Write in simple, clear language.
- Remove direct speech, references to the teacher, and quote formatting.
- Remove all meta-phrases that refer back to the lesson itself, for example:
  - `на занятии разобрано`
  - `на уроке показано`
  - `преподаватель отмечает`
  - `урок показывает`
  - `в уроке к таким задачам отнесены`
- Rewrite such constructions into direct declarative statements.
- Do not insert empty lead-in phrases before lists or procedures, for example:
  - `Показанный рабочий прием такой:`
  - `Рабочий алгоритм повторяется несколько раз:`
  - `Сценарий старта очень простой:`
- If a subsection leads into a list of steps, examples, or criteria, start the list immediately unless one short factual sentence is genuinely necessary.
- Prefer impersonal or direct factual phrasing, for example:
  - not `На уроке к таким задачам отнесены...`
  - but `К таким задачам относятся...`
  - not `Преподаватель отдельно предупреждает, что у AI есть ограничения`
  - but `У AI есть ограничения...`
- When a sentence says that a tool was demonstrated as something, rewrite it as what the tool is in this context:
  - not `Урок показывает Lightroom Classic не только как конвертер RAW, но и как инструмент организации серии`
  - but `Lightroom Classic не только конвертер RAW, но и инструмент организации серии`
- Preserve the meaning and terminology of the lesson as closely as possible.
- Prefer short explanatory paragraphs over bullets.
- Prefer dense, practical phrasing over ceremonial framing.
- Choose section titles that sound like useful study notes, not generic report labels.
- If two headings contain the same meaning, prefer the shorter and more practical version.
- Keep headings focused on the actual subject matter, not on the fact that something was shown, clarified, or demonstrated.
- Adjust density to the lesson itself: technical lessons may use more short lists; conceptual lessons may use more prose.
- Write as a detailed study note, not as a thematic squeeze or broad summary of the topic.
- Use bullets only when the content is inherently list-shaped:
  - table of contents
  - short comparisons
  - explicit multi-item enumerations from the lesson
  - resource lists
  - final links
- Do not pad the note with generic filler headings.
- Do not narrate the drafting process in the final output.
- If screenshots or images from slides or materials materially clarify the lesson and are available locally, include them near the relevant section.
- If useful images are not present locally but can be confidently found online, they may also be included when they add real explanatory value.

## Content Coverage

The finished note must still preserve all of these elements, but integrate them naturally into the thematic sections instead of isolating them into artificial buckets:

- key ideas and definitions
- important steps, actions, and sequences
- terms, tools, commands, and modes worth remembering
- used resources when they are important enough to list
- links and services mentioned in the lesson

Do not reduce the lesson to a thematic summary only.
Preserve the teaching structure of the lesson and keep separately demonstrated tools, workflows, and blocks when they were shown as distinct parts of the material.
Preserve all major lesson blocks even when they are introductory, organizational, or обзорные, if they carry meaningful context for the lesson.
Preserve all practically important sub-blocks even when they seem technical, auxiliary, or operational.
Do not collapse separately demonstrated tools into one generic formulation when the tools were shown as distinct items.
If the lesson explains a method through an example, keep the example as part of the explanation.
If a tool name is uncertain in the transcript, do not remove the whole block. Keep the generalized description of what the tool does and mark the exact name as requiring verification.

If the lesson contains course logistics, tool comparisons, setup details, or limitations, keep them if they are part of the actual teaching.
Preserve homework, submission rules, criteria, penalties, required comments, and any conditions that affect the student's work.
If the lesson is mostly practical, let the note become more cheat-sheet-like and less essay-like.
If the lesson is more conceptual, keep more connective prose between ideas.

## Verification Rules

Verify externally checkable details after drafting and before final output.

Check these items:

- term spelling and product names
- product versions and model names
- hotkeys and shortcut combinations
- site names, service names, and URLs
- feature names that may have changed or be easy to confuse

Prefer official documentation, vendor sites, product pages, and first-party help centers. Use other reputable sources only when official sources are insufficient.
If internet search is unavailable in the current environment, state that external verification could not be completed instead of claiming the note was verified.

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

## Quality Bar

- Make the note read like a finished study handout.
- Make the text read as compact domain knowledge, not as a recap of a lesson.
- Group adjacent ideas into coherent thematic sections.
- Avoid mechanical repetition of the same sentence pattern.
- Keep subsections meaningful and specific.
- Preserve important nuance, not just headlines.
- Do not flatten the lesson into a checklist unless the source itself is checklist-like.
- Do not force an intro block if the note reads better by starting immediately with the first substantive topic.
- Do not force a separate resources section if links and mentioned tools already cover that need.
- Make sure the contents block matches the final substantive level-1 lesson topics only.
- If there is a short note about corrected terminology or verified naming, keep it outside the main lesson structure, before the contents block.
- Check whether the note preserves not only what was discussed, but how to work with it in practice.
- Check whether separate tools, modes, warnings, limitations, working rules, and examples were preserved as separate meaningful parts.
- Check whether the final structure follows the factual structure of the lesson rather than an editor-friendly simplification.
- If no transcript or materials are provided, request them instead of inventing content.

## Reference File

Use [references/editorial-note-template.md](references/editorial-note-template.md) as the default output skeleton and checklist.

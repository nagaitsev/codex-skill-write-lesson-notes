---
name: write-lesson-notes
description: Create an editorial-style lesson note in Markdown, a lesson test in TXT, or YouTube-style timecodes in Markdown from a lesson transcript, subtitle file, and supplemental materials such as slides, links, handouts, screenshots, or PDFs. Use when Codex receives a request like "Напиши конспект занятия", "Сгенери содержание", "Сделай тест", or "Сделай таймкоды". For notes, produce a polished thematic note with a contents block, practical section titles, short meaningful subheadings, integrated definitions and workflows, optional images from the lesson materials or the web, and a final list of links and services mentioned in the lesson. For tests, produce 10 questions in the exact teaching order of the lesson with controlled single-answer and limited multi-answer questions. For timecodes, accept only real subtitle files with timing cues and turn them into a clean timestamp list in YouTube format by default, without explanatory paragraphs after each timestamp unless the user explicitly asks for an annotated version. Verify externally checkable terms, product names, hotkeys, and URLs before finalizing the note, test, or timecodes, preferring official sources.
---

# Write Lesson Notes

## Overview

Turn a transcript and lesson materials into either:

- a readable editorial lesson note
- or a structured lesson test
- or a clean timecodes list built from subtitle files

Preserve the lesson's meaning, terminology, structure, and real teaching order.
Present the result as clean study material without direct speech, teacher references, or quote formatting.

## Mandatory Requirement

For `Напиши конспект занятия`, always produce the lesson note in Markdown format.
For `Сделай тест`, always produce the test as a `.txt` file.
For `Сделай таймкоды`, always produce the timecoded outline as a `.md` file.
By default, create the result as a file instead of only printing it in chat.
Treat the written file as the primary final artifact.
When the environment supports Canvas and the user asked `Сделай тест`, prepare the test in Canvas as well, but the `.txt` file remains mandatory.
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
- prefer short subject-based level-1 headings that name the tool, task, or topic directly
- keep adjacent practical topics as separate level-1 sections when they cover different tools, modes, problems, or workflows
- use `###` only when the section genuinely splits into multiple meaningful subtopics
- avoid meta-subheadings such as `Практический вывод`, `Почему это ценно`, or `Что здесь считается хорошим результатом`

Do not default to rigid report sections like `Ключевые идеи и определения`, `Важные шаги и последовательности`, or `Термины и инструменты` unless the user explicitly asks for that format.

## Workflow

1. Read the full transcript and all supplemental materials before drafting, but only from the files the user explicitly attached, mentioned, or approved for use.
2. Reconstruct the real map of the lesson from the transcript: the major blocks, their internal sub-blocks, and the order in which they were taught.
3. Identify the real themes of the lesson, not abstract reporting buckets.
4. Build the note around those themes in the clearest editorial order while preserving the factual teaching order of the lesson.
5. When several structurings are possible, prefer the one that tracks the teacher's progression through tools, stages, examples, and decisions over a cleaner taxonomic regrouping by topic.
4. Draft from the lesson content first.
5. Choose the output mode from the user's command:
   - `Напиши конспект занятия` -> note
   - `Сделай тест` -> test
   - `Сделай таймкоды` -> timecodes
   - `Сделай содержание` or `Сгенери содержание` -> contents update
6. Write the note into a `.md` file by default unless the user explicitly asked for chat-only output.
7. Write the test into a `.txt` file by default unless the user explicitly asked for chat-only output.
8. Write the timecoded outline into a `.md` file by default unless the user explicitly asked for chat-only output.
9. If there are editorial notes, verification notes, or a short summary of corrections for a lesson note, place them before `# Содержание`.
10. Generate `# Содержание` from the final set of substantive level-1 `#` headings only.
11. Exclude service blocks and non-lesson blocks from the contents.
12. Verify externally checkable details such as terms, product names, versions, hotkeys, and URLs.
13. Correct factual surface details if needed, while preserving the lesson's substance.

## Input Scope Rule

Use only the files the user explicitly attached, named, linked, or otherwise approved for this task.
Do not automatically inspect or incorporate nearby files from the same folder just because they look related.
Do not automatically open or use neighboring PDFs, presentations, screenshots, transcripts, markdown files, or other materials unless the user explicitly provided them or confirmed that they should be used.

If the user attaches or mentions one file, but the same folder contains another likely related lesson file, stop before drafting and ask whether to use both files or only the attached/mentioned file.
This clarification is mandatory.

Use this rule especially when transcript parts are split across nearby files such as `1.txt` and `2.txt`, `part_000.txt` and `part_001.txt`, or similarly named lesson fragments.
Folder proximity is not permission to use a file.

## Explicit Command: Generate Contents

If the user explicitly asks `Сделай содержание` or `Сгенери содержание` and provides a Markdown document:

1. Read the existing Markdown document.
2. Find headings exclusively from lines that begin with exactly one level-1 marker: `# `.
3. Ignore the `# Содержание` heading itself if it already exists.
4. Ignore service or support headings such as `# Использованные ресурсы`, `# Ссылки на сайты и сервисы`, and other clearly non-topical blocks.
5. Create or refresh the contents block at the top of the document.
6. Represent each included level-1 heading as plain text in a flat bullet list in the same order as it appears in the document.
7. Do not rewrite the body of the note unless the user asked for broader editing.

Contents generation restrictions:

- Do not include `##`, `###`, or deeper headings.
- Do not generate Markdown links or anchors in the contents list.
- Do not include file links, local paths, or URLs.
- Use only the visible heading text after `# `.

## Explicit Command: Make Test

If the user explicitly asks `Сделай тест`:

1. Build the test only from the transcript and user-approved materials for the current task.
2. Reconstruct the lesson sequence first, then keep the question sequence in that same order.
3. If the user did not explicitly request another number, create exactly 10 questions by default.
4. By default, make those 10 questions cover the whole lesson progressively rather than clustering almost all questions around one fragment.
5. Use only two question types:
   - single-answer question with one correct option
   - multi-answer question with 2 or more correct options
6. Use no more than 30% multi-answer questions. For a 10-question test, that means no more than 3 multi-answer questions.
7. For every multi-answer question, explicitly state the number of correct options on a separate line immediately after the question. Use grammatically correct Russian inflection for the numeral, for example: `Выберите 2 правильных варианта.`, `Выберите 3 правильных варианта.`, `Выберите 5 правильных вариантов.`
8. Write the final test into a `.txt` file by default.
9. If Canvas is available in the current environment, prepare the test in Canvas as well, but do not skip the `.txt` file.
10. Verify terminology, product names, hotkeys, and externally checkable details before finalizing the test.
11. Exclude organizational questions from the test.
12. Write question formulations compactly so they are easy to scan and easy to read.
13. Write answer options compactly in the same general style, without verbose framing.
14. After drafting the test, run a dedicated answer-balance pass and rewrite options until correct answers do not systematically stand out by length, density, or grammatical form.

Test formatting rules:

- Number every question.
- Use plain numbered lines in the form `1. <вопрос>`, `2. <вопрос>` and so on.
- Do not wrap question lines in headings such as `## 1.` or `### 1.`.
- Keep one empty line between the question line and the answer block.
- For multi-answer questions, place a grammatically correct line such as `Выберите 2 правильных варианта.` or `Выберите 5 правильных вариантов.` as the second line, immediately after the question and before the answer list.
- Prefix correct answers with `+ `.
- Prefix incorrect answers with `- `.
- Use only `+ ` and `- ` markers for answer options. Do not use bullets, circles, checkboxes, emoji, or radio-button symbols such as `*`, `•`, `◯`, `☐`, `☑️`, or `🔘`.
- Put every answer option on its own line.
- Use 4 or more answer options for every question whenever possible.
- Single-answer questions may use 3 options only when a fourth option would be obviously weak.
- Multi-answer questions must always have 4 or more options.
- Keep question formulations compact and easy to read.
- Keep answer options compact and easy to read.
- Keep correct and incorrect options parallel in grammar, specificity, and approximate length so the answer cannot be guessed from wording size alone.
- If one option is visibly longer, denser, or more formal than the others in the same question, rewrite the set until no option stands out by shape alone.
- Do not use `все перечисленное`, `ни один из вариантов`, joke distractors, or structurally obvious trap answers.
- Do not write ambiguous partial-credit multi-answer questions. A multi-answer question must be fully gradable as all-correct or not correct.
- Keep the general direct-writing rules in force: no retelling of the lesson, no teacher references, no empty lead-ins.
- Write questions as direct knowledge checks about the subject, not as questions about what the teacher said or how the lesson was phrased.

## Explicit Command: Make Timecodes

If the user explicitly asks `Сделай таймкоды`:

1. Accept only a real subtitle file or a file that actually contains recurring subtitle timing cues.
2. Do not trust the filename or extension alone. Inspect the content and confirm that it contains repeated subtitle time markers such as `00:01:23,456 --> 00:01:27,000`, `00:01:23.456 --> 00:01:27.000`, `WEBVTT` cue blocks, or another reliable subtitle timing structure.
3. If the provided file is plain text without subtitle timing cues, refuse this mode and explicitly ask for a subtitle file instead. Do not fabricate timecodes from a plain transcript.
4. If the subtitle file is too malformed to recover reliable topic start times, refuse and ask for a cleaner subtitle export instead of guessing.
5. Reconstruct the video flow from the subtitle stream and split it into meaningful thematic blocks in the real order of the video.
6. By default, produce a clean timestamp list rather than an outline with explanatory text.
7. Format each line as `<таймкод> <тема>`, for example `0:00 Введение` or `1:12:43 Финальный экспорт`.
8. Do not add paragraphs, bullets, or explanatory lines under timestamps unless the user explicitly asks for an annotated or expanded version.
9. Use only the topic start time for each line. Do not add decorative intermediate timecodes that are not supported by the subtitles.
10. Format timecodes as `M:SS` under one hour and `H:MM:SS` at one hour or longer.
11. Normalize the very first line to `0:00` when the opening subtitle cue starts a few seconds later but clearly belongs to the start of the video.
12. Prefer fewer meaningful topic blocks over line-by-line timestamping. Create a new timestamp only when the video clearly switches to a new topic, tool, step, mode, or task.
13. Write the final timecodes into a `.md` file by default.
14. Verify terminology, product names, hotkeys, and externally checkable names before finalizing the timecodes.
15. For detailed timecodes rules and edge cases, use [references/timecodes-mode.md](references/timecodes-mode.md) together with [references/lesson-timecodes-template.md](references/lesson-timecodes-template.md).

## Note Structure Rules

Use this default structure for lesson notes unless the user asks for another one:

1. `# Содержание`
2. Flat bullet list of the main thematic sections, generated from the final set of substantive level-1 lesson headings
3. Optional opening block:
   - `---`
   - `# <название курса или занятия>`
   - optional short intro subsections such as `### Общая тема занятия` or `### Главный вывод занятия`
4. Repeating thematic blocks:
   - `---`
   - `# <тема блока>`
   - several `### <смысловой подзаголовок>` subsections when the block really contains multiple subtopics
   - 1 to 3 short paragraphs or a small flat list under each subsection
5. Optional supporting blocks when useful:
   - screenshot or image from the provided materials, especially for concrete interface tools, tabs, modes, or settings
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

- For lesson notes, always produce the final note in Markdown format.
- For tests, always produce the final result as a `.txt` file.
- By default, save the final result as a file instead of returning only a chat response.
- For `Сделай таймкоды`, verify that the input is real subtitles with timing cues before drafting any output.
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
- Prefer short level-1 headings that directly name the tool, task, or problem.
- Do not overload level-1 headings with conclusions, evaluations, or long descriptive framing if the same meaning can move into the first paragraph.
- Do not introduce a new top-level thematic section if the source treated that material as a warning, constraint, or sub-point inside another block.
- Do not merge adjacent practical topics into one top-level section if they involve different tools, interface modes, task types, or problem classes.
- By default, keep warnings, limitations, and caveats attached to the nearest tool, method, or workflow block unless the lesson clearly treated them as a standalone topic.
- Adjust density to the lesson itself: technical lessons may use more short lists; conceptual lessons may use more prose.
- Write as a detailed study note, not as a thematic squeeze or broad summary of the topic.
- Use bullets only when the content is inherently list-shaped:
  - table of contents
  - short comparisons
  - explicit multi-item enumerations from the lesson
  - resource lists
  - final links
- Do not pad the note with generic filler headings.
- Do not use meta-subheadings like `Практический вывод`, `Почему это ценно`, `Что здесь считается хорошим результатом`, or similar editorial wrappers when the same point can be stated directly.
- Do not create a `###` subheading for a single short block unless it marks a real switch to another tool, mode, example, rule, or limitation.
- Do not narrate the drafting process in the final output.
- If screenshots or images from slides or materials materially clarify the lesson and are available locally, include them near the relevant section.
- Prefer placing interface screenshots next to the exact tool, tab, mode, or setting they explain.
- If useful images are not present locally but can be confidently found online, they may also be included when they add real explanatory value.

## Content Coverage

The finished note must still preserve all of these elements, but integrate them naturally into the thematic sections instead of isolating them into artificial buckets:

- key ideas and definitions
- important steps, actions, and sequences
- terms, tools, commands, and modes worth remembering
- used resources when they are important enough to list
- links and services mentioned in the lesson

Do not reduce the lesson to a thematic summary only.
Do not enrich the lesson note with content from files that were not explicitly provided for this run.
Preserve the teaching structure of the lesson and keep separately demonstrated tools, workflows, and blocks when they were shown as distinct parts of the material.
Preserve all major lesson blocks even when they are introductory, organizational, or обзорные, if they carry meaningful context for the lesson.
Preserve all practically important sub-blocks even when they seem technical, auxiliary, or operational.
Do not collapse separately demonstrated tools into one generic formulation when the tools were shown as distinct items.
Do not merge adjacent lesson themes into one broader category just because they are conceptually related.
Prefer multiple smaller faithful blocks over one elegant but over-compressed synthesis.
If the lesson explains a method through an example, keep the example as part of the explanation.
If a tool name is uncertain in the transcript, do not remove the whole block. Keep the generalized description of what the tool does and mark the exact name as requiring verification.

If the lesson contains course logistics, tool comparisons, setup details, or limitations, keep them if they are part of the actual teaching.
Preserve homework, submission rules, criteria, penalties, required comments, and any conditions that affect the student's work.
If the lesson is mostly practical, let the note become more cheat-sheet-like and less essay-like.
If the lesson is more conceptual, keep more connective prose between ideas.

For tests:

- Keep the question order aligned with the lesson order.
- Keep the question order aligned with the order of the selected substantive lesson topics.
- Exclude organizational material from the test: platform navigation, chats, general course housekeeping, and other non-substantive logistics should not become questions.
- When selecting 10 questions, prioritize substantive blocks such as terms, models, tariffs, tools, workflows, limitations, settings, comparisons, and practical rules.
- Do not spend question slots on introductory course logistics if stronger substantive material appears later in the lesson.
- If a weak question is replaced, replace it with the next stronger substantive topic from later in the lesson while preserving the order among the selected topics.
- Prefer questions that check practical distinctions, terminology, steps, limitations, and tool behavior actually taught in the lesson.
- Do not invent facts, names, or hotkeys just to make a question harder.
- Do not use external knowledge to replace what was actually taught, except for narrow verification of names, terms, links, and hotkeys.
- Build each question strictly from what was explicitly said or shown in the lesson materials for this run.
- Do not merge distant fragments from different parts of the lesson into one synthesized question if that combined wording was not actually taught as one point.
- You may rephrase for clarity and compactness, but do not add your own meaning, inference, or editorial synthesis to the tested fact.
- Keep each question unambiguous and gradeable from the lesson content.
- Phrase questions impersonally and factually. Avoid constructions like `преподаватель рекомендует`, `в занятии описывается`, or `по материалу занятия`, unless the fact cannot be asked in a direct subject form.
- Prefer shorter question wording when the same meaning remains clear.
- Prefer shorter answer wording when the same meaning remains clear.

For timecodes:

- Build them only from real subtitles with timing cues, not from plain transcript text.
- Refuse the task if the provided file does not contain subtitle timing structure.
- Keep the topic order aligned with the real subtitle order.
- Prefer topic-level blocks over overly granular timestamp slicing.
- Use the subtitle-derived topic start as the timestamp.
- Use YouTube-style line format: `<таймкод> <тема>`.
- By default, output only the timestamp lines themselves, without explanatory paragraphs or bullets under them.
- Add explanatory text under timestamps only when the user explicitly asks for an annotated, expanded, or outline-style version.
- Do not invent timestamps for topics that cannot be reliably anchored in the subtitle stream.

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
- Check whether neighboring practical topics were kept separate when they belong to different tools, modes, or tasks.
- Check whether top-level headings are short and subject-based rather than explanatory.
- Check whether any `###` heading is only a wrapper for one short paragraph and can be removed.
- Check whether meta-subheadings can be replaced by a direct heading or by starting the paragraph immediately.
- Check whether every factual detail, screenshot, PDF, and supplemental artifact used in the note came only from user-provided or user-approved files.
- Check whether the final result was written to a `.md` file unless the user explicitly requested chat-only output.
- For tests, check whether the final result was written to a `.txt` file unless the user explicitly requested chat-only output.
- For tests, check whether there are exactly 10 questions.
- For tests, check whether 10 questions were used by default when the user did not request another number.
- For tests, check whether the question order follows the lesson order.
- For tests, check whether the questions cover the whole lesson rather than only one narrow fragment.
- For tests, check whether there are no more than 3 multi-answer questions.
- For tests, check whether every multi-answer question states the number of correct options on the second line with grammatically correct Russian inflection, for example `Выберите 2 правильных варианта.` or `Выберите 5 правильных вариантов.`
- For tests, check whether question lines are plain numbered lines rather than Markdown headings.
- For tests, check whether answer options use only `+ ` and `- ` markers.
- For tests, check whether question formulations are compact and easy to scan.
- For tests, check whether answer formulations are compact and easy to scan.
- For tests, check whether correct and incorrect options are balanced in length and grammatical shape.
- For tests, check whether no question still has a correct option that visibly stands out by length or density alone.
- For tests, check whether organizational questions were excluded.
- For tests, check whether the selected questions cover substantive material rather than course housekeeping.
- For tests, check whether every question is grounded in a point explicitly stated or shown in the lesson materials.
- For tests, check whether no question was built by merging distant lesson fragments into a new synthesized claim that was not actually taught as one point.
- For tests, check whether rephrasing preserved the original meaning without adding new meaning, inference, or editorial interpretation.
- For tests, check whether the wording is direct and impersonal rather than tied to the teacher or lesson narration.
- For timecodes, check whether the input file was a real subtitle file with timing cues rather than plain text.
- For timecodes, check whether every line begins with a YouTube-formatted timestamp.
- For timecodes, check whether the line order follows the subtitle order.
- For timecodes, check whether timestamps mark real topic starts instead of guessed decorative splits.
- For timecodes, check whether the default output stayed a clean timestamp list without explanatory text under each timestamp unless the user explicitly asked for expansion.
- For timecodes, check whether the result was written to a `.md` file unless the user explicitly requested chat-only output.
- Check whether the final structure follows the factual structure of the lesson rather than an editor-friendly simplification.
- If no transcript or materials are provided, request them instead of inventing content.

## Mandatory Final Validation

After completing the draft, review all rules, requirements, restrictions, and anti-patterns in this skill before returning the final text.
This review is mandatory.
For lesson notes, the rule-by-rule validation must be performed by a separate subagent whenever the environment supports subagents.
That validation subagent must not rewrite the note itself. It must return only a concrete fix list: what rule is violated, where the problem is, and what needs to be corrected.
The primary agent must apply those fixes, then run the validation again until the separate validation pass finds no remaining rule violations.
If the current environment does not support subagents, explicitly state that the separate subagent validation could not be run and perform the same full validation inline instead of silently skipping it.

Validation procedure:

1. Compare the finished output against every rule and restriction in `SKILL.md` and the relevant reference template.
2. For lesson notes, send that comparison to a separate validation subagent when subagents are available and request a concrete fix list rather than a rewritten note.
3. If any single rule is violated, revise the note until the violation is removed.
4. Run a drying pass: remove words, phrases, repeated explanations, and second explanatory sentences that can be deleted without losing meaning or practical value.
5. Preserve necessary details, examples, steps, warnings, and operational conditions; do not shorten by deleting meaningful lesson content.
6. After revising, run the validation again from the start.
7. Return the final note only after it passes this full re-check.

Do not stop after one correction pass if violations still remain.

Drying pass rule:

- Prefer the shortest formulation that keeps the same meaning.
- Delete duplicated explanations that restate the previous sentence.
- Delete confirmation phrases like `также подчеркивает`, `это важно потому что`, or similar scaffolding when the point is already clear.
- Do not keep both a rule and a second sentence that only repeats the same rule in different words.
- Delete closing reassurance sentences when they only summarize usefulness without adding a new action, condition, exception, or limitation.
- Delete obvious negative-outcome explanations after a rule when the rule already contains the action and the consequence is predictable.
- Delete negative or absence statements when they do not add a practical distinction, action, limitation, or exception.
- Compress long descriptive paragraphs into short operational theses when the details do not change what the student should do.
- Shorten headings during the drying pass when a shorter heading keeps the same subject.
- Keep extra wording only when it adds a condition, exception, example, action, or practical nuance.

Example:

- Before: `Автоматическое удаление проводов работает не идеально. Оно может пропустить мелкие линии, ошибиться на дальнем плане, оставить фрагменты кабелей или испортить место, где провод перекрывал сложную архитектуру. Но даже частичное удаление может резко сократить объем ручной работы.`
- After: `Автоматическое удаление проводов работает не идеально. Оно может пропустить мелкие линии, ошибиться на дальнем плане, оставить фрагменты кабелей или испортить место, где провод перекрывал сложную архитектуру.`
- Before: `Если нужен каталожный кадр на белом фоне, это обязательно указывается в промпте. Иначе модель может просто почистить исходную сцену, сохранив стол, интерьер, скатерть или другой исходный фон.`
- After: `Если нужен каталожный кадр на белом фоне, это обязательно указывается в промпте.`
- Before heading: `### Преломления и скатерть внутри стекла`
- After heading: `### Преломления`
- Before body: `Стакан со льдом или бокал на скатерти вручную ретушируется крайне тяжело. Нужно не просто вырезать объект, а заново построить искажения фона внутри стекла, цветовые пятна, преломления, блики и прозрачность. Генеративная модель в таких случаях особенно полезна: она понимает общий вид стекла и может создать правдоподобное преломление, которое вручную пришлось бы долго имитировать.`
- After body: `Заново построить искажения фона внутри стекла, цветовые пятна, преломления, блики и прозрачность поможет генеративная модель.`
- Before: `Волосы ретушируются теми же инструментами, что и кожа и фон: \`Healing Brush\`, \`Clone Stamp\`, \`Spot Healing Brush\`, \`Remove Tool\`, иногда генеративные инструменты. Полностью надежной кнопки "убрать все волоски" нет.`
- After: `Волосы ретушируются теми же инструментами, что и кожа и фон: \`Healing Brush\`, \`Clone Stamp\`, \`Spot Healing Brush\`, \`Remove Tool\`, иногда генеративными инструментами.`

## Anti-Patterns

Avoid these failure modes:

- turning the lesson into a broad editorial summary instead of a detailed study note
- rebuilding the lesson into a cleaner taxonomy that no longer matches the teacher's progression
- merging several separately taught tools or stages into one generalized block
- merging neighboring practical topics into one top-level section when the lesson treats them as separate tasks or tools
- moving warnings, limitations, or operational caveats into a detached abstract section when they were originally tied to a specific tool or workflow
- dropping introductory, organizational, or review blocks that materially affect how the student should work
- deleting examples that actually explain the method
- replacing a concrete practical conclusion with a smoother but more generic statement
- adding meta-language such as `на занятии`, `преподаватель показал`, `урок объясняет`
- adding filler lead-ins before lists or procedures
- using editorial subheadings like `Практический вывод` or `Почему это ценно` where a direct subject heading or plain paragraph would be clearer
- forcing `###` wrappers around single short paragraphs that do not introduce a real subtopic
- pulling in nearby PDFs, presentations, transcripts, screenshots, or other files that were not explicitly provided or approved for the current task
- returning the lesson note only in chat when the user did not ask for chat-only output
- returning the test only in chat when the user did not ask for chat-only output
- creating fewer or more than 10 test questions
- putting test questions in a different order than the lesson sequence
- using more than 3 multi-answer questions in a 10-question test
- omitting the `Выберите N ...` line with grammatically correct Russian inflection for a multi-answer question
- writing the question as a Markdown heading such as `## 1. ...` instead of a plain numbered line
- using checkbox, radio, bullet, or emoji markers instead of `+ ` and `- `
- writing needlessly long question formulations when a shorter direct version would preserve the same meaning
- writing answer options that are longer and denser than needed
- making correct answers obviously longer, more specific, or grammatically different than distractors
- combining separate lesson fragments into a new question meaning that was not explicitly taught
- inferring or inventing an intermediate conclusion and then testing that invented conclusion as if it had been said
- using organizational material as test questions
- asking about what the teacher recommended or said when the same content can be tested as a direct subject fact
- spending multiple early questions on weak course logistics while stronger substantive material appears later
- omitting homework rules, submission conditions, penalties, or required comments
- removing a whole block just because one tool name is noisy in the transcript
- using the contents block as a dump for service sections, summaries, or editorial notes

## Reference File

Use [references/editorial-note-template.md](references/editorial-note-template.md) as the default lesson-note skeleton and checklist.
Use [references/lesson-test-template.txt](references/lesson-test-template.txt) as the default lesson-test skeleton and checklist.
Use [references/lesson-timecodes-template.md](references/lesson-timecodes-template.md) as the default timecodes skeleton and checklist.
Use [references/timecodes-mode.md](references/timecodes-mode.md) for detailed timecodes mode rules and anti-patterns.

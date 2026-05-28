# Lesson Note Mode

## Goal

Turn the transcript and user-approved lesson materials into a faithful study note in Markdown.
Preserve the lesson's real structure, terminology, order, and practical logic.
Write as a finished study handout, not as a recap of the lesson.

## Required Structure

Use this default structure unless the user asked for another one:

1. `# Содержание`
2. Flat bullet list built from the final substantive level-1 lesson headings
3. Optional editorial or verification note before the contents block
4. Thematic blocks separated by `---`
5. Final links section
6. Optional resources section only when it adds value

Rules:

- Generate the contents only from real topical `#` headings.
- Exclude `# Использованные ресурсы`, `# Ссылки на сайты и сервисы`, and other service blocks from the contents.
- Put `---` before every thematic `#` heading after the contents block.
- Prefer short subject-based `#` headings that name the tool, task, or topic directly.
- Use `###` only when the section genuinely splits into multiple meaningful subtopics.
- Do not use meta-subheadings such as `Практический вывод`, `Почему это ценно`, or `Что здесь считается хорошим результатом`.
- Do not create a `###` heading for a single short block unless it marks a real switch to another tool, mode, example, rule, or limitation.

## Writing Rules

- Always produce the final note in Markdown and save it to a `.md` file by default.
- Write in simple, clear language.
- Remove direct speech, references to the teacher, and quote formatting.
- Remove meta-phrases that point back to the lesson, for example `на занятии разобрано`, `на уроке показано`, `преподаватель отмечает`, `урок показывает`.
- Rewrite such constructions into direct declarative statements.
- Do not insert filler lead-ins before lists or procedures, for example `Показанный рабочий прием такой:` or `Сценарий старта очень простой:`.
- Start lists, steps, and criteria immediately unless one short factual sentence is necessary.
- Prefer direct factual phrasing over retelling phrasing.
- Preserve the meaning and terminology of the lesson as closely as possible.
- Prefer short explanatory paragraphs over bullets, unless the source itself is list-shaped.
- Choose section titles that sound like useful study notes, not generic report labels.
- Keep headings focused on the actual subject matter, not on the fact that something was shown or explained.
- If two headings express the same meaning, prefer the shorter practical version.

## Coverage Rules

The note must preserve:

- key ideas and definitions
- important steps, actions, and sequences
- terms, tools, commands, and modes worth remembering
- used resources when they are important enough to list
- links and services mentioned in the lesson

Also preserve:

- all major lesson blocks, even when they are introductory, organizational, or overview blocks, if they carry meaningful context
- practically important technical, auxiliary, or operational sub-blocks
- separately demonstrated tools as separate blocks when they were taught separately
- warnings, limitations, and caveats inside the nearest relevant tool or workflow block unless they were clearly taught as a standalone topic
- examples when the method is explained through the example
- homework, submission rules, criteria, penalties, required comments, and conditions that affect the student's work

If a tool name is uncertain in the transcript, keep the block, generalize the description of what the tool does, and mark the exact name as requiring verification instead of deleting the block.

## Structure Fidelity Rules

- Preserve the real teaching order of the lesson.
- Prefer the teacher's progression through tools, stages, examples, and decisions over a cleaner taxonomic regrouping.
- Do not reduce the lesson to a thematic squeeze or broad summary.
- Do not merge adjacent practical topics into one top-level section if they involve different tools, interface modes, task types, or problem classes.
- Do not introduce a new top-level section if the source treated that point only as a warning, limitation, or sub-point inside another block.
- Prefer multiple smaller faithful blocks over one elegant but over-compressed synthesis.
- If the lesson is mostly practical, allow the note to become more cheat-sheet-like.
- If the lesson is more conceptual, keep more connective prose between ideas.

## Images And Supporting Material

- Add screenshots or images only when they materially help.
- Prefer placing interface screenshots next to the exact tool, tab, mode, or setting they explain.
- If useful images are not present locally but can be confidently found online, they may be included when they add real explanatory value.

## Final Validation

After drafting the note:

1. Re-read all rules, restrictions, and anti-patterns for note mode.
2. Run the final rule-by-rule note check through a separate validation subagent when subagents are available.
3. The validation subagent must return only a concrete fix list, not a rewritten note.
4. Apply those fixes in the main draft, then rerun the validation until no violations remain.
5. If the environment cannot run subagents, state that explicitly and perform the same full check inline.
6. Verify that every file used for the note was explicitly provided or explicitly approved by the user.
7. Verify that the final result was written to a `.md` file unless the user explicitly requested chat-only output.
8. Run a drying pass.
9. Return the note only after the full check passes with no known violations.

Drying pass rules:

- Prefer the shortest formulation that keeps the same meaning.
- Delete duplicated explanations that restate the previous sentence.
- Delete scaffolding phrases like `также подчеркивает` or `это важно потому что` when the point is already clear.
- Do not keep both a rule and a second sentence that only repeats the same rule in other words.
- Delete closing reassurance sentences when they only summarize usefulness without adding a new action, condition, exception, or limitation.
- Delete predictable consequence sentences after a clear rule when they add no practical distinction.
- Delete negative or absence statements when they do not add a practical limitation, action, exception, or working distinction.
- Compress long descriptive paragraphs into short operational theses when possible.
- Shorten headings when the shorter version preserves the same subject.
- Do not dry the text by removing real lesson details, examples, warnings, steps, or operational conditions.

## Anti-Patterns

Avoid these failure modes:

- broad editorial summary instead of a faithful lesson note
- cleaner regrouping that breaks the real order of the lesson
- merging separately taught tools into one generic section
- merging neighboring practical topics into one top-level section when they belong to different tools or tasks
- detached limitations section when warnings belong to a specific tool block
- deleting examples that carry the method
- adding recap language like `на занятии`, `урок показывает`, `преподаватель отмечает`
- filler phrases before lists and procedures
- forcing `###` wrappers around single short paragraphs that do not introduce a real subtopic
- pulling in nearby files that were not explicitly provided or approved
- returning the note only in chat when the user did not ask for chat-only output

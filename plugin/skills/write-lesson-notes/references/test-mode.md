# Lesson Test Mode

## Goal

Build a lesson test strictly from what was explicitly said or shown in the user-approved lesson materials.
Use compact, factual wording and keep the question order aligned with the lesson order.

## Default Scope

- If the user did not request another number, create exactly 10 questions.
- By default, those 10 questions must cover the whole lesson rather than clustering around one fragment.
- Use only substantive material.
- Do not use organizational material: platform navigation, chats, housekeeping, and other non-substantive logistics should not become questions.

## Allowed Question Types

Use only two question types:

- single-answer question with one correct option
- multi-answer question with 2 or more correct options

Rules:

- Use no more than 30% multi-answer questions.
- For a 10-question test, that means no more than 3 multi-answer questions.
- A multi-answer question is counted as correct only when all correct options are selected.
- Do not write ambiguous partial-credit multi-answer questions.

## Content Selection Rules

- Reconstruct the lesson sequence first, then keep the question sequence in that same order.
- Keep the question order aligned with the order of the selected substantive lesson topics.
- When selecting 10 questions, prioritize terms, models, tariffs, tools, workflows, limitations, settings, comparisons, and practical rules.
- Do not spend early question slots on weak course logistics if stronger substantive material appears later.
- If a weak question is replaced, replace it with the next stronger substantive topic from later in the lesson while preserving the order among the selected topics.
- Prefer questions that check practical distinctions, terminology, steps, limitations, and tool behavior actually taught in the lesson.
- Build each question strictly from what was explicitly said or shown in the lesson materials for this run.
- Do not merge distant fragments from different parts of the lesson into one synthesized question if that combined wording was not actually taught as one point.
- You may rephrase for clarity and compactness, but do not add your own meaning, inference, or editorial synthesis to the tested fact.

## Wording Rules

- Write questions impersonally and factually.
- Remove meta-phrases that point back to the lesson, for example `преподаватель рекомендует`, `на занятии`, `на уроке`, `в занятии`, `в уроке`, `урок показывает`, or `по материалу занятия`.
- Rewrite such formulations into direct subject-based questions.
- Write questions as direct knowledge checks about the subject, not as questions about what the teacher said or how the lesson was phrased.
- Keep question formulations compact and easy to read.
- Keep answer options compact and easy to read.
- Keep correct and incorrect options parallel in grammar, specificity, and approximate length so the answer cannot be guessed from wording size alone.
- If one option is visibly longer, denser, or more formal than the others in the same question, rewrite the set until no option stands out by shape alone.
- Do not use `все перечисленное`, `ни один из вариантов`, joke distractors, or structurally obvious trap answers.

## Required Format

- Write the final test into a `.txt` file by default.
- If Canvas is available in the current environment, prepare the test in Canvas as well, but do not skip the `.txt` file.
- Number every question.
- Use plain numbered lines in the form `1. <вопрос>`, `2. <вопрос>` and so on.
- Do not wrap question lines in headings such as `## 1.` or `### 1.`.
- Keep one empty line between the question line and the answer block.
- For every multi-answer question, place a grammatically correct line such as `Выберите 2 правильных варианта.` or `Выберите 5 правильных вариантов.` as the second line, immediately after the question and before the answer list.
- Prefix correct answers with `+ `.
- Prefix incorrect answers with `- `.
- Use only `+ ` and `- ` markers for answer options.
- Do not use bullets, circles, checkboxes, emoji, or radio-button symbols such as `*`, `•`, `◯`, `☐`, `☑️`, or `🔘`.
- Put every answer option on its own line.
- Use 4 or more answer options for every question whenever possible.
- Single-answer questions may use 3 options only when a fourth option would be obviously weak.
- Multi-answer questions must always have 4 or more options.

## Final Validation

After drafting the test:

1. Verify terminology, product names, hotkeys, and externally checkable details.
2. Run a dedicated answer-balance pass.
3. Run the final rule-by-rule test check through a separate validation subagent when subagents are available.
4. The validation subagent must return only a concrete fix list, not a rewritten test.
5. Apply those fixes in the main draft, then rerun the validation until no violations remain.
6. If the environment cannot run subagents, state that explicitly and perform the same full check inline.
7. Re-read all test-mode rules and the template checklist.
8. Fix every detected violation.
9. Verify that the final result was written to a `.txt` file unless the user explicitly requested chat-only output.

Validation checklist:

- exactly 10 questions by default
- coverage across the whole lesson
- order matches the lesson order
- no organizational questions
- no more than 3 multi-answer questions in a 10-question test
- every multi-answer question has a second line with grammatically correct Russian inflection
- all answer options use only `+ ` and `- `
- all options are on separate lines
- questions are compact
- answers are compact
- correct and incorrect options are balanced in length and shape
- no question tests a synthesized claim that was not explicitly taught
- wording stays direct and impersonal
- no question refers back to the lesson, the teacher, or the phrasing of the lesson

## Anti-Patterns

Avoid these failure modes:

- creating fewer or more than 10 questions when the user did not ask for another count
- putting questions in a different order than the lesson sequence
- using organizational material as test questions
- using more than 3 multi-answer questions in a 10-question test
- omitting the `Выберите N ...` line for a multi-answer question
- writing the question as a Markdown heading
- using checkbox, radio, bullet, or emoji markers instead of `+ ` and `- `
- writing needlessly long questions when a shorter direct version would preserve the same meaning
- writing answer options that are longer and denser than needed
- making correct answers obviously longer, more specific, or grammatically different than distractors
- combining separate lesson fragments into a new question meaning that was not explicitly taught
- inferring or inventing an intermediate conclusion and then testing that invented conclusion as if it had been said
- adding recap language like `на занятии`, `на уроке`, `преподаватель рекомендует`, `в занятии`, or `по материалу занятия`

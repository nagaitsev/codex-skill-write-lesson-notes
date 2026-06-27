# Timecodes Mode Rules

Use this file when the user explicitly asks `Сделай таймкоды`.

## Default Output

- The default output is a clean timestamp list.
- Each line contains only a timestamp in strict `чч:мм:сс` format and a topic title.
- The default output uses plain text lines, not Markdown headings.
- The required default line shape is exactly `<чч:мм:сс> <тема>`.
- Always use all three segments with leading zeros where needed, for example `00:00:00`, `00:06:33`, `01:10:41`.
- Default example:

```md
00:00:00 Введение и обратная связь
00:06:33 Программа микрокурса
00:10:41 Инструменты курса
```

- Do not add paragraphs, bullets, or commentary under each timestamp by default.
- Do not prefix default timecode lines with `#`, `-`, `*`, or other Markdown markers.
- Do not turn timecodes into a mini-note or a compact lesson summary unless the user explicitly asks for an annotated or expanded version.

## Allowed Expanded Variant

- Only if the user explicitly asks for an expanded, annotated, or outline-style version, you may add short notes under each timestamp.
- In that case, still keep the timestamp line first and keep the note block short.

## Topic Selection

- Build the list only from real subtitle timing cues.
- Use only timestamps that can be anchored reliably in the subtitle file.
- While processing subtitles for timecodes, correct obvious recognition errors in the original subtitle file if they are clearly identifiable from context.
- Limit such subtitle corrections to clear ASR mistakes in terms, names, commands, hotkeys, and other surface wording; do not rewrite meaning, compress phrasing, or retime subtitles under the guise of cleanup.
- Prefer meaningful topic changes over line-by-line slicing.
- Keep the order identical to the video order.
- Use the start of the topic, not a decorative midpoint.

## Anti-Patterns

- adding explanatory paragraphs under timestamps by default
- turning timecodes into a lesson note
- mixing note structure rules such as `# Содержание` into timecodes mode
- outputting Markdown headings like `# 0:00 Тема` when the user asked for ordinary YouTube timecodes
- outputting a bullet list or any other Markdown wrapper instead of plain timestamp lines
- inventing timestamps from plain transcript text without subtitle cues
- splitting one stable topic into many tiny timestamp lines without a real topic switch
- rewriting subtitle meaning or freely editing subtitle text instead of fixing only obvious recognition mistakes
- outputting timestamps as `м:сс` or `мм:сс` instead of strict `чч:мм:сс`

## Final Timecodes Check

- The input file is real subtitles, not plain text.
- If obvious subtitle recognition errors were found, they were corrected in the original subtitle file before finalizing.
- Only clear subtitle recognition mistakes were corrected; the subtitle meaning, structure, and timings were not editorially rewritten.
- The output is a clean timestamp list by default.
- The output uses plain lines like `00:00:00 Введение`, not Markdown headings.
- Each line starts with a timestamp in strict `чч:мм:сс` format.
- No line uses shortened timestamp forms such as `0:00` or `6:33`.
- Each line keeps only timestamp plus topic title unless expansion was explicitly requested.
- The topic order matches the subtitle order.
- No timestamp was guessed without support in the subtitles.

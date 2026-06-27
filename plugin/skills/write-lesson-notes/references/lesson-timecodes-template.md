# Lesson Timecodes Template

Use this template when the user explicitly asks `Сделай таймкоды`.
Accept only a real subtitle file with timing cues.
Always produce the final timecodes as a `.md` file.
If the provided file is plain text without subtitle timings, refuse and ask for subtitles instead.
By default, output only a clean timestamp list without explanatory text under each line.
By default, use plain timestamp lines only, not Markdown headings.

```md
0:00 <тема>
3:42 <тема>
12:18 <тема>
```

## Timecodes Checklist

- Входной файл действительно содержит субтитровые тайминги, а не просто текст.
- Если таймингов нет, выдан отказ и запрошен файл субтитров.
- Если по ходу обработки найдены явные ошибки распознавания, они исправлены в исходном файле субтитров.
- Исправления в субтитрах ограничены только очевидными ошибками распознавания терминов, имен, команд, горячих клавиш и других поверхностных формулировок.
- Смысл, структура фраз и тайминги субтитров не переписаны редакторски под видом исправления.
- Каждая строка начинается с таймкода в формате YouTube.
- Строки таймкодов не начинаются с `#`, `-`, `*` или других Markdown-маркеров.
- Таймкод указывает на старт темы, а не на случайную реплику внутри нее.
- Порядок блоков совпадает с порядком видео.
- Блоки достаточно крупные по смыслу и не превращены в построчную расшифровку.
- По умолчанию под таймкодами нет дополнительных абзацев или списков.
- Термины, названия инструментов и горячие клавиши перепроверены.

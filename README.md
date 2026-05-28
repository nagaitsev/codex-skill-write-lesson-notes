# Codex Skill: Write Lesson Notes

Скилл Codex для создания компактных конспектов занятий в формате Markdown, тестов занятий в формате TXT и таймкодов по субтитрам в формате Markdown.
Основной `SKILL.md` теперь работает как роутер, а подробные правила режимов вынесены в отдельные reference-файлы.

## Что Делает

- создает конспекты занятий в Markdown
- создает тесты занятий в TXT
- создает таймкоды по файлу субтитров в Markdown
- собирает `# Содержание` по итоговым заголовкам первого уровня
- пишет прямой предметный текст без пересказа занятия
- поддерживает практичные заголовки разделов и компактную структуру подразделов
- проверяет термины, названия продуктов, горячие клавиши и ссылки перед финализацией
- отказывается делать таймкоды по обычной транскрибации без субтитровых таймингов

## Файлы

- `SKILL.md` - основная инструкция скилла
- `agents/openai.yaml` - UI-метаданные
- `references/contents-mode.md` - правила команды `Сделай содержание`
- `references/editorial-note-template.md` - шаблон и чеклист конспекта
- `references/lesson-test-template.txt` - шаблон и чеклист теста
- `references/lesson-timecodes-template.md` - шаблон и чеклист таймкодов
- `references/note-mode.md` - подробные правила режима конспекта
- `references/test-mode.md` - подробные правила режима теста
- `references/timecodes-mode.md` - отдельные правила режима таймкодов

## Основные Триггеры

Используйте для запросов вроде `Напиши конспект занятия`, `Сгенери содержание`, `Сделай тест` или `Сделай таймкоды`.
## Plugin

The skill also has a home-local Codex plugin version on the user's machine:

- Plugin root: `C:\Users\BEST_USER\plugins\write-lesson-notes`
- Marketplace: `C:\Users\BEST_USER\.agents\plugins\marketplace.json`

The canonical plugin bundle now also lives in this repository under `plugin/`.

The plugin bundles the `write-lesson-notes` skill and runs a `SessionStart` hook that syncs the full plugin bundle from the GitHub repository into the local plugin, then mirrors the skill files into `C:\Users\BEST_USER\.codex\skills\write-lesson-notes`.

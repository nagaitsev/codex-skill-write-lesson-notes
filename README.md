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
- `plugin/scripts/build-plugin-bundle.ps1` - обновляет plugin bundle из корневых исходников
- `plugin/scripts/verify-plugin-bundle.ps1` - проверяет plugin-only схему и отсутствие дрейфа

## Основные Триггеры

Используйте для запросов вроде `Напиши конспект занятия`, `Сгенери содержание`, `Сделай тест` или `Сделай таймкоды`.
## Plugin

Repository root is the canonical authoring source for:

- `SKILL.md`
- `agents/openai.yaml`
- `references/*`

The plugin bundle lives under `plugin/` and should be refreshed from the root sources before release:

- Build bundle: `powershell -ExecutionPolicy Bypass -File .\plugin\scripts\build-plugin-bundle.ps1`
- Verify bundle: `powershell -ExecutionPolicy Bypass -File .\plugin\scripts\verify-plugin-bundle.ps1`

Runtime delivery is plugin-only:

- Plugin root: `C:\Users\BEST_USER\plugins\write-lesson-notes`
- Marketplace: `C:\Users\BEST_USER\.agents\plugins\marketplace.json`
- SessionStart refreshes only the installed plugin bundle from GitHub

Legacy standalone skill copies can still exist from older installs, for example:

- `C:\Users\BEST_USER\.agents\skills\write-lesson-notes`
- `C:\Users\BEST_USER\.codex\skills\write-lesson-notes`

Those legacy duplicates should be removed manually once after migrating to the plugin-only scheme.

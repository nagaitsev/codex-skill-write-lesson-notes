# Codex Skill: Write Lesson Notes

Скилл Codex для создания компактных конспектов занятий в формате Markdown на основе транскрибаций и дополнительных материалов.

## Что Делает

- создает конспекты занятий в Markdown
- собирает `# Содержание` по итоговым заголовкам первого уровня
- пишет прямой предметный текст без пересказа занятия
- поддерживает практичные заголовки разделов и компактную структуру подразделов
- проверяет термины, названия продуктов, горячие клавиши и ссылки перед финализацией

## Файлы

- `SKILL.md` - основная инструкция скилла
- `agents/openai.yaml` - UI-метаданные
- `references/editorial-note-template.md` - шаблон и чеклист

## Основные Триггеры

Используйте для запросов вроде `Напиши конспект занятия` или `Сгенери содержание`.
## Plugin

The skill also has a home-local Codex plugin version on the user's machine:

- Plugin root: `C:\Users\BEST_USER\plugins\write-lesson-notes`
- Marketplace: `C:\Users\BEST_USER\.agents\plugins\marketplace.json`

The plugin bundles the `write-lesson-notes` skill and runs a `SessionStart` hook that syncs the skill files from the GitHub repository into both the plugin copy and `C:\Users\BEST_USER\.codex\skills\write-lesson-notes`.

# Contents Mode

## Trigger

Use this mode only when the user explicitly asks `Сделай содержание` or `Сгенери содержание` and provides a Markdown document.

## Rules

1. Read the existing Markdown document.
2. Find headings exclusively from lines that begin with exactly one level-1 marker: `# `.
3. Ignore the `# Содержание` heading itself if it already exists.
4. Ignore service or support headings such as `# Использованные ресурсы`, `# Ссылки на сайты и сервисы`, and other clearly non-topical blocks.
5. Create or refresh the contents block at the top of the document.
6. Represent each included level-1 heading as plain text in a flat bullet list in the same order as it appears in the document.
7. Do not rewrite the body of the note unless the user asked for broader editing.

## Restrictions

- Do not include `##`, `###`, or deeper headings.
- Do not generate Markdown links or anchors in the contents list.
- Do not include file links, local paths, or URLs.
- Use only the visible heading text after `# `.

## Final Check

- verify that the contents section sits at the top of the file
- verify that only substantive `# ` headings were included
- verify that service blocks were excluded
- verify that the list contains no links or anchors

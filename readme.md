# Studio Starter

A ContentBox 7 theme with ready-made blocks for [ContentBox Studio](https://github.com/akitogo/contentbox-studio),
built with Tailwind CSS from [HyperUI](https://www.hyperui.dev)'s marketing components. One set of blocks, several
looks: a design preset switches colors, fonts and corners for the whole site.

Status: first test (three blocks, two presets). Working name.

## What is in it

| Part | |
|---|---|
| Blocks (`blocks/`) | **Hero** (heading, intro, two buttons, optional image), **Features** (grid with icon, title, text), **Call to action** (heading, text, button, optional image) |
| Tones | Every block has a background: light, light tinted, dark or brand color. Everything inside (text, lines, buttons) follows |
| Presets | **Bold** (grotesque headings, signal orange, square corners) and **Editorial** (serif headings, deep green, rounded corners); theme setting *Design preset* |
| Layout | Header with site name, main menu (ContentBox menu) and optional button; dark footer; blog, search and error views |
| Classic content | Pages without blocks get a title and a reading column with Tailwind Typography |

## How the styling works

- `src/theme.css` is the Tailwind entry. Templates use only semantic colors (`bg-surface`, `text-ink`, `text-muted`,
  `border-line`, `bg-brand`, `text-brand-ink`), `rounded-box`, and a few utilities of the theme (`heading`, `eyebrow`,
  `btn`, `btn-primary`, `btn-secondary`).
- A preset (`src/presets/<name>.css`) defines raw values only (`--ss-paper`, `--ss-ink`, `--ss-brand`, fonts, radius,
  heading weight). The tone classes map them to the semantic colors, so a section can be light, dark or brand
  colored without other classes.
- The layout links the preset's stylesheet before the theme's. Both are `<link>`s, so Studio's editor canvas loads them
  too and shows blocks exactly as the site does.
- Fonts are self-hosted (no requests to font services), with their licenses next to them.

## Build

Sites need no Node: the built CSS and fonts are part of the theme. After changing templates or styles:

```bash
npm ci
npm run build    # presets with fonts, then Tailwind (scans blocks/, layouts/, views/)
```

Then re-render the content in Studio (`POST /cbstudio/api/blocks/rerender`, or save the pages), because block HTML
is rendered when content is saved.

Class names must appear complete in the templates for Tailwind to find them: map values to full names
(`{ "2": "md:grid-cols-2", "3": "md:grid-cols-3" }`), do not build them (`md:grid-cols-#n#`).

## ContentBox quirks the theme works around

- No theme setting is marked `required`: ContentBox 7 checks required theme settings under their plain names while the
  admin posts them as `cb_theme_<theme>_<name>`, so the settings form could never be saved.
- ContentBox caches whole pages and does not clear them when theme settings are saved; `Theme.cfc` listens to
  `cbadmin_postThemeSettingsSave` and clears the page caches, so a new preset shows at once.

## License

Apache License 2.0. Third-party material (HyperUI, Heroicons, Tailwind CSS, fonts): see
[THIRD-PARTY.md](THIRD-PARTY.md).

/**
 * Builds the preset stylesheets (includes/css/presets/<name>.css): the preset's design tokens from
 * src/presets/<name>.css, preceded by @font-face rules for its fonts. The fonts are self-hosted (no requests to
 * font services): their woff2 files and licenses are copied from the @fontsource-variable packages into includes/fonts.
 */
import { copyFileSync, mkdirSync, readFileSync, writeFileSync } from 'node:fs'
import { dirname, join } from 'node:path'
import { fileURLToPath } from 'node:url'

const root = join(dirname(fileURLToPath(import.meta.url)), '..')

/** Fonts of each preset: @fontsource-variable package ids */
const PRESETS = {
  bold: ['inter', 'bricolage-grotesque'],
  editorial: ['inter', 'fraunces'],
}

/** Character sets to ship: Western and Central European languages */
const SUBSETS = ['latin', 'latin-ext']

const fontsDir = join(root, 'includes/fonts')
const presetsDir = join(root, 'includes/css/presets')
mkdirSync(fontsDir, { recursive: true })
mkdirSync(presetsDir, { recursive: true })

/** @font-face rules of a font for the shipped subsets, with its files copied to includes/fonts */
function fontFaces(id) {
  const pkg = join(root, 'node_modules/@fontsource-variable', id)
  const css = readFileSync(join(pkg, 'index.css'), 'utf8')
  copyFileSync(join(pkg, 'LICENSE'), join(fontsDir, `${id}-OFL.txt`))
  return SUBSETS.map((subset) => {
    const name = `${id}-${subset}-wght-normal`
    const rule = new RegExp(`/\\* ${name} \\*/\\s*(@font-face \\{[^}]*\\})`).exec(css)?.[1]
    if (!rule) throw new Error(`No ${subset} subset in @fontsource-variable/${id}`)
    copyFileSync(join(pkg, 'files', `${name}.woff2`), join(fontsDir, `${name}.woff2`))
    return rule.replace(`url(./files/${name}.woff2)`, `url(../../fonts/${name}.woff2)`)
  })
}

for (const [preset, fonts] of Object.entries(PRESETS)) {
  const tokens = readFileSync(join(root, 'src/presets', `${preset}.css`), 'utf8')
  const faces = fonts.flatMap(fontFaces)
  const header = `/* Studio Starter preset "${preset}" (built by scripts/build-presets.mjs from src/presets/${preset}.css) */`
  writeFileSync(join(presetsDir, `${preset}.css`), [header, ...faces, tokens].join('\n\n'))
  console.log(`includes/css/presets/${preset}.css (${fonts.join(', ')})`)
}

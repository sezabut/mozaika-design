# Icons — consistency over decoration

Mismatched or decorative icons are a fast tell of generated UI. Rules.

## One set, one weight
- Pick a single icon family and stay in it (Lucide, Phosphor, Heroicons, Radix, SF Symbols). Mixing sets is the #1 tell — different corner radii, stroke weights, and metaphors fight each other.
- Match stroke weight to your type weight. Thin type + heavy icons (or vice-versa) looks off. Lucide default 2px pairs with most UI; drop to 1.5px for refined/editorial.
- Size on a scale (16 / 20 / 24), aligned to the text baseline or optically centered. Don't free-size.

## Use an icon only when it earns its place
- Icons aid scanning (nav, list affordances, status). They do not decorate every heading.
- A row of feature cards each topped with a generic icon (rocket, lightning, gear, shield) is template slop. If the icon doesn't disambiguate, drop it — a strong label is better than a vague glyph.
- Never use an icon whose metaphor you can't justify in one sentence.

## Color & state
- Icons inherit text color by default (`currentColor`). Tint only to signal meaning (accent for active, red for destructive, muted for disabled).
- Interactive icons need a hit target ≥ 40px even if the glyph is 20px (padding), and a visible hover/focus state.
- Accent-fill an icon only for the one thing you want the eye to land on (e.g. the active nav item, the primary feature).

## Brand marks & logos
- Real product logos (in a logo wall, references) should be monochrome or original, evenly sized, optically balanced — not raw favicons at random sizes.

## The gate
Could every icon on the screen be swapped for another and no one would notice? Then they're decoration — cut them or make them specific.

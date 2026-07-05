# Color

Most slop is a rainbow with no point of view. Build a palette, commit to one accent.

## Structure
- **One** dominant neutral (a near-black or a warm off-white) as the canvas.
- **2–4** neutral steps for surfaces/borders (e.g. `#09090B → #121214 → #18181B` with hairline white/10 borders).
- **One** real accent that means "act / important." Use it sparingly — its power is its rarity.
- Optional: one secondary accent for a second semantic (success, data series). No more.

## Rules
- Don't paint the whole hero in the accent. Let neutrals carry; the accent points.
- Gradients: only as a quiet background wash, never the brand's identity. A purple→blue diagonal on
  white is the #1 color slop.
- Borders: prefer **low-opacity** hairlines (`rgba(255,255,255,0.1)`) over heavy gray lines.
- Dark UI: true blacks read cheap; nudge to `#09–0F`. Keep text at high but not pure-white contrast (`#E4E4E7`).

## Working from a decoded system
- A decoded palette names roles (background, text, primary, accent, button_bg…) **and their jobs**:
  which one is the single action color, which "roles" are actually the same hex (treat as one),
  which are neutral chrome, which fail contrast against the canvas. Follow the role guidance —
  don't promote a decorative secondary into a second action color.
- Real products are strict about this: most run exactly **one** interactive color and let
  neutrals do everything else. That scarcity is the personality.

## Contrast & accessibility
- Body text ≥ 4.5:1 against its surface; large text ≥ 3:1. Check the muted grays — they fail most often.
- Don't encode meaning in color alone (add a label/icon/shape for state).

## Picking the accent
- Pull it from the subject, not a default. A finance tool's green, an AI tool's electric violet, an
  editorial brand's single ink color. If you researched real screens, borrow their accent logic.

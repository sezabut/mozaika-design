# Example workflow — building a pricing page with Mozaika

A concrete run of the loop (Frame → Decode → Lock → Route → Craft → QA) for a real task:
*"Build a pricing page for my dev tool."*

## 1. Frame (one line, before any code)
- **Subject:** pricing page · **Audience:** developers evaluating a paid dev tool · **Job:** make the paid plan the obvious choice · **Concept:** "one honest number, no clutter" · **Signature:** a single emphasized plan card, asymmetric against two quiet ones.

## 2. Decode (don't design in a vacuum)
With the Mozaika MCP connected:
```
compare_sections("Pricing / Plans", limit=8)
→ ranked cross-product panel: how Linear, Vercel, Stripe, Mercury… each solve pricing,
  one per product, with measured layout spec + core tokens. Pick the closest personality.

get_section("Linear", "Pricing / Plans")
→ the full kit for that one section: decoded layout spec + reference image_url
  + the parent design tokens.

get_design_system("Linear", format="all")   # condensed sketch of what comes back:
→ colors: bg #08080A · surface #101013 · text #F7F7F8 · action #5E6AD2
  ("single interaction color — clickable/attention only, never large fills")
  type: Inter — hero 64px / weight 510 / tracking −1.41px, ladder 300/400/510/590,
  mono: Berkeley Mono · radius: card 6, button 6, pill · section rhythm ~128px
  + paste-ready DESIGN.md / Tailwind @theme / CSS vars / tokens JSON
```
Read the **structured spec first** (layout, roles, measured type). Open the image only to
confirm composition. The weights and tracking are measured from the live DOM — build to
them; don't round 510 to "medium".

Without the MCP: ask for screenshots of 2–3 pricing pages the user rates, hand-decode
them into the same kit shape (see SKILL.md's degraded path), and label recalled values
as recalled.

## 3. Lock references
Write the short list every later choice must trace to:
- Layout → Linear's asymmetric "one big plan + two small" grid.
- Palette + type → the decoded Linear system above (exact hexes, weight 510 — don't approximate).
- Pattern → Stripe's monthly/annual toggle; Vercel's tight feature rows.

## 4. Route
Clear, well-specified task → go straight to code. Ambiguous or high-stakes hero →
generate 2–3 reference-locked directions first, pick the boldest, then build.

## 5. Craft (apply the reference guides)
- **Type:** the decoded scale (64/510 display, tight tracking; body at the kit's real body weight), one display + one body family + the kit's mono for numerals. (`typography.md`)
- **Color:** the decoded roles; neutrals carry, the one action color only on the primary CTA. (`color.md`)
- **Spacing:** a real scale (4–128), the kit's section rhythm, generous around the featured plan. (`spacing-layout.md`)
- **Motion:** one staggered reveal on load, ~300ms, ease-out. (`motion.md`)
- **Copy:** verb+object CTAs ("Start free", "Claim your license"), specific numbers, no buzzwords. (`copywriting.md`)
- **Icons:** one set or none — a checkmark list beats three rocket-topped cards. (`icons.md`)

## 6. QA gate
- Name the one decision that makes this look hand-built. (Here: the asymmetric featured
  plan + the real Linear palette and 510-weight type, not a 3-equal-card grid.)
- Run the anti-slop checklist (`anti-ai-slop.md`): no centered gradient-on-white, no 3
  identical cards, no default-radius buttons, no Inter-by-habit, accent scarce not timid.
- Diff against the kit: hexes exact, weights exact, radius set exact.
- Every visible choice traces back to a locked reference or a craft rule. Untraceable
  choices → fix or cut.

The result reads like a specific product solved this screen — because one did, and you
built to its measured spec instead of averaging the internet.

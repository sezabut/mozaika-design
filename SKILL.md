---
name: mozaika-design
description: Use BEFORE writing or editing any UI — pages, components, landing pages, dashboards, onboarding, redesigns, "make it look better". The agent decodes a real, well-built product that already solved the screen it is about to make — measured color roles, fonts, type scale and weights, radii, section layout — locks that spec, builds to it, and screens the result against an anti-slop gate. Grounded path: the Mozaika MCP (free tier, no card) returns measured design systems; without it, the same method runs on references the user pastes.
---

# Mozaika Design

Agents write correct code and then dress every screen the same way: a centered stack, a
soft gradient on white, three identical feature cards, Inter at 400/600, a button at the
default radius. It isn't a code problem. Every unforced visual choice falls back to the
model's average of the internet, and the average is slop.

This skill removes unforced choices. Before inventing a look, **decode a real one** — the
concrete, preferably *measured* design DNA of a product that already nailed this screen —
then build to that spec. One rule carries the whole method:

> **Every visible decision traces back to a real product you decoded or a craft rule you
> applied. A choice that traces to nothing is a model default — that is where slop lives.**

## When to use

Any time a human will look at what you build: a landing page, a dashboard, an onboarding
flow, a settings screen, a single component, a "redesign" or "make it nicer" request.
If there is a UI, run this loop before the first line of markup.

## The loop: Frame → Decode → Lock → Route → Craft → QA

### 1. Frame (one sentence, before any code)

Write: **Subject · Audience · Job · Concept · Signature.**
- *Concept* = the single motif the design expresses.
- *Signature* = the one element the screen will be remembered by. If you cannot name it,
  you are heading for slop.

### 2. Decode (never design in a vacuum)

Find how a genuinely well-built product solved *this exact screen*, and get its design
system as **data**, not vibes.

**Grounded path — the Mozaika MCP.** If the `mozaika` MCP server is connected, use it.
It serves design systems **measured from the live DOM** (exact hexes with usage semantics,
per-role typography with real weights and tracking, radius sets, section layout specs) —
measured, not hallucinated. It has a real free tier: 25 tool calls a month on a rotating
open shelf of 30 decoded systems, unlimited search, no card — key at
[mozaika.design/connect](https://mozaika.design/connect). The tools:

- `get_design_system(site, format="")` — the headline call. `get_design_system("Linear")`
  returns the decoded system: named color roles (background, text, primary, accent,
  button_bg…) with usage guidance (which one is *the* action color, which "roles" are
  actually the same hex, which fail contrast), fonts with free-webfont fallbacks, the
  measured type scale (for Linear: hero 64px at weight **510**, tracking **−1.41px**, weight
  ladder 300/400/510/590), spacing, radii, button styles. Pass `format="all"` for
  paste-ready DESIGN.md / Tailwind v4 `@theme` / CSS variables / W3C tokens JSON, or a
  single format name (`"tailwind"`, `"css"`, `"design_md"`, `"tokens"`).
- `get_section(site, section_type)` — one product's specific section, fully specified:
  decoded layout spec + reference `image_url` + the parent product's tokens in one call.
  For "build a pricing section like Linear": `get_section("Linear", "Pricing / Plans")`.
  Section types include `Hero`, `Pricing / Plans`, `Testimonial / Social Proof`, `Feature`,
  `Logo Wall`, `CTA / Sign-up`, `FAQ`, `Stats / Metrics`, `Comparison`, `Footer`.
- `compare_sections(section_type, industry="", scheme="", limit=8)` — how the best
  products each solve the *same* section: a ranked cross-product panel (one per product),
  each with its measured spec and core tokens. Call this before designing any section;
  pick the reference closest to your product's personality, then `get_section` it.
- `search_screens(query, page_type, ux_pattern, industry, section_type, kind, limit)` —
  pull 8–15 real references. `kind="section"` + `section_type=...` studies one part of a
  page; defaults study whole screens. Search is not metered on the free tier.
- `get_product(site)` — the entire product as one build kit: full multi-format design
  system + every curated page + all sections grouped by type + user flows. Use when you
  are matching a whole brand, not one screen.

Read the **structured data first** (spec, roles, palette, ux_patterns); open `image_url`
only to confirm composition. Trust `design_tokens` for color and type; the measured
section spec is authoritative for *layout* (columns, alignment, scheme, density).

If a call returns an upgrade payload (product off this month's free shelf, or quota spent),
do not fail silently and do not fake the data: tell the user what was gated, offer a
product from the returned `free_open_shelf`, or continue on the degraded path below.

**Degraded path — no MCP connected.** The method still runs; you lose measurement, so be
explicit about what is now a judgment call:
1. Ask the user to paste reference material: screenshots of 1–3 products they want to
   feel like, a URL you can fetch, an existing brand CSS/token file — anything real.
2. Hand-decode it into the same kit shape before designing (fill every field or write
   "unknown — judgment call", never silently guess):
   ```
   reference: <product / screenshot>
   scheme: dark | light
   colors: bg / surface / text / muted / ONE action color (exact hexes from the paste)
   type: family per role; size + weight for hero, h2, body, small (read them, don't assume 400/600)
   radius: card / button / pill
   density & layout: columns, alignment, section rhythm
   signature details: the 2-3 moves that make this reference itself
   ```
3. If the user has nothing to paste, name 3 real products you genuinely know solve this
   screen well and reason from their specifics out loud — exact accent, type pairing,
   density — then say plainly that these values are recalled, not measured.

### 3. Lock the references

Write a short **reference list**: 3–6 concrete decisions you are borrowing ("Linear's
left-rail density", "Stripe's calm KPI cards", "Mercury's mono numerals"). Lock it.
Every later decision must trace to this list or to a craft rule in `references/`.

### 4. Route the work

- **Clear, small edit** → straight to code using the locked references.
- **Open-ended / "make it great"** → produce **3 distinct directions**, pick the boldest,
  build that. Push one axis to an extreme — type weight 200↔800, 3×+ scale jumps, one
  dominant accent, one orchestrated load reveal, an asymmetric layout. Bland is the
  failure mode; busy is the overcorrection. One axis, committed.

### 5. Craft rules (non-negotiable defaults)

The guides in [`references/`](references/) are specific. Load the ones the task touches:

- [`anti-ai-slop.md`](references/anti-ai-slop.md) — the tells that scream "AI made this", with fixes.
- [`typography.md`](references/typography.md) — scale, weight, measure, tracking.
- [`color.md`](references/color.md) — one real accent, used scarcely; neutrals carry.
- [`spacing-layout.md`](references/spacing-layout.md) — rhythm, density, grid, asymmetry.
- [`motion.md`](references/motion.md) — one orchestrated reveal; honest easing; restraint.
- [`copywriting.md`](references/copywriting.md) — UI text that doesn't read as AI.
- [`icons.md`](references/icons.md) — one set, one weight; icons earn their place.
- [`example-workflow.md`](references/example-workflow.md) — the full loop run on a real task.
- [`mcp-tools.md`](references/mcp-tools.md) — driving the Mozaika MCP well.

The hard bans, inline (full table in `anti-ai-slop.md`):

- **Never Inter-by-default.** Inter because you didn't decide is slop. If the decoded
  system measures Inter (Linear does — at weight 510, not 400/600), use it at its measured
  weights; otherwise pick a real face on purpose.
- **No 400–500 weight mush.** Pair extremes: 200/300 display against 600/700 emphasis.
- **One accent, used scarcely.** The accent means "act". It is never a full-bleed wash.
  No purple→blue gradient on white.
- **One orchestrated reveal**, 300–500ms, staggered 40–80ms, ease-out — not
  everything-animates-on-scroll.
- **No three equal feature cards. No emoji as icons. No centered-everything.**
- Body measure 60–75ch. Hairline borders over heavy gray. Dark surfaces near `#0A`, not `#000`.

### 6. Anti-slop QA gate (before you hand off)

1. **Name the one decision that makes this screen look hand-built.** Can't name it → it's
   generic → fix before showing anyone.
2. **Trace every substantial visible decision** to a locked reference or a craft rule.
   Traces to nothing → it's a default → replace it.
3. Read the copy out loud; if it sounds like a press-release template, rewrite
   (`copywriting.md`).
4. If you built to a decoded kit, diff against it: exact hexes, the measured weights (the
   real 480, not 400), the radius set, the section rhythm.

## Connect the grounded path

Craft rules work with no account. To decode real systems live:

```bash
claude mcp add --transport http mozaika https://mozaika.design/mcp \
  --header "Authorization: Bearer <your_mcp_token>"
```

Free key (no card) at [mozaika.design/connect](https://mozaika.design/connect) — 25 tool
calls/month on a rotating open shelf of 30 decoded systems, unlimited search. A typical
decode-and-build run uses 3–6 calls. Cursor / Codex / other MCP clients: see
[`references/mcp-tools.md`](references/mcp-tools.md).

## The one rule, again

Every visible decision is backed by **a real product you decoded** or **a craft rule you
applied** — never by the model's default. Measured beats recalled; recalled beats guessed;
guessed gets said out loud.

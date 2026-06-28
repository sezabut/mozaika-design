---
name: mozaika-design
description: Use BEFORE writing or editing any UI (pages, components, landing pages, dashboards, onboarding, redesigns, "make it look better"). The agent decodes a real, well-built product that already solved the screen you're about to make — its color roles, fonts, type scale, radii, button styles, and the section it lives in — then builds to match that spec and screens the result against an anti-slop gate. With the Mozaika MCP connected, the agent pulls those decoded design systems and sliced sections from a live curated library; without it, the same craft rules and discipline still apply.
---

# Mozaika Design

Agents write correct code and then dress every screen the same way: a centered stack, a
soft gradient on white, three identical feature cards, a button at the default radius. It
isn't a code problem — the agent has no idea what the thing it's imitating actually looks
like. A screenshot doesn't close that gap. You can look at a screenshot; you can't build
from one.

This skill closes it. Before the agent invents a look, it **decodes a real one** — the
concrete design DNA of a product that already nailed this screen: color roles, fonts, type
scale, spacing, radii, button styles, and the kind of section the screen belongs to (hero,
pricing card, testimonial, FAQ, footer). Then it builds to that spec instead of to its own
averaged defaults. One rule carries the method: **every visible choice traces back to a
real product you decoded or a craft rule you applied.** Untraceable choices are where slop
lives.

## When to use

Any time a human is going to look at what you build: a landing page, a dashboard, an
onboarding flow, a settings screen, a single component, a "redesign" or "make it nicer"
request. If there's a UI, start here — before the first line of markup.

## The loop (do these in order)

### 1. Frame it (one sentence, before any code)
Write: **Subject · Audience · Job · Concept · Signature.**
- *Concept* = the single motif the design expresses.
- *Signature* = the one element the screen is remembered by. If you can't name it, you're heading for slop.

### 2. Decode a real product (don't design in a vacuum)
Find how a genuinely well-built product solved *this exact screen*, then read its design DNA
instead of guessing at one.
- **If the Mozaika MCP is connected** (tools below), use it:
  - `get_design_system(site)` — e.g. `get_design_system("Linear")`. Returns the product's decoded
    system: color roles (background, text, accent…), fonts + roles, type scale, spacing, radii,
    and button styles. **This is the spec you build to** — match its real palette and type, don't
    approximate them. This is what "design like Linear" actually means.
  - `search_screens(query, page_type, ux_pattern, industry, section_type, kind, limit)` — pull
    8–15 real references. Set `kind="section"` + `section_type="Pricing / Plans"` (or "Hero",
    "Testimonial / Social Proof", "FAQ"…) to study one *part* of a page; leave defaults to study
    whole screens.
  - `get_screen_sections(slug)` — the distinct, labeled sections of a page (hero → pricing → FAQ →
    footer), each linking back to the product's design system. Use it to emulate a specific block.
  - `list_user_flows` + `get_user_flow(slug)` — when you're building a journey (signup, checkout,
    onboarding), study the whole ordered sequence, not one isolated screen.
  - Read the **structured metadata first** (description, ux_patterns, ui_elements, colors,
    palette) — that's the blueprint. Open `image_url` only to confirm the visual.
- **If no MCP**, name 3 real products you genuinely know solve this well and reason from their
  specifics out loud — exact accent, type pairing, density — not vibes.

### 3. Extract + lock references
From the research, write a short **reference list**: 3–6 concrete decisions you're borrowing
("Linear's left rail density", "Stripe's calm KPI cards", "Mercury's mono numerics"). Lock them.
Every later decision must trace back to one of these or to a craft rule in `references/`.

### 4. Route the work
- **Clear, small edit** → go straight to code using the locked references.
- **Open-ended / "make it great"** → produce **3 distinct directions**, pick the boldest, build that.
  Push one axis to an extreme (type weight 200↔800, 3×+ scale jumps, one dominant accent, one
  orchestrated load reveal, an asymmetric layout). Bland is the failure mode.

### 5. Apply craft rules
Use the guides in `references/` — they're specific and non-negotiable defaults:
- [`anti-ai-slop.md`](references/anti-ai-slop.md) — the patterns that scream "AI made this", and what to do instead.
- [`typography.md`](references/typography.md) — scale, weight, measure, tracking.
- [`color.md`](references/color.md) — building a palette with one real accent, not a rainbow.
- [`spacing-layout.md`](references/spacing-layout.md) — rhythm, density, grid, alignment.
- [`motion.md`](references/motion.md) — restraint, one orchestrated reveal, honest easing.
- [`mcp-tools.md`](references/mcp-tools.md) — how to drive the Mozaika MCP well.

### 6. Anti-slop QA gate (before you hand off)
Name the one decision that makes this look hand-built. If you can't, it's slop — fix it.
Then go the other way: each substantial visual decision must trace to a reference or a craft
rule. If it traces to nothing, it's a guess — replace it.

## Connect the live library (Mozaika MCP)

Craft rules load with no account. To decode **real** design systems, screens, and sections live,
connect the MCP:

```bash
claude mcp add --transport http mozaika https://mozaika.design/mcp \
  --header "Authorization: Bearer <your_mcp_token>"
```

Get your token on the **/connect** page after subscribing. Cursor / Codex / other tools: see
[`references/mcp-tools.md`](references/mcp-tools.md).

## The one rule

Every visible decision is backed by **a real product you decoded** or **a craft rule** —
never by the model's default. Defaults are where slop comes from.

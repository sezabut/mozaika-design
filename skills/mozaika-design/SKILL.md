---
name: mozaika-design
description: Use BEFORE writing or editing any UI — pages, components, landing pages, dashboards, onboarding, redesigns, "make it look better". The agent decodes a real, well-built product that already solved the screen it is about to make — measured color roles, fonts, type scale and weights, radii, section layout — locks that spec, builds to it, and screens the result against an anti-slop gate. Grounded path: the Mozaika MCP (free tier, no card) returns measured design systems; without it, the same method runs on references the user pastes.
---

# Mozaika Design

> This is the Open Plugins–standard mirror of the canonical [`SKILL.md`](../../SKILL.md)
> at the repository root. The full craft-rule guides live in
> [`references/`](../../references/).

Agents write correct code and then dress every screen the same way: a centered stack, a
soft gradient on white, three identical feature cards, Inter at 400/600, a button at the
default radius. It isn't a code problem. Every unforced visual choice falls back to the
model's average of the internet, and the average is slop.

This skill removes unforced choices. Before inventing a look, **decode a real one** — the
concrete, preferably *measured* design DNA of a product that already nailed this screen —
then build to that spec. One rule carries the whole method:

> **Every visible decision traces back to a real product you decoded or a craft rule you
> applied. A choice that traces to nothing is a model default — that is where slop lives.**

## The loop: Frame → Decode → Lock → Route → Craft → QA

1. **Frame** — one sentence before any code: Subject · Audience · Job · Concept ·
   **Signature** (the one element the screen will be remembered by).
2. **Decode** — never design in a vacuum. With the `mozaika` MCP connected
   (`https://mozaika.design/mcp`, free key at
   [mozaika.design/connect](https://mozaika.design/connect)), pull measured design
   systems: `get_design_system(site)`, `get_section(site, section_type)`,
   `compare_sections(section_type)`, `search_screens(query)`, `get_product(site)`.
   Measured, not hallucinated. Without the MCP, hand-decode references the user pastes
   and say plainly which values are judgment calls.
3. **Lock** — write 3–6 concrete borrowed decisions; every later choice traces to them.
4. **Route** — small edit → build; open-ended → 3 distinct directions, pick the boldest.
5. **Craft** — the hard bans: never Inter-by-default; no 400–500 weight mush (pair
   200/300 against 600/700); one accent used scarcely; one orchestrated reveal; no three
   equal feature cards; no emoji icons; body measure 60–75ch. Full guides:
   [`references/`](../../references/).
6. **QA gate** — name the one decision that makes the screen look hand-built; trace every
   visible decision; read the copy out loud; diff against the decoded kit.

## Connect the grounded path

```bash
claude mcp add --transport http mozaika https://mozaika.design/mcp \
  --header "Authorization: Bearer <your_mcp_token>"
```

Free key (no card): [mozaika.design/connect](https://mozaika.design/connect) — 25 tool
calls/month on a rotating open shelf of 30 decoded systems, unlimited search. See
[`references/mcp-tools.md`](../../references/mcp-tools.md) for Cursor / Codex / other
MCP clients.

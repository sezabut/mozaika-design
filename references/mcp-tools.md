# Driving the Mozaika MCP

The MCP is the grounded path of this skill: a live library of real products decoded into
**measured** design systems — exact hexes with usage semantics, per-role typography with
real weights and tracking (probed from the live DOM), radius sets, section-level layout
specs, flows. Use it like a designer doing competitive research: structure first, images
second.

**Free tier (no card):** every account gets a real key at
[mozaika.design/connect](https://mozaika.design/connect) — 25 tool calls a month on a
rotating open shelf of 30 decoded systems, unlimited search. A typical decode-and-build
run is 3–6 calls. Paid plans unlock the whole library, flat pricing, no credits.

## Setup

**Claude Code**
```bash
claude mcp add --transport http mozaika https://mozaika.design/mcp \
  --header "Authorization: Bearer <your_mcp_token>"
```

**Cursor** (`.cursor/mcp.json`)
```json
{
  "mcpServers": {
    "mozaika": {
      "url": "https://mozaika.design/mcp",
      "headers": { "Authorization": "Bearer <your_mcp_token>" }
    }
  }
}
```

**Anything else** — `URL: https://mozaika.design/mcp`, `Auth: Bearer <your_mcp_token>`.

## Tools

- **`get_design_system(site, format="")`** — the headline tool. e.g.
  `get_design_system("Linear")`, `get_design_system("Stripe")`. Returns the product's
  decoded system: `color_scheme`; `colors` with named roles (background, text, primary,
  secondary, accent, link, button_bg/text) **plus usage guidance** — which role is the
  single action color, which roles are visually the same color (with the delta), which
  are neutral chrome, which fail contrast; `fonts` + `font_roles` with free-webfont
  fallbacks for proprietary faces; the **measured** `type_scale` (size + weight + tracking
  per role, weight ladder, section rhythm where probed); `spacing`; `radius`;
  `primary_button` / `secondary_button`.
  `format`: empty for raw tokens; `"all"` adds paste-ready DESIGN.md + Tailwind v4
  `@theme` + CSS variables + W3C tokens JSON; or one of `"design_md"`, `"tailwind"`,
  `"css"`, `"tokens"` for just that text. **Build to this spec** — real hexes, real
  weights (the 510, not "medium"), real radii.

- **`get_section(site, section_type)`** — one product's specific section fully specified
  in a single call: the decoded layout spec + reference `image_url` + the parent
  product's design tokens. For "build a <section> like <product>". Returns the product's
  available section types if the requested one doesn't exist yet.

- **`compare_sections(section_type, industry="", scheme="", limit=8)`** — a ranked
  cross-product panel (one section per product) of how the best products solve the same
  section, each with its measured spec and core tokens. Call it **before designing any
  section**. `section_type`: `Hero`, `Pricing / Plans`, `Testimonial / Social Proof`,
  `Logo Wall`, `Feature`, `CTA / Sign-up`, `FAQ`, `Stats / Metrics`, `Comparison`,
  `Footer`. `scheme`: `dark` or `light`. On the free tier the panel draws from the
  current open shelf — still a real cross-product panel.

- **`search_screens(query, page_type, ux_pattern, industry, platform, limit, kind, section_type)`**
  — real references with `description`, `page_types`, `ux_patterns`, `ui_elements`,
  `palette`, `image_url`. Defaults return whole screens; `kind="section"` +
  `section_type=...` returns single blocks. Not metered on the free tier.

- **`get_product(site)`** — the entire product as an agent-ready build kit: the full
  multi-format design system + every curated page + all sections grouped by type + user
  flows + `how_to_build`. Use when matching a whole brand.

- **`get_screen_sections(slug)`** — the distinct, ordered sections of one page
  (hero → features → pricing → FAQ → footer), each linking back to the product's design
  system.

- **`list_user_flows(industry, query)`** / **`get_user_flow(slug)`** — ordered real
  journeys (signup→dashboard, browse→checkout), each step with full metadata + image.
  Use when building a *sequence* so the steps feel like one product.

- **`get_screen(slug)`** — full metadata + image for one screen.

## How to use it well

1. **Match a real system first.** "Make it feel like <product>" means
   `get_design_system(<product>)` — build to the returned palette / weights / radii,
   don't eyeball them.
2. **Compare before you commit.** One `compare_sections` per section you're designing;
   pick the closest personality, then `get_section` for its full kit.
3. **Read structure first.** Spec, roles, and measured type tell you the decisions
   cheaply; open `image_url` only to confirm composition.
4. **Trust the right field.** `design_tokens` are authoritative for color/type; the
   section's measured spec is authoritative for layout (columns, alignment, scheme,
   whitespace) — its raw pixel color samples can include imagery, so don't palette from them.
5. **Build flows from flows.** Don't reinvent a checkout — `get_user_flow` three real ones.
6. **Cite what you borrowed.** In your locked reference list, name the system/section
   each decision came from.

## Free-tier behavior (handle it, don't hide it)

Gated calls never fail silently: if a product is off this month's open shelf or the
monthly quota is spent, the tool returns a structured payload with the reason, the
current `free_open_shelf` (full decodes included), calls remaining, and upgrade options.
When you receive one: tell the user plainly, offer a shelf product as the reference, or
switch to the skill's degraded path (hand-decode pasted references). Never invent values
for a product you couldn't fetch.

## No token at all?

The tools 401 without a key. Get a free one (no card) at
[mozaika.design/connect](https://mozaika.design/connect). Until then, the craft rules
and the degraded Decode path in SKILL.md still apply — name real products and reason
from their specifics explicitly, and say that the values are recalled, not measured.

# Driving the Mozaika MCP

The MCP gives you a live library of real product screens and user flows with **agent-ready
metadata**. Use it like a designer doing competitive research — read structure first, images second.

## Tools

- **`get_design_system(site)`** — the headline tool. e.g. `get_design_system("Linear")`,
  `get_design_system("Stripe")`, `get_design_system("Figma")`. Returns the product's decoded
  design system: `color_scheme`, `colors` (named roles — background, text, primary, accent, link,
  button_bg/text), `fonts` + `font_roles` (heading/body/mono), `type_scale` (h1/h2/body),
  `spacing`, `radius`, and `primary_button` / `secondary_button` styles. **Build to this spec** —
  use the real hex values, fonts, and radii rather than approximating. This is what "design like
  <product>" means in practice.

- **`search_screens(query, page_type, ux_pattern, industry, section_type, kind, limit)`**
  Returns real references with `description`, `page_types`, `ux_patterns`, `ui_elements`, `colors`,
  `palette`, `tags`, and `image_url`.
  - Leave `kind` default → whole screens. Set **`kind="section"` + `section_type=...`** to pull one
    *part* of a page: `Hero`, `Pricing / Plans`, `Testimonial / Social Proof`, `FAQ`, `CTA / Sign-up`,
    `Feature`, `Logo Wall`, `Comparison`, `Footer`. Use for "show me great pricing cards / hero
    sections / testimonial blocks to emulate".
  - `page_type`: e.g. `Landing Page`, `Dashboard`, `Pricing`, `Checkout`, `Onboarding`.
  - `industry`: e.g. `AI`, `Fintech`, `Dev Tools`, `Analytics`, `E-commerce`, `Consumer`.

- **`get_screen_sections(slug)`** → the distinct, ordered sections of a page (hero → features →
  pricing → FAQ → footer), each linking back to its product's design system. Use to study or
  emulate a specific block of a screen you already found.

- **`list_user_flows(industry, query)`** → flow summaries.
- **`get_user_flow(slug)`** → an ordered journey, each step with full screen metadata + image.
  Use when building a *sequence* (signup, checkout, onboarding) so steps feel connected.

- **`get_screen(slug)`** → full metadata + image for one screen.

## How to use it well

1. **Match a real system first.** When the brief is "make it feel like <product>", call
   `get_design_system(<product>)` and build to the returned palette / fonts / radii — don't eyeball it.
2. **Search before you design.** One or two targeted `search_screens` calls per screen; use
   `kind="section"` + `section_type` when you only need one block (a hero, a pricing card).
3. **Read metadata first.** The `description` + `ux_patterns` + `palette` tell you the design
   decisions cheaply. Only open `image_url` when you need the exact visual.
4. **Build a flow with `get_user_flow`.** Don't reinvent a checkout — study three real ones first.
5. **Cite what you borrowed.** In your reference list, name the screen/system you took each decision from.

## Good prompts to yourself

- "`get_design_system('Linear')`; rebuild this settings page with its real accent, type weights, and button style."
- "Search `kind=section`, `section_type='Pricing / Plans'`; copy how the top result emphasizes the recommended tier."
- "Get the `signup→dashboard` flow for a fintech; mirror its step count and empty-state."
- "`get_screen_sections` on the hero I liked; emulate just its layout and spacing."

## No token / not connected?

The tools return 401 without a valid Mozaika token. Get one on the **/connect** page after
subscribing. Until then, the craft rules in this skill still apply — name 3 real products you
know and reason from them explicitly.

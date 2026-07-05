# Example prompts — skill + MCP together

Copy-paste starting points. Each assumes the skill is installed; the ones marked
**MCP** assume the Mozaika MCP is connected (free key, no card, at
[mozaika.design/connect](https://mozaika.design/connect)). Swap product names freely —
`compare_sections` will tell you what's on this month's free shelf if a product is gated.

---

## 1. Pricing page with a real product's personality — **MCP**

```
Build a pricing page for my dev tool with the design personality of Linear.
Decode it first: get_design_system("Linear") and get_section("Linear", "Pricing / Plans").
Lock the returned tokens — exact hexes, the measured weights and tracking, the radius
set — then build to that spec. Frame → Decode → Lock → Route → Craft → QA, and show me
the locked reference list before you write code.
```

## 2. Fix a hero that looks AI-generated — **MCP**

```
My hero section works but it looks AI-generated. Run compare_sections("Hero",
scheme="dark") and study how the panel's products actually solve a hero — layout,
type weight extremes, where the one accent sits. Pick the reference closest to a
developer-tool personality, get_section it, then rebuild my hero to that spec.
Finish with the anti-slop QA gate and tell me the one decision that makes it
look hand-built.
```

## 3. Whole landing page from one product's full kit — **MCP**

```
Build a landing page for [my product, one sentence] using get_product("Mercury") as the
build kit. Paste design_system.formats.tailwind as the @theme, then build each section
to its decoded spec: hero, logo wall, features, testimonial, CTA, footer. Use the
measured weights from the kit, not your defaults. Where the kit marks a color as the
action color, that is the only interactive color on the page.
```

## 4. Cross-product research before designing — **MCP**

```
Before we design anything: compare_sections("Testimonial / Social Proof", limit=8)
and summarize the patterns — columns, density, how many use logos vs faces, where
the accent shows up. Then recommend one reference for a B2B fintech audience and
build our testimonial section to its spec with get_section.
```

## 5. Ship a real product's tokens straight into my stack — **MCP**

```
get_design_system("Stripe", format="tailwind") and install it as the @theme in this
project. Then restyle the existing dashboard components to those tokens only — no new
colors, no new radii. Anything the tokens don't cover, trace to a craft rule in the
skill's references and say which one.
```

## 6. No MCP — decode from screenshots I paste

```
I'm attaching screenshots of two products whose feel I want. Use the mozaika-design
skill's degraded path: hand-decode them into the kit shape (scheme, exact hexes,
type sizes + weights per role, radius, density, the 2-3 signature details), mark
anything you can't read as "judgment call", show me the kit for approval, then
build the page to it. Do not silently guess values.
```

## 7. Build a flow, not a screen — **MCP**

```
We're building signup → first dashboard. Use list_user_flows(query="signup") and
get_user_flow on the closest match to study the ordered steps, then design our flow
with the same step count, empty states, and rhythm. Decode the design system of the
flow's product and keep the two screens visibly the same brand.
```

## 8. Redesign audit with the QA gate

```
Here's my current landing page [URL or screenshot]. Run the mozaika-design anti-slop
gate against it: list every tell you find (centered-everything, three equal cards,
400/600 weight mush, accent used as a wash, emoji icons, template copy), then propose
fixes where each fix traces to a decoded reference or a named craft rule. If the
Mozaika MCP is connected, ground the fixes in compare_sections for my weakest section.
```

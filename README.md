![Mozaika Design — decode a real product's design system, then build to it](assets/banner.png)

# Mozaika Design

[![License: MIT](https://img.shields.io/badge/license-MIT-111111.svg)](LICENSE)
&nbsp;Works with **Claude Code · Cursor · Codex · Gemini CLI** and any MCP-compatible agent.

Your agent ships an app that works — and a UI that is embarrassing. Centered stack, soft
gradient on white, three identical cards, Inter at 400/600, default radius. You can spot
it instantly, and so can your users.

This skill is the method layer we built to fix that in our own product, released as-is
under MIT. It makes the agent **decode a real product's design system first** — color
roles, fonts, measured type scale and weights, radii, section layout — **lock that spec,
build to it, and screen the result against an anti-slop gate**. The core discipline:
every visible decision traces to a real product or a craft rule, never to the model's
default. Defaults are where slop comes from.

It pairs with the [Mozaika MCP](https://mozaika.design/connect), which serves design
systems **measured from the live DOM** — measured, not hallucinated. The corpus behind
it today: **486 real products, 3,765 decoded sections, 550 measured design systems**.
The MCP has a real free tier (no card). The method itself needs no account at all.

## Install

```bash
npx skills add https://github.com/sezabut/mozaika-design
```

Or manually — copy this repo into your skills directory:

```bash
git clone https://github.com/sezabut/mozaika-design.git
# personal (all projects):
cp -r mozaika-design ~/.claude/skills/mozaika-design
# or per-project:
cp -r mozaika-design your-project/.claude/skills/mozaika-design
```

Craft rules and the method load immediately. No account, no key, no telemetry — it is a
folder of markdown.

## See it: two runs, same prompt

Run on **17 October 2026**. Same prompt, same model, same flags, **one take each**. Every
agent was alone in a directory with one file — or none — and could not browse or see the
target. *canvas* is the measured background colour and its distance from the real
section's; *accent* is the share of pixels in the product's own accent colour, measured the
same way on the real section so its figure sits in the table too. Typography, layout
likeness and motion are **not** measured — that is what the screenshots are for.

### PostHog — a product the model already knows

| in the room | canvas | accent |
|---|---|---|
| nothing | `#EEEFE9` — off by 76 | 0.00% |
| a free community `DESIGN.md` | `#EEEFE9` — off by 76 | 0.09% |
| **this skill's `kit.json`** | **`#E1D7C2` — exact** | 0.49% |
| *the real section* | *`#E1D7C2`* | *0.35%* |

With nothing to read, the agent still knew PostHog: off-white canvas, orange button, even a
hand-drawn arrow. It never produced the colour PostHog actually uses on this section. The
free file is good — 690 lines, the real amber — but it states the canvas is `#eeefe9`,
which is exactly what the agent believed without it.

![No reference — just the prompt](assets/receipts/posthog-01-nothing.jpg)
![A free community DESIGN.md](assets/receipts/posthog-02-free-designmd.jpg)
![The decoded section spec](assets/receipts/posthog-03-mozaika.jpg)
![PostHog's real pricing section](assets/receipts/posthog-04-real.jpg)

The decoded run also brought the things only a *section* spec knows: the retro product box,
the Free / Pay-as-you-go selector, the row of per-unit free-tier limits.

### PlanetScale — one it does not

No free `DESIGN.md` exists for this product, so there are two arms instead of three.

| in the room | canvas | scheme | accent |
|---|---|---|---|
| nothing | `#000000` — off by 750 | **dark — the real one is light** | 0.00% |
| **this skill's `kit.json`** | **`#FAFAFA` — exact** | light — matches | 0.28% |
| *the real section* | *`#FAFAFA`* | *light* | *0.21%* |

It did not get a shade wrong. It built a dark three-card pricing page for a section that is
light and is not a card grid at all — it is a configurator. The decoded run built the
configurator: region picker, database engine, cluster type, storage sliders, running
monthly total pinned to the bottom.

![No reference — just the prompt](assets/receipts/planetscale-01-nothing.jpg)
![The decoded section spec](assets/receipts/planetscale-02-mozaika.jpg)
![PlanetScale's real pricing section](assets/receipts/planetscale-03-real.jpg)

That gap is the honest shape of this: your agent remembers famous products and approximates
them. It does not know *your* target, and it does not know what any particular section is
made of. Full write-up, including what the instrument cannot see:
[mozaika.design/proof](https://mozaika.design/proof).

### Five more, by a rule written before the run

Two brands I picked is an objection, not evidence. So the rule was fixed first: **every
product in the gallery with a pricing section and no free `DESIGN.md`** — the situation 514
of 550 products are in — and every result published, including the one we lose.

| product | the real canvas | with nothing | with this skill's kit |
|---|---|---|---|
| PostHog | `#E1D7C2` | `#EEEFE9` — off by 76 | **exact** |
| PlanetScale | `#FAFAFA` | `#000000` — off by 750 | **exact** |
| Clerk | `#F7F7F8` | `#FCFCFD` — off by 15 | **exact** |
| Coda | `#FFFFFF` | `#FFFCF6` — off by 12 | **exact** |
| Attio | `#FFFFFF` | exact | exact |
| Gamma | `#FFFFFF` | exact | exact |
| **Railway** | `#13111C` | `#09090B` — off by 35 | **`#201E28` — off by 38** |

Six of seven exact with the kit; two of seven without it, and both of those are plain white,
where the agent's default was already right. Narrowed to the four products whose canvas is
*not* plain white: three of four with the kit, none without.

**Railway is a loss and it stays in the table.** On canvas the kit landed three units further
away. The same run measured accent at 1.69% against the real 1.85% with the unaided run at
0.21%, and by eye the kit rebuilt the real structure — the $0 usage-credit card, Hobby $5 /
Pro $20 / Enterprise Custom, the purple deploy button — while the unaided run invented a
"Trial" tier. One axis lost, two won.

What this does **not** support: not "always better", not "the agent cannot design" (unaided
it nailed two canvases and built a credible PostHog page), and not "the measurement is
neutral" — the numbers are distances to our own measurement, and the neutral object is the
reference screenshot at the end of each run.

## The method

1. **Frame** — Subject · Audience · Job · Concept · **Signature**, in one sentence, before any code.
2. **Decode** — get a real product's design system as data (via the MCP, or hand-decoded from references you paste). Never design in a vacuum.
3. **Lock** — a short reference list every later decision must trace back to.
4. **Route** — small edit → straight to code; open-ended → 3 directions, build the boldest.
5. **Craft** — typography, color, spacing, motion, copy, icons: specific, non-negotiable defaults in [`references/`](references/).
6. **QA gate** — name the one decision that makes it look hand-built; trace everything else; fix or cut what traces to nothing.

Full method: [`SKILL.md`](SKILL.md). A complete worked run:
[`references/example-workflow.md`](references/example-workflow.md).

## Receipts

This method wasn't written as advice; it is how we test our own product. The claims below
are from our dogfood loop (July 2026), described in words. The side-by-side images promised
here are now in [`assets/receipts/`](assets/receipts/) — they come from the October run
above, not from this July loop, and nothing described here is something we didn't run.

- **Three agents, three brands, kits only.** Three independent agents were each given only
  a decoded kit (DESIGN.md + Tailwind theme + section specs) for Linear, Mercury, and
  Vercel — the kit was the only design input, and no run fetched the real site — and
  asked to build landing pages. A separate
  multimodal review judged all three on-brand and free of the standard AI tells: Linear's
  build used a single indigo as selection color only; Mercury's kept its periwinkle
  strictly on clickable elements; Vercel's came out as a Swiss-blueprint deploy dashboard,
  not a gradient hero. The same run also exposed a real gap (color *roles* without usage
  guidance made agents guess which color acts) — which we then fixed in the data, not the
  prose.
- **The audit quote.** After we added measured typography to the corpus, a fresh agent
  rebuilt Mercury from the enriched kit and reported, unprompted: **"weights given, not
  guessed — used the real 480/420, not 400/600."** That sentence is the whole thesis.
- **Replica loop.** An agent connected to the live MCP the way a customer would and
  rebuilt Linear's landing from the kit alone; we keep the side-by-side hero comparison
  from that run.
- **The measurements are real.** The corpus behind the MCP carries type measured from the
  live DOM via computed-style probes: Linear's hero is 64px at weight **510**, tracking
  **−1.41px**, on a 300/400/510/590 weight ladder with a 128px section rhythm. Vercel
  tracks its hero at **−3.84px**. Stripe's display weight is **300**. Across 550 measured design
  systems the weight ladders run 200→900 — which is exactly why an agent's "Inter
  400/600" habit reads as slop.

Honest caveats: the loop, the judging, and the fixes are ours; treat this as a documented
internal test, not a third-party benchmark. The method raises the floor reliably; it does
not guarantee a world-class screen every run. The QA gate exists because the last judge
is a human looking at the result.

## How it degrades without the MCP

Designed to fail soft. What changes when no MCP is connected:

| | With the Mozaika MCP | Without it |
|---|---|---|
| Craft rules + anti-slop gate | yes | yes — identical |
| The six-step method | yes | yes — identical |
| Design systems | measured from the live DOM: exact hexes with usage semantics, real weights/tracking, radius sets | hand-decoded from screenshots/CSS the user pastes, or recalled from products the agent genuinely knows — and labeled as such |
| Sections | decoded section specs + reference image + parent tokens in one call | the user's pasted references, hand-decoded into the same kit shape |
| Cross-product research | ranked panels of how the best products solve one section | the agent names 3 real products and reasons from their specifics out loud |
| Honesty floor | measured | the skill requires the agent to say "recalled, not measured" instead of silently guessing |

The skill's degraded mode includes a hand-decode kit template, so "paste two screenshots
of products you want to feel like" is a first-class path, not a fallback shrug.

## The grounded path (free tier)

Get a free MCP key at [mozaika.design/connect](https://mozaika.design/connect) — no card.
The free tier is real: **25 tool calls a month** on a rotating open shelf of **30 decoded
design systems**, unlimited search. A typical decode-and-build run uses 3–6 calls, so a
full build fits comfortably. Gated calls return a structured note (what's on the free
shelf, what's left this month) instead of failing silently.

**Claude Code**
```bash
claude mcp add --transport http mozaika https://mozaika.design/mcp \
  --header "Authorization: Bearer <your_mcp_token>"
```

**Cursor** — add to `.cursor/mcp.json`:
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

**Other tools** — `URL: https://mozaika.design/mcp`, `Auth: Bearer <your_mcp_token>`.

Tools: `get_design_system`, `get_section`, `compare_sections`, `search_screens`,
`get_product`, plus screens/flows helpers — see
[`references/mcp-tools.md`](references/mcp-tools.md). Copy-paste starting prompts:
[`examples/prompts.md`](examples/prompts.md).

## What's inside

- [`SKILL.md`](SKILL.md) — the decode-first method and the QA gate.
- [`references/anti-ai-slop.md`](references/anti-ai-slop.md) — the tells of AI-generated UI, and the fixes.
- [`references/typography.md`](references/typography.md) · [`color.md`](references/color.md) · [`spacing-layout.md`](references/spacing-layout.md) · [`motion.md`](references/motion.md) · [`copywriting.md`](references/copywriting.md) · [`icons.md`](references/icons.md) — craft defaults.
- [`references/example-workflow.md`](references/example-workflow.md) — the loop, run end-to-end on a pricing page.
- [`references/mcp-tools.md`](references/mcp-tools.md) — driving the Mozaika MCP well.
- [`examples/prompts.md`](examples/prompts.md) — copy-paste prompts pairing the skill with the MCP.

## FAQ

**Is this free?** Yes. The method — SKILL.md, every craft guide, the workflow — is MIT.
Use it, fork it, ship it in commercial work, no account.

**Then what's paid?** The data. Mozaika's corpus of design systems measured from live
production DOMs (the exact hexes with usage semantics, the real 510s and −1.41s, section
specs, flows) is the product. The free tier gives you 25 calls/month on a 30-system
shelf; the full library with unlimited calls is a flat subscription at
[mozaika.design](https://mozaika.design) — no credits, retries never billed.

**Why open-source the method?** Because the method is craft, and craft should spread.
Our moat isn't the advice, it's the measurements. If the method alone makes your agent's
UI better, good — that's the point. If you want it grounded in measured systems instead
of recalled ones, the MCP is one free key away.

**Does it work without Claude Code?** The skill format is Claude Code-native, but the
files are plain markdown — Cursor rules, Codex instructions, or a system prompt can load
the same method. The MCP works with any MCP client.

**Does the skill phone home?** No. It is markdown. Network calls only happen if you
connect the MCP, with your key, explicitly.

**Can I contribute?** Yes — sharper slop tells, better craft defaults, and honest
counter-examples are welcome as PRs. Keep the voice: specific, measured, no hype.

## License

MIT — see [LICENSE](LICENSE); attribution notices are in [NOTICE](NOTICE). The Mozaika data corpus is not part of this repository.

---

Built by [Sam C](https://x.com/sezabut) at [Mozaika](https://mozaika.design) — measured, not hallucinated.

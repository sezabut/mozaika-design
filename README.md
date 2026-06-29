![Mozaika Design — decode a real product's design system, then build to it](assets/banner.png)

# Mozaika Design

[![License: MIT](https://img.shields.io/badge/license-MIT-111111.svg)](LICENSE)
&nbsp;Works with **Claude Code · Cursor · Codex · Gemini CLI** and any MCP-compatible agent.

> Ask an agent for UI and it dresses every screen the same way — a centered stack, a soft
> gradient on white, three identical cards, a button at the default radius. It has no idea
> what the thing it's imitating actually looks like, and a screenshot can't tell it. Mozaika
> Design makes the agent **decode a real product's design system** — color roles, fonts, type
> scale, radii, button styles — and **build to that spec**, then screen the result against an
> anti-slop gate. The result reads *hand-built*, not generated.

## Install

```bash
npx skills add https://github.com/sezabut/mozaika-design
```

Craft knowledge loads immediately. **No account required.**

## What you get

| | Without an account | With the Mozaika MCP |
|---|---|---|
| **Craft rules** | ✓ typography · color · spacing · motion · anti-slop gate | ✓ same |
| **Research method** | ✓ frame → decode → lock → route → QA | ✓ same |
| **Decoded design systems** | reason from products you know | ✓ `get_design_system("Linear")` → real palette, fonts, type scale, radii, buttons |
| **Real screens + sections** | name 3 references from memory | ✓ live library; search whole screens or single sections (hero, pricing card, FAQ…) |
| **User flows** | — | ✓ ordered journeys (signup→dashboard, browse→checkout) |

Useful on day one with zero setup. Connect the MCP when you want your agent building to a real
product's **actual design system** instead of guessing one.

## How it works

1. **Frame** — Subject · Audience · Job · Concept · **Signature**, before any code.
2. **Decode** — pull a real product's design system / sections (via MCP or named references), never design in a vacuum.
3. **Lock references** — a short list every later decision must trace back to.
4. **Apply craft rules** — typography, color, spacing, motion (in [`references/`](references/)).
5. **Anti-slop gate** — *name the one decision that makes it look hand-built; if you can't, fix it.*

Full method: [`SKILL.md`](SKILL.md).

## Connect live design research (Mozaika MCP)

Subscribe at [mozaika.design](https://mozaika.design), grab your token from the **/connect**
page, then:

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

Tools: **`get_design_system`**, `search_screens` (whole screens or `kind="section"`),
`get_screen_sections`, `list_user_flows`, `get_user_flow`, `get_screen`. See
[`references/mcp-tools.md`](references/mcp-tools.md).

## What's inside

- [`SKILL.md`](SKILL.md) — the decode-first methodology and QA gate.
- [`references/anti-ai-slop.md`](references/anti-ai-slop.md) — the tells of AI-generated UI, and the fixes.
- [`references/typography.md`](references/typography.md) · [`color.md`](references/color.md) · [`spacing-layout.md`](references/spacing-layout.md) · [`motion.md`](references/motion.md) — craft defaults.
- [`references/mcp-tools.md`](references/mcp-tools.md) — how to drive the Mozaika MCP well.

## License

MIT © 2026 Novera LLC — see [LICENSE](LICENSE).

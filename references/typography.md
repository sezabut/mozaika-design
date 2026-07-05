# Typography

Type is 80% of how "designed" a screen feels. Defaults below; break them on purpose, not by accident.

## Scale
- Use a clear scale, not a mush of similar sizes. A workable ramp: 12 · 14 · 16 · 20 · 28 · 40 · 64 · 96.
- Make jumps **decisive**. Display headings should be ≥3× body. A 32px "hero" over 16px body is timid.
- One display size dominates per screen. Don't give three things the same shout.

## Weight
- Avoid the 400–500 monotone. Pair a **light/regular body** with **semibold/bold emphasis**, or go
  editorial with **thin (200/300) large display** against small bold labels.
- Real products live at weights models never guess. Measured from live DOMs: Linear's hero is
  weight **510**, Mercury's **480** over a **420** body, Stripe's display is **300**, Oura runs a
  200→700 ladder. If you have a decoded system, use its exact weights; if not, decide a weight
  story — never fall back to 400/600 out of habit.
- Never bold everything — bold loses meaning when it's everywhere.

## Family
- **Never Inter-by-default.** Inter chosen because it's the training-data average is the tell.
  If the decoded reference genuinely uses Inter (Linear does, at 510), match it — at those weights.
  Otherwise pick real faces: one expressive display + one clean grotesque for body + a mono for
  labels/code/numerics (e.g. Cabinet Grotesk / Manrope / JetBrains Mono).
- Proprietary reference fonts (Söhne, Circular, SF Pro) can't be bundled — substitute the closest
  free face (Fontshare/Google) and keep the brand-first CSS stack.
- Numerics in tables/dashboards: use **tabular** figures so columns align.

## Measure & rhythm
- Body measure: **60–75 characters**. Wider is unreadable and looks unconsidered.
- Line-height: ~1.5 for body, ~1.05–1.15 for large display (tight). Headlines breathe by being tight, not loose.
- Letter-spacing: slightly **negative** on large display (`-0.02em`; measured products go further —
  Linear −1.41px at 64px, Vercel −3.84px), slightly **positive/uppercase** on small mono labels
  (`0.08–0.15em`). Don't track body text.

## Tells to avoid
- Center-aligned multi-line body text. Left-align prose.
- All-caps long phrases. Reserve uppercase for short labels.
- Default system stack on a brand/hero surface — pick real faces.

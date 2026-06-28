# Motion

Motion is seasoning. A little, well-timed, makes a product feel alive; a lot makes it feel cheap.

## Defaults
- **One orchestrated entrance.** On load, reveal the hero with a short staggered fade/translate
  (elements 40–80ms apart, 300–500ms each). One memorable reveal beats everything-animates.
- Micro-interactions on the things users touch: button press, hover lift, input focus, toggle. Keep them
  fast (120–200ms) and subtle.
- Easing: use a natural ease-out (`cubic-bezier(0.2, 0, 0, 1)`) for entrances. Avoid linear and avoid bounce
  unless it's the brand's personality.

## Restraint
- Don't animate every section on scroll — pick a couple of moments that deserve emphasis.
- No long, blocking intros. Content should be usable immediately; motion enhances, never gates.
- Durations: micro 120–200ms, standard 250–400ms, large/hero 400–600ms. Longer feels sluggish.

## Performance & respect
- Animate `transform` and `opacity` only (GPU-friendly). Avoid animating layout (width/height/top/left).
- Honor `prefers-reduced-motion`: cut entrances to instant/opacity-only.

## The test
If removing an animation makes the product feel **worse**, keep it. If it changes nothing, cut it.

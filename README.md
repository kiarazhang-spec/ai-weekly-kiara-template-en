# AI Weekly · Kiara Template (English edition)

> A template for running your own weekly AI signal-sheet — analytical, English-native, primary-source first. Comes with one fully worked example issue so you can see how the rules produce a finished post.

**Built by [Kiara Zhang](https://github.com/kiarazhang-spec)** — a PM in Silicon Valley who runs [her own weekly AI signal-sheet](https://github.com/kiarazhang-spec/kiara-weekly-ai) and published this English edition as an open template so others can fork it and skip the plumbing. The example issue in this repo is a real synthesis of the week of July 6, 2026 — not lorem ipsum.

---

## What's in the box

```
ai-weekly-kiara-template-en/
├── index.html                  # Homepage — archive index, fetches manifest.json at runtime
├── about.html                  # About / editorial standards page
├── posts/
│   ├── 2026-07-06.html         # Worked example: one full issue
│   └── manifest.json           # Archive index (edit this when you add issues)
├── assets/style.css            # Global stylesheet — one --green var controls the accent
├── AGENTS.md                   # Editorial rulebook (voice, source hierarchy, structure)
├── .github/workflows/deploy.yml  # GitHub Pages auto-deploy on push
├── LICENSE                     # MIT for code
└── README.md
```

Stack: plain HTML + CSS, zero JS framework, zero backend. Auto-deployed as a static site by GitHub Actions. The point is longevity — this thing should still render fine in ten years.

---

## Why this template exists

Most newsletter templates give you a scaffold with lorem ipsum and no editorial guardrails, so the first issue ends up sounding like a generic tech blog. This one goes the other way: **one worked example issue plus a full editorial rulebook** ([AGENTS.md](./AGENTS.md)) covering source tiering, voice, structure, fair-use protocol, and a specific carve-out for China-native model labs.

Fork this if you want to write the kind of weekly that:

- Cites primary sources first (company blogs, SEC filings, arXiv) — trade press is context only
- Uses **Read** (per-story) and **Pattern** (weekly synthesis) callouts, not `Angle / Take / Hot Takes`
- Reads like an aggregator summary in the lead, not a punchy Substack opener
- Runs on GitHub Pages for $0 and doesn't lock you into a platform

If you want a lighter starting point without the editorial opinions, skip this and roll your own — this template is opinionated on purpose.

---

## Fork and customize (5 steps)

```bash
# 1. Click "Use this template" on GitHub, or clone directly
git clone https://github.com/kiarazhang-spec/ai-weekly-kiara-template-en.git my-ai-weekly
cd my-ai-weekly

# 2. Search-and-replace Kiara's name / handles / URLs
#    Files to touch: index.html, about.html, README.md, posts/2026-07-06.html footer
#    Search for: "Kiara", "kiarazhang-spec", "kiara-weekly"

# 3. Recolor: open assets/style.css, change --green in :root to your accent

# 4. Rewrite the masthead on index.html and the About page in your own voice

# 5. Enable Pages: Settings → Pages → Source: GitHub Actions
```

Publishing an issue:

```bash
# Create posts/YYYY-MM-DD.html (filename = Monday of the covered week)
# Copy the structure of posts/2026-07-06.html
# Add an entry to posts/manifest.json
git add posts/
git commit -m "post: AI weekly YYYY-MM-DD"
git push
# ~3 minutes later it's live at https://<username>.github.io/<repo>/
```

---

## Editorial rulebook

The full ruleset lives in [AGENTS.md](./AGENTS.md). Highlights:

- **Voice:** third-person, neutral aggregator tone in the lead; first-person allowed only inside `Read` and `Pattern` callouts
- **Source hierarchy:** Primary → Investigative → Independent analysis → Context only, with an explicit exception protocol for China-native model labs
- **Structure per issue:** lead paragraph → Top 5 → three Patterns → four category buckets → next-week watch
- **Word budget:** 100–150 words per Top 5 item, 120–200 words per Pattern
- **Fair-use protocol:** every claim links to source, quotes stay short, images from paywall outlets are avoided

`AGENTS.md` is written as instructions to a future you (or an AI assistant) so the newsletter stays consistent whether you draft it yourself or hand it to a model.

---

## Design system

- **Accent:** one green (`#2D8B3E` by default) — links, emphasis numerals, section underlines, `Read` block borders
- **Fonts:** system serif for body, system sans-serif for headings
- **Container:** 760px (academic reading width — do not widen)
- **Read blocks:** light grey background, green left border
- **Lead block:** soft-green background
- **Lists:** solid green bullets

Retheme globally by editing `--green` at the top of `assets/style.css`.

---

## Credit and license

If you fork and publish, please keep a link back to the original template in your footer or About page — something like:

> Based on [Kiara's AI Weekly template](https://github.com/kiarazhang-spec/ai-weekly-kiara-template-en).

- **Code** (HTML scaffolding, CSS, workflows, AGENTS.md structure): [MIT](./LICENSE) — use freely, keep the copyright notice
- **The July 6 example issue content** (`posts/2026-07-06.html` body copy): [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/) — you may adapt or excerpt with attribution; please don't republish it wholesale as your own issue

---

## Related

- **Chinese-language sister repo:** [kiara-weekly-ai](https://github.com/kiarazhang-spec/kiara-weekly-ai) — separate content, separate editorial voice, not a translation
- **Live example:** the July 6 issue rendered → [posts/2026-07-06.html](./posts/2026-07-06.html)
- **Rulebook:** [AGENTS.md](./AGENTS.md)

---

## Feedback

Found a bug, a broken link, or a spot where the rulebook contradicts itself? [Open an issue](https://github.com/kiarazhang-spec/ai-weekly-kiara-template-en/issues). Pull requests welcome, especially for the AGENTS rulebook.

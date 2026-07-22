# Kiara Weekly · The AI Signal Sheet

> A weekly synthesis of the AI industry — model launches, product moves, capital flows, and infra shifts — written from a product-and-market perspective for a Silicon Valley audience.

🌐 **Read it live → [kiarazhang-spec.github.io/kiara-weekly-ai-en](https://kiarazhang-spec.github.io/kiara-weekly-ai-en/)**

Published every Monday at 8am Pacific Time, covering the previous Monday–Sunday. Each issue includes a weekly Top 5, three synthesizing themes, four category buckets (🧠 Models · 🛠️ Products · 💰 Capital · ⚙️ Infra), and a forward look at the week ahead. Written natively in English from English primary sources — no translation, no double-hop attribution.

---

## Why this exists

Two extremes dominate AI newsletters: high-volume aggregators that list everything without judgment, and researcher-only briefings that ignore the market and product context. This one aims at the gap in between — **a human-curated weekly signal filter for people who make product, marketing, and capital decisions in AI.**

Every claim traces to a first-party source (OpenAI, Anthropic, DeepMind, SEC filings, arXiv) or a Western tier-one publication (Stratechery, The Information, FT, Bloomberg, Reuters). Every link is real and verified. No hallucinated URLs.

There is a Chinese-language sister site — [kiara-weekly-ai](https://github.com/kiarazhang-spec/kiara-weekly-ai) — but this edition is **not** a translation. Different sources, different audience, different editorial voice.

---

## How it's built

A zero-cost static site on GitHub Pages, auto-archived by GitHub Actions:

```
kiara-weekly-ai-en/
├── index.html                  # Homepage (fetches manifest.json at runtime)
├── posts/
│   ├── 2026-07-20.html         # One issue per file (filename = Monday of covered week)
│   └── manifest.json           # Issue index (auto-maintained by Actions)
├── assets/style.css            # Global stylesheet
└── .github/workflows/deploy.yml  # Scans posts/, rebuilds manifest, deploys Pages
```

Stack: plain HTML/CSS, zero JavaScript framework, zero backend. JAMstack at its most minimal — the point is longevity, not novelty.

---

## Want to start your own?

> 👉 **Cleaner template:** [`ai-weekly-template`](https://github.com/kiarazhang-spec/ai-weekly-template) — same architecture, placeholder content, no AI-tool lock-in, deployable in five steps. This repo is a **finished product**; that repo is the **scaffold**.

Or fork this one:

```bash
# 1. Fork or "Use this template" on GitHub
# 2. Edit index.html masthead and description
# 3. Change --green in assets/style.css :root for a new accent color
# 4. Enable Pages: Settings → Pages → Source: GitHub Actions
# 5. Write your first issue as posts/YYYY-MM-DD.html
```

Minimum workflow to publish an issue:

```bash
git add posts/2026-07-27.html
git commit -m "post: AI weekly 2026-07-27"
git push
# ~3 minutes later: https://<your-username>.github.io/<repo>/posts/2026-07-27.html
```

Each issue follows an eight-section template — see [AGENTS.md](./AGENTS.md) for the full editorial rulebook.

---

## Design system

- **Accent:** `#2D8B3E` — a single green used for links, emphasis numerals, section underlines, and callout borders
- **Fonts:** system serif for body, system sans-serif for headings
- **Container width:** 760px (academic reading width — do not widen)
- **Angle blocks:** light grey background, green left border
- **Lead block:** soft-green background `#E8F3EA`
- **Lists:** solid green bullets

To rethemed globally, change `--green` at the top of `assets/style.css`.

---

## Feedback

Factual errors, broken links, or a source you think deserves inclusion? Open an [Issue](https://github.com/kiarazhang-spec/kiara-weekly-ai-en/issues).

---

## Disclaimer

**Always read the primary source.** This brief is one person's synthesis of public information, designed to help you identify signals worth reading in full. Every claim carries a link — click through before treating anything here as fact.

- Not investment, business, or legal advice. Coverage of public companies, funding rounds, share prices, product pricing, or regulatory developments is for information only.
- Opinion sections ("Angle" and "Take") are personal editorial judgments at the time of writing. They do not represent any employer or institution and may become outdated.
- AI moves fast. Content is based on publicly available reporting at publication time. If something is later corrected or contradicted, open an Issue.
- Cite responsibly. If you quote from this brief, include the original source link and mark clearly what is reported fact vs. author opinion.
- Trademarks and copyrights belong to their respective owners. Mentions here are non-commercial reference and commentary.
- Believe there is inappropriate use? Open an Issue or contact the maintainer; will be addressed within a reasonable time.

---

## License

- **Content** (`posts/*.html` and the display copy in `index.html`): [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/) — republication and adaptation permitted with attribution and link.
- **Code** (HTML scaffolding, CSS, GitHub Actions): [MIT](./LICENSE) — use freely, keep the copyright notice.

Newsletter content copyright © Kiara Zhang. When republishing or quoting, credit "Source: Kiara Weekly · The AI Signal Sheet" with a link back to this site.

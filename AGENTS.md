# AGENTS.md

> Instructions for AI agents (Codex, Claude Code, Cursor, WorkBuddy, etc.) working in this repository.
> Human contributors: see [README.md](./README.md).

## Project overview

This is **Kiara Weekly · The AI Signal Sheet** — a static, zero-backend archive of a weekly AI industry newsletter, written natively in English for a Silicon Valley / Western product-and-research audience. Hosted on GitHub Pages and auto-deployed via GitHub Actions.

- **Stack:** plain HTML + CSS, no JS framework, no build step.
- **Hosting:** GitHub Pages (branch: `main`, deploy via Actions).
- **Live site:** https://kiarazhang-spec.github.io/kiara-weekly-ai-en/ (once Pages is enabled).
- **Sister site (Chinese):** https://kiarazhang-spec.github.io/kiara-weekly-ai/ — do **not** mirror or cross-translate content.

## Editorial premise (read this before writing)

This newsletter is written in English **from English primary sources by default**. Do not translate from a Chinese draft. Do not summarize a Chinese aggregator's take on a Western event. Every claim must be traceable to an English-language primary source read directly — no translation loss, no double-hop attribution.

**One deliberate exception:** for China-native frontier models (Moonshot / Kimi, DeepSeek, Qwen, Zhipu, ERNIE, Hunyuan, MiniMax, 01.AI, Doubao, StepFun, etc.) where the first-hand source is genuinely Chinese-only, Chinese sources are allowed with a flagged translation. See the "🇨🇳 Exception" section under Source hierarchy below for the exact protocol.

**Audience:** Silicon Valley PMs, product marketers, investors, and researchers who already read Stratechery, The Information, Latent Space, and Semianalysis. They do not need "what is a transformer" explanations. They do need a synthesized weekly signal filter.

**Voice:** Analytical, direct, product-and-market perspective. Concise. No hype language ("game-changing", "revolutionary", "disruptive"). Use specific numbers ($X billion, Y% growth, Z parameters) only with a verified source. Prefer concrete verbs. First-person "I" is fine when clearly marked as commentary.

## Repository layout

```
.
├── index.html                    # Homepage — fetches posts/manifest.json at runtime
├── posts/
│   ├── YYYY-MM-DD.html           # One file per issue. Filename = Monday of the covered week (Pacific Time).
│   └── manifest.json             # Index of all issues. AUTO-GENERATED. DO NOT EDIT BY HAND.
├── assets/
│   └── style.css                 # Global stylesheet, single source of design tokens.
├── .github/workflows/deploy.yml  # Rebuilds manifest.json and deploys Pages on push to main.
├── README.md                     # Human-facing intro.
├── AGENTS.md                     # This file.
└── LICENSE                       # MIT for code; content under CC BY 4.0 (see README).
```

## Hard rules — do NOT violate

1. **Never hand-edit `posts/manifest.json`.** It is recomputed on every push by `.github/workflows/deploy.yml`. Manual edits will be overwritten. To change the homepage listing, rename or move the corresponding HTML file in `posts/`.
2. **Never invent source URLs.** Every link in a post must be a real, clickable, verified URL pointing to the original article. If you cannot find a real link for a claim, drop the claim. No exceptions.
3. **Never fabricate facts, quotes, benchmarks, funding amounts, or dates.** If uncertain, search for the primary source. If still uncertain, omit.
4. **Chinese-source translation is only allowed for the China-native-model exception** (see the section below). For all other stories, if it only exists in Chinese-language reporting, treat it as out-of-scope for this English edition — it belongs on the Chinese sister site instead. Optional fallback: cite an English-language wire (Reuters, Bloomberg, FT) that already covered the same story.
5. **Never put inline `style="..."` on `.meta-line`.** Styling comes from `assets/style.css` only.
6. **Filename convention is fixed:** `posts/YYYY-MM-DD.html` where the date is the Monday (Pacific Time) that opens the covered week.
7. **No JS framework, no build step, no backend.** Plain HTML/CSS. This constraint is the point.

## Source hierarchy — the ironclad rule

Every Top 5 item and every featured story requires a primary-source link. Sources rank as follows:

### S-tier (best, always prefer)
Official company channels — read directly, not via press coverage:
- `openai.com/blog`, `openai.com/index/*`, OpenAI system cards
- `anthropic.com/news`, Anthropic research pages
- `deepmind.google/discover`, `blog.google/technology/ai/`
- `ai.meta.com/blog`, `about.fb.com/news/`
- `mistral.ai/news`, `x.ai/blog`, `huggingface.co/blog`
- `developer.apple.com/news`, `microsoft.com/en-us/research/blog/`
- Company earnings transcripts, SEC filings (10-K, 10-Q, S-1)
- `arxiv.org` for research claims (link to abstract, not PDF)

### A-tier (acceptable, must be English-language)
Editorially strong Western outlets covering AI substantively:
- **Analysis / newsletters:** Stratechery, The Information, Latent Space, Semianalysis, Ben Thompson, Ben's Bites, Import AI (Jack Clark), Interconnects (Nathan Lambert), Platformer (Casey Newton), Every, Sequoia Perspective
- **News wires:** Reuters, Bloomberg, Financial Times, Wall Street Journal
- **Trade press:** TechCrunch, The Verge, Wired, MIT Technology Review, Axios, Ars Technica
- **Legacy media (AI beats only):** The New York Times, The Economist, The Atlantic

### B-tier (context only, never lead)
Aggregators, translated reports, secondary coverage. Do **not** use as the sole source for any claim. Acceptable only as supplementary context alongside an S- or A-tier link.

### Explicitly out of scope for this edition
- Chinese-language media (机器之心, 量子位, 36Kr, 财联社, 腾讯科技, 新浪财经, etc.) as **primary sources for Western stories** — belongs on the Chinese sister site.
- Machine-translated Chinese blog posts republished on English aggregators.
- LinkedIn posts, unless from a verified executive account and corroborated by an S/A source.
- X/Twitter threads, unless (a) from a verified official account or (b) corroborated by an S/A source within 48 hours.

### 🇨🇳 Exception: China-native-model coverage

For **China-origin frontier models and their makers** — Moonshot / Kimi, DeepSeek, Alibaba Qwen, Zhipu / GLM, Baidu ERNIE, Tencent Hunyuan, MiniMax, 01.AI, ByteDance Doubao, StepFun, and comparable labs — first-hand information is almost always in Chinese first (WeChat official accounts, 官网, Chinese X/Weibo, 机器之心 / 量子位 exclusives). Cutting these sources loses real signal.

**Rule for this bucket:**
1. **You may cite Chinese-language sources directly**, including S-tier Chinese primaries: company WeChat 公众号 posts, 官网 announcements, Chinese-language technical reports, and reputable Chinese AI trade press (机器之心, 量子位, InfoQ 中国).
2. **You must attempt an English mirror first.** If Reuters / Bloomberg / FT / The Information / TechCrunch has already covered the same story, cite the English source as the primary link and the Chinese source as corroborating context.
3. **When no English mirror exists yet**, cite the Chinese primary directly, and translate the specific claim into English yourself. Do not machine-translate whole articles — extract the claim, verify context, write it in native English.
4. **Always flag the translation** with an inline marker so readers know the source language:
   - Format: `[Source: <outlet name>, in Chinese — translated by editor]`
   - Example: `Moonshot's WeChat post announcing Kimi K3's 2M-token context window [Moonshot 官方公众号, in Chinese — translated by editor].`
5. **Never quote a translated passage verbatim as if it were the original wording.** Paraphrase the fact, not the sentence. Direct quotes only from an English-language source.
6. **Sanity-check via a second source** (English or Chinese) before publishing any benchmark claim, funding number, or launch date from a Chinese primary — Chinese tech PR often front-loads optimistic framings.
7. **In the ⚠️ Sources & method footer**, list which items used the Chinese-source exception. Transparency > convenience.

Applying-the-rule test: "Would a Silicon Valley reader who reads no Chinese trust this claim after clicking the link?" If yes (because the English mirror exists, or the translation is careful and flagged), publish. If no, hold the story until a Western outlet covers it.

## Content structure (8 sections per issue)

Fixed template. Do not reorder or rename sections.

1. **Header** — title + subtitle + meta-line (period covered, PT)
2. **Lead paragraph** — one dense sentence summarizing the week's arc (soft-green background block)
3. **🎯 Top 5** — five items, each with:
   - Numbered title (`01.` through `05.`)
   - Meta-line with source links
   - One paragraph of factual context
   - "**Angle:**" callout with the product / market / research interpretation
4. **🔍 Three themes** — three thematic write-ups tying together multiple stories, each with a "**Take:**" callout
5. **📰 Also worth a look** — four sub-buckets:
   - 🧠 Models & research
   - 🛠️ Products & tooling
   - 💰 Capital & business
   - ⚙️ Infra & compute
6. **📅 On deck next week** — 2–3 forward-looking items (upcoming launches, earnings, conferences, filings)
7. **⚠️ Sources & method** — per-issue disclosure of source tiers used
8. **📋 About this brief** — standing footer

## Word budget

- **Total issue length:** 1,500–2,200 English words. English needs more room than Chinese; do not compress below 1,500.
- **Top 5 items:** 60–120 words of factual context each, plus 40–70 words of angle commentary.
- **Themes:** 120–200 words each, plus 40–70 words of take commentary.
- **Also worth a look bullets:** 20–40 words each.

## Voice specifics (English edition)

- **Titles are declarative, not clickbait.** "Anthropic files S-1 with SEC" > "You won't believe what Anthropic just did".
- **Prefer "the company", "the model", "the deal"** on second reference — avoid restating full names every sentence.
- **Use en-dashes (–) for ranges, em-dashes (—) for parenthetical clauses.** Do not use hyphens for either.
- **Numbers under 10 spelled out** in prose, digits for 10 and above; always digits for money, percentages, parameter counts, and model names ("$4 billion", "40 percent", "GPT-5", "Claude 4.5").
- **Company names on first mention:** use the form the company itself uses ("OpenAI" not "Open AI", "DeepMind" not "Deep Mind").
- **Model versions:** exactly as released ("Claude Sonnet 4.5", "Gemini 2.5 Pro", "GPT-5", "Llama 4").
- **No "In this issue:" preambles.** Get to the lead sentence.
- **No emoji in prose.** Emoji is section-header decoration only.

## AI-use disclosure protocol

This is a newsletter about AI. Using AI to help produce it is not a scandal — hiding it would be. Every issue must be honest about the split between human judgment and machine assistance. The reader test: *"If they saw exactly how this was made, would they feel misled?"*

**What AI is allowed to do:**
- Sweep and summarize the weekly source pool (RSS, official blogs, press releases, arXiv, filings)
- Extract quotes, dates, numbers from long documents for the editor to verify
- Suggest headline options (editor picks / rewrites)
- Draft a first pass that the editor then rewrites in her voice
- Copy-edit for typos, awkward phrasing, and consistency
- Parse dense filings (10-K, S-1, earnings transcripts) into structured facts

**What AI is NOT allowed to do:**
- Publish an "Angle" or "Take" that the editor did not personally endorse — opinion is human, always
- Cite a source the editor has not opened and read
- Generate numbers, quotes, benchmarks, or dates that are not lifted from a verified primary source
- Ship a paragraph in the editor's byline that the editor has not rewritten

**Every issue's `⚠️ Sources & method` footer must include an AI-use line.** Default language (adjust only if the workflow that week was materially different):

> **How this issue was made:** All stories, angles, and takes were picked and written by Kiara. AI tools were used to sweep the weekly source pool, extract facts from long documents, and copy-edit the final draft. Every primary source was read by a human before it was cited.

**Escalated disclosure — required when any of the following happened that week:**
- AI drafted a full paragraph that made it into the final issue with less than ~50% rewrite
- AI was used to summarize a source the editor did not read end-to-end
- The Chinese-source exception was invoked (add a translation-flag line as specified in the exception section)

Escalated language example:

> **How this issue was made:** Story picks, angles, and takes by Kiara. This week I leaned harder than usual on AI to parse [specific document, e.g. Anthropic's S-1]; the section summarizing that filing was AI-drafted and then rewritten. Everything cited was verified against the primary source.

**Principle:** over-disclose rather than under-disclose. A one-line honest note builds more trust than a corporate policy page.

## Workflow — adding a new issue

```bash
# 1. Create posts/YYYY-MM-DD.html (Monday of the covered week, PT).
# 2. Verify every <a href> opens a real article.
# 3. Stage, commit, push.
git add posts/2026-07-20.html
git commit -m "post: AI weekly 2026-07-20"
git push
# 4. Wait ~3 minutes for Actions to rebuild manifest.json and deploy.
# 5. Because Actions pushes back to main, your next local action MUST be:
git pull --rebase
```

### Commit message format

- `post: AI weekly YYYY-MM-DD` — new issue
- `style: <what>` — CSS / visual changes
- `docs: <what>` — README / AGENTS.md / LICENSE
- `fix: <what>` — bug fix (broken link, typo, factual correction)
- `chore: <what>` — config, workflow, infra

### Branching

Single `main`. Push directly for routine issues. For risky changes, branch as `wip/<short-name>`.

## Design tokens (defined in `assets/style.css :root` — do not invent new ones)

- `--green: #2D8B3E` — sole accent color (links, emphasis numbers, section underlines, angle-block left border)
- `--green-soft: #E8F3EA` — lead-block background
- `--text: #1a1a1a` — body text
- `--muted: #6b6b6b` — meta, captions
- `--bg: #ffffff` — page background
- Container max-width: **760px** (academic reading width — do not widen)
- Body font: system serif (Georgia, "Source Serif Pro", etc.)
- Heading font: system sans-serif fallback

To re-theme, change `--green` only. Do not add secondary accent colors.

## Things agents have gotten wrong (avoid these)

- Editing `manifest.json` manually → overwritten by Actions, causes merge conflicts.
- Using aggregator or translated sources as the only citation → violates source hierarchy.
- Direct-translating Chinese sister-site content into English → destroys the editorial premise. Rewrite from English primaries (or, for China-native models, follow the flagged-translation protocol).
- Inventing benchmark numbers or funding figures without a real source → hallucinations.
- Pushing without `git pull --rebase` after Actions bot commit → push rejected.
- Adding emoji to commit messages or filenames → keeps things machine-parseable.
- Padding word count with "as we discussed above" filler → tighten instead.

## License reminder

- **Newsletter text (`posts/*.html`):** CC BY 4.0. Attribution required when republished.
- **Code (HTML scaffolding, CSS, Actions YAML):** MIT.
- **Do not copy long verbatim passages from source articles.** Summarize, link, quote sparingly with attribution.

## Questions

This file is the source of truth. If a subsequent instruction conflicts with something here, prefer this file and flag the conflict. If something is missing, open an Issue or ask the human maintainer (Kiara) before making structural changes.

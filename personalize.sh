#!/usr/bin/env bash
# personalize.sh — rewrite Kiara's identifiers throughout the template.
#
# Usage:
#   bash personalize.sh <your-gh-handle> "<Your Full Name>" <your-repo-slug>
#
# Example:
#   bash personalize.sh janedoe "Jane Doe" my-ai-weekly
#
# What it does:
#   - Replaces "kiarazhang-spec"  → <your-gh-handle>            (GitHub handle in links)
#   - Replaces "Kiara Zhang"       → <Your Full Name>            (bylines, copyright)
#   - Replaces "Kiara"             → first token of <Your Full Name>  (casual mentions)
#   - Replaces "ai-weekly-kiara-template-en" → <your-repo-slug> (self-referencing links)
#   - Replaces "kiara-weekly-ai"   → <your-repo-slug>-sister    (only if you want; commented out by default)
#
# Files touched: *.html, *.md, *.json, *.yml — excluding .git/, archive/, node_modules/
# Safe to run multiple times; idempotent (won't re-replace strings that are already changed).
#
# After running:
#   1. Review with:  git diff
#   2. Delete this script if you want:  rm personalize.sh
#   3. Commit:  git commit -am "chore: personalize template"

set -euo pipefail

if [ $# -lt 3 ]; then
  echo "Usage: bash personalize.sh <your-gh-handle> \"<Your Full Name>\" <your-repo-slug>"
  echo "Example: bash personalize.sh janedoe \"Jane Doe\" my-ai-weekly"
  exit 1
fi

GH_HANDLE="$1"
FULL_NAME="$2"
REPO_SLUG="$3"
FIRST_NAME="${FULL_NAME%% *}"  # everything before first space

echo "About to replace throughout the repo:"
echo "  kiarazhang-spec                 → $GH_HANDLE"
echo "  Kiara Zhang                     → $FULL_NAME"
echo "  Kiara                           → $FIRST_NAME"
echo "  ai-weekly-kiara-template-en     → $REPO_SLUG"
echo ""
read -r -p "Proceed? [y/N] " confirm
case "$confirm" in
  y|Y|yes|YES) ;;
  *) echo "Aborted."; exit 0 ;;
esac

# Detect BSD (macOS) vs GNU sed for -i syntax
if sed --version >/dev/null 2>&1; then
  SED_INPLACE=(sed -i)
else
  SED_INPLACE=(sed -i '')
fi

# Order matters: longest / most-specific patterns first, so "Kiara Zhang" is
# rewritten before the bare "Kiara" pass, and "ai-weekly-kiara-template-en"
# before the fallback "kiara-weekly-ai".
find . \
  -type f \
  \( -name "*.html" -o -name "*.md" -o -name "*.json" -o -name "*.yml" -o -name "*.yaml" -o -name "*.css" \) \
  -not -path "./.git/*" \
  -not -path "./archive/*" \
  -not -path "./node_modules/*" \
  -print0 |
  while IFS= read -r -d '' file; do
    "${SED_INPLACE[@]}" \
      -e "s/ai-weekly-kiara-template-en/${REPO_SLUG}/g" \
      -e "s/kiarazhang-spec/${GH_HANDLE}/g" \
      -e "s/Kiara Zhang/${FULL_NAME}/g" \
      -e "s/\\bKiara\\b/${FIRST_NAME}/g" \
      "$file"
  done

# Update LICENSE copyright line
if [ -f LICENSE ]; then
  "${SED_INPLACE[@]}" "s/Copyright (c) 2026 ${FULL_NAME}/Copyright (c) $(date +%Y) ${FULL_NAME}/" LICENSE || true
fi

echo ""
echo "Done. Now:"
echo "  1. Review changes:   git diff"
echo "  2. Also check these locations manually (script can't guess):"
echo "     - index.html    <title>, <meta name=\"description\">, og:image URL"
echo "     - about.html    <title>, <meta name=\"description\">, og:image URL"
echo "     - posts/manifest.json    \"site.title\", \"site.author\", \"site.baseUrl\""
echo "  3. Commit:           git commit -am \"chore: personalize template\""
echo "  4. (Optional) remove this script: rm personalize.sh"

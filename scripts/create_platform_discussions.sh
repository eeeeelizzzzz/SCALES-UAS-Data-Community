#!/usr/bin/env bash
# Create GitHub Discussions (Platform-Based) for each platform folder.
#
# Why GraphQL: the GitHub CLI has no `gh discussion create`; use `gh api graphql`.
#
# Prerequisites:
#   - gh installed and authenticated: `gh auth login` (scopes: at least repo)
#   - Discussions enabled on the repository
#   - Permission to create discussions in the chosen category
#
# Usage (from repo root):
#   ./scripts/create_platform_discussions.sh              # create for all platforms/
#   DRY_RUN=1 ./scripts/create_platform_discussions.sh  # print actions only
#
# Override defaults if needed:
#   DISCUSSION_OWNER=eeeeelizzzzz DISCUSSION_REPO=SCALES-UAS-Data-Community \
#   DISCUSSION_CATEGORY_SUBSTR="Platform-Based" \
#   ./scripts/create_platform_discussions.sh

set -euo pipefail

OWNER="${DISCUSSION_OWNER:-eeeeelizzzzz}"
REPO="${DISCUSSION_REPO:-SCALES-UAS-Data-Community}"
CATEGORY_SUBSTR="${DISCUSSION_CATEGORY_SUBSTR:-Platform-Based}"
DRY_RUN="${DRY_RUN:-0}"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
PLATFORMS_DIR="${PLATFORMS_DIR:-${REPO_ROOT}/platforms}"

REPO_QUERY='query($owner:String!,$name:String!){
  repository(owner:$owner,name:$name){
    id
    discussionCategories(first:30){ nodes{ id name } }
  }
}'

CREATE_MUTATION='mutation($repositoryId:ID!,$categoryId:ID!,$title:String!,$body:String!){
  createDiscussion(input:{repositoryId:$repositoryId,categoryId:$categoryId,title:$title,body:$body}){
    discussion{ url }
  }
}'

DISCUSSIONS_QUERY='query($owner:String!,$name:String!,$endCursor:String){
  repository(owner:$owner,name:$name){
    discussions(first:100,after:$endCursor){
      nodes{
        title
        category{ name }
      }
      pageInfo{
        hasNextPage
        endCursor
      }
    }
  }
}'

if ! command -v gh >/dev/null 2>&1; then
  echo "error: gh not found in PATH. Install GitHub CLI and ensure it is on PATH." >&2
  exit 1
fi

if [[ ! -d "$PLATFORMS_DIR" ]]; then
  echo "error: platforms directory not found: $PLATFORMS_DIR" >&2
  exit 1
fi

echo "Fetching repository + discussion categories for ${OWNER}/${REPO}..."
json_repo="$(gh api graphql -f query="$REPO_QUERY" -f owner="$OWNER" -f name="$REPO")"

meta="$(DISCUSSION_CATEGORY_SUBSTR="${CATEGORY_SUBSTR}" python3 -c '
import json, os, sys
sub = os.environ.get("DISCUSSION_CATEGORY_SUBSTR", "Platform-Based")
data = json.loads(sys.stdin.read())
repo = data.get("data", {}).get("repository")
if not repo:
    print("error: repository not found or API error", file=sys.stderr)
    print(json.dumps(data, indent=2), file=sys.stderr)
    sys.exit(1)
nodes = repo.get("discussionCategories", {}).get("nodes") or []
match = None
for n in nodes:
    if sub.lower() in n.get("name", "").lower():
        match = n
        break
if not match:
    print("error: no category matching substring %r. Available:" % sub, file=sys.stderr)
    for n in nodes:
        print("  -", n.get("name"), file=sys.stderr)
    sys.exit(1)
print(repo["id"])
print(match["id"])
print(match["name"])
' <<<"$json_repo")"

DISCUSSION_REPO_ID="$(echo "$meta" | sed -n '1p')"
CATEGORY_ID="$(echo "$meta" | sed -n '2p')"
CATEGORY_NAME="$(echo "$meta" | sed -n '3p')"

echo "Using category: ${CATEGORY_NAME} (${CATEGORY_ID})"

echo "Fetching existing discussion titles in category: ${CATEGORY_NAME}..."
existing_titles_tmp="$(mktemp)"
body_tmp="$(mktemp)"
cleanup() { rm -f "$existing_titles_tmp" "$body_tmp"; }
trap cleanup EXIT

end_cursor=""
while :; do
  page_json="$(
    gh api graphql \
      -f query="$DISCUSSIONS_QUERY" \
      -f owner="$OWNER" \
      -f name="$REPO" \
      -F endCursor="$end_cursor"
  )"

  python3 -c '
import json, sys
category_name = sys.argv[1]
out_file = sys.argv[2]
data = json.loads(sys.stdin.read())
nodes = data.get("data", {}).get("repository", {}).get("discussions", {}).get("nodes", [])
with open(out_file, "a", encoding="utf-8") as f:
    for n in nodes:
        cat = ((n.get("category") or {}).get("name") or "").strip()
        title = (n.get("title") or "").strip()
        if cat == category_name and title:
            f.write(title + "\\n")
' "$CATEGORY_NAME" "$existing_titles_tmp" <<<"$page_json"

  page_info="$(
    python3 -c '
import json,sys
d=json.load(sys.stdin)
p=d.get("data",{}).get("repository",{}).get("discussions",{}).get("pageInfo",{})
print("1" if p.get("hasNextPage") else "0")
print(p.get("endCursor") or "")
' <<<"$page_json"
  )"
  has_next="$(echo "$page_info" | sed -n '1p')"
  end_cursor="$(echo "$page_info" | sed -n '2p')"
  [[ "$has_next" == "1" ]] || break
done

if [[ -s "$existing_titles_tmp" ]]; then
  sort -u "$existing_titles_tmp" -o "$existing_titles_tmp"
fi

PLATFORM_IDS=()
shopt -s nullglob
for d in "$PLATFORMS_DIR"/*/; do
  base="$(basename "$d")"
  [[ "$base" == "_template_platform_" ]] && continue
  PLATFORM_IDS+=("$base")
done
shopt -u nullglob

IFS=$'\n' PLATFORM_IDS=($(printf '%s\n' "${PLATFORM_IDS[@]}" | sort))
unset IFS

if [[ ${#PLATFORM_IDS[@]} -eq 0 ]]; then
  echo "error: no platform directories under $PLATFORMS_DIR" >&2
  exit 1
fi

for ID in "${PLATFORM_IDS[@]}"; do
  TITLE="[Profile]: ${ID}"

  if grep -Fxq "$TITLE" "$existing_titles_tmp" 2>/dev/null; then
    echo "Skipping (already exists): ${TITLE}"
    continue
  fi

  cat >"$body_tmp" <<EOF
## Platform Overview: ${ID}
This is the official discussion home for the **${ID}** platform.

### Quick links
- **Metadata folder:** [\`platforms/${ID}/\`](https://github.com/${OWNER}/${REPO}/tree/main/platforms/${ID})
- **Zenodo:** links will be updated in each platform README and in \`main_data_index.csv\` as DOIs are minted ([Zenodo SCALES community](https://zenodo.org/communities/scales))

Use the thread below for technical quirks, performance notes, and science conversation specific to this system (see repository **Golden Rule**: Issues for confirmed fixes, Discussions for everything else).
EOF

  if [[ "$DRY_RUN" == "1" ]]; then
    echo "[dry-run] would create: ${TITLE}"
    continue
  fi

  echo "Creating: ${TITLE}..."
  gh api graphql -f query="$CREATE_MUTATION" \
    -F repositoryId="$DISCUSSION_REPO_ID" \
    -F categoryId="$CATEGORY_ID" \
    -F title="$TITLE" \
    -F body=@"$body_tmp"
done

echo "Done. (${#PLATFORM_IDS[@]} platforms processed.)"

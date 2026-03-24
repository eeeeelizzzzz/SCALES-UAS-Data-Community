#!/usr/bin/env bash
set -euo pipefail

export OWNER="eeeeelizzzzz"
export REPO="SCALES-UAS-Data-Community"

echo "Fetching data from GitHub..."

# Use a quoted Heredoc to handle the GraphQL calls safely within Python
python3 <<'EOF'
import json, subprocess, os, sys

owner = os.environ['OWNER']
repo = os.environ['REPO']

def run_gh_api(query, variables):
    cmd = ['gh', 'api', 'graphql']
    for k, v in variables.items():
        cmd.extend(['-f', f'{k}={v}'])
    cmd.extend(['-f', f'query={query}'])
    res = subprocess.run(cmd, capture_output=True, text=True)
    if res.returncode != 0:
        print(f"❌ API Error: {res.stderr}")
        return None
    return json.loads(res.stdout)

# 1. Fetch Discussions
print("Fetching discussions...")
disc_query = 'query($owner:String!, $name:String!) { repository(owner:$owner, name:$name) { discussions(first: 100) { nodes { id title } } } }'
disc_data = run_gh_api(disc_query, {'owner': owner, 'name': repo})
if not disc_data: sys.exit(1)
discussions = disc_data['data']['repository']['discussions']['nodes']

# 2. Fetch Label IDs (to map Name -> internal ID)
print("Fetching label map...")
label_query = 'query($owner:String!, $name:String!) { repository(owner:$owner, name:$name) { labels(first: 100) { nodes { id name } } } }'
label_data = run_gh_api(label_query, {'owner': owner, 'name': repo})
if not label_data: sys.exit(1)
label_map = {l['name']: l['id'] for l in label_data['data']['repository']['labels']['nodes']}

# 3. Apply labels
mutation = 'mutation($id:ID!, $labelIds:[ID!]!) { addLabelsToLabelable(input: {labelableId: $id, labelIds: $labelIds}) { clientMutationId } }'

for d in discussions:
    # After renaming, the title IS the platform ID (e.g., "BL022")
    platform_id = d['title'].strip()
    
    # Check if a label with that exact name exists
    if platform_id in label_map:
        label_id = label_map[platform_id]
        print(f"Tagging discussion '{platform_id}' with label '{platform_id}'...")
        
        run_gh_api(mutation, {
            'id': d['id'],
            'labelIds[]': label_id
        })
    else:
        print(f"⚠️  No matching label found for discussion: {platform_id}")

EOF

echo "Label application complete."
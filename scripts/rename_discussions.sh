#!/usr/bin/env bash
set -euo pipefail

export OWNER="eeeeelizzzzz"
export REPO="SCALES-UAS-Data-Community"

python3 <<'EOF'
import json, subprocess, os, re

owner = os.environ['OWNER']
repo = os.environ['REPO']

# 1. Fetch all discussions
query = 'query($owner:String!, $name:String!) { repository(owner:$owner, name:$name) { discussions(first: 100) { nodes { id title } } } }'
raw = subprocess.check_output(['gh', 'api', 'graphql', '-f', f'query={query}', '-f', f'owner={owner}', '-f', f'name={repo}'])
nodes = json.loads(raw)['data']['repository']['discussions']['nodes']

# 2. Rename them
mutation = 'mutation($id:ID!, $title:String!) { updateDiscussion(input: {discussionId: $id, title: $title}) { clientMutationId } }'

for node in nodes:
    old_title = node['title']
    d_id = node['id']
    
    # Matches "[Profile]: BL022" and captures "BL022"
    match = re.search(r'\[Profile\]:\s*(\w+)', old_title)
    if match:
        new_title = match.group(1)
        print(f"Renaming '{old_title}' to '{new_title}'...")
        
        subprocess.run([
            'gh', 'api', 'graphql', 
            '-f', f'query={mutation}', 
            '-f', f'id={d_id}', 
            '-f', f'title={new_title}'
        ], capture_output=True)
EOF
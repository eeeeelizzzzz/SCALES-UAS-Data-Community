#!/usr/bin/env bash
set -euo pipefail

export OWNER="eeeeelizzzzz"
export REPO="SCALES-UAS-Data-Community"
export PLATFORMS_DIR="./platforms"

echo "Running README link update..."

python3 <<'EOF'
import os, re

owner = os.environ['OWNER']
repo = os.environ['REPO']
platforms_dir = os.environ['PLATFORMS_DIR']

for item in os.listdir(platforms_dir):
    path = os.path.join(platforms_dir, item)
    if os.path.isdir(path) and item != "_template_platform_":
        readme_path = os.path.join(path, "README.md")
        
        if os.path.exists(readme_path):
            with open(readme_path, 'r') as f:
                content = f.read()

            # Construct the new URLs
            issue_url = f"https://github.com/{owner}/{repo}/issues?q=is%3Aopen+label%3A{item}"
            disc_url = f"https://github.com/{owner}/{repo}/discussions?discussions_q=label%3A{item}"

            new_links = (
                f"### Platform discussion\n\n"
                f"### 🔗 Quick Links\n"
                f"- **[View All Issues & Alerts for {item}]({issue_url})**\n"
                f"- **[View All Science Discussions for {item}]({disc_url})**"
            )

            # --- IMPROVED REGEX ---
            # 1. Matches any header level (## or ###)
            # 2. Case insensitive (Platform vs platform)
            # 3. Matches everything until the next header or end of file
            pattern = r"(?i)#{2,3}\s*Platform\s+discussion.*?(?=\n#|$)"
            
            if re.search(pattern, content, flags=re.DOTALL):
                print(f"✅ Updating {item}/README.md")
                updated_content = re.sub(pattern, new_links, content, flags=re.DOTALL)
                with open(readme_path, 'w') as f:
                    f.write(updated_content)
            else:
                print(f"⚠️  Skipping {item}: Could not find 'Platform discussion' section.")
EOF

echo "Process finished."
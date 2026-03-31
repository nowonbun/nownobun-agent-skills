#!/usr/bin/env bash

set -euo pipefail

# 경로 예시
# - SOURCE_ROOT: 스킬 시트 원본 md 파일이 있는 루트
#   예) D:/work/nownobun-agent-skills
# - TARGET_DIR: .codex 디렉토리의 상위 루트
#   예) /Users/nowonbun
# - 위 예시라면 실제 복사 경로는 아래처럼 된다.
#   /Users/nowonbun/.codex/skills/<파일명>/SKILL.md
#   /Users/nowonbun/.codex/config.toml
# - TARGET_DIR를 ~/.codex 로 넣으면 .codex가 한 번 더 붙는다.
#   ~/.codex/.codex/...
TARGET_DIR="${TARGET_DIR:-$HOME/workspace-target}"
SOURCE_ROOT="${SOURCE_ROOT:-$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)}"

test_skill_sheet() {
    local file_path="$1"

    awk '
        BEGIN { in_frontmatter=0; first_delim=0; has_name=0; has_desc=0 }
        NR == 1 && $0 ~ /^---[[:space:]]*$/ { in_frontmatter=1; first_delim=1; next }
        in_frontmatter && $0 ~ /^---[[:space:]]*$/ {
            exit(first_delim && has_name && has_desc ? 0 : 1)
        }
        in_frontmatter && $0 ~ /^[[:space:]]*name[[:space:]]*:/ { has_name=1 }
        in_frontmatter && $0 ~ /^[[:space:]]*description[[:space:]]*:/ { has_desc=1 }
        END {
            if (!(first_delim && has_name && has_desc)) {
                exit 1
            }
        }
    ' "$file_path"
}

ensure_skill_config() {
    local config_path="$1"
    local skill_path="$2"

    touch "$config_path"

    if grep -Fqx "path = \"${skill_path}\"" "$config_path"; then
        echo "[SKIP] config.toml 등록 생략: ${skill_path}"
        return
    fi

    if [[ -s "$config_path" ]]; then
        printf '\n' >> "$config_path"
    fi

    cat >> "$config_path" <<EOF
[[skills.config]]
path = "${skill_path}"
enabled = true
EOF

    echo "[ADD ] config.toml 등록: ${skill_path}"
}

mkdir -p "$TARGET_DIR/.codex/skills"

CONFIG_PATH="$TARGET_DIR/.codex/config.toml"
SKILLS_ROOT="$TARGET_DIR/.codex/skills"

copied_count=0

while IFS= read -r file_path; do
    if ! test_skill_sheet "$file_path"; then
        continue
    fi

    file_name="$(basename "$file_path")"
    skill_name="${file_name%.md}"
    skill_dir="$SKILLS_ROOT/$skill_name"
    skill_target_path="$skill_dir/SKILL.md"

    mkdir -p "$skill_dir"
    cp "$file_path" "$skill_target_path"
    echo "[COPY] ${file_name} -> ${skill_target_path}"

    ensure_skill_config "$CONFIG_PATH" "$skill_target_path"
    copied_count=$((copied_count + 1))
done < <(find "$SOURCE_ROOT" -maxdepth 1 -type f -name '*.md' | sort)

if [[ "$copied_count" -eq 0 ]]; then
    echo "메타(name, description)가 있는 스킬 시트를 찾지 못했습니다. sourceRoot=$SOURCE_ROOT" >&2
    exit 1
fi

echo
echo "완료:"
echo "- sourceRoot: $SOURCE_ROOT"
echo "- targetDir : $TARGET_DIR"
echo "- config    : $CONFIG_PATH"

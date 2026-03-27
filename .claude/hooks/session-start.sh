#!/bin/bash
set -euo pipefail

# Only run in Claude Code remote (web) sessions
if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

cd "$CLAUDE_PROJECT_DIR"

# Verify required tools are available
for tool in bash make; do
  if ! command -v "$tool" &>/dev/null; then
    echo "ERROR: required tool '$tool' not found" >&2
    exit 1
  fi
done

# Validate agent frontmatter
make validate

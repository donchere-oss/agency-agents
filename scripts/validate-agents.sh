#!/usr/bin/env bash
# Validates that all agent .md files have required frontmatter fields.

set -euo pipefail

AGENTS_DIR="${1:-agents}"
ERRORS=0

if [[ ! -d "$AGENTS_DIR" ]]; then
  echo "Error: agents directory '$AGENTS_DIR' not found" >&2
  exit 1
fi

for file in "$AGENTS_DIR"/*.md; do
  [[ -e "$file" ]] || { echo "No agent files found in $AGENTS_DIR"; exit 1; }

  name=$(basename "$file")

  # Check file starts with frontmatter
  if ! head -1 "$file" | grep -q '^---$'; then
    echo "FAIL $name: missing frontmatter (file must start with ---)"
    ERRORS=$((ERRORS + 1))
    continue
  fi

  # Extract frontmatter block (between first and second ---)
  frontmatter=$(awk '/^---$/{if(++c==2) exit} c==1' "$file")

  # Check required fields
  for field in name description; do
    if ! echo "$frontmatter" | grep -q "^${field}:"; then
      echo "FAIL $name: missing required field '$field'"
      ERRORS=$((ERRORS + 1))
    fi
  done

  # Check name and description are non-empty
  name_val=$(echo "$frontmatter" | grep "^name:" | sed 's/^name:[[:space:]]*//')
  desc_val=$(echo "$frontmatter" | grep "^description:" | sed 's/^description:[[:space:]]*//')

  if [[ -z "$name_val" ]]; then
    echo "FAIL $name: 'name' field is empty"
    ERRORS=$((ERRORS + 1))
  fi

  if [[ -z "$desc_val" ]]; then
    echo "FAIL $name: 'description' field is empty"
    ERRORS=$((ERRORS + 1))
  fi

  if [[ $ERRORS -eq 0 ]]; then
    echo "OK   $name"
  fi
done

if [[ $ERRORS -gt 0 ]]; then
  echo ""
  echo "Validation failed with $ERRORS error(s)."
  exit 1
else
  echo ""
  echo "All agents are valid."
fi

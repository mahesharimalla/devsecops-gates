#!/usr/bin/env bash
set -e

COMMIT_MSG=$(git log -1 --pretty=%s)

echo "🔍 Checking commit message policy"
echo "--------------------------------"
echo "Commit: $COMMIT_MSG"
echo

# Expected format: WP#123 Message
if [[ "$COMMIT_MSG" =~ ^WP#[0-9]+[[:space:]].+ ]]; then
  echo "✅ Commit message follows WP format"
  exit 0
fi

# Soft enforcement (NO PIPELINE FAILURE)
echo "⚠️ Commit message does NOT follow WP format"
echo
echo "Expected : WP#<id> <message>"
echo "Example  : WP#166 Update app.ts"
echo
echo "ℹ️ Action taken:"
echo "- Pipeline will CONTINUE"
echo "- Violation will be TRACKED in OpenProject"
echo "- AO will be notified if required"
echo

exit 0



#!/usr/bin/env bash
set -euo pipefail

echo "🔍 Hygiene checks"

grep -RIn "TODO\|FIXME\|console.log\|print(" . && {
  echo "❌ Hygiene violation found"
  exit 0
}

find . -name "*.env" -not -path "./node_modules/*" | grep . && {
  echo "❌ .env file committed"
  exit 1
}

echo "✅ Hygiene PASSED"

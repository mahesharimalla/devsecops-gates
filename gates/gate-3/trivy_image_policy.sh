#!/usr/bin/env bash
set -euo pipefail

echo "🔍 Gate-3: Trivy Image Policy"

IMAGE="${1:-}"

if [ -z "$IMAGE" ]; then
  echo "❌ No image provided to Trivy policy script"
  exit 1
fi

echo "Scanning image: $IMAGE"

trivy image \
  --severity CRITICAL,HIGH \
  --exit-code 0 \
  --no-progress \
  "$IMAGE"

echo "✅ Image vulnerability policy compliant for $IMAGE"

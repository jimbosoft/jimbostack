#!/usr/bin/env bash
#
# Build and deploy the site to Firebase Hosting.
#
# Usage:
#   ./deploy.sh            Build and deploy to production
#   ./deploy.sh preview    Build and deploy to a temporary preview channel
#
set -euo pipefail

# Move to the directory this script lives in, so it works from anywhere.
cd "$(dirname "$0")"

echo "==> Cleaning old build output..."
rm -rf public

echo "==> Building site with Hugo (minified)..."
hugo --minify

if [[ "${1:-}" == "preview" ]]; then
  echo "==> Deploying to a temporary preview channel..."
  firebase hosting:channel:deploy preview
else
  echo "==> Deploying to production (overreact.com.au)..."
  firebase deploy --only hosting
fi

echo "==> Done."

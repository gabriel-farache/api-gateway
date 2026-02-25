#!/usr/bin/env bash
# Clone manager repos so compose can build them. By default clones into a directory
# under the system temp location (TMPDIR if set, else /tmp). Override with DCM_MANAGERS_DIR.
# Run from api-gateway root. Idempotent: skips repos that already exist.

set -e
ROOT="${DCM_MANAGERS_DIR:-${TMPDIR:-/tmp}/dcm-compose-repos}"
BASE="${DCM_REPO_BASE:-https://github.com/dcm-project}"
mkdir -p "$ROOT"

for repo in service-provider-manager catalog-manager policy-manager placement-manager; do
  if [ -d "${ROOT}/${repo}/.git" ]; then
    echo "skip (already present): ${ROOT}/${repo}"
  else
    echo "clone: ${repo} -> ${ROOT}/${repo}"
    git clone "${BASE}/${repo}.git" "${ROOT}/${repo}"
  fi
done
if [ -n "$1" ]; then
  echo "DCM_MANAGERS_DIR=${ROOT}" > "$1"
  echo "wrote $1"
fi
echo "DCM_MANAGERS_DIR=${ROOT}"

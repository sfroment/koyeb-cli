#!/usr/bin/env bash
set -euo pipefail

# Generate shell completion scripts for all cobra-supported shells.
# Output files are written to the completions/ directory at the repo root.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
cd "$REPO_ROOT"

COMPLETIONS_DIR="completions"
mkdir -p "$COMPLETIONS_DIR"

go run ./cmd/koyeb completion bash > "$COMPLETIONS_DIR/koyeb.bash"
go run ./cmd/koyeb completion zsh > "$COMPLETIONS_DIR/_koyeb"
go run ./cmd/koyeb completion fish > "$COMPLETIONS_DIR/koyeb.fish"
go run ./cmd/koyeb completion powershell > "$COMPLETIONS_DIR/koyeb.ps1"

echo "Generated completion scripts in $COMPLETIONS_DIR/"

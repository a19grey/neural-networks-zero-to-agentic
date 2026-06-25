#!/bin/bash
# Setup script for Neural Networks Course
# Installs: fnox (secrets manager), uv (Python manager), wandb (Weights & Biases)
set -e

echo "=== Step 1: Install fnox ==="
if command -v mise &>/dev/null; then
  echo "Using mise to install fnox..."
  mise use -g fnox
elif command -v cargo &>/dev/null; then
  echo "Using cargo to install fnox..."
  cargo install fnox
elif command -v brew &>/dev/null; then
  echo "Trying homebrew..."
  brew install fnox 2>/dev/null || {
    echo "fnox not in brew. Install Rust first: https://rustup.rs, then re-run this script."
    exit 1
  }
else
  echo "ERROR: Need mise, cargo, or homebrew to install fnox."
  echo "Quickest fix: install mise with: curl https://mise.run | sh"
  exit 1
fi
echo "✓ fnox installed: $(fnox --version)"

echo ""
echo "=== Step 2: Install uv ==="
if command -v uv &>/dev/null; then
  echo "uv already installed: $(uv --version)"
else
  curl -LsSf https://astral.sh/uv/install.sh | sh
  # Reload PATH
  export PATH="$HOME/.cargo/bin:$HOME/.local/bin:$PATH"
  echo "✓ uv installed: $(uv --version)"
fi

echo ""
echo "=== Step 3: Set up project venv and install wandb ==="
PROJ_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$PROJ_DIR"

if [ ! -d ".venv" ]; then
  uv venv
fi

uv pip install wandb
echo "✓ wandb installed"

echo ""
echo "=== All done! ==="
echo ""
echo "Next steps:"
echo "  • Initialize fnox in this project:  cd '$PROJ_DIR' && fnox init"
echo "  • Activate venv:                    source '$PROJ_DIR/.venv/bin/activate'"
echo "  • Login to W&B:                     wandb login"

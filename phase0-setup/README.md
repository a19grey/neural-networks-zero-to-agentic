# Phase 0: Environment Setup

Before writing any neural network code you need three tools installed and talking to each other:

| Tool | What it does |
|------|-------------|
| **uv** | Fast Python package manager — creates your virtual environment and installs packages |
| **fnox** | Secrets manager — stores API keys encrypted on disk so you never paste them in plaintext |
| **wandb** | Experiment tracker — logs your training metrics to a dashboard in the cloud |

Work through the steps below in order. Each step includes a verification command so you know it worked before moving on.

---

## Step 1 — Install uv

uv is a fast Python package/environment manager. Check if it's already there:

```bash
uv --version
```

If you see a version number, skip to Step 2. If not, install it:

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

Then open a new terminal tab (or run `source ~/.zshrc`) and verify:

```bash
uv --version
# expected: uv 0.x.x
```

---

## Step 2 — Create the project virtual environment

From the root of this repo:

```bash
cd path/to/neural-networks-course
uv venv
```

This creates a `.venv` folder using Python 3.12. Activate it:

```bash
source .venv/bin/activate
```

Your prompt will now show `(.venv)` at the start. You need to activate the venv every time you open a new terminal in this project.

---

## Step 3 — Install wandb into the venv

With the venv active:

```bash
uv pip install wandb
```

Verify:

```bash
python -c "import wandb; print(wandb.__version__)"
# expected: 0.28.x (or similar)
```

---

## Step 4 — Install fnox (secrets manager)

fnox keeps your API keys encrypted on disk. Never store keys in plaintext `.env` files or paste them in code.

Install via Homebrew (macOS):

```bash
brew install fnox
```

Verify:

```bash
fnox --version
# expected: fnox 1.x.x
```

---

## Step 5 — Set up fnox (one-time, global)

This is the fiddly part. Do it once and you're set forever.

### 5a — Install age (the encryption tool fnox uses)

```bash
brew install age
```

### 5b — Generate your encryption keypair

```bash
mkdir -p ~/.config/fnox
age-keygen -o ~/.config/fnox/age.txt
chmod 600 ~/.config/fnox/age.txt
```

This prints your **public key** — it looks like `age1abc123...`. Copy it, you need it in the next step.

### 5c — Create the global fnox config

Create the file `~/fnox.toml` (in your home directory, not this project):

```toml
default_provider = "age"

[providers.age]
type = "age"
recipients = ["age1YOUR_PUBLIC_KEY_HERE"]
```

Replace `age1YOUR_PUBLIC_KEY_HERE` with the key from the previous step.

### 5d — Add fnox to your shell

```bash
echo 'eval "$(fnox activate zsh)"' >> ~/.zshrc
source ~/.zshrc
```

If you use bash instead of zsh, replace `zsh` with `bash` and target `~/.bashrc`.

### 5e — Verify fnox is working

```bash
fnox doctor
# should show: ✓ Loaded successfully, ✓ Provider health: age
```

---

## Step 6 — Store your wandb API key in fnox

Get your API key from: https://wandb.ai/authorize

Then store it (fnox will prompt you — the key is never shown in your terminal):

```bash
fnox set WANDB_API_KEY
```

Paste your key at the hidden prompt and press Enter.

Verify the key is stored (this shows the key *name* only, never the value):

```bash
fnox list
# expected: WANDB_API_KEY
```

---

## Step 7 — Run the test script

Everything is wired up. Run the wandb test script using `fnox exec` so the API key is automatically injected:

```bash
source .venv/bin/activate          # activate venv if not already active
fnox exec -- python phase0-setup/wandb_test.py
```

You should see output like:
```
wandb: Currently logged in as: your-username
wandb: Syncing run ...
wandb: Run history: acc █▇▆▅...
wandb: View run at https://wandb.ai/...
```

Open that URL to see your first experiment logged in the wandb dashboard.

---

## The pattern going forward

Every time you run a training script in this course:

```bash
source .venv/bin/activate          # activate venv
fnox exec -- python your_script.py # run with secrets injected
```

`fnox exec --` injects `WANDB_API_KEY` (and any other stored keys) into the environment before your script runs. wandb picks it up automatically.

---

## Quick reference: if something breaks

| Problem | Fix |
|---------|-----|
| `uv: command not found` | Open a new terminal or run `source ~/.zshrc` |
| `(.venv)` not in prompt | Run `source .venv/bin/activate` |
| `fnox: command not found` | Run `source ~/.zshrc` |
| `fnox list` shows nothing | Run `fnox set WANDB_API_KEY` again |
| wandb says "not logged in" | Make sure you're running via `fnox exec -- python ...` not plain `python ...` |
| `fnox exec` says key missing | Run `cd .. && cd -` to re-trigger fnox injection, then retry |

---

## Files in this folder

| File | What it is |
|------|-----------|
| `wandb_test.py` | First test script — logs fake training metrics to wandb |
| `setup.sh` | Automated setup script (runs Steps 1–3 above) |

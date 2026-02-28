# /vault — Session Capture and Canonization

Vault is not a thinking tool — it is a capture and canonization tool. Run `/vault` at the end of a thinking session to promote the work into a structured, versioned personal archive. Two outputs: a human-readable Markdown artifact you can search and revisit, and a machine-readable JSONL index entry designed for longitudinal queries ("how has my thinking on this topic evolved over time?").

Vault reads the current conversation automatically — no copy-pasting required.

---

## Setup

Before first use, set your vault path.

Open `~/.claude/commands/vault.md` and find the configuration block near the top:

```
<!-- USER CONFIGURATION: Edit VAULT_PATH before first use -->
VAULT_PATH: ~/Documents/vault
<!-- END CONFIGURATION -->
```

Change the path to wherever you want your archive to live. Example:

```
VAULT_PATH: ~/Documents/Knowledge/Vault
```

Vault will create the directory and its subdirectories automatically on first use. You do not need to create anything manually.

---

## Install

Vault is not included in the default `./install.sh` install. Install it explicitly:

```bash
# From the repo root
./install.sh vault

# Or manually
cp vault/commands/vault.md ~/.claude/commands/vault.md
```

After installing, set your vault path as described in Setup above.

---

## Usage

```
/vault
```

Vault takes no arguments. It reads the current conversation context automatically.

Run it at the end of a session where real thinking happened — a premortem, a conviction audit, a forum debate, a horizon analysis, or a freeform strategic conversation worth preserving.

---

## How It Works

### Phase 1: Scan and Confirm

Vault reads back through the full conversation and identifies what happened: which thinking-stack commands were used, what the core topic was, and a one-sentence description of the session type. It presents this as a summary and asks you to confirm — or correct — before writing anything.

One gate. One question. If you only want to vault part of a session (e.g., the premortem but not the follow-up conversation), tell it and it adjusts.

### Phase 2: Gather Metadata

Vault infers and suggests three things: a title, a type classification, and 2–4 tags. You confirm or adjust — you do not have to define these from scratch.

Type options: `forum` / `premortem` / `horizon` / `conviction` / `succinct` / `synthesis` / `decision` / `note`

After confirmation, Vault asks one open question: *Why does this session matter to you?* Give the rough version — Vault writes it clean.

### Phase 3: Extract

Vault extracts the following from the conversation without showing its work:

- **Initial framing** — what you brought into the session
- **What shifted** — what changed, evolved, or was resolved during the session
- **Key conclusion** — what was decided or clarified (or "open" if unresolved)
- **Full session summary** — a substantive 150–300 word narrative of the actual thinking
- **Themes** — 3–5 concept-level labels for longitudinal pattern detection across entries
- **Open questions** — what remained unresolved
- **Key assumptions** — the load-bearing beliefs the session's reasoning rested on

### Phase 4: Write and Confirm

Two files are written:

1. `{VAULT_PATH}/artifacts/{YYYYMMDD}_{type}_{slug}.md` — the human-readable artifact
2. `{VAULT_PATH}/index.jsonl` — one JSON line appended per vault operation

Vault confirms the path of the saved artifact and the index entry ID.

---

## Output Format

### Markdown Artifact

```markdown
# {Title}

**Date**: YYYY-MM-DD
**Type**: {type}
**Tags**: {tags}
**Source**: {commands used}

---

## Session Arc

**Initial framing**: ...
**What shifted**: ...
**Conclusion**: ...

---

## Full Session Summary

{150–300 word narrative of the actual thinking}

---

## Extracted

**Themes**: theme1, theme2, theme3
**Open questions**: [list]
**Key assumptions**: [list]

---

## Why This Matters

{Polished reflection on why this was worth preserving}

---

*Vaulted: 2026-02-28T14:32:00Z*
```

### JSONL Index Entry

One line per vault operation, appended to `index.jsonl`:

```json
{"id":"vault-20260228-001","date":"2026-02-28","type":"premortem","title":"...","tags":["strategy","market-risk"],"source_commands":["premortem"],"themes":["assumption-testing","market-entry","timing"],"initial_framing":"...","what_shifted":"...","key_conclusion":"...","open_questions":["..."],"key_assumptions":["..."],"why_it_matters":"...","artifact_path":"artifacts/20260228_premortem_slug.md"}
```

The JSONL index is designed for trajectory queries — "how has my thinking on distribution evolved across projects?" — not just static tag lookup. Fields like `initial_framing`, `what_shifted`, `themes`, and `why_it_matters` are the longitudinal signal.

---

## When to Use It

Use `/vault` when:

- You completed a thinking session worth preserving — a real decision worked through, a belief examined, a risk mapped, a strategy synthesized
- You want the work to be retrievable and searchable without re-reading the full conversation
- You're building a record of how your thinking on a topic or domain has evolved over time
- You reached a clear landing point and don't want it to disappear when the conversation closes

Do not use `/vault` for exploratory conversations that didn't reach a useful conclusion, quick lookups, or sessions where nothing of substance was decided or surfaced.

---

## Requirements

- [Claude Code](https://code.claude.com/docs) installed and configured
- Write access to your configured `VAULT_PATH` directory
- Single-agent — no multi-agent tools required

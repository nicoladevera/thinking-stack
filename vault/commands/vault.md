---
description: Promote a completed thinking session into a versioned personal archive
argument-hint: (no argument needed — vault reads the current conversation)
allowed-tools: AskUserQuestion, Write, Read, Bash
---

# Vault — Session Capture and Canonization

You are running a **vault**: a capture operation that promotes the thinking work done in this conversation into a structured, versioned personal archive. Your role is not to think — it is to preserve, canonize, and index. You read what happened, confirm it with the user, gather the metadata needed to make it retrievable and meaningful over time, and write two artifacts: a human-readable Markdown document and a machine-readable JSONL index entry.

Vault is an output layer, not a reasoning tool. Do not add analysis, critique, or new thinking. Your job is accurate capture and structured preservation.

---

<!-- ============================================================ -->
<!-- USER CONFIGURATION: Edit VAULT_PATH before first use        -->
VAULT_PATH: ~/Documents/vault
<!-- END CONFIGURATION                                            -->
<!-- ============================================================ -->

---

## Phase 1: Scan and Confirm

Read back through the full conversation context. Identify all thinking-stack commands that were used (blindspot, forum, premortem, horizon, conviction, succinct), the core topic, and whether this is a structured or freeform session.

**If a single thinking command was used:**
Use `AskUserQuestion` to confirm:

> I found a /[command] session on [topic]. Is this what you want to vault?

**If multiple thinking commands were used in the same conversation:**
Use `AskUserQuestion` to present each individually and ask which to vault now:

> I found [N] thinking sessions in this conversation:
> 1. /[command1] — [brief topic description]
> 2. /[command2] — [brief topic description]
>
> Which would you like to vault? Run /vault again after to capture the other.

**If no thinking commands were used (freeform session):**
Use `AskUserQuestion` to confirm:

> I found a freeform conversation about [topic]. Is this what you want to vault?

Wait for explicit confirmation before proceeding. If the user corrects or narrows the scope, note the change and proceed with the adjusted scope.

---

## Phase 2: Gather Metadata

### Step 1 — Infer and confirm

Based on the session content, infer the following. Do not ask the user to define these — present your inferences for confirmation.

**Title**: Infer from the session topic. Choose something specific and memorable, not generic.

**Type**: Set to the command name if a thinking command was used (`blindspot`, `forum`, `premortem`, `horizon`, `conviction`, `succinct`). For freeform sessions, infer from session content:
- `synthesis` — session drawing together ideas from multiple threads or prior thinking
- `decision` — session where the primary output was a concrete commitment or choice
- `note` — shorter capture, idea, or reflection that does not fit the above

**Tags**: 2–4 concept-level labels drawn from the session. These should describe the underlying domain or problem type, not just the surface topic (e.g., "incentive design" not "pricing"; "organizational change" not "team restructure").

**If vault detects it was already run earlier in this conversation** (visible as a prior "Vaulted. Saved to..." confirmation in the conversation history), pre-populate the same title and tags from that prior entry and note:
> This looks like part of the same session — suggesting the same title and tags as your last vault entry. Adjust if needed.

Use `AskUserQuestion` to present all three as a single prompt:

> Here's what I'm thinking:
> - **Title**: "{suggested title}"
> - **Type**: {type}
> - **Tags**: {tag1, tag2}
>
> Any changes? If this looks right, just say "good" — or tell me what to adjust.

Wait for the user's response and incorporate any corrections before proceeding.

### Step 2 — Reflection

After the user confirms metadata, present this as plain text (not `AskUserQuestion`):

> One last thing — why does this session matter to you? Give me the rough version; I'll write it clean.

Accept whatever the user provides — a fragment, a few loose thoughts, a sentence or two. Do not re-prompt if they give something brief. You will write the polished version of this field in Phase 3.

---

## Phase 3: Extract

Do this work silently. Do not show your reasoning or intermediate steps. Produce the artifacts in Phase 4 directly.

**Determine extraction mode based on the confirmed session type:**
- **Command mode**: the session being vaulted used one of the five thinking commands (forum, premortem, horizon, conviction, succinct)
- **Freeform mode**: the session type is note, decision, or synthesis

---

### Command Mode (blindspot, forum, premortem, horizon, conviction, succinct)

Preserve the command output exactly as produced — verbatim, including all sections, tables, headers, and lists. Do not summarize, compress, or editorialize. The structured output is the artifact.

Extract the session arc fields:

**Input** — what the user brought to the command: the original argument, question, or idea they passed in.

**What shifted** — any refinements, clarifications, or changes that occurred during the session (back-and-forth before the output was produced). If nothing shifted, write "Nothing shifted materially — the command ran on the original input."

**Key conclusion** — extract command-specific, verbatim where possible:
- **blindspot** → the #1 Priority Gap + its corresponding Suggested Action
- **premortem** → the "If this fails, it's probably because…" sentence from the output
- **horizon** → the Predicted New Bottleneck from the New Bottleneck Prediction section
- **forum** → the Recommendation line + Consensus Signal (e.g., "Proceed with X. Consensus: Majority 3–1.")
- **conviction** → the Confidence Score + Decision Rule ("Act now if… / Wait if…")
- **succinct** → the Thesis sentence

**Themes** — 3–5 concept-level labels for longitudinal pattern detection. Choose labels that will be meaningful across dozens of future entries from different domains.

**Open questions** — unresolved items from the command output (e.g., unresolved assumptions in conviction, items flagged as uncertain in premortem). Write "None" if fully resolved.

**Key assumptions** — load-bearing beliefs from the command output's assumptions section, or inferred from the reasoning if no explicit assumptions section exists.

**Why it matters** — write a polished version of what the user provided in Phase 2 Step 2. Clean up the phrasing, sharpen the thought, preserve the user's intent. Keep it to 1–3 sentences.

---

### Freeform Mode (note, decision, synthesis)

Extract the following:

**Initial framing** — what did the user bring into the session? What was the question, idea, or problem as they originally stated it?

**What shifted** — what changed during the session? What was refined, challenged, or resolved that was not clear at the start? If nothing shifted materially, say so plainly.

**Key conclusion** — what was decided, resolved, or clarified by the end? If the session ended open, state that honestly.

**Full session summary** — a substantive narrative of the session. Write 150–300 words capturing what was discussed, the reasoning used, the key moves made, the tensions surfaced. Future-you should be able to read this and understand what happened without re-reading the full conversation.

**Themes** — 3–5 concept-level labels for longitudinal pattern detection.

**Open questions** — what remained unresolved at the end of the session. Write "None" if fully resolved.

**Key assumptions** — load-bearing beliefs the session's reasoning rested on that were not fully validated.

**Why it matters** — write a polished version of what the user provided in Phase 2 Step 2.

---

Then prepare the following for file writing:

- **Date**: Get today's date via `Bash`: `date +%Y-%m-%d`
- **Timestamp**: Get ISO 8601 timestamp via `Bash`: `date -u +"%Y-%m-%dT%H:%M:%SZ"`
- **Slug**: Lowercase title, spaces to hyphens, remove special characters, max 40 characters
- **Filename**: `{YYYYMMDD}_{type}_{slug}.md`
- **Entry ID**: Use `Bash` to count existing entries for today's date in the index:
  ```
  grep -c "\"date\":\"YYYY-MM-DD\"" {VAULT_PATH}/index.jsonl 2>/dev/null || echo 0
  ```
  (Replace `YYYY-MM-DD` with today's actual date.)
  NNN = count + 1, zero-padded to 3 digits. Format: `vault-{YYYYMMDD}-{NNN}`

---

## Phase 4: Write and Confirm

### Step 1: Create directories

Use `Bash`:
```
mkdir -p {VAULT_PATH}/artifacts
```

This runs every time vault is invoked. `mkdir -p` is idempotent — it creates the `artifacts/` subdirectory on the first run and does nothing on subsequent runs if it already exists. Markdown artifacts are always written into `{VAULT_PATH}/artifacts/`. The JSONL index lives directly in `{VAULT_PATH}/`, not inside `artifacts/`.

### Step 2: Write the Markdown artifact

Use `Write` to create `{VAULT_PATH}/artifacts/{filename}`.

**Command mode — use this format:**

```markdown
# {Title}

**Date**: {YYYY-MM-DD}
**Type**: {type}
**Tags**: {tag1, tag2}
**Source**: /{command}

---

## Session Arc

**Input**: {what the user brought to the command}

**What shifted**: {what changed, or "Nothing shifted materially — the command ran on the original input."}

**Conclusion**: {command-specific key conclusion extracted above}

---

## Command Output

{Full structured output from the thinking command, preserved verbatim}

---

## Extracted

**Themes**: {theme1, theme2, theme3}

**Open questions**:
{- question 1 (or "None")}

**Key assumptions**:
{- assumption 1}

---

## Why This Matters

{Polished version of user's reflection}

---

*Vaulted: {ISO 8601 timestamp}*
```

**Freeform mode — use this format:**

```markdown
# {Title}

**Date**: {YYYY-MM-DD}
**Type**: {type}
**Tags**: {tag1, tag2}
**Source**: {freeform conversation}

---

## Session Arc

**Initial framing**: {what the user brought into the session}

**What shifted**: {what changed, evolved, or resolved — or "nothing shifted materially" if applicable}

**Conclusion**: {what was decided, resolved, or clarified — or "open" if unresolved}

---

## Full Session Summary

{150–300 word narrative of the actual thinking}

---

## Extracted

**Themes**: {theme1, theme2, theme3}

**Open questions**:
{- question 1 (or "None")}

**Key assumptions**:
{- assumption 1}

---

## Why This Matters

{Polished version of user's reflection}

---

*Vaulted: {ISO 8601 timestamp}*
```

### Step 3: Append to the JSONL index

⚠️ **CRITICAL — READ BEFORE ACTING**: You MUST use `Bash` with `>>` for this step. **NEVER use the `Write` tool on `index.jsonl`** — the `Write` tool overwrites the entire file and permanently destroys all previous entries. This is the most common failure mode for this skill.

Use `Bash`:
```
echo '{...}' >> {VAULT_PATH}/index.jsonl
```

`>>` creates `index.jsonl` automatically on the first vault run if it does not yet exist, then appends to it on every subsequent run. No separate initialization step is needed. Each vault operation adds exactly one line to the file.

After appending, verify the write succeeded by reading back the last line:
```
tail -1 {VAULT_PATH}/index.jsonl
```
Confirm the output matches the entry you just wrote. If it does not match, surface an error to the user — do not proceed to Step 4.

The entry must be a single line, no pretty-printing, all string values properly JSON-escaped (no unescaped quotes or literal newlines):

```
{"id":"vault-YYYYMMDD-NNN","date":"YYYY-MM-DD","type":"...","title":"...","tags":["tag1","tag2"],"source_commands":["premortem"],"themes":["theme1","theme2","theme3"],"initial_framing":"...","what_shifted":"...","key_conclusion":"...","open_questions":["question1"],"key_assumptions":["assumption1"],"why_it_matters":"...","artifact_path":"artifacts/YYYYMMDD_type_slug.md"}
```

Field notes:
- `tags`: empty array `[]` if none
- `source_commands`: list of command names used, or `["freeform"]` if no structured commands
- `open_questions`: list of strings, or `[]` if none
- `themes`: distinct from tags — concept-level, longitudinal
- `key_conclusion`: use the command-specific extraction defined in Phase 3; for freeform mode, a brief sentence summarizing the conclusion
- All string values must be single-line, properly escaped JSON

### Step 4: Confirm

Output a plain-text confirmation (not `AskUserQuestion`):

> Vaulted. Saved to {VAULT_PATH}/artifacts/{filename}
> Index entry {id} appended to {VAULT_PATH}/index.jsonl

---

## Vault Principles

- **Capture, don't editorialize** — accurate preservation of what happened, not improvement of it. Do not add insights the session didn't produce.
- **Exact preservation for command outputs** — when vaulting a thinking-stack command, copy the structured output verbatim into "Command Output". Do not summarize, paraphrase, or compress. The structure is the value.
- **Infer, don't interrogate** — suggest title, type, and tags from session content; the user confirms or adjusts. Never ask them to define these from scratch.
- **Polish the reflection** — accept rough thoughts for "why it matters" and write the clean version. Meet the user where they are.
- **Silent extraction** — Phase 3 is internal work. Do not narrate the extraction process.
- **One confirmation gate** — confirm what's being vaulted in Phase 1. No further approval gates for the content of the artifacts.
- **JSONL is for machines** — compact single-line JSON only. The Markdown artifact is for humans; the JSONL is for future queries, pattern detection, and evolution tracking.
- **Themes are longitudinal** — choose theme labels that will be meaningful across dozens of future entries from different domains. Think about the pattern, not just the instance.

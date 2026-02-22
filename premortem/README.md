# /premortem — Adversarial Risk Analysis

Assume your idea has already failed — then work backward to find out why. The premortem surfaces failure causes, exposes false assumptions, and produces concrete tests and mitigations before you commit.

---

## Install

```bash
# From the repo root
./install.sh premortem

# Or manually
cp premortem/commands/premortem.md ~/.claude/commands/premortem.md
```

---

## Usage

```
/premortem [your idea or decision]
```

**Examples:**

```
/premortem Should we embed an internal agent that calls our lending APIs and give the agent to partners instead of REST APIs?
/premortem We're planning to rewrite our auth system from scratch over the next quarter
/premortem Launch a paid tier before we've validated willingness to pay
```

If your idea is vague, the command will ask up to 3 clarifying questions before proceeding.

---

## How It Works

### Phase 1: Intake & Readiness

The command assesses whether your idea has enough context for meaningful analysis. If not, it asks targeted clarifying questions (max 3). Once it understands the idea, it presents a **framing statement** — "It is [time horizon] later. [Idea] has failed." — and asks you to confirm before proceeding.

### Phase 2: Optional Research

For ideas with useful external analogues, the command runs 2–3 targeted web searches to surface real-world failure patterns and base rates for the domain. Skipped for purely internal or proprietary decisions.

### Phase 3: Analysis & Output

A full structured premortem covering:

- **Failure Headline** — how this ended, in one sentence
- **Top Failure Causes (10–14)** — with category, mechanism, and likelihood
- **Most Likely (Top 3)** — the failure paths most likely to materialize
- **Most Catastrophic (Top 2)** — hardest to recover from, regardless of probability
- **Assumptions That Proved False** — the beliefs that turned out to be wrong
- **Early Warning Signals** — observable leading indicators (4–12 weeks out)
- **Cheap Tests to Run Now** — low-cost experiments with pass/fail rules
- **Mitigations** — actions to take now, plus triggered responses if signals appear
- **"If this fails, it's probably because…"** — a single honest root cause

---

## Output Format

```
## Premortem: [Short Idea Title]

**Framing Statement**
*It is [time horizon] later. [Idea] has failed.*

### Failure Headline
[One punchy sentence]

### Top Failure Causes
| # | Cause | Category | Mechanism | Likelihood |
...

### Most Likely (Top 3)
### Most Catastrophic (Top 2)
### Assumptions That Proved False
### Early Warning Signals (4–12 weeks)
### Cheap Tests to Run Now
### Mitigations
  #### Do Now
  #### Triggered Actions (if signal appears)
### "If this fails, it's probably because…"
```

---

## When to Use It

Use `/premortem` when you:

- Are about to commit to a significant decision (architectural, strategic, financial)
- Have an idea that *feels* right but haven't stress-tested it
- Want to pressure-test assumptions before a stakeholder presentation
- Are planning a project and want to identify the highest-risk bets upfront

It complements `/forum` (multi-agent debate) — use `/forum` when you want to weigh pros and cons across expert perspectives, use `/premortem` when you want to stress-test a decision you're leaning toward.

---

## Requirements

- Claude Code (standard installation)
- No multi-agent tools required — single-agent, runs entirely in one session

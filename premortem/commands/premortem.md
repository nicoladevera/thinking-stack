---
description: Assume your idea has already failed — work backward to find out why
argument-hint: [your idea or decision]
allowed-tools: AskUserQuestion, WebSearch, WebFetch
---

# Premortem — Adversarial Risk Analysis

You are running a **premortem**: a structured risk analysis that assumes the idea or decision in `$ARGUMENTS` has already failed, then works backward to identify why. Your role is to surface failure causes before they happen — not to debate the idea's merit, but to stress-test its assumptions and expose its weak points.

The user invoked this with: $ARGUMENTS

---

## Phase 1: Intake & Readiness

Assess whether `$ARGUMENTS` gives you enough to run a meaningful premortem. You need: (1) what the idea or decision is, and (2) enough context to reason about how it might fail. You do not need a full business plan — a paragraph of context is sufficient.

**If the idea is too vague** (no clear action, no discernible domain, no hypothesis):
Use `AskUserQuestion` to ask up to 3 targeted clarifying questions. Only ask what's actually missing — do not ask all 3 if 1-2 are already clear:
1. What is the idea or decision you're evaluating?
2. What does success look like in 12–18 months?
3. Any constraints (budget, team, timeline, compliance) or prior thinking that matters?

**If the idea is ready**: proceed directly.

Once you have enough context, synthesize a **framing statement** in this form:

> It is [time horizon] later. [Idea/decision] has failed.

Present the framing statement to the user and wait for explicit confirmation before proceeding. If they correct or refine it, update accordingly.

---

## Phase 2: Optional Research

Before generating failure causes, assess whether external data would meaningfully improve the analysis. If so, use `WebSearch` and `WebFetch` (2–3 queries maximum) to surface:
- Real-world analogues of similar ideas or bets that failed
- Base rate data for the domain (e.g., "API partnership churn rate", "B2B SaaS integration failure patterns", "fintech regulatory enforcement trends")

Skip this step if the idea is purely internal/strategic with no useful external comparables, or if the domain is highly proprietary.

If you do research, briefly surface what you found before proceeding to analysis.

---

## Phase 3: Analysis & Output

Run the full premortem. Think adversarially — you are not the idea's advocate, you are its harshest critic. Your job is to find every credible way this fails.

Structure your output exactly as follows:

---

## Premortem: [Short Idea Title]

**Framing Statement**
*It is [time horizon] later. [Idea] has failed.*

---

### Failure Headline
One punchy sentence describing how this ended — the newspaper headline if this became a cautionary tale.

---

### Top Failure Causes

For each cause: include a **category** (e.g., Execution, Market, Technical, People, Regulatory, Financial, External), the **mechanism** (how exactly it unfolds into failure), and an **estimated likelihood** (High / Medium / Low).

Aim for 10–14 distinct causes. Cast a wide net — include execution failures, assumption failures, timing failures, competitor responses, internal organizational failures, and external shocks.

| # | Cause | Category | Mechanism | Likelihood |
|---|-------|----------|-----------|------------|
| 1 | ... | ... | ... | High |
| 2 | ... | ... | ... | Medium |
| ... | | | | |

---

### Most Likely (Top 3)

The 3 failure causes most likely to materialize, and why.

1. **[Cause]** — [1-2 sentences on why this is the most probable path to failure]
2. **[Cause]** — [1-2 sentences]
3. **[Cause]** — [1-2 sentences]

---

### Most Catastrophic (Top 2)

The 2 failure causes that would be hardest to recover from — even if they're lower probability.

1. **[Cause]** — [Why this is existential or severely damaging]
2. **[Cause]** — [Why this is existential or severely damaging]

---

### Assumptions That Proved False

The core beliefs underlying this idea that the postmortem revealed were wrong. Be specific — name the assumption, not just the outcome.

- [Assumption 1]: [What was believed vs. what turned out to be true]
- [Assumption 2]: [What was believed vs. what turned out to be true]
- [Assumption 3]: ...

---

### Early Warning Signals (4–12 Weeks)

Concrete, observable signals — things you could actually measure or notice — that would indicate this is heading toward failure. These are leading indicators, not lagging ones.

- [Signal 1]: [What to watch, why it matters]
- [Signal 2]: ...
- (4–8 signals)

---

### Cheap Tests to Run Now

Before fully committing, what low-cost experiments or checks would validate (or invalidate) the riskiest assumptions?

For each test: include **how to run it** and a **pass/fail rule** — what result would give you confidence vs. what result would make you pause or pivot.

| Test | How to Run | Pass | Fail |
|------|------------|------|------|
| [Test 1] | ... | ... | ... |
| [Test 2] | ... | ... | ... |
| (3–6 tests) | | | |

---

### Mitigations

#### Do Now
Actions to take immediately that reduce the probability or impact of the highest-risk failure causes.

- [Mitigation 1]
- [Mitigation 2]
- [Mitigation 3]

#### Triggered Actions
Actions to take only *if* a specific warning signal appears — not proactively, but as a pre-committed response.

- **If [signal]** → [action]
- **If [signal]** → [action]
- **If [signal]** → [action]

---

### If This Fails, It's Probably Because…

One sentence. The single root cause that, more than anything else, explains why this didn't work out. This should be honest and specific, not a hedge.

*"If this fails, it's probably because [root cause]."*

---

## Premortem Principles

- **Assume failure** — you are not evaluating whether the idea is good. You are explaining why the already-failed version failed.
- **Be specific** — vague concerns ("execution risk") are useless. Name the mechanism.
- **Separate probability from severity** — a low-probability catastrophic failure deserves as much attention as a high-probability mild failure.
- **Name the assumptions** — the most valuable output is often the list of things the team believed that turned out to be wrong.
- **Produce actionable output** — every identified failure cause should connect to a test, a signal, or a mitigation.

---
description: Turn a belief or decision into an epistemic audit — assumptions, evidence, confidence, and falsifying tests
argument-hint: [your belief, claim, or decision]
allowed-tools: AskUserQuestion, WebSearch, WebFetch
---

# Conviction — Epistemic Belief Audit

You are running a **conviction audit**: a structured epistemic analysis that takes a belief, claim, or decision in `$ARGUMENTS` and turns it into a falsifiable scorecard — mapping assumptions, weighing evidence, scoring confidence, and designing the cheapest test that could prove you wrong.

The user invoked this with: $ARGUMENTS

---

## Phase 1: Intake & Readiness

Assess whether `$ARGUMENTS` contains a clear belief or claim. You need: (1) a stated belief, claim, or decision, and (2) enough context to reason about what would make it true or false.

**If the input is too thin** (no discernible claim, purely emotional, no domain context):
Use `AskUserQuestion` to ask up to 3 targeted clarifying questions. Only ask what's actually missing:
1. What is the belief or claim you're trying to evaluate?
2. What domain or context does this apply to? (e.g., your team, a product, a market, a personal decision)
3. What are the stakes or time window, if relevant? (low/medium/high — helps calibrate how much rigor to apply)

**If the input is ready**: proceed directly.

Once you have enough context, restate the claim in **falsifiable form** — a precise statement that could, in principle, be shown to be true or false. Surface it before proceeding (no confirmation required — just present it and move on):

> **Claim (falsifiable):** [Precise, falsifiable restatement of the belief]

---

## Phase 2: Research (Optional, Targeted)

Determine whether external data would meaningfully ground the analysis: base rates, analogous comparisons, published benchmarks, or documented evidence relevant to the claim.

If yes: run 2–3 targeted `WebSearch` / `WebFetch` queries. Surface relevant findings in a brief paragraph before the audit. Focus on:
- Empirical data or benchmarks directly bearing on the claim
- Analogous cases where similar beliefs were tested and what the outcome was
- Known base rates for the domain (e.g., adoption rates, failure rates, performance benchmarks)

If the belief is purely internal or subjective with no meaningful external comparables: skip this step entirely.

If you do research, briefly surface what you found before proceeding to the audit.

---

## Phase 3: Conviction Audit

Run the full structured audit. Be rigorous and honest — your job is not to validate the belief but to map its epistemic terrain accurately.

Structure your output exactly as follows:

---

## Conviction Audit: [Short Claim Title]

---

## Claim (falsifiable)
[The belief restated as a precise, falsifiable statement — something that could be shown to be true or false with sufficient evidence]

---

## Assumptions

### Core (must be true)
The beliefs that, if false, would immediately invalidate the claim. These are load-bearing — the claim collapses without them.

- [Assumption]: [Why the claim depends on this]
- [Assumption]: [Why the claim depends on this]
- (2–4 core assumptions)

### Supporting
Beliefs that strengthen the claim but whose failure would weaken rather than destroy it.

- [Assumption]: [How it supports the claim]
- [Assumption]: [How it supports the claim]
- (2–5 supporting assumptions)

---

## Evidence

### For
Concrete observations, data points, or experiences that support the claim. Be specific — general impressions don't count.

- [Evidence]: [Why this supports the claim]
- [Evidence]: [Why this supports the claim]

### Against
Evidence that cuts against the claim, or patterns that are hard to explain if the claim is true.

- [Evidence]: [Why this complicates the claim]
- [Evidence]: [Why this complicates the claim]

### Unknown / needs data
Key questions where you lack evidence and the answer would meaningfully update your confidence.

- [Unknown]: [What data would resolve this]
- [Unknown]: [What data would resolve this]

---

## Confidence Score

- **Score: __/100**
- Rationale:
  - [Bullet: what's driving confidence up]
  - [Bullet: what's driving it down]
  - [Bullet: what's creating the most uncertainty]
  - [Optional 4th bullet if warranted]

---

## What Would Change My Mind

Specific, concrete conditions that would cause you to revise this belief downward (or upward). Vague answers ("if I saw enough evidence") don't count — name the evidence.

- **Lower my confidence significantly:** [Specific finding or outcome]
- **Lower my confidence significantly:** [Specific finding or outcome]
- **Raise my confidence significantly:** [Specific finding or outcome]
- **Cause me to abandon the claim:** [The specific thing that would falsify it]

---

## Tests

### 48-Hour Test
A concrete experiment or data-gathering action completable within 48 hours that would meaningfully update confidence in the claim.

| Test | How to Run | Pass (supports claim) | Fail (challenges claim) |
|------|------------|----------------------|------------------------|
| [Test name] | [Specific steps] | [What result looks like] | [What result looks like] |
| [Test name] | [Specific steps] | [What result looks like] | [What result looks like] |

### 2-Week Test
A slightly deeper experiment or structured observation requiring 1–2 weeks that would provide stronger evidence.

| Test | How to Run | Pass (supports claim) | Fail (challenges claim) |
|------|------------|----------------------|------------------------|
| [Test name] | [Specific steps] | [What result looks like] | [What result looks like] |
| [Test name] | [Specific steps] | [What result looks like] | [What result looks like] |

---

## Decision Rule

- **Act now if:** [Conditions under which the current evidence is sufficient to act]
- **Wait if:** [Conditions under which gathering more evidence is worth the delay]

---

## Phase 4: Drill-Down Offer

After delivering the audit, present this as plain text (not `AskUserQuestion`):

> Want to go deeper? I can:
> - Revisit a specific assumption and stress-test it further
> - Steelman the opposing view
> - Design an additional test for the hardest-to-resolve unknown
>
> Just tell me what you'd like to explore, or type "done" to wrap up.

If the user engages with a follow-up, address the specific request — revisit an assumption, steelman the opposing view, or design a targeted test. Keep drill-downs scoped; do not re-run the full audit.

If the user says "done" or signals they're finished, close cleanly with 1–2 sentences max.

---

## Conviction Principles

- **State the claim precisely** — vague beliefs can't be falsified; if you can't state what would prove it wrong, you don't have a belief, you have a preference
- **Separate assumptions from evidence** — what you believe vs. what you've observed are different epistemic categories; conflating them inflates confidence
- **Disconfirmation over confirmation** — the most valuable test is the one that could prove you wrong; a test that can only confirm is not a test
- **Confidence is not certainty** — a score of 70 means 30% chance you're wrong; calibrate your actions to that uncertainty, not just the majority case
- **The smallest test wins** — if a 2-hour experiment can resolve a $100K decision, do it first; information has asymmetric value before commitment

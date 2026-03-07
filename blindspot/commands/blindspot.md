---
description: Audit what's absent from your idea and your thinking before committing to a direction
argument-hint: [your idea, plan, or decision]
allowed-tools: AskUserQuestion, WebSearch, WebFetch
---

# Blindspot — Gap Analysis for Ideas and Thinking

You are running a **blindspot audit**: a structured analysis that surfaces what's missing from both the idea itself and the thinking behind it. Your role is not to evaluate whether the idea is good or bad — it is to map what's outside the current frame: unexplored assumptions, absent perspectives, unexamined dimensions, and cognitive patterns that may be shaping what gets seen and what doesn't.

The user invoked this with: $ARGUMENTS

---

## Phase 1: Intake & Readiness

Assess whether `$ARGUMENTS` gives you something to audit. The bar is low — you need: (1) something to examine (an idea, plan, decision, problem framing, or question), and (2) enough context to understand the domain and what the user is trying to do. Vague or early-stage input is fine; even an undeveloped idea has a frame that can be audited.

**If the input is too thin** (no discernible idea, domain, or direction):
Use `AskUserQuestion` to ask 1–2 targeted clarifying questions. Only ask what's actually missing:
1. What are you thinking about — what's the idea, decision, or question you want to audit?
2. What's the decision or outcome at stake, if any?

**If the input is ready**: proceed directly.

Once you have enough context, synthesize a **Subject Statement** — 1 sentence stating exactly what's being audited. Surface it to the user before proceeding (no confirmation gate required — just present it and move on):

> **Auditing:** [1 sentence stating the idea, plan, or decision being examined]

---

## Phase 2: Research (Optional, Targeted)

Determine whether external grounding would surface gaps that analysis alone would miss: competitive context, analogous situations, domain base rates, known failure modes, or relevant precedents the user may not have considered.

If yes: run 2–3 targeted `WebSearch` / `WebFetch` queries. Surface relevant findings in a brief paragraph before analysis begins. Focus on:
- How similar ideas have played out in analogous contexts
- Known blind spots or failure patterns in this domain
- External factors (market, regulatory, competitive) that frequently go unexamined in this type of decision

If the subject is purely internal, personal, or has no meaningful external comparables: skip this step entirely.

---

## Phase 3: Blindspot Audit

Run the full structured audit. Your job is to surface what's missing — not to argue against the idea, evaluate its merits, or advocate for a different position. Each section targets a distinct category of gap.

Structure your output exactly as follows:

---

## Blindspot Audit: [Short Title]

---

### Frame Audit

The current framing in one sentence: [State how the idea/decision is currently framed — what question it's answering, what problem it's solving for.]

**Alternative framings to consider:**

- **[Framing 1]:** [State the alternative framing] — [1–2 sentences on what changes if this is the right frame: what becomes important, what becomes irrelevant, what different questions emerge]
- **[Framing 2]:** [State the alternative framing] — [What changes]
- **[Framing 3, if applicable]:** [State the alternative framing] — [What changes]

The goal is not to argue these framings are correct — it's to make visible that a framing choice was made and what it might be costing.

---

### Unexplored Assumption Inventory

The load-bearing beliefs operating under the surface of this idea that haven't been consciously named. These are not the same as assumptions you've already surfaced — these are the ones you didn't know you were making.

For each assumption: name it precisely, then explain why it's load-bearing (what collapses if it's false).

- **[Assumption]:** [Why it's load-bearing — what the idea depends on this being true]
- **[Assumption]:** [Why it's load-bearing]
- **[Assumption]:** [Why it's load-bearing]
- (3–5 assumptions total)

---

### Missing Perspectives

Stakeholders, viewpoints, or affected parties that are relevant to this idea but absent from the analysis. This is not a debate — it is an inventory of who's not in the room and why that absence is a gap.

For each: name who is missing and state specifically what they would add or how their absence distorts the analysis.

- **[Who is missing]:** [What they see that the current analysis doesn't — what their interests, constraints, or knowledge would surface]
- **[Who is missing]:** [What they add]
- **[Who is missing, if applicable]:** [What they add]

---

### Dimension Audit

Assess coverage across the analytical dimensions that are *relevant* to this specific idea. Do not include dimensions that simply don't apply — exclude them entirely. A missing row means not applicable, not overlooked.

| Dimension | Coverage | Notes |
|-----------|----------|-------|
| [Dimension] | Well-covered / Underexplored / Absent | [Required if Underexplored or Absent: 1 sentence on what's missing and why it matters] |

Dimension candidates to consider (include only those that apply):
- **Financial** — costs, unit economics, revenue model, funding requirements
- **Technical** — feasibility, dependencies, architecture, debt
- **Competitive** — market dynamics, substitutes, competitor response
- **Operational** — execution capacity, process changes, tooling
- **Temporal** — timing, sequencing, long-range consequences
- **Regulatory / Legal** — compliance, liability, policy exposure
- **Cultural / Organizational** — team dynamics, change management, incentive alignment
- **Ethical** — fairness, unintended harm, externalities

---

### Cognitive Posture Flags

Based on how this idea is framed and the language used to describe it, these reasoning patterns appear to be at work. Each flag is grounded in something specific in the input — not a generic checklist applied from the outside.

Frame each flag analytically: "this framing suggests..." or "the emphasis on X without mention of Y may indicate..." — not "you are biased toward..."

- **[Flag]:** [What in the framing or language suggests this pattern is at work — be specific]
- **[Flag]:** [What specific signal points to this]
- (2–4 flags total; only include flags with genuine grounding in the input)

---

### Priority Gaps

The 3 most consequential gaps across all categories above. Ranked by impact: which gaps, if unaddressed, would most undermine the idea's chances of success or most distort the decision being made.

1. **[Gap]:** [Why this is the highest-priority gap — what's at stake if it remains unaddressed]
2. **[Gap]:** [Why this matters most after the first]
3. **[Gap]:** [Why this rounds out the top three]

---

## Phase 4: Drill-Down Offer

After delivering the audit, present this as plain text (not `AskUserQuestion` — the user needs open-ended input):

> Want to go deeper? I can:
> - Stress-test a specific assumption from the inventory
> - Explore one of the alternative framings in more depth
> - Examine a missing perspective in detail
>
> Just tell me what you'd like to explore, or type "done" to wrap up.

If the user engages with a follow-up, address the specific request — revisit a framing, pressure-test an assumption, or examine a missing perspective in depth. Keep drill-downs scoped; do not re-run the full audit.

If the user says "done" or signals they're finished, close cleanly with 1–2 sentences max.

---

## Blindspot Principles

- **Read the frame before reading the content** — the most important gap is often that the wrong question is being answered; always audit the framing before auditing what's inside it
- **Surface, don't argue** — the job is to name what's missing, not to advocate for a different position; the user decides what to do with the gaps
- **Separate idea gaps from thinking gaps** — sections 1–4 surface content the idea hasn't addressed; section 5 surfaces how the thinking itself may be shaped; both categories matter and should stay distinct
- **Dimension audit filters for relevance first** — a dimension isn't "absent" if it doesn't apply to this idea; only include dimensions where absence is genuinely a gap
- **Cognitive posture flags must be grounded** — connect each flag to something specific in how the user framed the input; generic bias lists applied without evidence are noise, not insight
- **The assumption inventory surfaces the pre-conscious** — conviction audits assumptions you've already surfaced in a belief you've formed; blindspot finds what you didn't know you were assuming before you formed it

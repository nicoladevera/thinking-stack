# /blindspot — Gap Analysis for Ideas and Thinking

You're thinking clearly about the thing in front of you — but you may be asking the wrong question, missing a stakeholder who matters, or operating on an assumption you don't know you're making. `/blindspot` surfaces what's outside your current frame: gaps in the idea and gaps in the thinking, across five structured categories.

---

## Install

```bash
# From the repo root
./install.sh blindspot

# Or manually
cp blindspot/commands/blindspot.md ~/.claude/commands/blindspot.md
```

---

## Usage

```
/blindspot [your idea, plan, or decision]
```

**Examples:**

```
/blindspot We're planning to launch a self-serve tier to drive bottom-up adoption in enterprise accounts
/blindspot I think we should consolidate our three data pipelines into a single platform team-owned system
/blindspot We're considering replacing our annual review cycle with continuous feedback and quarterly check-ins
```

The input can be early-stage or fully formed — the command works at any level of development. If the input is too vague to audit, it will ask 1–2 targeted clarifying questions before proceeding.

---

## How It Works

### Phase 1: Intake & Readiness

The command assesses whether there's enough context to run a meaningful audit. The bar is low — it needs something to examine, not a complete plan. If the input is too thin, it asks 1–2 clarifying questions. Once ready, it synthesizes a one-sentence Subject Statement and proceeds without a confirmation gate.

### Phase 2: Research (Optional, Targeted)

If external context would surface gaps the analysis alone would miss — analogous situations, domain failure patterns, competitive dynamics — the command runs 2–3 targeted web queries before analysis. If the subject is internal or has no meaningful external comparables, this step is skipped.

### Phase 3: Blindspot Audit

The core five-section analysis, run in full. Each section targets a distinct category of gap.

### Phase 4: Drill-Down

After the audit, the command offers to go deeper on any specific gap: stress-test an assumption, explore an alternative framing, or examine a missing perspective in detail.

---

## Output Format

```
## Blindspot Audit: [Short Title]

### Frame Audit
The current framing in one sentence.

Alternative framings to consider:
- [Framing 1]: [What it is] — [What changes if this is the right frame]
- [Framing 2]: [What it is] — [What changes]

### Unexplored Assumption Inventory
- [Assumption]: [Why it's load-bearing — what the idea depends on this being true]
- [Assumption]: [Why it's load-bearing]
- (3–5 assumptions)

### Missing Perspectives
- [Who is missing]: [What they see that the current analysis doesn't]
- [Who is missing]: [What they add]

### Dimension Audit
| Dimension | Coverage | Notes |
|-----------|----------|-------|
| [Relevant dimension] | Well-covered / Underexplored / Absent | [Notes if underexplored or absent] |
(Only dimensions relevant to this specific idea — irrelevant ones excluded)

### Cognitive Posture Flags
- [Flag]: [What in the framing or language suggests this pattern is at work]
- [Flag]: [Specific signal]
(2–4 flags, each grounded in something specific in the input)

### Priority Gaps
1. [Gap]: [Why this is the most consequential unaddressed gap]
2. [Gap]: [Why this matters most after the first]
3. [Gap]: [Why this rounds out the top three]
```

---

## When to Use It

Use `/blindspot` when you:

- Are early in thinking about something and want to know what you're not seeing before forming a strong view
- Have just finished a forum, premortem, or conviction session and want to audit what the whole analysis may have missed
- Feel confident about a direction but want a structured check on that confidence before committing
- Are about to present or act and realize you may have been thinking inside a frame you never questioned

---

## Requirements

- Claude Code (standard installation)
- Optional web research for external grounding — no multi-agent coordination required

# Thinking Stack

A structured decision-making framework implemented as composable commands.
It helps you expand perspective, pressure-test assumptions, model long-term consequences, clarify conviction, and communicate with precision.

This is not a prompt collection.
It's a disciplined reasoning system designed to strengthen judgment under complexity.

---

Modern work moves fast, but thinking should not become shallow.
**thinking-stack** exists to slow down the right parts: assumptions, incentives, second-order effects, and tradeoffs.
It is a lightweight cognitive infrastructure for making better decisions — deliberate, rigorous, and communicable.

---

## The Five Commands

Each command targets a distinct reasoning capability. Together they cover the full arc from belief to action.

| Command | Reasoning Role | Description |
|---------|---------------|-------------|
| [`/conviction`](./conviction/README.md) | Clarify what you believe | Epistemic audit — map assumptions, weigh evidence, score confidence, design the cheapest falsifying test |
| [`/forum`](./forum/README.md) | Expand perspective | Multi-agent council debate — spawn expert agents to pressure-test an idea through structured rounds |
| [`/premortem`](./premortem/README.md) | Stress-test the decision | Adversarial risk analysis — assume the idea has already failed, work backward to find out why |
| [`/horizon`](./horizon/README.md) | Model consequences | Long-range consequence mapping — trace causal chains forward across time bands, surface incentive shifts and scaling failures |
| [`/succinct`](./succinct/README.md) | Communicate with precision | Compression to executive artifact — one thesis, three pillars, one tradeoff, one metric, one decision ask |

---

## When to Use Which

| Question you're asking | Command |
|------------------------|---------|
| How much should I trust what I think I know? | `/conviction` |
| Is this a good idea? | `/forum` |
| What could go wrong? | `/premortem` |
| What does this set in motion? | `/horizon` |
| How do I make this land? | `/succinct` |

---

## How They Compose

The commands work standalone, but they also chain naturally. A typical reasoning arc:

```
conviction → forum → premortem → horizon → succinct
 audit the    debate     stress-test   map the       compress
 belief       the idea   the decision  consequences  for action
```

You don't need all five every time. Common combinations:

- **conviction → forum** — audit a belief, then open it to multi-perspective debate
- **forum → premortem** — debate an idea, then assume the winning direction fails
- **premortem → horizon** — stress-test a decision, then trace its long-range consequences
- **horizon → succinct** — map what a decision sets in motion, then compress the recommendation for stakeholders

---

## Installation

### Prerequisites

- [Claude Code](https://claude.ai/code) installed and configured
- `/forum` requires multi-agent tools (`TeamCreate`, `SendMessage`, `Task`) — available in standard Claude Code installations
- All other commands are single-agent and work out of the box

### Install

```bash
git clone https://github.com/nicoladevera/thinking-stack.git
cd thinking-stack

# Install all commands
./install.sh

# Install a specific command
./install.sh forum
```

Or copy manually:

```bash
cp forum/commands/forum.md ~/.claude/commands/forum.md
```

Commands are available immediately — no restart required. Invoke them in Claude Code with `/command-name`.

---

## Adding Your Own

Each command follows the same structure:

```
command-name/
├── README.md
└── commands/
    └── command-name.md
```

The `.md` file supports Claude Code frontmatter (`description`, `argument-hint`, `allowed-tools`) and full markdown prompt content. See any existing command for the pattern.

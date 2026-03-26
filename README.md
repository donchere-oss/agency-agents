# Agency Agents

A collection of specialized Claude Code sub-agents for common software engineering roles.

## Setup

Copy agents to your Claude Code agents directory:

```bash
cp -r agents/* ~/.claude/agents/
```

## Available Agents

| Agent | Best for |
|-------|----------|
| **Frontend Developer** | React, TypeScript, CSS, UI components, state management |
| **Backend Developer** | APIs, databases, authentication, server-side services |
| **Code Reviewer** | PR reviews, security audits, correctness checks |
| **DevOps Engineer** | Docker, Kubernetes, CI/CD, Terraform, cloud deployments |
| **Debugger** | Diagnosing bugs, reading stack traces, root cause analysis |
| **Technical Writer** | READMEs, API docs, how-to guides, architecture docs |

## Usage

Once copied, activate any agent in your Claude Code session:

```
Hey Claude, activate Frontend Developer mode and help me build a React component
```

Or reference the agent by name in your prompt:

```
Use the Debugger agent to help me understand this stack trace
```

## Adding Your Own Agents

Create a new `.md` file in `~/.claude/agents/` with this structure:

```markdown
---
name: Agent Name
description: One-line description of when to use this agent.
---

Your system prompt here. Define the agent's expertise, behavior, and guidelines.
```

The `description` field helps Claude decide when to automatically invoke the agent.

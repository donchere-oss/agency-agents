# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a pure Markdown repository — no build system, no dependencies, no tests. It distributes specialized Claude Code sub-agents as `.md` files.

## Installation

```bash
cp -r agents/* ~/.claude/agents/
```

## Agent File Structure

Each file in `agents/` follows this format:

```markdown
---
name: Agent Name
description: One-line description of when to auto-invoke this agent.
---

System prompt body defining expertise, procedures, and principles.
```

- The `description` frontmatter controls when Claude automatically routes to the agent.
- Agent files are self-contained — no cross-dependencies between them.

## Adding a New Agent

Create a new `.md` file in `agents/` following the pattern above. Existing agents serve as templates. The six current agents cover: frontend, backend, code review, debugging, DevOps, and technical writing.

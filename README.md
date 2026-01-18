# AI-Link

[中文文档](README_CN.md)

Unified configuration manager for AI coding assistants. Edit one file, sync to all your AI tools.

## Supported Tools

| Tool | Instructions | Skills | Agents | Rules | Commands | Prompts |
|------|:------:|:------:|:------:|:-----:|:--------:|:-------:|
| Claude Code | ✓ | ✓ | | | ✓ | |
| Cursor | ✓ | ✓ | | | | ✓ |
| GitHub Copilot | ✓ | | | | | |
| Factory Droid | ✓ | | | | | |
| Gemini CLI | ✓ | ✓ | | | ✓ | |
| Windsurf | ✓ | ✓ | ✓ | ✓ | | |
| Kiro | ✓ | | ✓ | | | |
| Qodo | ✓ | | ✓ | | | |
| Antigravity | ✓ | ✓ | | | ✓ | |
| Continue | ✓ | | | ✓ | | ✓ |
| Cline | ✓ | | | ✓ | | ✓ |
| Roo Code | ✓ | | | ✓ | | |
| Sourcegraph Cody | ✓ | | | | ✓ | |
| CodeGPT | ✓ | | | | | ✓ |
| GPT Engineer | ✓ | | | | | ✓ |
| Smol Developer | ✓ | | | | | ✓ |
| Amp | ✓ | | | | | |
| Trae | ✓ | | | | | |
| OpenCode | ✓ | | | | | |
| OpenAI Codex | ✓ | | | | | |
| Aider | ✓ | | | | | |
| Codeium | ✓ | | | | | |
| TabNine | ✓ | | | | | |
| Zed | ✓ | | | | | |
| Aide | ✓ | | | | | |
| PearAI | ✓ | | | | | |
| Supermaven | ✓ | | | | | |
| CodeStory | ✓ | | | | | |
| Double | ✓ | | | | | |
| Blackbox AI | ✓ | | | | | |
| Amazon Q | ✓ | | | | | |
| Copilot Workspace | ✓ | | | | | |
| Goose AI | ✓ | | | | | |
| Mentat | ✓ | | | | | |
| Melty | ✓ | | | | | |
| Void | ✓ | | | | | |
| Qoder | ✓ | | | | | |

## Installation

### npm / pnpm / yarn / bun

```bash
npm install -g ai-link
# or
pnpm add -g ai-link
# or
yarn global add ai-link
# or
bun add -g ai-link
```

### curl

```bash
curl -fsSL https://raw.githubusercontent.com/nanxiaobei/ai-link/main/install.sh | bash
```

## Usage

### First run

```bash
ai-link
```

This will:
1. Scan your system for installed AI tools
2. Backup original configs to `~/.ai-config/backups/`
3. Merge instructions/skills/agents/rules/commands/prompts from all tools
4. Create symlinks from each tool's config to shared directories

### Edit instructions

```
~/.ai-config/instructions.md
```

Changes take effect immediately - all tools read the same file via symlinks.

### Add a skill

```
~/.ai-config/skills/my-skill.md
```

The skill will be available in all tools that support skills.

### Commands

| Command | Description |
|---------|-------------|
| `ai-link` | Scan, merge and update symlinks (default) |
| `ai-link status` | Show symlink status |
| `ai-link list` | List supported tools |
| `ai-link backups` | List available backups |
| `ai-link restore <tool>` | Restore a tool's original config |
| `ai-link restore all` | Restore all tools |
| `ai-link add <type> <file>` | Add a skill/agent/rule/command/prompt |
| `ai-link custom <dir> [file]` | Add a custom tool |
| `ai-link upgrade` | Upgrade ai-link to latest version |
| `ai-link uninstall` | Completely remove ai-link |
| `ai-link version` | Show version |
| `ai-link help` | Show help |

### Add skill/agent/rule/command/prompt

```bash
ai-link add skill my-skill.md      # Add a skill
ai-link add agent my-agent.md      # Add an agent
ai-link add rule my-rule.md        # Add a rule
ai-link add command my-cmd.md      # Add a command
ai-link add prompt my-prompt.md    # Add a prompt
```

### Add custom tool

```bash
ai-link custom .mytool                   # With default instructions.md
ai-link custom .mytool INSTRUCTIONS.md   # With custom file
```

## How it works

```
~/.ai-config/
├── instructions.md  <- Your instructions (edit this)
├── skills/          <- Shared skills (merged from all tools)
├── agents/          <- Shared agents
├── rules/           <- Shared rules
├── commands/        <- Shared slash commands
├── prompts/         <- Shared prompt templates
└── backups/         <- Original configs (backup)

Each AI tool's config directory contains symlinks:

~/.claude/
├── CLAUDE.md -> ~/.ai-config/instructions.md  (symlink)
├── skills/   -> ~/.ai-config/skills/          (symlink)
└── commands/ -> ~/.ai-config/commands/        (symlink)

~/.cursor/
├── rules/global.md -> ~/.ai-config/instructions.md (symlink)
├── skills/         -> ~/.ai-config/skills/         (symlink)
└── prompts/        -> ~/.ai-config/prompts/        (symlink)

... and more tools
```

## Merge behavior

When you run `ai-link`, it merges items from all tools by filename:

- Cursor has skills: `react.md`, `typescript.md`
- Claude has skills: `typescript.md`, `python.md`
- Result in `~/.ai-config/skills/`: `react.md`, `typescript.md`, `python.md`

The first file found wins (dedup by filename).

## Uninstall

```bash
ai-link uninstall
```

This will:
1. Restore all tools to their original configuration
2. Remove `~/.ai-config` directory
3. Remove `ai-link` command

If installed via npm:

```bash
ai-link uninstall
npm uninstall -g ai-link
```

## Example instructions.md

```markdown
# AI Assistant Instructions

- Use pnpm as the package manager
- Reply in English
- Follow existing code style
- Use TypeScript with `type` for type definitions
```

## License

MIT

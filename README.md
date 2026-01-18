# AI Config

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
npm install -g ai-config
# or
pnpm add -g ai-config
# or
yarn global add ai-config
# or
bun add -g ai-config
```

### curl

```bash
curl -fsSL https://raw.githubusercontent.com/nanxiaobei/ai-config/main/install.sh | bash
```

## Usage

### First run

```bash
ai-config
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

### Commands

| Command | Description |
|---------|-------------|
| `ai-config` | Scan, merge and update symlinks (default) |
| `ai-config status` | Show symlink status |
| `ai-config list` | List supported tools |
| `ai-config backups` | List available backups |
| `ai-config restore <tool>` | Restore a tool's original config |
| `ai-config restore all` | Restore all tools |
| `ai-config skill <source>` | Add a skill (file or GitHub repo) |
| `ai-config agent <source>` | Add an agent |
| `ai-config rule <source>` | Add a rule |
| `ai-config command <source>` | Add a command |
| `ai-config prompt <source>` | Add a prompt |
| `ai-config upgrade` | Upgrade to latest version |
| `ai-config uninstall` | Completely remove ai-config |
| `ai-config version` | Show version |
| `ai-config help` | Show help |

### Add skill/agent/rule/command/prompt

```bash
# From local file
ai-config skill react.md
ai-config agent coder.md

# From GitHub repo (clone all .md files)
ai-config skill user/repo
ai-config skill https://github.com/user/repo

# From GitHub subdirectory
ai-config skill user/repo/skills

# From GitHub single file
ai-config skill user/repo/skills/react.md
```

## How it works

```
~/.ai-config/
├── instructions.md  <- Shared instructions (edit this)
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

When you run `ai-config`, it merges items from all tools by filename:

- Cursor has skills: `react.md`, `typescript.md`
- Claude has skills: `typescript.md`, `python.md`
- Result in `~/.ai-config/skills/`: `react.md`, `typescript.md`, `python.md`

The first file found wins (dedup by filename).

## Uninstall

```bash
ai-config uninstall
```

This will:
1. Restore all tools to original configuration
2. Remove `~/.ai-config` directory
3. Remove `ai-config` command

If installed via npm:

```bash
ai-config uninstall
npm uninstall -g ai-config
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

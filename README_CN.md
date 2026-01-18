# AI-Link

[English](README.md)

AI 编程助手统一配置管理器。编辑一个文件，同步到所有 AI 工具。

## 支持的工具

| 工具 | Instructions | Skills | Agents | Rules | Commands | Prompts |
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

## 安装

### npm / pnpm / yarn / bun

```bash
npm install -g ai-link
# 或
pnpm add -g ai-link
# 或
yarn global add ai-link
# 或
bun add -g ai-link
```

### curl

```bash
curl -fsSL https://raw.githubusercontent.com/nanxiaobei/ai-link/main/install.sh | bash
```

## 使用方法

### 首次运行

```bash
ai-link
```

这将会：
1. 扫描系统中已安装的 AI 工具
2. 备份原始配置到 `~/.ai-config/backups/`
3. 合并所有工具的 instructions/skills/agents/rules/commands/prompts
4. 创建从各工具配置到共享目录的软链

### 编辑指令

```
~/.ai-config/instructions.md
```

修改立即生效 - 所有工具通过软链读取同一文件。

### 添加技能

```
~/.ai-config/skills/my-skill.md
```

该技能会自动同步到所有支持 skills 的工具。

### 命令列表

| 命令 | 说明 |
|------|------|
| `ai-link` | 扫描、合并并更新软链（默认） |
| `ai-link status` | 显示软链状态 |
| `ai-link list` | 列出支持的工具 |
| `ai-link backups` | 列出可用的备份 |
| `ai-link restore <tool>` | 恢复某个工具的原始配置 |
| `ai-link restore all` | 恢复所有工具 |
| `ai-link add <type> <file>` | 添加 skill/agent/rule/command/prompt |
| `ai-link custom <dir> [file]` | 添加自定义工具 |
| `ai-link upgrade` | 升级 ai-link 到最新版本 |
| `ai-link uninstall` | 彻底卸载 ai-link |
| `ai-link version` | 显示版本号 |
| `ai-link help` | 显示帮助 |

### 添加 skill/agent/rule/command/prompt

```bash
ai-link add skill my-skill.md      # 添加技能
ai-link add agent my-agent.md      # 添加代理
ai-link add rule my-rule.md        # 添加规则
ai-link add command my-cmd.md      # 添加命令
ai-link add prompt my-prompt.md    # 添加提示词
```

### 添加自定义工具

```bash
ai-link custom .mytool                   # 使用默认 instructions.md
ai-link custom .mytool INSTRUCTIONS.md   # 使用自定义文件
```

## 工作原理

```
~/.ai-config/
├── instructions.md  <- 你的指令（编辑这个）
├── skills/          <- 共享技能（从所有工具合并）
├── agents/          <- 共享代理
├── rules/           <- 共享规则
├── commands/        <- 共享斜杠命令
├── prompts/         <- 共享提示词模板
└── backups/         <- 原始配置（备份）

各 AI 工具的配置目录中存放软链：

~/.claude/
├── CLAUDE.md -> ~/.ai-config/instructions.md  (软链)
├── skills/   -> ~/.ai-config/skills/          (软链)
└── commands/ -> ~/.ai-config/commands/        (软链)

~/.cursor/
├── rules/global.md -> ~/.ai-config/instructions.md (软链)
├── skills/         -> ~/.ai-config/skills/         (软链)
└── prompts/        -> ~/.ai-config/prompts/        (软链)

... 以及更多工具
```

## 合并行为

运行 `ai-link` 时，会按文件名合并所有工具的内容：

- Cursor 有 skills: `react.md`, `typescript.md`
- Claude 有 skills: `typescript.md`, `python.md`
- 合并结果 `~/.ai-config/skills/`: `react.md`, `typescript.md`, `python.md`

先发现的文件优先（按文件名去重）。

## 卸载

```bash
ai-link uninstall
```

这将会：
1. 恢复所有工具的原始配置
2. 删除 `~/.ai-config` 目录
3. 移除 `ai-link` 命令

如果通过 npm 安装：

```bash
ai-link uninstall
npm uninstall -g ai-link
```

## instructions.md 示例

```markdown
# AI 代码助手指令

- 使用 pnpm 作为包管理工具
- 必须使用中文回复
- 保持现有代码风格
- 使用 TypeScript，必须使用 type 定义类型
```

## 许可证

MIT

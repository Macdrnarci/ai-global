# AI Config

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
npm install -g ai-config
# 或
pnpm add -g ai-config
# 或
yarn global add ai-config
# 或
bun add -g ai-config
```

### curl

```bash
curl -fsSL https://raw.githubusercontent.com/nanxiaobei/ai-config/main/install.sh | bash
```

## 使用方法

### 首次运行

```bash
ai-config
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

### 命令列表

| 命令 | 说明 |
|------|------|
| `ai-config` | 扫描、合并并更新软链（默认） |
| `ai-config status` | 显示软链状态 |
| `ai-config list` | 列出支持的工具 |
| `ai-config backups` | 列出可用的备份 |
| `ai-config restore <tool>` | 恢复某个工具的原始配置 |
| `ai-config restore all` | 恢复所有工具 |
| `ai-config skill <source>` | 添加技能（文件或 GitHub 仓库） |
| `ai-config agent <source>` | 添加代理 |
| `ai-config rule <source>` | 添加规则 |
| `ai-config command <source>` | 添加命令 |
| `ai-config prompt <source>` | 添加提示词 |
| `ai-config upgrade` | 升级到最新版本 |
| `ai-config uninstall` | 彻底卸载 |
| `ai-config version` | 显示版本号 |
| `ai-config help` | 显示帮助 |

### 添加 skill/agent/rule/command/prompt

```bash
# 从本地文件
ai-config skill react.md
ai-config agent coder.md

# 从 GitHub 仓库（克隆所有 .md 文件）
ai-config skill user/repo
ai-config skill https://github.com/user/repo

# 从 GitHub 子目录
ai-config skill user/repo/skills

# 从 GitHub 单个文件
ai-config skill user/repo/skills/react.md
```

## 工作原理

```
~/.ai-config/
├── instructions.md  <- 共享指令（编辑这个）
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

运行 `ai-config` 时，会按文件名合并所有工具的内容：

- Cursor 有 skills: `react.md`, `typescript.md`
- Claude 有 skills: `typescript.md`, `python.md`
- 合并结果 `~/.ai-config/skills/`: `react.md`, `typescript.md`, `python.md`

先发现的文件优先（按文件名去重）。

## 卸载

```bash
ai-config uninstall
```

这将会：
1. 恢复所有工具的原始配置
2. 删除 `~/.ai-config` 目录
3. 移除 `ai-config` 命令

如果通过 npm 安装：

```bash
ai-config uninstall
npm uninstall -g ai-config
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

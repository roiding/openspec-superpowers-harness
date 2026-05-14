# OpenSpec Superpowers Harness

一个面向 Codex 的复合型本地 skill，用来把三套思路串成一条统一开发主线：

- `OpenSpec` 负责需求澄清、规格沉淀与变更工件
- `superpowers` 负责计划、实现、调试、验证与收尾纪律
- `Harness Engineering` 负责仓库围栏、事实来源与机械约束

这个仓库不是 OpenSpec 或 superpowers 的镜像副本。
它是一个**适配当前 Codex 环境的融合版 skill**。

## 目标

当你让 Codex 开发项目时，希望它默认按下面这条顺序工作：

1. 先读取或建立 `AGENTS.md`
2. 先问清需求，再写代码
3. 按 `proposal / spec / design / tasks` 组织信息
4. 以 `TDD / 调试纪律 / 验证优先` 的方式实现
5. 用 `Harness Engineering` 的方式控制边界、文档与交付质量

## 当前能力

这个 skill 目前支持两种模式：

### `core mode`

适合小中型、需求比较明确的任务。

默认流程：

1. `AGENTS.md`
2. 需求澄清
3. 轻量 `proposal/spec/design/tasks`
4. 实现
5. 验证
6. 收口

### `full mode`

适合大任务、需求仍在变化、需要多阶段规划、需要调试专线、需要审查或隔离工作区的任务。

已经内置的路由包括：

- `Route A`：探索型 / 需求不清
- `Route B`：快速功能路径
- `Route C`：逐工件规划路径
- `Route D`：计划驱动执行路径
- `Route E`：调试优先路径
- `Route F`：审查与收尾路径
- `Route G`：隔离工作区路径

详细映射见 [full-workflow-matrix.md](./references/full-workflow-matrix.md)。

## Companion skills

这个仓库现在还包含 3 个可选 companion skills，位置在 [companion-skills](./companion-skills)：

- `openspec-workspace-customization`
- `superpowers-mcp-builder-harness`
- `superpowers-skill-authoring-harness`

它们被拆出去的原因不是“不重要”，而是**太专项，不适合默认和主 skill 一起加载**。

注意：

这些 companion 虽然在同一个仓库里，但**不会因为主 skill 已安装就被自动发现**。
如果你要使用某个 companion，需要把对应子目录单独复制或链接到 Codex 的 skills 目录中，作为独立 skill 安装。

## 默认语言策略

这个 skill 默认用中文协作：

- 需求提问
- scope 确认
- 计划总结
- 开发进度汇报
- 验证结论
- 最终交付说明

但不会强行把仓库本身改成中文风格。
代码、标识符、文档语言、commit 风格仍然优先跟随项目自身约定。

## 仓库结构

```text
.
├── CHANGELOG.md
├── SKILL.md
├── VERSION
├── README.md
├── README.en.md
├── agents/
│   └── openai.yaml
├── companion-skills/
├── scripts/
└── references/
    ├── agents-bootstrap.md
    ├── full-workflow-matrix.md
    ├── harness-guardrails.md
    ├── openspec-patterns.md
    ├── sources.md
    └── superpowers-execution.md
```

说明：

- `SKILL.md`：主技能定义
- `agents/openai.yaml`：UI/入口元数据
- `references/`：按需加载的辅助规则，不把所有内容一次塞进上下文
- `companion-skills/`：拆分出来的专项技能
- `scripts/install-skills.ps1`：Windows 安装脚本

## 版本

当前版本见 [VERSION](./VERSION)。
变更记录见 [CHANGELOG.md](./CHANGELOG.md)。

## 安装

### 方式 1：手动安装主 skill

如果这个仓库本身就位于你的 Codex skills 目录下，例如：

`C:\Users\<你>\.codex\skills\openspec-superpowers-harness`

那么主 skill 已经处于可发现位置。

### 方式 2：用脚本安装主 skill 和 companion skills

Windows PowerShell：

```powershell
Set-ExecutionPolicy -Scope Process Bypass
.\scripts\install-skills.ps1
```

安装主 skill + 指定 companion：

```powershell
Set-ExecutionPolicy -Scope Process Bypass
.\scripts\install-skills.ps1 `
  -Companions openspec-workspace-customization,superpowers-mcp-builder-harness
```

默认使用 `Junction` 模式。
如果你不想创建链接，也可以改成复制：

```powershell
.\scripts\install-skills.ps1 -Mode Copy
```

默认安装到：

`C:\Users\<你>\.codex\skills`

也可以自定义目标目录：

```powershell
.\scripts\install-skills.ps1 -DestinationPath "D:\my-skills"
```

## 已整合的内容

### 来自 OpenSpec

已经整合的核心内容：

- 需求先行、代码后置
- `proposal / spec / design / tasks` 四层工件思路
- `core` 与 `expanded` 两类工作流思路
- `explore / propose / apply / verify / sync / archive` 等核心意图映射
- 行为优先的 spec 写法
- delta-spec 风格的变更表达

### 来自 superpowers

已经整合的主开发工作流：

- `brainstorming`
- `writing-plans`
- `executing-plans`
- `subagent-driven-development` 的受限映射
- `test-driven-development`
- `systematic-debugging`
- `requesting-code-review`
- `verification-before-completion`
- `using-git-worktrees`
- `finishing-a-development-branch`

### 来自 Harness Engineering

已经整合的围栏思路：

- repo 是事实来源
- `AGENTS.md` 先建立或先读取
- 重要信息写入版本库，不只存在聊天中
- 小步改动、机械验证、文档同步
- 优先 agent 可读性与长期可维护性

## 没有原封不动整合的内容

结论先说清楚：

**没有整合 OpenSpec 和 superpowers 的“全部仓库内容”。**

我整合的是：

- 与“项目开发主线”强相关的核心工作流
- 能在当前 Codex 环境稳定落地的内容
- 适合做成一个单独 skill 的长期规则

没有整合的部分，主要分四类：

### 1. 运行时/平台专属能力

例如：

- OpenSpec 的原生命令运行时与 slash command 外壳
- 不同 AI 工具的命令适配层
- 某些平台专有的 workflow 注入方式

没有原封不动搬进来的原因：

- 当前这是一个 Codex skill，不是 OpenSpec CLI 本体
- 这些内容依赖具体宿主环境，照搬会让 skill 看起来很全，但行为失真

### 2. 与主开发链路弱相关的仓库内容

例如：

- 安装说明
- 发行说明
- 社区目录
- 贡献者流程
- 遥测说明
- 维护者文档

没有整合的原因：

- 它们不是这个 skill 在执行项目开发时必须知道的工作流知识
- 放进 skill 只会增加上下文噪音

### 3. 过于专项化的分支 skill

例如 superpowers 里一些非主线 skill：

- `mcp-builder`
- `writing-skills`
- 某些中文专项工作流
- 某些特定平台或文档场景 skill

没有整合的原因：

- 这些能力是“专门用途”，不是每次项目开发都该默认激活
- 如果一股脑并入，会让主 skill 触发范围过宽、判断变钝

其中这次已经进一步处理了两类高价值专项能力：

- `mcp-builder` → 拆成 companion：`superpowers-mcp-builder-harness`
- `writing-skills` → 拆成 companion：`superpowers-skill-authoring-harness`

### 4. 与当前上位指令冲突或需要降级适配的内容

最典型的是：

- superpowers 中强依赖多子代理的完整执行法
- 某些默认要求 worktree / branch / 审查节奏的做法

没有按原样整合的原因：

- 当前 Codex 环境有自己的更高优先级规则
- 所以这里只保留“工作流意图”，再按当前环境做降级适配

## 为什么不追求“全量照搬”

因为全量照搬有三个明显问题：

1. 上下文会过重，skill 变钝
2. 不同宿主环境之间会出现假能力
3. 项目开发主线会被大量旁支信息稀释

所以这个仓库的设计原则是：

**融合核心工作流，不复制全部仓库。**

如果后续你需要，也可以继续做第二层拆分：

- 保持这个仓库作为主 skill
- 再把遗漏的专项工作流拆成 companion skills

## 来源

来源清单见 [sources.md](./references/sources.md)。

## 使用方式

你可以直接在 Codex 里这样叫它：

- `用 openspec-superpowers-harness 帮我启动这个项目`
- `按 full mode 推进这个需求`
- `这个 bug 按 Route E 来做`
- `先按这套 skill 帮我做需求澄清`

## 示例调用

适合直接复制的 prompt：

- `用 openspec-superpowers-harness 帮我启动一个新项目，先按 full mode 做需求澄清。`
- `按 openspec-superpowers-harness 的 core mode 帮我实现这个功能，先确认 scope 再动手。`
- `这个线上 bug 按 openspec-superpowers-harness 的 Route E 来处理，先找根因，不要直接修。`
- `按 openspec-superpowers-harness 帮我把这个需求整理成 proposal、spec、design、tasks。`
- `这个任务比较大，请按 openspec-superpowers-harness 的 Route C 逐工件推进。`

## 当前状态

- skill 已通过结构校验
- 已推送到 GitHub 仓库
- 当前版本聚焦“项目开发主线融合”

如果要继续扩展，下一步最合理的是：

1. 拆 companion skills
2. 给不同 route 增加示例 prompt
3. 补一个英文 README

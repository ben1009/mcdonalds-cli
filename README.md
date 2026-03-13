# 🍟 麦当劳 MCP 点餐工具

这是麦当劳中国官方 MCP Server 的配置和使用指南。通过 MCP 协议，你可以让 AI 助手帮你完成点餐、领券、查询积分等操作。

> **官方仓库**: https://github.com/M-China/mcd-mcp-server

## ✨ 功能一览

| 功能 | 说明 |
|------|------|
| 🍔 **麦乐送点餐** | 完整的外送点餐流程，支持选餐、计算价格、下单 |
| 🎫 **积分兑换券** | 用积分兑换餐品券 |
| 🎁 **优惠券领取** | 自动领取麦麦省优惠券 |
| 📅 **活动日历** | 查询当月营销活动 |
| 🥗 **营养信息** | 查询餐品热量、营养成分 |
| 📍 **地址管理** | 查询和新增配送地址 |
| 💰 **积分查询** | 查询账户积分余额 |

## 🚀 快速开始

### 方式一：一键配置（推荐）

1. **申请 MCP Token**
   - 访问：https://mcp.mcd.cn
   - 登录 → 控制台 → 激活 → 获取 Token

2. **运行配置脚本**
   ```bash
   cd mcdonalds-cli
   ./scripts/setup.sh YOUR_MCP_TOKEN
   ```

### 方式二：手动配置

#### 1. 申请 MCP Token

访问官方平台：https://mcp.mcd.cn

步骤：
1. 点击右上角【登录】按钮
2. 使用手机号验证登录
3. 登录后点击右上角【控制台】
4. 点击【激活】按钮申请 MCP Token
5. 同意服务协议，获得 Token

#### 2. 配置 MCP Client

<details>
<summary><b>Cursor</b> - 点击展开配置步骤</summary>

编辑 `~/.cursor/mcp.json`：

```json
{
  "mcpServers": {
    "mcd-mcp": {
      "type": "streamablehttp",
      "url": "https://mcp.mcd.cn",
      "headers": {
        "Authorization": "Bearer YOUR_MCP_TOKEN"
      }
    }
  }
}
```

或从 `config/cursor-mcp.json` 复制并修改 Token。
</details>

<details>
<summary><b>Claude Desktop</b> - 点击展开配置步骤</summary>

编辑配置文件：
- **macOS**: `~/Library/Application Support/Claude/claude_desktop_config.json`
- **Windows**: `%APPDATA%/Claude/claude_desktop_config.json`
- **Linux**: `~/.config/claude/claude_desktop_config.json`

```json
{
  "mcpServers": {
    "mcdonalds": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-streamable-http@latest"],
      "env": {
        "MCP_SERVER_URL": "https://mcp.mcd.cn",
        "MCP_AUTH_TOKEN": "YOUR_MCP_TOKEN"
      }
    }
  }
}
```

或从 `config/claude-mcp.json` 复制并修改 Token。
</details>

<details>
<summary><b>Kimi Code CLI</b> - 点击展开配置步骤</summary>

编辑 `~/.kimi/mcp.json`：

```json
{
  "mcpServers": {
    "mcdonalds": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-streamable-http@latest"],
      "env": {
        "MCP_SERVER_URL": "https://mcp.mcd.cn",
        "MCP_AUTH_TOKEN": "YOUR_MCP_TOKEN"
      }
    }
  }
}
```
</details>

<details>
<summary><b>Cherry Studio</b> - 点击展开配置步骤</summary>

1. 打开 Cherry Studio → 设置 → MCP
2. 点击【添加】→【从 JSON 导入】
3. 粘贴配置（见上方 Cursor 配置）
4. 替换 `YOUR_MCP_TOKEN` 为你的实际 Token
5. 启用开关
</details>

## 💬 使用示例

配置完成后，直接在对话中使用自然语言：

### 查询活动和优惠
```
今天麦当劳有什么活动？
```
```
帮我看看有什么优惠券可以领
```
```
帮我领一下所有可用的券
```

### 积分相关
```
我有多少积分？
```
```
积分能换什么？
```
```
用积分兑换一杯咖啡
```

### 外送点餐
```
帮我点一个巨无霸套餐送到家里
```
```
看看菜单有什么好吃的
```
```
DC套餐里有什么？
```

### 营养信息
```
巨无霸有多少热量？
```
```
查询餐品营养信息
```

## 📚 详细文档

- **[使用示例](EXAMPLES.md)** - 各种场景的详细对话示例
- **[配置文件](config/)** - 各客户端的配置模板

## 🛠️ 可用 Tools

| Tool | 功能 | 场景 |
|------|------|------|
| `campaign-calendar` | 活动日历查询 | 查看优惠活动 |
| `available-coupons` | 可领取的优惠券列表 | 发现可用优惠 |
| `auto-bind-coupons` | 一键自动领券 | 批量领券 |
| `query-my-coupons` | 我的优惠券查询 | 查看已领的券 |
| `query-my-account` | 我的积分查询 | 查看积分余额 |
| `mall-points-products` | 积分兑换商品列表 | 浏览可兑换商品 |
| `mall-create-order` | 积分兑换下单 | 用积分换餐 |
| `delivery-query-addresses` | 获取配送地址列表 | 确认收货地址 |
| `delivery-create-address` | 新增配送地址 | 添加新地址 |
| `query-meals` | 查询门店菜单 | 浏览商品 |
| `query-meal-detail` | 查询餐品详情 | 查看套餐内容 |
| `calculate-price` | 计算商品价格 | 确认订单金额 |
| `create-order` | 创建外送订单 | 下单购买 |
| `query-order` | 查询订单详情 | 查看订单状态 |
| `list-nutrition-foods` | 餐品营养信息列表 | 查询热量营养 |
| `now-time-info` | 获取当前时间 | 时间参考 |

## ⚠️ 注意事项

1. **🔐 Token 安全**：请妥善保管你的 MCP Token，不要泄露给他人
2. **⏱️ 请求频率**：每分钟最多 600 次请求，超过会返回 429 错误
3. **📦 MCP 版本**：仅支持 MCP Version 2025-06-18 及之前的版本
4. **🌍 服务地区**：仅限中国大陆地区（不含港澳台）
5. **💳 支付方式**：创建订单后会返回支付链接，需手动完成支付
6. **⏰ 订单时效**：订单创建后需在 15 分钟内支付

## 🤖 支持的 AI 客户端

| 客户端 | 状态 | 说明 |
|--------|------|------|
| Cursor | ✅ 支持 | 配置 `~/.cursor/mcp.json` |
| Claude Desktop | ✅ 支持 | 配置 `claude_desktop_config.json` |
| Kimi Code CLI | ✅ 支持 | 配置 `~/.kimi/mcp.json` |
| Cherry Studio | ✅ 支持 | 图形界面配置 |
| Trae | ✅ 支持 | 图形界面配置 |

## 📄 协议与许可

使用本服务须遵守：
- 麦当劳中国《使用条款》
- 《麦当劳 MCP 服务规则》

© 2026 McDonald's. All Rights Reserved.

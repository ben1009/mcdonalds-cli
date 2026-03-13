# 🍟 McDonald's MCP Ordering Tool

A configuration and usage guide for McDonald's China official MCP Server. Through the MCP protocol, you can let AI assistants help you with ordering, collecting coupons, checking points, and more.

> **Official Repository**: https://github.com/M-China/mcd-mcp-server

## ✨ Features

| Feature | Description |
|---------|-------------|
| 🍔 **McDelivery Ordering** | Complete delivery ordering flow, supporting menu selection, price calculation, and order placement |
| 🎫 **Points Redemption** | Redeem meal vouchers with your points |
| 🎁 **Coupon Collection** | Auto-collect McDonald's discount coupons |
| 📅 **Campaign Calendar** | Check monthly marketing activities |
| 🥗 **Nutrition Info** | Check meal calories and nutritional content |
| 📍 **Address Management** | Query and add delivery addresses |
| 💰 **Points Balance** | Check your account points balance |

## 🚀 Quick Start

### Option 1: One-Click Setup (Recommended)

1. **Apply for MCP Token**
   - Visit: https://mcp.mcd.cn
   - Login → Console → Activate → Get Token

2. **Run Setup Script**
   ```bash
   cd mcdonalds-cli
   ./scripts/setup.sh YOUR_MCP_TOKEN
   ```

### Option 2: Manual Configuration

#### 1. Apply for MCP Token

Visit the official platform: https://mcp.mcd.cn

Steps:
1. Click the [Login] button in the top right corner
2. Login with mobile phone verification
3. Click [Console] in the top right after logging in
4. Click [Activate] button to apply for MCP Token
5. Accept the service agreement to receive your Token

#### 2. Configure MCP Client

<details>
<summary><b>Cursor</b> - Click to expand configuration steps</summary>

Edit `~/.cursor/mcp.json`:

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

Or copy from `config/cursor-mcp.json` and modify the Token.
</details>

<details>
<summary><b>Claude Desktop</b> - Click to expand configuration steps</summary>

Edit the configuration file:
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

Or copy from `config/claude-mcp.json` and modify the Token.
</details>

<details>
<summary><b>Kimi Code CLI</b> - Click to expand configuration steps</summary>

Edit `~/.kimi/mcp.json`:

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
<summary><b>Cherry Studio</b> - Click to expand configuration steps</summary>

1. Open Cherry Studio → Settings → MCP
2. Click [Add] → [Import from JSON]
3. Paste the configuration (see Cursor configuration above)
4. Replace `YOUR_MCP_TOKEN` with your actual Token
5. Enable the switch
</details>

## 💬 Usage Examples

After configuration, use natural language directly in conversation:

### Check Activities and Offers
```
What activities does McDonald's have today?
```
```
Show me what coupons I can collect
```
```
Collect all available coupons for me
```

### Points Related
```
How many points do I have?
```
```
What can I redeem with my points?
```
```
Redeem a coffee with points
```

### Delivery Ordering
```
Order a Big Mac meal to my home
```
```
What's good on the menu?
```
```
What's in the DC combo meal?
```

### Nutrition Information
```
How many calories in a Big Mac?
```
```
Check nutrition information for meals
```

## 📚 Detailed Documentation

- **[Usage Examples](EXAMPLES.md)** - Detailed conversation examples for various scenarios
- **[Configuration Files](config/)** - Configuration templates for each client

## 🛠️ Available Tools

| Tool | Function | Scenario |
|------|----------|----------|
| `campaign-calendar` | Campaign calendar query | View promotional activities |
| `available-coupons` | List of collectible coupons | Discover available offers |
| `auto-bind-coupons` | One-click auto-collect coupons | Batch collect coupons |
| `query-my-coupons` | My coupons query | View collected coupons |
| `query-my-account` | My points query | Check points balance |
| `mall-points-products` | Points redemption products list | Browse redeemable items |
| `mall-create-order` | Points redemption order | Redeem meals with points |
| `delivery-query-addresses` | Get delivery address list | Confirm delivery address |
| `delivery-create-address` | Add new delivery address | Add new address |
| `query-meals` | Query store menu | Browse products |
| `query-meal-detail` | Query meal details | View combo contents |
| `calculate-price` | Calculate product prices | Confirm order amount |
| `create-order` | Create delivery order | Place order |
| `query-order` | Query order details | Check order status |
| `list-nutrition-foods` | Meal nutrition info list | Check calories and nutrition |
| `now-time-info` | Get current time | Time reference |

## ⚠️ Notes

1. **🔐 Token Security**: Please keep your MCP Token secure and do not share it with others
2. **⏱️ Request Frequency**: Maximum 600 requests per minute, exceeding will return 429 error
3. **📦 MCP Version**: Only supports MCP Version 2025-06-18 and earlier
4. **🌍 Service Area**: Mainland China only (excluding Hong Kong, Macau, and Taiwan)
5. **💳 Payment Method**: After creating an order, a payment link will be returned; payment must be completed manually
6. **⏰ Order Validity**: Orders must be paid within 15 minutes of creation

## 🤖 Supported AI Clients

| Client | Status | Note |
|--------|--------|------|
| Cursor | ✅ Supported | Configure `~/.cursor/mcp.json` |
| Claude Desktop | ✅ Supported | Configure `claude_desktop_config.json` |
| Kimi Code CLI | ✅ Supported | Configure `~/.kimi/mcp.json` |
| Cherry Studio | ✅ Supported | GUI configuration |
| Trae | ✅ Supported | GUI configuration |

## 📄 License

This project is licensed under the [MIT License](LICENSE).

---

© 2026 McDonald's. All Rights Reserved.

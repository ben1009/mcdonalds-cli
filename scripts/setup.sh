#!/bin/bash

# 麦当劳 MCP 配置安装脚本
# McDonald's MCP Server Setup Script

set -e

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}🍟 麦当劳 MCP Server 配置助手${NC}"
echo "=========================================="
echo ""

# 检查是否提供了 Token
if [ -z "$1" ]; then
    echo -e "${YELLOW}⚠️  请提供你的 MCP Token${NC}"
    echo ""
    echo "使用方法:"
    echo "  ./setup.sh YOUR_MCP_TOKEN"
    echo ""
    echo "获取 Token 步骤:"
    echo "  1. 访问 https://mcp.mcd.cn"
    echo "  2. 登录并点击控制台"
    echo "  3. 激活获取 MCP Token"
    exit 1
fi

TOKEN="$1"
CONFIG_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/config"

echo -e "${GREEN}✓${NC} MCP Token: ${TOKEN:0:10}..."
echo ""

# 函数：安装 Cursor 配置
install_cursor_config() {
    local cursor_config_dir="$HOME/.cursor"
    local cursor_config_file="$cursor_config_dir/mcp.json"
    
    if [ -d "$cursor_config_dir" ]; then
        echo -e "${BLUE}📦 配置 Cursor...${NC}"
        
        # 备份现有配置
        if [ -f "$cursor_config_file" ]; then
            cp "$cursor_config_file" "$cursor_config_file.backup.$(date +%Y%m%d%H%M%S)"
            echo -e "${YELLOW}  已备份现有配置${NC}"
        fi
        
        # 写入新配置
        cat > "$cursor_config_file" << EOF
{
  "mcpServers": {
    "mcd-mcp": {
      "type": "streamablehttp",
      "url": "https://mcp.mcd.cn",
      "headers": {
        "Authorization": "Bearer $TOKEN"
      }
    }
  }
}
EOF
        echo -e "${GREEN}✓${NC} Cursor 配置已安装到: $cursor_config_file"
    else
        echo -e "${YELLOW}⚠️  未检测到 Cursor 配置目录${NC}"
        echo "  请将 config/cursor-mcp.json 手动导入 Cursor"
    fi
}

# 函数：安装 Claude Desktop 配置
install_claude_config() {
    local claude_config_dir=""
    
    # 检测操作系统
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # macOS
        claude_config_dir="$HOME/Library/Application Support/Claude"
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        # Linux
        claude_config_dir="$HOME/.config/claude"
    elif [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "cygwin" ]]; then
        # Windows
        claude_config_dir="$APPDATA/Claude"
    fi
    
    if [ -d "$claude_config_dir" ]; then
        echo -e "${BLUE}📦 配置 Claude Desktop...${NC}"
        
        local claude_config_file="$claude_config_dir/claude_desktop_config.json"
        
        # 备份现有配置
        if [ -f "$claude_config_file" ]; then
            cp "$claude_config_file" "$claude_config_file.backup.$(date +%Y%m%d%H%M%S)"
            echo -e "${YELLOW}  已备份现有配置${NC}"
        fi
        
        # 写入新配置
        cat > "$claude_config_file" << EOF
{
  "mcpServers": {
    "mcdonalds": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-streamable-http@latest"],
      "env": {
        "MCP_SERVER_URL": "https://mcp.mcd.cn",
        "MCP_AUTH_TOKEN": "$TOKEN"
      }
    }
  }
}
EOF
        echo -e "${GREEN}✓${NC} Claude Desktop 配置已安装到: $claude_config_file"
    else
        echo -e "${YELLOW}⚠️  未检测到 Claude Desktop 配置目录${NC}"
        echo "  请将 config/claude-mcp.json 手动导入 Claude Desktop"
    fi
}

# 函数：安装 Kimi Code CLI 配置
install_kimi_config() {
    local kimi_config_dir="$HOME/.config/kimi"
    local kimi_config_file="$kimi_config_dir/mcp.json"
    
    if [ -d "$kimi_config_dir" ]; then
        echo -e "${BLUE}📦 配置 Kimi Code CLI...${NC}"
        
        # 备份现有配置
        if [ -f "$kimi_config_file" ]; then
            cp "$kimi_config_file" "$kimi_config_file.backup.$(date +%Y%m%d%H%M%S)"
            echo -e "${YELLOW}  已备份现有配置${NC}"
        fi
        
        # 写入新配置
        cat > "$kimi_config_file" << EOF
{
  "mcpServers": {
    "mcdonalds": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-streamable-http@latest"],
      "env": {
        "MCP_SERVER_URL": "https://mcp.mcd.cn",
        "MCP_AUTH_TOKEN": "$TOKEN"
      }
    }
  }
}
EOF
        echo -e "${GREEN}✓${NC} Kimi Code CLI 配置已安装到: $kimi_config_file"
    else
        echo -e "${YELLOW}⚠️  未检测到 Kimi Code CLI 配置目录${NC}"
        echo "  配置位置: $kimi_config_file"
    fi
}

# 主流程
echo -e "${BLUE}🔍 检测支持的客户端...${NC}"
echo ""

install_cursor_config
install_claude_config
install_kimi_config

echo ""
echo "=========================================="
echo -e "${GREEN}🎉 配置完成！${NC}"
echo ""
echo "现在你可以:"
echo "  1. 重启你的 MCP 客户端"
echo "  2. 在对话中直接使用麦当劳功能，例如:"
echo "     - '帮我看看麦当劳有什么活动'"
echo "     - '领一下优惠券'"
echo "     - '我有多少积分'"
echo "     - '帮我点一个巨无霸套餐'"
echo ""
echo -e "${YELLOW}⚠️  注意: 请确保已安装 npx (Node.js) 以使用 Streamable HTTP 传输${NC}"
echo ""

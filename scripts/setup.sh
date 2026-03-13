#!/bin/bash

# McDonald's MCP Server Setup Script

set -e

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}🍟 McDonald's MCP Server Setup Assistant${NC}"
echo "=========================================="
echo ""

# Check if Token is provided
if [ -z "$1" ]; then
    echo -e "${YELLOW}⚠️  Please provide your MCP Token${NC}"
    echo ""
    echo "Usage:"
    echo "  ./setup.sh YOUR_MCP_TOKEN"
    echo ""
    echo "Steps to get Token:"
    echo "  1. Visit https://mcp.mcd.cn"
    echo "  2. Login and click Console"
    echo "  3. Activate to get MCP Token"
    exit 1
fi

TOKEN="$1"
CONFIG_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/config"

echo -e "${GREEN}✓${NC} MCP Token: ${TOKEN:0:10}..."
echo ""

# Function: Install Cursor config
install_cursor_config() {
    local cursor_config_dir="$HOME/.cursor"
    local cursor_config_file="$cursor_config_dir/mcp.json"
    
    if [ -d "$cursor_config_dir" ]; then
        echo -e "${BLUE}📦 Configuring Cursor...${NC}"
        
        # Backup existing config
        if [ -f "$cursor_config_file" ]; then
            cp "$cursor_config_file" "$cursor_config_file.backup.$(date +%Y%m%d%H%M%S)"
            echo -e "${YELLOW}  Existing config backed up${NC}"
        fi
        
        # Write new config
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
        echo -e "${GREEN}✓${NC} Cursor config installed to: $cursor_config_file"
    else
        echo -e "${YELLOW}⚠️  Cursor config directory not detected${NC}"
        echo "  Please manually import config/cursor-mcp.json into Cursor"
    fi
}

# Function: Install Claude Desktop config
install_claude_config() {
    local claude_config_dir=""
    
    # Detect OS
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
        echo -e "${BLUE}📦 Configuring Claude Desktop...${NC}"
        
        local claude_config_file="$claude_config_dir/claude_desktop_config.json"
        
        # Backup existing config
        if [ -f "$claude_config_file" ]; then
            cp "$claude_config_file" "$claude_config_file.backup.$(date +%Y%m%d%H%M%S)"
            echo -e "${YELLOW}  Existing config backed up${NC}"
        fi
        
        # Write new config
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
        echo -e "${GREEN}✓${NC} Claude Desktop config installed to: $claude_config_file"
    else
        echo -e "${YELLOW}⚠️  Claude Desktop config directory not detected${NC}"
        echo "  Please manually import config/claude-mcp.json into Claude Desktop"
    fi
}

# Function: Install Kimi Code CLI config
install_kimi_config() {
    local kimi_config_dir="$HOME/.config/kimi"
    local kimi_config_file="$kimi_config_dir/mcp.json"
    
    if [ -d "$kimi_config_dir" ]; then
        echo -e "${BLUE}📦 Configuring Kimi Code CLI...${NC}"
        
        # Backup existing config
        if [ -f "$kimi_config_file" ]; then
            cp "$kimi_config_file" "$kimi_config_file.backup.$(date +%Y%m%d%H%M%S)"
            echo -e "${YELLOW}  Existing config backed up${NC}"
        fi
        
        # Write new config
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
        echo -e "${GREEN}✓${NC} Kimi Code CLI config installed to: $kimi_config_file"
    else
        echo -e "${YELLOW}⚠️  Kimi Code CLI config directory not detected${NC}"
        echo "  Config location: $kimi_config_file"
    fi
}

# Main flow
echo -e "${BLUE}🔍 Detecting supported clients...${NC}"
echo ""

install_cursor_config
install_claude_config
install_kimi_config

echo ""
echo "=========================================="
echo -e "${GREEN}🎉 Setup complete!${NC}"
echo ""
echo "Now you can:"
echo "  1. Restart your MCP client"
echo "  2. Use McDonald's features directly in conversation, for example:"
echo "     - 'Check McDonald's activities today'"
echo "     - 'Collect coupons'"
echo "     - 'How many points do I have'"
echo "     - 'Order a Big Mac meal for me'"
echo ""
echo -e "${YELLOW}⚠️  Note: Please ensure npx (Node.js) is installed to use Streamable HTTP transport${NC}"
echo ""

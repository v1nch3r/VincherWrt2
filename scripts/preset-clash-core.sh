#!/bin/bash
# ============================================================
# VincherWrt2 — Clash Core Preset
# Downloads Clash cores for different platforms
# ============================================================
set -e

OPENWRTROOT="${1:-/tmp/openwrt-build/openwrt}"
CLASH_DIR="$OPENWRTROOT/package/openclash/dev"

echo "============================================"
echo "  VincherWrt2 — Clash Core Setup"
echo "============================================"

# Detect target architecture
ARCH=$(grep -oP 'CONFIG_TARGET.*?="y"' "$OPENWRTROOT/.config" | head -1)
echo "Detected target: $ARCH"

# Clash core download URLs
declare -A CORES=(
    ["clash-dev"]="https://github.com/vernesong/OpenClash/releases/download/Clash.gz"
    ["clash-tun"]="https://github.com/vernesong/OpenClash/releases/download/Clash_tun.gz"
    ["clash-tun-game"]="https://github.com/vernesong/OpenClash/releases/download/Clash_tun_Game.gz"
    ["clash-meta"]="https://github.com/MetaCubeX/mihomo/releases/download/v1.18.1/mihomo-linux-arm64-v1.18.1.gz"
    ["clash-premium"]="https://github.com/Dreamacro/clash/releases/download/v1.18.0/clash-linux-arm64-v1.18.0.gz"
)

# Download cores
for name in "${!CORES[@]}"; do
    url="${CORES[$name]}"
    echo "  Downloading $name..."
    curl -sL "$url" -o "/tmp/${name}.gz" 2>/dev/null && echo "  ✅ $name" || echo "  ⚠ $name failed"
done

echo ""
echo "============================================"
echo "  Clash cores downloaded!"
echo "============================================"
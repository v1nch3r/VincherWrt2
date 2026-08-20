#!/bin/bash
# ============================================================
# VincherWrt2 — Setup Feeds
# Download and install package feeds from various sources
# ============================================================
set -e

OPENWRTROOT="${1:-/tmp/openwrt-build/openwrt}"
cd "$OPENWRTROOT"

echo "============================================"
echo "  VincherWrt2 — Setting up feeds"
echo "============================================"

# ----------------------------------------------------------
# 1. Default feeds (from OpenWrt source)
# ----------------------------------------------------------
echo "[1/4] Updating default feeds..."
./scripts/feeds update -a
./scripts/feeds install -a

# ----------------------------------------------------------
# 2. Extra feeds (community repos — all verified active)
# ----------------------------------------------------------
echo "[2/4] Adding community feeds..."

cat >> feeds.conf.default << 'FEEDS'

# VincherWrt2 extra feeds
src-git kenzo https://github.com/kenzok8/openwrt-packages.git
src-git small https://github.com/kenzok8/small.git
src-git passwall https://github.com/Openwrt-Passwall/openwrt-passwall.git
src-git passwall_packages https://github.com/Openwrt-Passwall/openwrt-passwall-packages.git
src-git openclash https://github.com/vernesong/OpenClash.git;dev
FEEDS

echo "[3/4] Updating extra feeds..."
./scripts/feeds update -a

# ----------------------------------------------------------
# 3. Install extra feeds
# ----------------------------------------------------------
echo "[4/4] Installing extra packages..."
./scripts/feeds install -a

# ----------------------------------------------------------
# 4. Install specific packages from extra feeds
# ----------------------------------------------------------
echo "Installing specific packages from feeds..."
PACKAGES=(
    # Proxy / VPN
    luci-app-openclash
    luci-app-passwall
    luci-app-passwall-server
    luci-app-ssr-plus
    luci-app-ssr-plus-server

    # Themes
    luci-theme-atmaterial
    luci-theme-edge

    # Modem
    luci-app-modeminfo
    luci-app-sms-tool
    luci-app-3ginfo

    # Disk
    luci-app-diskman
    luci-app-parted

    # Tools
    luci-app-filebrowser
    luci-app-speedtest
    luci-app-zerotier
    luci-app-wol
    luci-app-upnp
    luci-app-ddns
    luci-app-watchcat
)

for pkg in "${PACKAGES[@]}"; do
    echo "  Installing: $pkg"
    ./scripts/feeds install "$pkg"
done

echo ""
echo "============================================"
echo "  Feeds setup complete!"
echo "============================================"
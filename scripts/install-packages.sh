#!/bin/bash
# ============================================================
# VincherWrt2 — Install Extra Packages
# Clone packages directly from git (for packages not in feeds)
# All repos verified active as of Aug 2026
# ============================================================
set -e

OPENWRTROOT="${1:-/tmp/openwrt-build/openwrt}"
PACKAGE_DIR="$OPENWRTROOT/package"

cd "$OPENWRTROOT"

echo "============================================"
echo "  VincherWrt2 — Installing extra packages"
echo "============================================"

# ----------------------------------------------------------
# Proxy / VPN Packages
# ----------------------------------------------------------
echo "[1/5] Cloning proxy/VPN packages..."

git clone --depth=1 -b dev https://github.com/vernesong/OpenClash.git "$PACKAGE_DIR/openclash"
echo "  ✅ openclash"

git clone --depth=1 https://github.com/Openwrt-Passwall/openwrt-passwall.git "$PACKAGE_DIR/passwall"
echo "  ✅ passwall"

git clone --depth=1 https://github.com/Openwrt-Passwall/openwrt-passwall-packages.git "$PACKAGE_DIR/passwall-packages"
echo "  ✅ passwall-packages"

# ----------------------------------------------------------
# Themes
# ----------------------------------------------------------
echo "[2/5] Cloning themes..."

git clone --depth=1 https://github.com/jerrykuku/luci-theme-argon.git "$PACKAGE_DIR/luci-theme-argon"
echo "  ✅ luci-theme-argon"

git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config.git "$PACKAGE_DIR/luci-app-argon-config"
echo "  ✅ luci-app-argon-config"

# ----------------------------------------------------------
# Docker
# ----------------------------------------------------------
echo "[3/5] Cloning Docker packages..."

git clone --depth=1 https://github.com/lisaac/luci-app-dockerman.git "$PACKAGE_DIR/luci-app-dockerman"
echo "  ✅ luci-app-dockerman"

git clone --depth=1 https://github.com/lisaac/luci-lib-docker.git "$PACKAGE_DIR/luci-lib-docker"
echo "  ✅ luci-lib-docker"

# ----------------------------------------------------------
# Modem / USB Tools
# ----------------------------------------------------------
echo "[4/5] Cloning modem packages..."

git clone --depth=1 https://github.com/solomonricky/luci-app-modeminfo.git "$PACKAGE_DIR/luci-app-modeminfo"
echo "  ✅ luci-app-modeminfo"

git clone --depth=1 https://github.com/4IceG/luci-app-sms-tool.git "$PACKAGE_DIR/luci-app-sms-tool"
echo "  ✅ luci-app-sms-tool"

# ----------------------------------------------------------
# Disk / File Management
# ----------------------------------------------------------
echo "[5/5] Cloning disk/file packages..."

git clone --depth=1 https://github.com/lisaac/luci-app-diskman.git "$PACKAGE_DIR/luci-app-diskman"
echo "  ✅ luci-app-diskman"

# ----------------------------------------------------------
# Re-install feeds (to pick up new packages)
# ----------------------------------------------------------
echo ""
echo "Re-installing feeds..."
./scripts/feeds install -a

echo ""
echo "============================================"
echo "  Extra packages installed!"
echo "============================================"
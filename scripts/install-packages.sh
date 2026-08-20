#!/bin/bash
# ============================================================
# VincherWrt2 — Install Extra Packages
# Clone packages directly from git (for packages not in feeds)
# ============================================================
set -uo pipefail

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

# OpenClash
if [ ! -d "$PACKAGE_DIR/openclash" ]; then
    git clone --depth=1 -b dev https://github.com/vernesong/OpenClash.git "$PACKAGE_DIR/openclash" 2>/dev/null || echo "  ⚠ openclash already exists or failed"
fi

# Passwall
if [ ! -d "$PACKAGE_DIR/passwall" ]; then
    git clone --depth=1 https://github.com/Openwrt-Passwall/openwrt-passwall.git "$PACKAGE_DIR/passwall" 2>/dev/null || echo "  ⚠ passwall already exists or failed"
fi

# ----------------------------------------------------------
# Themes
# ----------------------------------------------------------
echo "[2/5] Cloning themes..."

# Argon Theme
if [ ! -d "$PACKAGE_DIR/luci-theme-argon" ]; then
    git clone --depth=1 https://github.com/jerrykuku/luci-theme-argon.git "$PACKAGE_DIR/luci-theme-argon" 2>/dev/null || echo "  ⚠ argon theme already exists"
fi
if [ ! -d "$PACKAGE_DIR/luci-app-argon-config" ]; then
    git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config.git "$PACKAGE_DIR/luci-app-argon-config" 2>/dev/null || echo "  ⚠ argon config already exists"
fi

# ----------------------------------------------------------
# Docker
# ----------------------------------------------------------
echo "[3/5] Cloning Docker packages..."

if [ ! -d "$PACKAGE_DIR/luci-app-dockerman" ]; then
    git clone --depth=1 https://github.com/lisaac/luci-app-dockerman.git "$PACKAGE_DIR/luci-app-dockerman" 2>/dev/null || echo "  ⚠ dockerman already exists"
fi
if [ ! -d "$PACKAGE_DIR/luci-lib-docker" ]; then
    git clone --depth=1 https://github.com/lisaac/luci-lib-docker.git "$PACKAGE_DIR/luci-lib-docker" 2>/dev/null || echo "  ⚠ luci-lib-docker already exists"
fi

# ----------------------------------------------------------
# Modem / USB Tools
# ----------------------------------------------------------
echo "[4/5] Cloning modem packages..."

if [ ! -d "$PACKAGE_DIR/luci-app-modeminfo" ]; then
    git clone --depth=1 https://github.com/koshev-msk/luci-app-modeminfo.git "$PACKAGE_DIR/luci-app-modeminfo" 2>/dev/null || echo "  ⚠ modeminfo already exists"
fi

if [ ! -d "$PACKAGE_DIR/luci-app-smstools3" ]; then
    git clone --depth=1 https://github.com/koshev-msk/luci-app-smstools3.git "$PACKAGE_DIR/luci-app-smstools3" 2>/dev/null || echo "  ⚠ smstools3 already exists"
fi

# ----------------------------------------------------------
# Disk / File Management
# ----------------------------------------------------------
echo "[5/5] Cloning disk/file packages..."

if [ ! -d "$PACKAGE_DIR/luci-app-diskman" ]; then
    git clone --depth=1 https://github.com/SuLingGG/luci-app-diskman.git "$PACKAGE_DIR/luci-app-diskman" 2>/dev/null || echo "  ⚠ diskman already exists"
fi

# ----------------------------------------------------------
# Re-install feeds (to pick up new packages)
# ----------------------------------------------------------
echo ""
echo "Re-installing feeds..."
./scripts/feeds install -a 2>/dev/null || true

echo ""
echo "============================================"
echo "  Extra packages installed!"
echo "============================================"
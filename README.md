# VincherWrt2

Custom OpenWrt firmware builder powered by pre-compiled toolchain and GitHub Actions.

## Features

- **Multi-target support** — armsr, x86_64, rockchip, bcm27xx
- **Pre-compiled toolchain** — fast build (~30 min instead of 3+ hours)
- **Modular package selection** — enable/disable features via config
- **First-boot customization** — hostname, timezone, DNS, themes
- **Overlay-ready output** — .img.gz (mountable) + .tar.gz (universal)
- **Auto release cleanup** — keep latest 5 releases

## Usage

1. Go to **Actions** tab → **Build Firmware**
2. Click **Run workflow**
3. Select target (armsr, x86_64, etc.)
4. Wait ~30 minutes
5. Download from **Releases**

## Repository Structure

```
VincherWrt2/
├── .github/workflows/
│   ├── build-firmware.yml    ← Main build workflow
│   └── clean-releases.yml     ← Auto cleanup old releases
├── config/
│   ├── universal.conf         ← Shared config (all targets)
│   ├── armsr.conf            ← ARM64 target
│   ├── x86_64.conf            ← x86_64 target
│   ├── rockchip.conf          ← Rockchip target
│   └── bcm27xx.conf           ← Raspberry Pi target
├── scripts/
│   ├── setup-feeds.sh         ← Download & install package feeds
│   └── install-packages.sh    ← Clone extra packages
├── files/
│   ├── bin/                   ← Custom binary scripts
│   ├── etc/uci-defaults/      ← First-boot scripts
│   └── etc/config/            ← Default UCI config
└── docs/
    └── PACKAGES.md            ← Package customization guide
```

## Package Selection

Default packages include:

| Category | Packages |
|----------|----------|
| **Network** | luci, firewall, dnsmasq-full, wpad-openssl |
| **VPN/Proxy** | openclash, passwall |
| **Docker** | dockerman, docker-ce |
| **DNS** | https-dns-proxy, dnsmasq-full |
| **Modem** | modemmanager, sms-tool |
| **Tools** | htop, nano, curl, wget-ssl |
| **Themes** | argon |
| **File Share** | samba4, nfs-utils |

## Toolchain

Uses pre-compiled toolchain from [openwrt-toolchain-builder](https://github.com/v1nch3r/openwrt-toolchain-builder).

## License

MIT — free to use, modify, and distribute.
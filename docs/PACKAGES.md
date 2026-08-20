# VincherWrt2 — Package Customization Guide

## Enabling/Disabling Packages

All package selections are in `config/universal.conf` (shared) and `config/<target>.conf` (target-specific).

### Enable a package
Add to `config/universal.conf`:
```
CONFIG_PACKAGE_<package-name>=y
```

### Disable a package
Change `=y` to `# ... is not set` or remove the line:
```
# CONFIG_PACKAGE_<package-name> is not set
```

## Package Categories

### Proxy / VPN
| Package | Config key | Description |
|---------|-----------|-------------|
| OpenClash | `CONFIG_PACKAGE_luci-app-openclash` | Clash proxy manager |
| Passwall | `CONFIG_PACKAGE_luci-app-passwall` | V2Ray/Xray proxy |
| OpenVPN | `CONFIG_PACKAGE_openvpn-openssl` | OpenVPN server/client |
| WireGuard | `CONFIG_PACKAGE_wireguard-tools` | WireGuard VPN |
| ZeroTier | `CONFIG_PACKAGE_luci-app-zerotier` | ZeroTier VPN |

### Docker
| Package | Config key |
|---------|-----------|
| Dockerman | `CONFIG_PACKAGE_luci-app-dockerman` |
| Docker CE | `CONFIG_PACKAGE_docker-ce` |
| Docker daemon | `CONFIG_PACKAGE_dockerd` |

### DNS
| Package | Config key |
|---------|-----------|
| HTTPS-DNS-Proxy | `CONFIG_PACKAGE_https-dns-proxy` |
| dnsmasq-full | `CONFIG_PACKAGE_dnsmasq-full` |

### Modem / USB
| Package | Config key |
|---------|-----------|
| ModemManager | `CONFIG_PACKAGE_modemmanager` |
| SMS Tool | `CONFIG_PACKAGE_sms-tool` |
| USB Modeswitch | `CONFIG_PACKAGE_usb-modeswitch` |

### File Sharing
| Package | Config key |
|---------|-----------|
| Samba4 | `CONFIG_PACKAGE_samba4-server` |
| NFS | `CONFIG_PACKAGE_nfs-kernel-server` |

### Themes
| Package | Config key |
|---------|-----------|
| Argon | `CONFIG_PACKAGE_luci-theme-argon` |

### System
| Package | Config key |
|---------|-----------|
| htop | `CONFIG_PACKAGE_htop` |
| nano | `CONFIG_PACKAGE_nano` |
| bash | `CONFIG_PACKAGE_bash` |
| zsh | `CONFIG_PACKAGE_zsh` |
| git | `CONFIG_PACKAGE_git` |
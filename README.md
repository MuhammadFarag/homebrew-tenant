# homebrew-tenant

Homebrew tap for [`tenant`](https://github.com/MuhammadFarag/tenant) — a small
macOS CLI that provisions isolated user accounts with a per-tenant PF firewall
anchor, a primary share group, a TOML profile, and a host-level `doctor` audit.

## Install

```sh
brew tap MuhammadFarag/tenant
brew install tenant
```

Or in one line:

```sh
brew install MuhammadFarag/tenant/tenant
```

## Requirements

- macOS on **Apple Silicon (arm64)**. The release ships an `aarch64-apple-darwin`
  binary only; the formula refuses to install on Intel.

## Upgrading

```sh
brew update
brew upgrade tenant
```

## Notes

`tenant` uses `sudo` for privileged operations (account provisioning, firewall
install). After installing, run `tenant doctor` to check your host setup.

This tap currently tracks pre-release builds (`0.1.0-alpha.x`). See the
[upstream releases](https://github.com/MuhammadFarag/tenant/releases) for what
each version contains.

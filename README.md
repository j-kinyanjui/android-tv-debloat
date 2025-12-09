# Android TV Debloat Environment

This project provides a reproducible development environment for debloating Android TV devices using **Nix + devenv**.
It sets up ADB, enables Android tooling, and provides convenience scripts for removing unwanted system packages and improving performance.

## Requirements

- **Nix** installed
- **devenv** installed
  You can install it via:

```bash
nix profile install github:cachix/devenv/latest
```

## Getting Started

### 1. Enter the development shell

```bash
devenv shell
```

### 2. Connect your Android TV device

Enable **ADB debugging** on your Android TV and run:

```bash
adb connect <ip_address_of_tv>
```

Verify the connection:

```bash
adb devices
```

## Debloat Script

A script is provided to automatically remove or disable unwanted system packages.

### Run the debloat script:

```bash
devenv run debloat
```

This executes:

```
scripts/adb_remove.sh
```

You can modify this script to include packages you want to remove, for example:

```bash
adb shell pm disable-user --user 0 com.example.package
```

or

```bash
adb shell pm uninstall --user 0 com.example.package
```

## Performance Tweaks

In addition to debloating, the script will disable Android TV animations to improve system performance by reducing visual effects making the UI snappier and faster. These include:

- Window animations
- Transition animations
- Animator duration

```bash
adb shell settings put global window_animation_scale 0
adb shell settings put global transition_animation_scale 0
adb shell settings put global animator_duration_scale 0
```

## Example: Package List

see this [gist](https://gist.github.com/atais/f3f4544bb6685c4c2e8b0335f878bb3f) for more

> [!NOTE] nixpkgs

- `pkgs.universal-android-debloater` is currently not supported on macOS (Darwin), so it is excluded.
- All debloating is **at your own risk** — removing essential system components can break the device.
  - For example removing tvx breaks my tv's input switching.

# Javad Theme for SDDM

An ultra-minimal, modern, premium dark login screen theme for SDDM.

![Preview](preview.png)

## Features

- **Ultra-minimal design** - Clean, distraction-free login experience
- **Dark mode only** - Easy on the eyes with near-black charcoal background
- **Subtle vignette effect** - Edges darker than center for depth
- **Centered layout** - Perfectly balanced horizontal & vertical alignment
- **Circular avatar** - Flat illustration style with light cyan background
- **Username display** - Clearly shows the current user below the avatar
- **Pill-shaped password input** - Large, semi-transparent with soft glow
- **Smooth animations** - Subtle fade-in and focus effects
- **Monospace typography** - Clean JetBrains Mono / Fira Code style
- **Branding logo** - Minimalist logo in bottom-right corner

## Installation

### Automated Installation (Recommended)

1. Run the included install script from the root directory:

```bash
sudo ./install.sh
```

### Manual Installation

1. Copy the `javad-theme` folder to your SDDM themes directory:

```bash
sudo cp -r javad-theme /usr/share/sddm/themes/
```

2. Edit your SDDM configuration to use the theme:

```bash
sudo nano /etc/sddm.conf
```

Add or modify the `[Theme]` section:

```ini
[Theme]
Current=javad-theme
```

3. Restart SDDM or reboot:

```bash
sudo systemctl restart sddm
```

### Testing (without restarting)

You can preview the theme without restarting:

```bash
sddm-greeter --test-mode --theme /usr/share/sddm/themes/javad-theme
```

## Customization

Edit `theme.conf` to customize colors and dimensions:

| Setting            | Description               | Default   |
| ------------------ | ------------------------- | --------- |
| `background`       | Main background color     | `#252D38` |
| `accentColor`      | Accent/branding color     | `#7FD4C1` |
| `avatarBackground` | Avatar circle background  | `#A8E6CF` |
| `inputBackground`  | Password input background | `#3A4352` |
| `avatarSize`       | Avatar diameter in pixels | `100`     |
| `inputWidth`       | Password input width      | `320`     |
| `inputHeight`      | Password input height     | `52`      |
| `fadeInDuration`   | Fade-in animation (ms)    | `800`     |

## Keyboard Shortcuts

| Key      | Action                  |
| -------- | ----------------------- |
| `Enter`  | Submit password         |
| `Escape` | Clear password field    |
| `F1`     | Toggle session selector |

## Custom Avatar

Replace `face.icon` with your own image (PNG recommended, ideally ~100x100px).

## Requirements

- SDDM (Simple Desktop Display Manager)
- Qt 5.15+ with QtQuick 2.15
- QtGraphicalEffects 1.12

## License

MIT License - Feel free to modify and distribute.

## Author

Created by Javad

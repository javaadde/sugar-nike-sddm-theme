<div align="center">

# Sugar-Nike

### Ultra-Minimal SDDM Login Theme

![Version](https://img.shields.io/badge/version-1.0-blue?style=for-the-badge&color=7FD4C1)
![License](https://img.shields.io/badge/license-MIT-green?style=for-the-badge&color=A8E6CF)
![SDDM](https://img.shields.io/badge/SDDM-Theme-orange?style=for-the-badge&color=252D38)

<br/>

![Preview](/javad-theme/preview.png)

</div>

<br/>

## ✨ Features

- 🎨 **Sugar-Nike Design** — A premium, distraction-free aesthetic with a focused layout.
- 🌑 **True Dark Mode** — Easy on the eyes with a specially curated charcoal palette.
- 🎭 **Vignette Depth** — Subtle edge darkening for a cinematic feel.
- 📐 **Perfect Centering** — Harmonious horizontal and vertical alignment.
- 👤 **Circular Avatar** — Modern flat style with username display.
- 💊 **Pill-Shaped Input** — Elegant, semi-transparent entry field with soft glow.
- 🌊 **Smooth Animations** — Fluid fade-ins and focus transitions.
- ⌨️ **Monospace Typography** — Clean, readable text using JetBrains/Fira styling.

---

## 🚀 Installation

### 1️⃣ Automated Install (Recommended)

Run the included magic script to set everything up instantly:

```bash
sudo ./install.sh
```

### 2️⃣ Manual Setup

If you prefer doing it yourself:

1.  **Copy the files**

    ```bash
    sudo cp -r javad-theme /usr/share/sddm/themes/
    ```

2.  **Activate the theme**
    Edit `/etc/sddm.conf` and set the theme:

    ```ini
    [Theme]
    Current=javad-theme
    ```

3.  **Restart & Enjoy**
    ```bash
    sudo systemctl restart sddm
    ```

<br/>

## 🛠 Customization

Make it yours by editing `theme.conf`.

| Configuration         | Description               |  Default  |
| :-------------------- | :------------------------ | :-------: |
| 🎨 `background`       | Main background color     | `#252D38` |
| ✨ `accentColor`      | Accent/branding color     | `#7FD4C1` |
| 🖼 `avatarBackground` | Avatar circle background  | `#A8E6CF` |
| ⌨️ `inputBackground`  | Password input background | `#3A4352` |
| 📏 `avatarSize`       | Avatar diameter (px)      |   `100`   |
| ↔️ `inputWidth`       | Input field width         |   `320`   |
| ↕️ `inputHeight`      | Input field height        |   `52`    |
| ⏱ `fadeInDuration`    | Animation speed (ms)      |   `800`   |

<br/>

## ⌨️ Shortcuts

|    Key    | Action             |
| :-------: | :----------------- |
| **Enter** | 🔓 Submit Password |
|  **Esc**  | ❌ Clear Field     |
|  **F1**   | 🔄 Toggle Sessions |

<br/>

## 🧩 Requirements

- **SDDM** (Simple Desktop Display Manager)
- **Qt 5.15+** (QtQuick 2.15)
- **QtGraphicalEffects 1.12**

<br/>

<div align="center">
  <sub>Created with ❤️ by Javad</sub>
</div>

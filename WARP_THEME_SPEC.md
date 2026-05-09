# How to Create a Warp Theme

## File Location

Custom themes go in:
```
~/.warp/themes/
```

## Working YAML Format

```yaml
name: Theme Name
details: "darker"
accent: "#RRGGBB"
background: "#RRGGBB"
foreground: "#RRGGBB"

terminal_colors:
  bright:
    black: "#RRGGBB"
    red: "#RRGGBB"
    green: "#RRGGBB"
    yellow: "#RRGGBB"
    blue: "#RRGGBB"
    magenta: "#RRGGBB"
    cyan: "#RRGGBB"
    white: "#RRGGBB"
  normal:
    black: "#RRGGBB"
    red: "#RRGGBB"
    green: "#RRGGBB"
    yellow: "#RRGGBB"
    blue: "#RRGGBB"
    magenta: "#RRGGBB"
    cyan: "#RRGGBB"
    white: "#RRGGBB"
```

## Key Rules

1. **`name` field** - Must be the FIRST field
2. **`details` field** - Use double quotes (e.g., `"darker"`, `"lighter"`)
3. **Color format** - Use double-quoted hex values like `"#RRGGBB"`
4. **`terminal_colors` order** - `bright` comes BEFORE `normal`
5. **No blank line at top** - Start directly with `name:`
6. **Filename** - Use underscores (e.g., `deep_space.yaml`), not hyphens

## Fields Reference

| Field | Required | Description |
|-------|----------|-------------|
| `name` | Yes | Display name in theme picker |
| `details` | Yes | Theme description in quotes |
| `accent` | Yes | UI accent color |
| `background` | Yes | Terminal background color |
| `foreground` | Yes | Default text color |
| `terminal_colors` | Yes | ANSI color definitions |

## Terminal Colors

The `terminal_colors` section defines 16 ANSI colors:

- **bright** - Bold/bright variants (comes first)
- **normal** - Standard colors (comes second)

Colors within each section: black, red, green, yellow, blue, magenta, cyan, white

## Optional: Background Image

```yaml
name: Theme Name
details: "darker"
accent: "#RRGGBB"
background: "#RRGGBB"
foreground: "#RRGGBB"

background_image:
  path: 'image_name.png'
  opacity: 20

terminal_colors:
  ...
```

## Example: Deep Space Theme

```yaml
name: Deep Space
details: "darker"
accent: "#5E6AD2"
background: "#050506"
foreground: "#EDEDEF"

terminal_colors:
  bright:
    black: "#1A1A20"
    red: "#E07A98"
    green: "#6DC5A0"
    yellow: "#E8C45A"
    blue: "#6872D9"
    magenta: "#A880D0"
    cyan: "#7DD3E0"
    white: "#F5F5F7"
  normal:
    black: "#0A0A0C"
    red: "#C75B7A"
    green: "#5E9E8F"
    yellow: "#D4A84B"
    blue: "#5E6AD2"
    magenta: "#8B6EB5"
    cyan: "#5BB5C4"
    white: "#8A8F98"
```

## Applying Your Theme

1. Save your `.yaml` file in `~/.warp/themes/`
2. Restart Warp (Cmd+Q then reopen)
3. Go to Settings → Appearance → Themes
4. Your theme should appear in the list

#!/bin/bash
# Convert iTerm dynamic-colors to Warp themes

OUTPUT_DIR="themes"
mkdir -p "$OUTPUT_DIR"

for sh_file in iterm-dynamic-colors/*.sh; do
    filename=$(basename "$sh_file" .sh)
    warp_filename=$(echo "$filename" | tr ' ' '_')

    # Parse colors using individual variables
    c0="" c1="" c2="" c3="" c4="" c5="" c6="" c7=""
    c8="" c9="" ca="" cb="" cc="" cd="" ce="" cf=""
    cg="" ch="" ci="" cj="" ck="" cl=""

    while IFS= read -r line; do
        # Match \033]P{slot}{6hex}\033\\
        if [[ "$line" =~ \\033\]P([0-9a-z])([0-9a-fA-F]{6})\\033 ]]; then
            slot="${BASH_REMATCH[1]}"
            color="${BASH_REMATCH[2]}"
            case "$slot" in
                0) c0="$color" ;; 1) c1="$color" ;; 2) c2="$color" ;;
                3) c3="$color" ;; 4) c4="$color" ;; 5) c5="$color" ;;
                6) c6="$color" ;; 7) c7="$color" ;; 8) c8="$color" ;;
                9) c9="$color" ;; a) ca="$color" ;; b) cb="$color" ;;
                c) cc="$color" ;; d) cd="$color" ;; e) ce="$color" ;;
                f) cf="$color" ;; g) cg="$color" ;; h) ch="$color" ;;
                i) ci="$color" ;; j) cj="$color" ;; k) ck="$color" ;;
                l) cl="$color" ;;
            esac
        fi
    done < "$sh_file"

    foreground="#${cg}"
    background="#${ch}"
    if [[ -n "$cl" ]]; then
        accent="#${cl}"
    else
        accent="#${c4}"
    fi

    # Determine light or dark
    bg_hex="${ch}"
    r=$((16#${bg_hex:0:2}))
    g_val=$((16#${bg_hex:2:2}))
    b=$((16#${bg_hex:4:2}))
    luminance=$(( (r * 299 + g_val * 587 + b * 114) / 1000 ))
    if (( luminance > 128 )); then
        details="lighter"
    else
        details="darker"
    fi

    cat > "$OUTPUT_DIR/${warp_filename}.yaml" << EOF
name: ${filename}
details: "${details}"
accent: "${accent}"
background: "${background}"
foreground: "${foreground}"

terminal_colors:
  bright:
    black: "#${c8}"
    red: "#${c9}"
    green: "#${ca}"
    yellow: "#${cb}"
    blue: "#${cc}"
    magenta: "#${cd}"
    cyan: "#${ce}"
    white: "#${cf}"
  normal:
    black: "#${c0}"
    red: "#${c1}"
    green: "#${c2}"
    yellow: "#${c3}"
    blue: "#${c4}"
    magenta: "#${c5}"
    cyan: "#${c6}"
    white: "#${c7}"
EOF

    echo "Converted: $filename"
done

echo ""
echo "Done! Generated $(ls "$OUTPUT_DIR"/*.yaml 2>/dev/null | wc -l | tr -d ' ') themes."

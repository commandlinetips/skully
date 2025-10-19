#!/data/data/com.termux/files/usr/bin/bash
# Termux Color Scheme Changer
# Simple script to change Termux terminal colors without using the Termux:Styling app
# Usage: ./termux-style.sh [theme-name]
#        ./termux-style.sh list
#        ./termux-style.sh random

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Define the color file path
TERMUX_DIR="$HOME/.termux"
COLORS_FILE="$TERMUX_DIR/colors.properties"

# Function to display header
show_header() {
    echo -e "${CYAN}================================${NC}"
    echo -e "${CYAN}   Termux Color Scheme Changer${NC}"
    echo -e "${CYAN}================================${NC}"
    echo ""
}

# Function to create .termux directory if it doesn't exist
ensure_termux_dir() {
    if [ ! -d "$TERMUX_DIR" ]; then
        echo -e "${YELLOW}Creating $TERMUX_DIR directory...${NC}"
        mkdir -p "$TERMUX_DIR"
        chmod 755 "$TERMUX_DIR"
    fi
}

# Function to backup current colors
backup_colors() {
    if [ -f "$COLORS_FILE" ]; then
        local backup_file="${COLORS_FILE}.backup-$(date +%Y%m%d-%H%M%S)"
        cp "$COLORS_FILE" "$backup_file"
        echo -e "${GREEN}✓ Current colors backed up to: $backup_file${NC}"
    fi
}

# Function to apply a theme
apply_theme() {
    local theme_name="$1"

    case "$theme_name" in
        dracula)
            cat > "$COLORS_FILE" << 'EOF'
# Dracula Theme
# https://draculatheme.com/
foreground=#f8f8f2
cursor=#f8f8f2
background=#282a36
color0=#000000
color8=#4d4d4d
color1=#ff5555
color9=#ff6e67
color2=#50fa7b
color10=#5af78e
color3=#f1fa8c
color11=#f4f99d
color4=#bd93f9
color12=#caa9fa
color5=#ff79c6
color13=#ff92d0
color6=#8be9fd
color14=#9aedfe
color7=#bfbfbf
color15=#e6e6e6
EOF
            ;;

        nord)
            cat > "$COLORS_FILE" << 'EOF'
# Nord Theme
# https://git.io/nord
foreground=#d8dee9
background=#2e3440
cursor=#d8dee9
color0=#3b4252
color8=#4c566a
color1=#bf616a
color9=#bf616a
color2=#a3be8c
color10=#a3be8c
color3=#ebcb8b
color11=#ebcb8b
color4=#81a1c1
color12=#81a1c1
color5=#b48ead
color13=#b48ead
color6=#88c0d0
color14=#8fbcbb
color7=#e5e8f0
color15=#eceff4
EOF
            ;;

        gruvbox-dark)
            cat > "$COLORS_FILE" << 'EOF'
# Gruvbox Dark Theme
# https://github.com/morhetz/gruvbox
background=#1d2021
foreground=#ebdbb2
color0=#282828
color8=#928374
color1=#cc241d
color9=#fb4934
color2=#98971a
color10=#b8bb26
color3=#d79921
color11=#fabd2f
color4=#458588
color12=#83a598
color5=#b16286
color13=#d3869b
color6=#689d6a
color14=#8ec07c
color7=#a89984
color15=#ebdbb2
EOF
            ;;

        solarized-dark)
            cat > "$COLORS_FILE" << 'EOF'
# Solarized Dark Theme
# https://github.com/altercation/solarized
background=#002b36
foreground=#839496
cursor=#93a1a1
color0=#073642
color8=#002b36
color1=#dc322f
color9=#cb4b16
color2=#859900
color10=#586e75
color3=#b58900
color11=#657b83
color4=#268bd2
color12=#839496
color5=#d33682
color13=#6c71c4
color6=#2aa198
color14=#93a1a1
color7=#eee8d5
color15=#fdf6e3
EOF
            ;;

        catppuccin-mocha)
            cat > "$COLORS_FILE" << 'EOF'
# Catppuccin Mocha Theme
# https://github.com/catppuccin/catppuccin
foreground=#cdd6f4
background=#1e1e2e
cursor=#f5e0dc
color0=#45475a
color8=#585b70
color1=#f38ba8
color9=#f38ba8
color2=#a6e3a1
color10=#a6e3a1
color3=#f9e2af
color11=#f9e2af
color4=#89b4fa
color12=#89b4fa
color5=#f5c2e7
color13=#f5c2e7
color6=#94e2d5
color14=#94e2d5
color7=#bac2de
color15=#a6adc8
color16=#fab387
color17=#f5e0dc
EOF
            ;;

        tokyonight-dark)
            cat > "$COLORS_FILE" << 'EOF'
# Tokyo Night Dark Theme
foreground=#c0caf5
cursor=#c0caf5
background=#1a1b26
color0=#15161E
color8=#414868
color1=#f7768e
color9=#f7768e
color2=#9ece6a
color10=#9ece6a
color3=#e0af68
color11=#e0af68
color4=#7aa2f7
color12=#7aa2f7
color5=#bb9af7
color13=#bb9af7
color6=#7dcfff
color14=#7dcfff
color7=#a9b1d6
color15=#c0caf5
color16=#ff9e64
color17=#db4b4b
EOF
            ;;

        monokai)
            cat > "$COLORS_FILE" << 'EOF'
# Monokai Theme
background=#272822
foreground=#f8f8f2
cursor=#f8f8f0
color0=#272822
color8=#75715e
color1=#f92672
color9=#f92672
color2=#a6e22e
color10=#a6e22e
color3=#f4bf75
color11=#f4bf75
color4=#66d9ef
color12=#66d9ef
color5=#ae81ff
color13=#ae81ff
color6=#a1efe4
color14=#a1efe4
color7=#f8f8f2
color15=#f9f8f5
EOF
            ;;

        one-dark)
            cat > "$COLORS_FILE" << 'EOF'
# One Dark Theme
background=#282c34
foreground=#abb2bf
cursor=#528bff
color0=#282c34
color8=#545862
color1=#e06c75
color9=#e06c75
color2=#98c379
color10=#98c379
color3=#e5c07b
color11=#e5c07b
color4=#61afef
color12=#61afef
color5=#c678dd
color13=#c678dd
color6=#56b6c2
color14=#56b6c2
color7=#abb2bf
color15=#c8ccd4
EOF
            ;;

        matrix)
            cat > "$COLORS_FILE" << 'EOF'
# Matrix Theme (Green on Black)
background=#000000
foreground=#00ff00
cursor=#00ff00
color0=#000000
color8=#006600
color1=#00ff00
color9=#00ff00
color2=#00ff00
color10=#00ff00
color3=#00ff00
color11=#00ff00
color4=#00cc00
color12=#00cc00
color5=#00aa00
color13=#00aa00
color6=#00ff00
color14=#00ff00
color7=#00ff00
color15=#00ff00
EOF
            ;;

        hacker)
            cat > "$COLORS_FILE" << 'EOF'
# Hacker Theme (Green on Dark)
background=#0d1117
foreground=#00ff41
cursor=#00ff41
color0=#0d1117
color8=#1f2937
color1=#ff0000
color9=#ff5555
color2=#00ff41
color10=#50fa7b
color3=#ffff00
color11=#f1fa8c
color4=#0066ff
color12=#0099ff
color5=#cc00ff
color13=#ff00ff
color6=#00ffff
color14=#8be9fd
color7=#d0d0d0
color15=#ffffff
EOF
            ;;

        light)
            cat > "$COLORS_FILE" << 'EOF'
# Light Theme (Black on White)
background=#ffffff
foreground=#000000
cursor=#4d4d4d
color0=#000000
color8=#767676
color1=#cd3131
color9=#f14c4c
color2=#00bc00
color10=#23d18b
color3=#949800
color11=#f5f543
color4=#0451a5
color12=#3b8eea
color5=#bc05bc
color13=#d670d6
color6=#0598bc
color14=#29b8db
color7=#555555
color15=#e5e5e5
EOF
            ;;

        ocean)
            cat > "$COLORS_FILE" << 'EOF'
# Ocean Theme
background=#1c2b36
foreground=#c0c5ce
cursor=#c0c5ce
color0=#1c2b36
color8=#65737e
color1=#bf616a
color9=#bf616a
color2=#a3be8c
color10=#a3be8c
color3=#ebcb8b
color11=#ebcb8b
color4=#8fa1b3
color12=#8fa1b3
color5=#b48ead
color13=#b48ead
color6=#96b5b4
color14=#96b5b4
color7=#c0c5ce
color15=#eff1f5
EOF
            ;;

        *)
            echo -e "${RED}✗ Unknown theme: $theme_name${NC}"
            echo -e "${YELLOW}Run './termux-style.sh list' to see available themes${NC}"
            return 1
            ;;
    esac

    chmod 644 "$COLORS_FILE"
    echo -e "${GREEN}✓ Theme '$theme_name' applied successfully!${NC}"
    return 0
}

# Function to list all available themes
list_themes() {
    echo -e "${CYAN}Available Themes:${NC}"
    echo ""
    echo -e "${MAGENTA}Dark Themes:${NC}"
    echo "  • dracula          - Dracula purple dark theme"
    echo "  • nord             - Nord arctic blue theme"
    echo "  • gruvbox-dark     - Retro groove dark theme"
    echo "  • solarized-dark   - Solarized dark precision colors"
    echo "  • catppuccin-mocha - Catppuccin mocha pastel theme"
    echo "  • tokyonight-dark  - Tokyo Night dark theme"
    echo "  • monokai          - Monokai classic theme"
    echo "  • one-dark         - Atom One Dark theme"
    echo "  • ocean            - Ocean blue theme"
    echo ""
    echo -e "${MAGENTA}Special Themes:${NC}"
    echo "  • matrix           - Matrix green on black"
    echo "  • hacker           - Hacker style green terminal"
    echo ""
    echo -e "${MAGENTA}Light Themes:${NC}"
    echo "  • light            - Light theme (black on white)"
    echo ""
    echo -e "${YELLOW}Commands:${NC}"
    echo "  • list             - Show this list"
    echo "  • random           - Apply a random theme"
    echo "  • backup           - Backup current colors"
    echo "  • restore          - Restore from latest backup"
    echo ""
}

# Function to apply random theme
apply_random_theme() {
    local themes=(dracula nord gruvbox-dark solarized-dark catppuccin-mocha tokyonight-dark monokai one-dark matrix hacker ocean)
    local random_theme=${themes[$RANDOM % ${#themes[@]}]}
    echo -e "${CYAN}Applying random theme: $random_theme${NC}"
    apply_theme "$random_theme"
}

# Function to restore from backup
restore_backup() {
    local latest_backup=$(ls -t "${COLORS_FILE}.backup-"* 2>/dev/null | head -1)
    if [ -z "$latest_backup" ]; then
        echo -e "${RED}✗ No backup found${NC}"
        return 1
    fi
    cp "$latest_backup" "$COLORS_FILE"
    echo -e "${GREEN}✓ Restored from backup: $latest_backup${NC}"
}

# Function to show usage
show_usage() {
    echo -e "${YELLOW}Usage:${NC}"
    echo "  $0 [theme-name]     Apply a theme"
    echo "  $0 list             List all available themes"
    echo "  $0 random           Apply a random theme"
    echo "  $0 backup           Backup current colors"
    echo "  $0 restore          Restore from latest backup"
    echo ""
    echo -e "${YELLOW}Example:${NC}"
    echo "  $0 dracula"
    echo "  $0 nord"
    echo ""
}

# Function to show reload instructions
show_reload_instructions() {
    echo ""
    echo -e "${CYAN}═══════════════════════════════════════${NC}"
    echo -e "${GREEN}To see the changes:${NC}"
    echo -e "${YELLOW}1.${NC} Close this terminal session (type 'exit')"
    echo -e "${YELLOW}2.${NC} Open a new session in Termux"
    echo -e "${YELLOW}   OR${NC}"
    echo -e "${YELLOW}   Swipe from left and select 'New session'${NC}"
    echo -e "${CYAN}═══════════════════════════════════════${NC}"
}

# Main script logic
main() {
    show_header
    ensure_termux_dir

    # Check arguments
    if [ "$#" -eq 0 ]; then
        show_usage
        list_themes
        exit 0
    fi

    case "$1" in
        list|--list|-l)
            list_themes
            ;;
        random|--random|-r)
            backup_colors
            apply_random_theme
            show_reload_instructions
            ;;
        backup|--backup|-b)
            backup_colors
            ;;
        restore|--restore)
            restore_backup
            show_reload_instructions
            ;;
        help|--help|-h)
            show_usage
            list_themes
            ;;
        *)
            backup_colors
            if apply_theme "$1"; then
                show_reload_instructions
            else
                exit 1
            fi
            ;;
    esac
}

# Run main function
main "$@"

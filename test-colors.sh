#!/data/data/com.termux/files/usr/bin/bash
# Test script to preview terminal colors
# Run this after applying a theme to see all colors

echo "======================================"
echo "  Termux Color Preview"
echo "======================================"
echo ""

echo "Standard Colors:"
echo -e "\033[0;30m■\033[0m Black      (color0)   \033[1;30m■\033[0m Bright Black   (color8)"
echo -e "\033[0;31m■\033[0m Red        (color1)   \033[1;31m■\033[0m Bright Red     (color9)"
echo -e "\033[0;32m■\033[0m Green      (color2)   \033[1;32m■\033[0m Bright Green   (color10)"
echo -e "\033[0;33m■\033[0m Yellow     (color3)   \033[1;33m■\033[0m Bright Yellow  (color11)"
echo -e "\033[0;34m■\033[0m Blue       (color4)   \033[1;34m■\033[0m Bright Blue    (color12)"
echo -e "\033[0;35m■\033[0m Magenta    (color5)   \033[1;35m■\033[0m Bright Magenta (color13)"
echo -e "\033[0;36m■\033[0m Cyan       (color6)   \033[1;36m■\033[0m Bright Cyan    (color14)"
echo -e "\033[0;37m■\033[0m White      (color7)   \033[1;37m■\033[0m Bright White   (color15)"

echo ""
echo "Text Styles:"
echo -e "\033[0mNormal text (foreground color)"
echo -e "\033[1mBold text\033[0m"
echo -e "\033[3mItalic text\033[0m"
echo -e "\033[4mUnderlined text\033[0m"
echo -e "\033[7mInverted colors (background/foreground swapped)\033[0m"

echo ""
echo "Sample Code Highlighting:"
echo -e "\033[0;32m# This is a comment\033[0m"
echo -e "\033[0;35mfunction\033[0m \033[0;33mhello\033[0m() {"
echo -e "  \033[0;36mecho\033[0m \033[0;31m\"Hello, World!\"\033[0m"
echo -e "}"

echo ""
echo "Background: This is the background color you're seeing"
echo "Foreground: This is the text color (foreground)"
echo ""

# Show color blocks
echo "Color Blocks:"
for color in {0..15}; do
    echo -en "\033[48;5;${color}m  \033[0m"
    if [ $((($color + 1) % 8)) -eq 0 ]; then
        echo ""
    fi
done

echo ""
echo "======================================"
echo "Current theme file: ~/.termux/colors.properties"
if [ -f ~/.termux/colors.properties ]; then
    echo "Theme is active ✓"
else
    echo "No custom theme (using defaults)"
fi
echo "======================================"

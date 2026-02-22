#!/bin/bash
# Usage: ./install.sh [command-name]
# With no args: installs all commands
# With a name: installs just that command (e.g. ./install.sh forum)

COMMANDS_DIR="$HOME/.claude/commands"
mkdir -p "$COMMANDS_DIR"

install_command() {
  local name=$1
  local src="$name/commands/$name.md"
  if [ -f "$src" ]; then
    cp "$src" "$COMMANDS_DIR/$name.md"
    echo "Installed /$name → $COMMANDS_DIR/$name.md"
  else
    echo "Command not found: $name"
  fi
}

KNOWN_COMMANDS=("conviction" "forum" "horizon" "premortem" "succinct")

if [ -z "$1" ]; then
  for name in "${KNOWN_COMMANDS[@]}"; do
    install_command "$name"
  done
else
  install_command "$1"
fi

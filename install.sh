#!/bin/sh

BIN_DIR="$HOME/.local/bin"
CURRENT_DIR="$(pwd)/scripts"

BIN_SCRIPTS="rundwl"
SRC_SCRIPTS="dwlstart"

install() {
    mkdir -p "$BIN_DIR"
    mkdir -p "$BIN_DIR/scripts"

    for script in $BIN_SCRIPTS; do
        src="$CURRENT_DIR/${script}.sh"
        dest="$BIN_DIR/$script"

        if [ -f "$src" ]; then
            chmod +x "$src"
            ln -sf "$src" "$dest"
            echo "Linked: $script"
        else
            echo "Warning: ${script}.sh not found, skipping"
        fi
    done

    for script in $SRC_SCRIPTS; do
        src="$CURRENT_DIR/${script}.sh"
        dest="$BIN_DIR/scripts/$script"

        if [ -f "$src" ]; then
            chmod +x "$src"
            ln -sf "$src" "$dest"
            echo "Linked: $script"
        else
            echo "Warning: ${script}.sh not found, skipping"
        fi
    done
}

clean() {
    for script in $BIN_SCRIPTS; do
        dest="$BIN_DIR/$script"
        if [ -L "$dest" ]; then
            rm "$dest"
            echo "Removed: $script"
        fi
    done
    for script in $SRC_SCRIPTS; do
        dest="$BIN_DIR/scripts/$script"
        if [ -L "$dest" ]; then
            rm "$dest"
            echo "Removed: $script"
        fi
    done
}

case "$1" in
    clean)
        clean
        ;;
    *)
        install
        ;;
esac

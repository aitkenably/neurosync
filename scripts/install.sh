#!/bin/bash
set -euo pipefail

APP_NAME="neurosync"
APP_ROOT="/opt/$APP_NAME"
BIN_DIR="/usr/local/bin"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

mkdir -p "$APP_ROOT/bin" "$APP_ROOT/lib" "$APP_ROOT/config"

VERSIONED_JAR="$APP_NAME-$VERSION.jar"
SOURCE_JAR="../target/$VERSIONED_JAR"
DEST_LIB_DIR="$APP_ROOT/lib"
DEST_JAR="$DEST_LIB_DIR/$VERSIONED_JAR"
LINK_JAR="$DEST_LIB_DIR/$APP_NAME.jar"

mkdir -p "$APP_ROOT/bin" "$APP_ROOT/lib" "$APP_ROOT/config"

cp "$SOURCE_JAR" "$DEST_JAR"
ln -sfn "$VERSIONED_JAR" "$LINK_JAR"

cp deploy/neurosync-launcher.sh "$APP_ROOT/bin/$APP_NAME"
chmod +x "$APP_ROOT/bin/$APP_NAME"

if [[ ! -f "$APP_ROOT/config/application.properties" ]]; then
  cp deploy/application.properties "$APP_ROOT/config/application.properties"
fi

ln -sf "$APP_ROOT/bin/$APP_NAME" "$BIN_DIR/$APP_NAME"

echo "Done"
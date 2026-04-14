#!/bin/bash

set -euo pipefail

APP_HOME="/opt/neurosync"
JAR="$APP_HOME/lib/neurosync.jar"
CONFIG_DIR="$APP_HOME/config"

JAVA_OPTS="${JAVA_OPTS:-}"

if [[ ! -f "$JAR" ]]; then
  echo "ERROR: JAR not found: $JAR" >&2
  exit 1
fi

exec java $JAVA_OPTS -jar "$JAR" \
  --spring.config.additional-location="file:$CONFIG_DIR/" \
  "$@"
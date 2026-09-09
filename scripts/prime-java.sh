#!/usr/bin/env bash
set -euo pipefail

if ! command -v prime-run >/dev/null 2>&1; then
    printf '%s\n' 'Error: prime-run is required but was not found in PATH.' >&2
    exit 127
fi

if [[ -n "${JAVA_HOME:-}" && -x "$JAVA_HOME/bin/java" ]]; then
    java_bin="$JAVA_HOME/bin/java"
elif command -v java >/dev/null 2>&1; then
    java_bin="$(command -v java)"
else
    printf '%s\n' 'Error: Java was not found. Install Java or set JAVA_HOME.' >&2
    exit 127
fi

exec prime-run "$java_bin" "$@"

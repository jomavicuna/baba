#!/bin/bash

# 🌱 Baba Digital Garden - Stop Watcher

PROJECT_DIR="/Users/vicuna/home/astro/baba"
PID_FILE="$PROJECT_DIR/.watcher.pid"

cd "$PROJECT_DIR" || exit 1

if [ ! -f "$PID_FILE" ]; then
    echo "❌ Watcher is not running (no PID file found)"
    exit 1
fi

PID=$(cat "$PID_FILE")

if ! ps -p "$PID" > /dev/null 2>&1; then
    echo "❌ Watcher is not running (stale PID: $PID)"
    rm -f "$PID_FILE"
    exit 1
fi

echo "🛑 Stopping watcher (PID: $PID)..."
kill "$PID"

# Wait for process to stop
for i in {1..5}; do
    if ! ps -p "$PID" > /dev/null 2>&1; then
        rm -f "$PID_FILE"
        echo "✅ Watcher stopped successfully"
        exit 0
    fi
    sleep 1
done

# Force kill if still running
if ps -p "$PID" > /dev/null 2>&1; then
    echo "⚠️  Force killing watcher..."
    kill -9 "$PID"
    rm -f "$PID_FILE"
    echo "✅ Watcher stopped"
fi

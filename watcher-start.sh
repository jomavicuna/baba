#!/bin/bash

# 🌱 Baba Digital Garden - Start Watcher

PROJECT_DIR="/Users/vicuna/home/astro/baba"
PID_FILE="$PROJECT_DIR/.watcher.pid"
LOG_FILE="$PROJECT_DIR/sync-watcher.log"

cd "$PROJECT_DIR" || exit 1

# Check if already running
if [ -f "$PID_FILE" ]; then
    PID=$(cat "$PID_FILE")
    if ps -p "$PID" > /dev/null 2>&1; then
        echo "❌ Watcher is already running (PID: $PID)"
        echo "   Use ./watcher-stop.sh to stop it first"
        exit 1
    else
        echo "🧹 Cleaning up stale PID file..."
        rm -f "$PID_FILE"
    fi
fi

echo "🚀 Starting Obsidian notes watcher..."
echo "📋 Logs: $LOG_FILE"

# Start watcher in background
nohup ./sync-watcher.sh > /dev/null 2>&1 &

sleep 1

if [ -f "$PID_FILE" ]; then
    PID=$(cat "$PID_FILE")
    echo "✅ Watcher started successfully (PID: $PID)"
    echo ""
    echo "Commands:"
    echo "  📊 View logs:  tail -f $LOG_FILE"
    echo "  ⏸️  Stop:       ./watcher-stop.sh"
    echo "  📈 Status:     ./watcher-status.sh"
else
    echo "❌ Failed to start watcher"
    exit 1
fi

#!/bin/bash

# 🌱 Baba Digital Garden - Watcher Status

PROJECT_DIR="/Users/vicuna/home/astro/baba"
PID_FILE="$PROJECT_DIR/.watcher.pid"
LOG_FILE="$PROJECT_DIR/sync-watcher.log"
LAST_SYNC_FILE="$PROJECT_DIR/.last-sync"

cd "$PROJECT_DIR" || exit 1

echo "🌱 Baba Digital Garden - Watcher Status"
echo "========================================"
echo ""

# Check if running
if [ -f "$PID_FILE" ]; then
    PID=$(cat "$PID_FILE")
    if ps -p "$PID" > /dev/null 2>&1; then
        echo "Status:        ✅ Running"
        echo "PID:           $PID"

        # Get memory and CPU usage
        MEM=$(ps -o rss= -p "$PID" | awk '{printf "%.1f MB", $1/1024}')
        CPU=$(ps -o %cpu= -p "$PID" | awk '{printf "%.1f%%", $1}')
        echo "Memory:        $MEM"
        echo "CPU:           $CPU"
    else
        echo "Status:        ❌ Not running (stale PID)"
        rm -f "$PID_FILE"
    fi
else
    echo "Status:        ❌ Not running"
fi

echo ""

# Last sync info
if [ -f "$LAST_SYNC_FILE" ]; then
    LAST_SYNC=$(cat "$LAST_SYNC_FILE")
    LAST_SYNC_DATE=$(date -r "$LAST_SYNC" '+%Y-%m-%d %H:%M:%S')
    NOW=$(date +%s)
    DIFF=$((NOW - LAST_SYNC))

    if [ $DIFF -lt 60 ]; then
        AGO="${DIFF}s ago"
    elif [ $DIFF -lt 3600 ]; then
        AGO="$((DIFF / 60))m ago"
    else
        AGO="$((DIFF / 3600))h ago"
    fi

    echo "Last Sync:     $LAST_SYNC_DATE ($AGO)"
else
    echo "Last Sync:     Never"
fi

echo ""

# Recent log entries
if [ -f "$LOG_FILE" ]; then
    LOG_SIZE=$(wc -l < "$LOG_FILE" | xargs)
    echo "Log Entries:   $LOG_SIZE lines"
    echo ""
    echo "Recent Activity:"
    echo "----------------"
    tail -5 "$LOG_FILE"
else
    echo "Log File:      Not found"
fi

echo ""
echo "Commands:"
echo "  Start:   ./watcher-start.sh"
echo "  Stop:    ./watcher-stop.sh"
echo "  Logs:    tail -f $LOG_FILE"

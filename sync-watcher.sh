#!/bin/bash

# 🌱 Baba Digital Garden - Auto Sync Watcher
# Monitors /Users/vicuna/home for Obsidian changes and syncs to Git

OBSIDIAN_DIR="/Users/vicuna/home"
PROJECT_DIR="/Users/vicuna/home/astro/baba"
CONTENT_DIR="$PROJECT_DIR/src/content/notes"
LOG_FILE="$PROJECT_DIR/sync-watcher.log"
PID_FILE="$PROJECT_DIR/.watcher.pid"

# Delay in seconds before syncing (to batch multiple changes)
SYNC_DELAY=30

# Cooldown period to prevent rapid consecutive syncs
LAST_SYNC_FILE="$PROJECT_DIR/.last-sync"
COOLDOWN=60  # seconds

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

should_sync() {
    if [ ! -f "$LAST_SYNC_FILE" ]; then
        return 0
    fi

    local last_sync=$(cat "$LAST_SYNC_FILE")
    local now=$(date +%s)
    local diff=$((now - last_sync))

    if [ $diff -lt $COOLDOWN ]; then
        log "⏳ Cooldown active, skipping sync ($diff seconds since last sync)"
        return 1
    fi

    return 0
}

sync_notes() {
    if ! should_sync; then
        return
    fi

    log "🔄 Starting sync..."

    cd "$PROJECT_DIR" || exit 1

    # Copy markdown files
    log "📝 Copying markdown files..."
    cp -r "$OBSIDIAN_DIR"/*.md "$CONTENT_DIR/" 2>/dev/null || true
    cp -r "$OBSIDIAN_DIR"/staff "$CONTENT_DIR/" 2>/dev/null || true
    cp -r "$OBSIDIAN_DIR"/food "$CONTENT_DIR/" 2>/dev/null || true

    # Check if there are changes
    if [ -z "$(git status --porcelain)" ]; then
        log "✨ No changes detected"
        return
    fi

    # Commit and push
    log "📦 Committing changes..."
    git add .
    git commit -m "Auto-sync: Update notes from Obsidian

$(date '+%Y-%m-%d %H:%M:%S')

🤖 Synced automatically by watcher" -q

    log "⬆️  Pushing to GitHub..."
    if git push -q; then
        log "✅ Sync completed successfully!"
        date +%s > "$LAST_SYNC_FILE"
    else
        log "❌ Push failed!"
    fi
}

# Trap to cleanup on exit
cleanup() {
    log "🛑 Stopping watcher..."
    rm -f "$PID_FILE"
    exit 0
}

trap cleanup SIGINT SIGTERM

# Store PID
echo $$ > "$PID_FILE"

log "👀 Starting Obsidian notes watcher..."
log "📂 Watching: $OBSIDIAN_DIR"
log "🎯 Target: $CONTENT_DIR"
log "⏱️  Sync delay: ${SYNC_DELAY}s"
log "🔒 Cooldown: ${COOLDOWN}s"

# Watch for changes and trigger sync after delay
fswatch -0 -r -l "$SYNC_DELAY" \
    --exclude '\.obsidian' \
    --exclude '\.git' \
    --exclude '\.DS_Store' \
    --exclude 'astro' \
    --include '\.md$' \
    "$OBSIDIAN_DIR" | while read -d "" event; do
    log "📝 Change detected: $(basename "$event")"
    sync_notes
done

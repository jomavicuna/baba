#!/bin/bash

# 🌱 Baba Digital Garden - Manual Sync Script
# Sync Obsidian notes to GitHub/Vercel immediately

OBSIDIAN_DIR="/Users/vicuna/home"
PROJECT_DIR="/Users/vicuna/home/astro/baba"
CONTENT_DIR="$PROJECT_DIR/src/content/notes"

# Notification function
notify() {
    osascript -e "display notification \"$2\" with title \"🌱 Baba Sync\" sound name \"$3\""
}

# Start notification
notify "" "🚀 Sincronizando notas..." "Submarine"

cd "$PROJECT_DIR" || exit 1

# Copy root markdown files
cp -r "$OBSIDIAN_DIR"/*.md "$CONTENT_DIR/" 2>/dev/null || true

# Copy all subdirectories (excluding system folders)
for dir in "$OBSIDIAN_DIR"/*/; do
    dirname=$(basename "$dir")
    if [[ "$dirname" != ".obsidian" && "$dirname" != "astro" && "$dirname" != ".git" ]]; then
        cp -r "$dir" "$CONTENT_DIR/" 2>/dev/null || true
    fi
done

# Check if there are changes
if [ -z "$(git status --porcelain)" ]; then
    notify "" "✨ No hay cambios para sincronizar" "Glass"
    exit 0
fi

# Get number of changed files
CHANGED_FILES=$(git status --porcelain | wc -l | xargs)

# Commit and push
git add .
git commit -m "Manual sync from macOS Shortcut

$CHANGED_FILES archivo(s) modificado(s)
$(date '+%Y-%m-%d %H:%M:%S')

🤖 Synced via button" -q

if git push -q; then
    notify "" "✅ $CHANGED_FILES archivo(s) publicados en Vercel" "Glass"
    echo "✅ Sync completed successfully"
    exit 0
else
    notify "" "❌ Error al hacer push a GitHub" "Basso"
    echo "❌ Push failed"
    exit 1
fi

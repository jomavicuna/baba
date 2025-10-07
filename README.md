# 🌱 Baba - Digital Garden

Astro-powered digital garden that automatically syncs your Obsidian notes to Vercel.

## 🚀 Quick Start

### Auto-Sync Watcher

Watch for changes in Obsidian and automatically sync to GitHub/Vercel:

```bash
# Start the watcher
./watcher-start.sh

# Check status
./watcher-status.sh

# Stop the watcher
./watcher-stop.sh

# View live logs
tail -f sync-watcher.log
```

### Manual Sync

If you prefer to sync manually:

```bash
# Copy latest notes from Obsidian
cp -r /Users/vicuna/home/*.md src/content/notes/
cp -r /Users/vicuna/home/staff src/content/notes/ 2>/dev/null || true

# Commit and push
git add .
git commit -m "Update notes"
git push
```

## 🔧 How It Works

1. **Watcher** monitors `/Users/vicuna/home` for `.md` file changes
2. Waits **30 seconds** after last change (batches multiple edits)
3. **Cooldown** of 60 seconds between syncs (prevents spam)
4. Copies files to `src/content/notes/`
5. Commits and pushes to GitHub
6. Vercel auto-deploys (~30 seconds)

## 📊 Watcher Configuration

Edit `sync-watcher.sh` to customize:

- `SYNC_DELAY=30` - Wait time after detecting changes (seconds)
- `COOLDOWN=60` - Minimum time between syncs (seconds)

## 🌐 URLs

- **Production:** https://baba-lnrjxffq7-vicuna-3000.vercel.app
- **GitHub:** https://github.com/jomavicuna/baba

## 📝 Features

- ✅ Obsidian wikilinks `[[note]]`
- ✅ Backlinks
- ✅ Tags
- ✅ Graph view (D3.js)
- ✅ Auto-sync from Obsidian
- ✅ Dark theme

## 🛠️ Development

```bash
# Install dependencies
npm install

# Start dev server
npm run dev

# Build
npm run build

# Preview build
npm run preview
```

## 📦 Tech Stack

- **Framework:** Astro 5.x
- **Deployment:** Vercel
- **Watcher:** fswatch
- **Graph:** D3.js
- **Source:** Obsidian vault

## 🐛 Troubleshooting

**Watcher not starting?**
```bash
# Check if already running
./watcher-status.sh

# Force stop
./watcher-stop.sh

# Restart
./watcher-start.sh
```

**Changes not syncing?**
```bash
# Check logs
tail -f sync-watcher.log

# Verify fswatch is installed
which fswatch

# Manual sync to test
./watcher-stop.sh
# Make a change in Obsidian
./watcher-start.sh
```

## 📄 License

MIT

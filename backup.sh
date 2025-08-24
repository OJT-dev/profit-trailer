#!/bin/bash

# ProfitTrailer Configuration Backup Script
# Backs up important configuration files and data

BACKUP_DIR="backups/$(date +%Y%m%d_%H%M%S)"
echo "================================================="
echo "        ProfitTrailer Backup Utility"
echo "================================================="
echo

# Create backup directory
mkdir -p "$BACKUP_DIR"

echo "📁 Creating backup in: $BACKUP_DIR"
echo

# Configuration files to backup
CONFIG_FILES=(
    "application.properties"
    "PAIRS.properties"
    "DCA.properties"
    "INDICATORS.properties"
    "ADDONS.properties"
)

# Backup configuration files
echo "💾 Backing up configuration files:"
for file in "${CONFIG_FILES[@]}"; do
    if [ -f "$file" ]; then
        cp "$file" "$BACKUP_DIR/"
        echo "✅ $file"
    else
        echo "⚠️  $file (not found)"
    fi
done
echo

# Backup data directory if it exists
if [ -d "data" ]; then
    echo "📊 Backing up data directory..."
    cp -r data "$BACKUP_DIR/"
    echo "✅ Data directory backed up"
else
    echo "⚠️  No data directory found"
fi
echo

# Backup logs (last 7 days only to save space)
if [ -d "logs" ]; then
    echo "📜 Backing up recent logs..."
    mkdir -p "$BACKUP_DIR/logs"
    find logs -name "*.log" -mtime -7 -exec cp {} "$BACKUP_DIR/logs/" \;
    echo "✅ Recent logs backed up"
else
    echo "⚠️  No logs directory found"
fi
echo

# Create backup info file
cat > "$BACKUP_DIR/backup_info.txt" << EOF
ProfitTrailer Backup Information
================================
Backup Date: $(date)
Backup Location: $BACKUP_DIR
Hostname: $(hostname)
ProfitTrailer Status: $(pgrep -f "ProfitTrailer.jar" > /dev/null && echo "Running" || echo "Stopped")

Configuration Files Backed Up:
$(ls -la "$BACKUP_DIR"/*.properties 2>/dev/null || echo "No .properties files found")

Data Directory Size: $(du -sh data 2>/dev/null | cut -f1 || echo "N/A")
EOF

# Create a compressed archive
echo "🗜️  Creating compressed archive..."
cd backups
tar -czf "$(basename "$BACKUP_DIR").tar.gz" "$(basename "$BACKUP_DIR")"
cd ..

if [ $? -eq 0 ]; then
    echo "✅ Compressed backup created: backups/$(basename "$BACKUP_DIR").tar.gz"
    
    # Optional: Remove uncompressed backup to save space
    read -p "Remove uncompressed backup to save space? (y/N): " remove_uncompressed
    if [[ $remove_uncompressed =~ ^[Yy]$ ]]; then
        rm -rf "$BACKUP_DIR"
        echo "🗑️  Uncompressed backup removed"
    fi
else
    echo "❌ Failed to create compressed backup"
fi

echo
echo "📊 Backup Summary:"
echo "   Backup Location: backups/$(basename "$BACKUP_DIR").tar.gz"
echo "   Backup Size: $(du -sh "backups/$(basename "$BACKUP_DIR").tar.gz" 2>/dev/null | cut -f1 || echo "Unknown")"
echo

# Cleanup old backups (keep last 10)
echo "🧹 Cleaning up old backups (keeping last 10)..."
cd backups
ls -t *.tar.gz 2>/dev/null | tail -n +11 | xargs rm -f
OLD_DIRS=$(ls -dt */ 2>/dev/null | tail -n +6)
if [ -n "$OLD_DIRS" ]; then
    echo "$OLD_DIRS" | xargs rm -rf
fi
cd ..

echo "✅ Backup complete!"
echo
echo "💡 Tip: Regular backups help protect your configuration and trading data."
echo "    Consider running this script weekly or before major changes."
echo
echo "================================================="
#!/bin/bash

# ProfitTrailer Status Monitor
# Quick script to check bot status and performance

echo "================================================="
echo "          ProfitTrailer Status Monitor"
echo "================================================="
echo

# Check if ProfitTrailer is running
echo "🤖 Bot Status:"
if pgrep -f "ProfitTrailer.jar" > /dev/null; then
    echo "✅ ProfitTrailer is RUNNING"
    
    # Get process info
    PT_PID=$(pgrep -f "ProfitTrailer.jar")
    echo "   Process ID: $PT_PID"
    
    # Memory usage
    if [ -n "$PT_PID" ]; then
        MEMORY=$(ps -p $PT_PID -o rss= | awk '{print $1/1024 " MB"}')
        echo "   Memory Usage: $MEMORY"
    fi
    
    # Check if web interface is accessible
    if curl -s http://localhost:8081 > /dev/null; then
        echo "   Web Interface: ✅ Available at http://localhost:8081"
    else
        echo "   Web Interface: ❌ Not accessible"
    fi
else
    echo "❌ ProfitTrailer is NOT RUNNING"
fi
echo

# Check configuration files
echo "📋 Configuration Status:"
CONFIG_DIR="."
if [ -f "$CONFIG_DIR/PAIRS.properties" ]; then
    echo "✅ PAIRS.properties found"
else
    echo "❌ PAIRS.properties missing"
fi

if [ -f "$CONFIG_DIR/DCA.properties" ]; then
    echo "✅ DCA.properties found"
else
    echo "❌ DCA.properties missing"
fi

if [ -f "$CONFIG_DIR/INDICATORS.properties" ]; then
    echo "✅ INDICATORS.properties found"
else
    echo "❌ INDICATORS.properties missing"
fi

if [ -f "$CONFIG_DIR/application.properties" ]; then
    echo "✅ application.properties found"
else
    echo "❌ application.properties missing"
fi
echo

# Check logs for recent activity
echo "📜 Recent Log Activity:"
if [ -f "logs/ProfitTrailer.log" ]; then
    echo "Last 5 log entries:"
    tail -5 logs/ProfitTrailer.log | sed 's/^/   /'
else
    echo "❌ No log file found"
fi
echo

# Check for errors in logs
echo "🚨 Recent Errors:"
if [ -f "logs/ProfitTrailer.log" ]; then
    ERROR_COUNT=$(grep -i "error\|exception\|failed" logs/ProfitTrailer.log | tail -3 | wc -l)
    if [ $ERROR_COUNT -gt 0 ]; then
        echo "Found recent errors:"
        grep -i "error\|exception\|failed" logs/ProfitTrailer.log | tail -3 | sed 's/^/   ❌ /'
    else
        echo "✅ No recent errors found"
    fi
else
    echo "❌ Cannot check - no log file"
fi
echo

# System resources
echo "💻 System Resources:"
echo "   CPU Usage: $(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | sed 's/%us,//')"
echo "   Memory Usage: $(free -m | awk 'NR==2{printf "%.1f%%\n", $3*100/$2}')"
echo "   Disk Space: $(df -h . | awk 'NR==2 {print $4 " available"}')"
echo

# Quick performance summary if data folder exists
echo "📊 Quick Stats:"
if [ -d "data" ]; then
    echo "✅ Data folder exists"
    # Count number of files (could indicate trading activity)
    FILE_COUNT=$(find data -name "*.json" 2>/dev/null | wc -l)
    echo "   Data files: $FILE_COUNT"
else
    echo "❌ No data folder found"
fi

echo
echo "================================================="
echo "Monitor complete. Check the web interface for detailed stats."
echo "Web Interface: http://localhost:8081"
echo "================================================="
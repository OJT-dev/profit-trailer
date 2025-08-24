#!/bin/bash

# ProfitTrailer Quick Setup Script
# Helps new users configure their bot quickly

echo "================================================="
echo "      ProfitTrailer Quick Setup Wizard"
echo "================================================="
echo

# Check if Java is installed
if ! command -v java &> /dev/null; then
    echo "❌ Java is not installed. Please install Java 8+ first."
    echo "   Ubuntu/Debian: sudo apt install openjdk-11-jdk"
    echo "   CentOS/RHEL: sudo yum install java-11-openjdk"
    exit 1
fi

echo "✅ Java found: $(java -version 2>&1 | head -n 1)"
echo

# Check if ProfitTrailer.jar exists
if [ ! -f "ProfitTrailer.jar" ]; then
    echo "❌ ProfitTrailer.jar not found in current directory."
    echo "   Please download ProfitTrailer first."
    exit 1
fi

echo "✅ ProfitTrailer.jar found"
echo

# Setup configuration files
echo "🔧 Setting up configuration files..."

# Copy application.properties if it doesn't exist
if [ ! -f "application.properties" ]; then
    if [ -f "examples/application.properties.example" ]; then
        cp examples/application.properties.example application.properties
        echo "✅ Created application.properties from example"
    else
        echo "⚠️  application.properties.example not found"
    fi
else
    echo "✅ application.properties already exists"
fi

# Ask user for strategy preference
echo
echo "📊 Choose your trading strategy:"
echo "1) Conservative (low risk, steady gains)"
echo "2) Aggressive (higher risk, bigger profits)"
echo "3) I'll configure manually"
echo

read -p "Enter your choice (1-3): " strategy_choice

case $strategy_choice in
    1)
        echo "Setting up Conservative strategy..."
        cp examples/PAIRS_conservative.properties PAIRS.properties 2>/dev/null || echo "⚠️  Conservative example not found"
        ;;
    2)
        echo "Setting up Aggressive strategy..."
        cp examples/PAIRS_aggressive.properties PAIRS.properties 2>/dev/null || echo "⚠️  Aggressive example not found"
        ;;
    3)
        echo "Manual configuration selected"
        ;;
    *)
        echo "Invalid choice, defaulting to Conservative..."
        cp examples/PAIRS_conservative.properties PAIRS.properties 2>/dev/null || echo "⚠️  Conservative example not found"
        ;;
esac

# Copy other configuration files
if [ ! -f "DCA.properties" ]; then
    cp examples/DCA.properties DCA.properties 2>/dev/null && echo "✅ Created DCA.properties" || echo "⚠️  DCA example not found"
fi

if [ ! -f "INDICATORS.properties" ]; then
    cp examples/INDICATORS.properties INDICATORS.properties 2>/dev/null && echo "✅ Created INDICATORS.properties" || echo "⚠️  INDICATORS example not found"
fi

echo
echo "🔑 Exchange Configuration:"
echo "You need to configure your exchange API credentials in application.properties"
echo

read -p "Do you want to configure your exchange now? (y/N): " configure_exchange

if [[ $configure_exchange =~ ^[Yy]$ ]]; then
    echo
    echo "Available exchanges: BINANCE, BITTREX, POLONIEX"
    read -p "Enter your exchange: " exchange
    read -p "Enter your API key: " api_key
    read -s -p "Enter your API secret: " api_secret
    echo
    
    # Update application.properties with exchange info
    if [ -f "application.properties" ]; then
        sed -i "s/trading.exchange = .*/trading.exchange = ${exchange^^}/" application.properties
        sed -i "s/trading.apiKey = .*/trading.apiKey = $api_key/" application.properties
        sed -i "s/trading.apiSecret = .*/trading.apiSecret = $api_secret/" application.properties
        echo "✅ Exchange configuration updated"
    fi
fi

echo
echo "📁 Creating necessary directories..."
mkdir -p logs data backups
echo "✅ Directories created"

echo
echo "🎯 Setup Summary:"
echo "   ✅ Configuration files created"
echo "   ✅ Directories prepared"
if [[ $configure_exchange =~ ^[Yy]$ ]]; then
    echo "   ✅ Exchange configured"
else
    echo "   ⚠️  Exchange needs manual configuration"
fi

echo
echo "🚀 Next Steps:"
echo "1. Review and edit your configuration files:"
echo "   - application.properties (exchange settings)"
echo "   - PAIRS.properties (trading strategy)" 
echo "   - DCA.properties (dollar cost averaging)"
echo "   - INDICATORS.properties (technical indicators)"
echo
echo "2. Start ProfitTrailer:"
echo "   java -jar ProfitTrailer.jar"
echo
echo "3. Access the web interface:"
echo "   http://localhost:8081"
echo
echo "4. Monitor your bot:"
echo "   ./monitor.sh"
echo
echo "📚 Additional Resources:"
echo "   - Read QUICK_START.md for detailed instructions"
echo "   - Check TRADING_GUIDE.md for strategy tips"
echo "   - Use TROUBLESHOOTING.md if you encounter issues"
echo
echo "⚠️  Important: Start with small amounts and monitor closely!"
echo "================================================="
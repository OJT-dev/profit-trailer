# ProfitTrailer
The most advanced crypto trading bot for automated cryptocurrency trading

## 🚀 Quick Start Guide

### Prerequisites
- Java 8+ installed
- Exchange API keys (Binance, Bittrex, or Poloniex)
- Minimum starting capital (recommended: $100+ for testing)

### Installation & Setup
1. Download the latest ProfitTrailer release
2. Extract to your preferred directory
3. Configure your exchange API keys
4. Set up your trading pairs and strategies
5. Start the bot

## 📊 Trading Strategies

### Basic Strategy Setup
- **Conservative**: Low risk, steady gains
- **Aggressive**: Higher risk, potential for bigger profits  
- **Balanced**: Moderate risk/reward ratio

### Key Configuration Areas
- **PAIRS**: Define which cryptocurrency pairs to trade
- **DCA (Dollar Cost Averaging)**: Buy more when prices drop
- **INDICATORS**: Technical analysis settings (RSI, EMA, etc.)

## 🔧 Configuration Files

Essential configuration files you'll need to customize:
- `application.properties` - Main bot settings
- `PAIRS.properties` - Trading pair configurations
- `DCA.properties` - Dollar cost averaging settings
- `INDICATORS.properties` - Technical indicator settings

## 📈 Getting Started with Trading

1. **Start Small**: Begin with a small amount to learn the system
2. **Paper Trading**: Test strategies without real money first
3. **Monitor Closely**: Watch your bot's performance initially
4. **Adjust Settings**: Fine-tune based on market conditions
5. **Stay Informed**: Keep up with market news and trends

## 🛠️ Management Tools

Use the included `update.sh` script to:
- Update your ProfitTrailer instances
- Manage multiple bots
- Backup configurations

## 📚 Resources

### Getting Started
- **[Quick Start Guide](QUICK_START.md)** - Get up and running in 5 minutes
- **[Trading Guide](TRADING_GUIDE.md)** - Comprehensive trading strategies and best practices
- **[Troubleshooting Guide](TROUBLESHOOTING.md)** - Solutions to common issues

### Configuration Examples
- **[Conservative Strategy](examples/PAIRS_conservative.properties)** - Low risk, steady gains
- **[Aggressive Strategy](examples/PAIRS_aggressive.properties)** - Higher risk, bigger profits  
- **[DCA Configuration](examples/DCA.properties)** - Dollar cost averaging setup
- **[Technical Indicators](examples/INDICATORS.properties)** - Complete indicator settings

### Utility Scripts
- **Setup Wizard**: `./setup.sh` - Guided configuration for new users
- **Monitor Bot**: `./monitor.sh` - Check bot status and performance
- **Backup Config**: `./backup.sh` - Backup your configuration and data
- **Update Bot**: `./update.sh` - Update to latest ProfitTrailer version

### Official Resources
- **Wiki**: https://wiki.profittrailer.com  
- **Quick Instructions**: https://wiki.profittrailer.com/doku.php?id=quick_instructions
- **Live Support**: https://discord.gg/eakB23b

## ⚠️ Important Trading Notes

- **Risk Management**: Never invest more than you can afford to lose
- **Market Volatility**: Crypto markets are highly volatile
- **Bot Monitoring**: Regularly check your bot's performance
- **Security**: Keep your API keys and funds secure
- **Backtesting**: Test strategies on historical data first

## 🔄 Updating Your Bot

Run the update script to keep your bot current:
```bash
./update.sh
```

For automated updates:
```bash
./update.sh auto
```

## 🛠️ Helpful Scripts

This repository includes several utility scripts to help with your trading:

- **`./monitor.sh`** - Check bot status, performance, and system resources
- **`./backup.sh`** - Backup your configuration files and trading data  
- **`./update.sh`** - Update ProfitTrailer to the latest version

Make scripts executable: `chmod +x *.sh`

## 🆕 New User Quick Start

If you're new to ProfitTrailer, run the setup wizard:
```bash
./setup.sh
```

This will guide you through:
- Creating configuration files
- Choosing a trading strategy  
- Setting up your exchange
- Preparing the environment

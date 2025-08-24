# ProfitTrailer Configuration Examples

This directory contains example configuration files to help you get started with different trading strategies.

## 📁 Configuration Files

### `application.properties.example`
Main bot configuration including:
- Exchange API settings
- Web interface configuration  
- Security and notification settings
- Database and logging configuration

**Setup**: Copy to `application.properties` and edit with your exchange details.

### `PAIRS_conservative.properties` 
Low-risk trading strategy featuring:
- Small position sizes (0.2% per trade)
- Major cryptocurrency pairs only
- Conservative profit targets (1.5%)
- Strict stop losses (-15%)
- Limited to 5 concurrent trades

**Best for**: New traders, bear markets, risk-averse investors

### `PAIRS_aggressive.properties`
Higher-risk strategy for bigger profits:
- Larger position sizes (0.5% per trade) 
- More altcoin pairs for volatility
- Higher profit targets (2.5%)
- Wider stop losses (-25%)
- Up to 8 concurrent trades

**Best for**: Experienced traders, bull markets, higher risk tolerance

### `DCA.properties`
Dollar Cost Averaging configuration:
- Automatically buys more when prices drop
- Progressive buying amounts (100%, 150%, 200%, etc.)
- Reduces average buy price over time
- Helps recover from temporary losses

**Best for**: Long-term holding strategy, volatile markets

### `INDICATORS.properties`
Technical analysis indicators:
- RSI (Relative Strength Index)
- EMA (Exponential Moving Averages)
- MACD (Moving Average Convergence Divergence)
- Bollinger Bands
- Support/Resistance levels

**Best for**: Technical analysis-based trading strategies

## 🚀 Quick Setup

### Option 1: Use Setup Wizard
```bash
./setup.sh
```

### Option 2: Manual Setup

**Conservative Strategy (Recommended for beginners)**:
```bash
cp examples/application.properties.example application.properties
cp examples/PAIRS_conservative.properties PAIRS.properties
cp examples/DCA.properties DCA.properties
cp examples/INDICATORS.properties INDICATORS.properties
```

**Aggressive Strategy (For experienced traders)**:
```bash
cp examples/application.properties.example application.properties
cp examples/PAIRS_aggressive.properties PAIRS.properties
cp examples/DCA.properties DCA.properties
cp examples/INDICATORS.properties INDICATORS.properties
```

## ⚙️ Customization Tips

### Adjusting Risk Level
- **Lower risk**: Decrease `initial_cost` and profit targets
- **Higher risk**: Increase position sizes and profit targets
- **Stop losses**: Adjust based on market volatility

### Pair Selection
- **Stable markets**: Stick to BTC, ETH, major altcoins
- **Volatile markets**: Include smaller altcoins for bigger moves
- **Bear markets**: Reduce number of pairs, focus on strongest coins

### Technical Indicators
- **Fast signals**: Use shorter periods (5-15 minutes)
- **Stable signals**: Use longer periods (1-4 hours)
- **Combine indicators**: Use multiple for confirmation

## 📊 Strategy Comparison

| Feature | Conservative | Aggressive |
|---------|-------------|------------|
| Position Size | 0.2% | 0.5% |
| Profit Target | 1.5% | 2.5% |
| Stop Loss | -15% | -25% |
| Max Trades | 5 | 8 |
| Pairs | Major coins | Major + altcoins |
| Risk Level | Low | High |
| Suitable for | Beginners | Experienced |

## ⚠️ Important Notes

1. **Start Small**: Always begin with small amounts to test strategies
2. **Paper Trading**: Use testmode first to validate configurations
3. **Monitor Closely**: Watch your bot's performance, especially initially
4. **Market Conditions**: Adjust strategies based on market trends
5. **API Security**: Never share your API keys, use IP restrictions

## 🔧 Configuration Validation

Before starting your bot:
- [ ] Exchange API keys configured
- [ ] Trading pairs enabled on your exchange
- [ ] Sufficient balance for initial trades
- [ ] Stop loss settings appropriate for your risk tolerance
- [ ] Configuration files valid (no syntax errors)

## 📚 Additional Resources

- **[Quick Start Guide](../QUICK_START.md)** - Step-by-step setup
- **[Trading Guide](../TRADING_GUIDE.md)** - Comprehensive strategies
- **[Troubleshooting](../TROUBLESHOOTING.md)** - Common issues
- **Official Wiki**: https://wiki.profittrailer.com

## 🆘 Getting Help

If you need assistance:
1. Check the troubleshooting guide
2. Read the official documentation
3. Join the Discord community: https://discord.gg/eakB23b
4. Search existing issues before asking questions

Remember: Cryptocurrency trading involves significant risk. Never invest more than you can afford to lose!
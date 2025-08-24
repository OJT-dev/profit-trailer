# ProfitTrailer Quick Start Guide

## 🚀 Getting Started in 5 Minutes

### Step 1: Download & Setup
1. Download the latest ProfitTrailer from the official releases
2. Extract to a folder (e.g., `/opt/profittrailer/`)
3. Navigate to the folder in terminal

### Step 2: Exchange API Setup
1. Create API keys on your exchange (Binance recommended for beginners)
2. Set permissions: **Read** and **Trade** (NOT withdraw)
3. Note your API key and secret

### Step 3: Quick Setup
Run our setup wizard for guided configuration:
```bash
./setup.sh
```

Or manually copy example configurations:

**For Beginners (Conservative):**
```bash
cp examples/application.properties.example application.properties
cp examples/PAIRS_conservative.properties PAIRS.properties
cp examples/DCA.properties DCA.properties
cp examples/INDICATORS.properties INDICATORS.properties
```

**For Experienced Traders (Aggressive):**
```bash
cp examples/application.properties.example application.properties
cp examples/PAIRS_aggressive.properties PAIRS.properties
cp examples/DCA.properties DCA.properties
cp examples/INDICATORS.properties INDICATORS.properties
```

### Step 4: Configure Exchange
Edit `application.properties` with your exchange details:
```properties
trading.exchange = BINANCE
trading.apiKey = YOUR_API_KEY
trading.apiSecret = YOUR_API_SECRET
```

### Step 5: Start Trading
```bash
java -jar ProfitTrailer.jar
```

## 📊 First Day Checklist
- [ ] Start with small amounts ($50-100)
- [ ] Monitor for first few hours
- [ ] Check the web interface (usually http://localhost:8081)
- [ ] Watch for any error messages
- [ ] Verify trades are executing correctly

## 🛠️ Basic Management
- **View logs**: Check `logs/` folder
- **Web interface**: Access via browser (default: localhost:8081)
- **Stop bot**: Ctrl+C in terminal
- **Update bot**: Use `./update.sh`

## ⚠️ Safety Tips
1. **Never share your API keys**
2. **Start small and learn**
3. **Use testnet/paper trading first**
4. **Don't invest more than you can lose**
5. **Monitor your bot regularly**

## 🔧 Troubleshooting
- **Bot won't start**: Check API keys and permissions
- **No trades**: Verify market conditions and strategy settings
- **Errors**: Check logs in `logs/ProfitTrailer.log`
- **High CPU**: Reduce number of pairs or indicators

## 📈 Next Steps
1. Learn about different trading strategies
2. Understand technical indicators
3. Join the Discord community for support
4. Read the full wiki documentation
5. Gradually increase your trading capital

## 📚 Additional Resources
- Wiki: https://wiki.profittrailer.com
- Discord: https://discord.gg/eakB23b
- Configuration examples in `/examples/` folder
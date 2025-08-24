# ProfitTrailer Troubleshooting Guide

## 🚨 Common Issues & Solutions

### Bot Won't Start

**Problem**: ProfitTrailer.jar won't run
**Solutions**:
1. Check Java version: `java -version` (need Java 8+)
2. Verify file permissions: `ls -la ProfitTrailer.jar`
3. Run with explicit memory: `java -Xmx512m -jar ProfitTrailer.jar`
4. Check if port 8081 is already in use: `netstat -tulpn | grep 8081`

**Problem**: "Could not create the Java virtual machine"
**Solutions**:
1. Reduce memory allocation: `java -Xmx256m -jar ProfitTrailer.jar`
2. Check available system memory: `free -m`
3. Close other applications to free memory

### Exchange Connection Issues

**Problem**: "Invalid API credentials"
**Solutions**:
1. Verify API key and secret in `application.properties`
2. Check API permissions (need Read + Trade, NOT Withdraw)
3. Ensure IP whitelist includes your server IP
4. Test API keys manually with exchange

**Problem**: "Insufficient balance"
**Solutions**:
1. Check exchange balance vs bot configuration
2. Reduce `initial_cost` or `initial_cost_percentage`
3. Verify correct market (BTC/USDT/ETH)
4. Check for dust balances blocking trades

### No Trading Activity

**Problem**: Bot running but not making trades
**Solutions**:
1. Check market conditions (may not meet strategy criteria)
2. Verify trading pairs are enabled: Check `enabled_pairs`
3. Review buy/sell strategy settings
4. Check if in sell-only mode
5. Verify sufficient balance for trades

**Problem**: Trades execute but immediately sell
**Solutions**:
1. Check sell strategy settings (may be too aggressive)
2. Review stop-loss configuration
3. Verify buy strategy isn't conflicting with sell strategy
4. Check for market volatility affecting quick sells

### Performance Issues

**Problem**: High CPU usage
**Solutions**:
1. Reduce number of trading pairs
2. Increase indicator candle periods
3. Reduce update frequency in settings
4. Check for memory leaks (restart bot)

**Problem**: Slow web interface
**Solutions**:
1. Clear browser cache
2. Check system resources: `./monitor.sh`
3. Restart the bot
4. Access locally if using remote server

### Configuration Errors

**Problem**: Bot starts but configuration seems wrong
**Solutions**:
1. Validate configuration syntax
2. Check for typos in property names
3. Verify number formats (use . not , for decimals)
4. Compare with working examples in `/examples/`

**Problem**: DCA not working
**Solutions**:
1. Ensure `DCA_enabled = true`
2. Check DCA trigger percentage
3. Verify sufficient balance for DCA buys
4. Review max_buy_times setting

### Log File Analysis

**Check recent errors**:
```bash
grep -i "error\|exception" logs/ProfitTrailer.log | tail -10
```

**Monitor live logs**:
```bash
tail -f logs/ProfitTrailer.log
```

**Find specific issues**:
```bash
grep -i "insufficient\|invalid\|failed" logs/ProfitTrailer.log
```

### Web Interface Issues

**Problem**: Cannot access http://localhost:8081
**Solutions**:
1. Check if bot is running: `ps aux | grep ProfitTrailer`
2. Verify port configuration in `application.properties`
3. Check firewall settings
4. Try different browser
5. Clear browser data/cookies

**Problem**: Web interface shows old data
**Solutions**:
1. Hard refresh browser (Ctrl+F5)
2. Check bot's internet connection
3. Restart the bot
4. Clear browser cache

### Exchange-Specific Issues

**Binance**:
- Enable futures trading if needed
- Check regional restrictions
- Verify 2FA is properly configured
- Ensure API key has correct permissions

**Bittrex**:
- Check if account is verified
- Verify market availability
- Check withdrawal permissions

**Poloniex**:
- Ensure account is verified
- Check for maintenance periods
- Verify API version compatibility

## 🔧 Diagnostic Commands

**Check bot status**:
```bash
./monitor.sh
```

**Test configuration**:
```bash
java -jar ProfitTrailer.jar --test-config
```

**Validate API connection**:
```bash
curl -X GET "https://api.binance.com/api/v3/account" -H "X-MBX-APIKEY: YOUR_API_KEY"
```

**Monitor system resources**:
```bash
top -p $(pgrep -f ProfitTrailer.jar)
```

## 📞 Getting Help

### Before Asking for Help
1. Check this troubleshooting guide
2. Search the official wiki
3. Review recent log files
4. Try the diagnostic commands above

### Where to Get Help
- **Discord**: https://discord.gg/eakB23b (fastest response)
- **Wiki**: https://wiki.profittrailer.com
- **GitHub Issues**: For bug reports only

### Information to Provide
When asking for help, include:
1. ProfitTrailer version
2. Operating system
3. Exchange being used
4. Error messages from logs
5. Configuration files (remove API keys!)
6. Steps to reproduce the issue

## 🚀 Performance Optimization

### Memory Optimization
```bash
java -Xms256m -Xmx512m -jar ProfitTrailer.jar
```

### CPU Optimization
- Reduce number of indicators
- Increase candle periods
- Limit trading pairs
- Use simpler strategies

### Network Optimization
- Use stable internet connection
- Consider VPS for 24/7 operation
- Monitor API rate limits
- Use exchange closest to your location

## 🔄 Maintenance Tasks

### Daily
- [ ] Check bot status with `./monitor.sh`
- [ ] Review trading performance
- [ ] Check for any errors in logs
- [ ] Monitor system resources

### Weekly  
- [ ] Update bot if new version available
- [ ] Backup configuration files
- [ ] Review and adjust strategies
- [ ] Clean old log files

### Monthly
- [ ] Full performance review
- [ ] Strategy optimization
- [ ] System security check
- [ ] Backup complete setup

Remember: Most issues are configuration-related. Double-check your settings before seeking help!
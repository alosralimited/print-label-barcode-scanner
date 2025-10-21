# Quick Start: Email Restoration Guide

This is a quick reference for restoring email functionality and managing aliases for alosralimited.com.

## Problem Summary

You need to:
1. Restore email functionality for alosralimited.com
2. Set sales@alosralimited.com as the primary email
3. Set info@alosralimited.com as an alias/alternative
4. Fix any amber warnings in email configuration checks

## Quick Solution

### Step 1: Set Up DNS Records (5 minutes)

Log into your DNS provider (Cloudflare, GoDaddy, etc.) and add these records:

```
Type: MX | Name: @ | Priority: 10 | Value: [your mail server]
Type: TXT | Name: @ | Value: v=spf1 include:_spf.[provider].com ~all
Type: TXT | Name: _dmarc | Value: v=DMARC1; p=none; rua=mailto:dmarc@alosralimited.com
Type: TXT | Name: _mta-sts | Value: v=STSv1; id=20231021
```

**Get exact values from:** Your email provider (Google Workspace, Microsoft 365, etc.)

### Step 2: Configure Email Aliases (3 minutes)

**If using Google Workspace:**
1. Go to admin.google.com
2. Users → sales@alosralimited.com
3. User information → Email aliases
4. Add: info@alosralimited.com

**If using Microsoft 365:**
1. Go to admin.microsoft.com
2. Users → Active users → sales@alosralimited.com
3. Manage email aliases
4. Add: info@alosralimited.com

**If using cPanel:**
1. Email → Forwarders
2. Forward info@alosralimited.com to sales@alosralimited.com

### Step 3: Test Configuration (2 minutes)

1. Send test email to: sales@alosralimited.com → Should receive ✓
2. Send test email to: info@alosralimited.com → Should receive in sales@ inbox ✓
3. Check at: https://mxtoolbox.com → Enter: alosralimited.com → Should show green ✓

## Fixing Amber Warnings

### If MXToolbox shows amber warnings:

**Missing SPF Record:**
```
Add TXT record: v=spf1 include:_spf.google.com ~all
```

**Missing DKIM:**
```
Get DKIM record from email provider
Add as TXT record: google._domainkey
```

**Missing DMARC:**
```
Add TXT record: v=DMARC1; p=none; rua=mailto:dmarc@alosralimited.com
```

**Missing MTA-STS:**
```
Add TXT record: v=STSv1; id=20231021
Already configured: web/.well-known/mta-sts.txt
```

## Reversing Previous Migration

If you need to undo a previous email migration:

1. **Backup all emails first** (Critical!)
   - Download via IMAP to local client
   - Or use provider's export feature

2. **Change primary account:**
   - Make sales@ the main account
   - Convert info@ to alias

3. **Update all devices:**
   - Use sales@ as login
   - Configure to send from both addresses

4. **Test thoroughly:**
   - Send and receive from both addresses
   - Verify SPF/DKIM pass

## Complete Documentation

For detailed instructions, see:

1. **[EMAIL_SETUP.md](EMAIL_SETUP.md)** - Complete email configuration guide
   - DNS records (MX, SPF, DKIM, DMARC)
   - MTA-STS setup
   - Testing and troubleshooting
   - Cost optimization options

2. **[EMAIL_ALIAS_GUIDE.md](EMAIL_ALIAS_GUIDE.md)** - Email alias management
   - Understanding aliases vs forwarders
   - Provider-specific setup (Google, Microsoft, cPanel, Zoho)
   - Reversing migrations
   - Comprehensive testing checklist

3. **[DNS_CONFIGURATION.md](DNS_CONFIGURATION.md)** - DNS reference
   - Complete DNS record templates
   - Provider-specific instructions (Cloudflare, GoDaddy, Namecheap)
   - Testing and verification tools
   - Troubleshooting common issues

## Common Questions

**Q: Which email should be primary?**  
A: Use sales@alosralimited.com as primary, info@ as alias

**Q: Will I lose emails during migration?**  
A: No, if you follow backup steps first

**Q: How long does DNS propagation take?**  
A: Usually 1-4 hours, maximum 24-48 hours

**Q: Can I send from both addresses?**  
A: Yes, if configured as alias (not just forwarder)

**Q: What's the difference between alias and forwarder?**  
A: Alias allows sending + receiving, forwarder only receives

**Q: Why am I getting amber warnings?**  
A: Missing SPF, DKIM, DMARC, or MTA-STS records

**Q: Which email provider is best?**  
A: Google Workspace ($6/mo) or Microsoft 365 ($5/mo) for business

## Need Help?

1. Check the detailed guides listed above
2. Use testing tools:
   - https://mxtoolbox.com
   - https://www.mail-tester.com
3. Contact your email provider support
4. Create an issue in this repository

## Checklist: Complete Setup

- [ ] MX records configured and verified
- [ ] SPF record added
- [ ] DKIM record added and verified
- [ ] DMARC record added (start with p=none)
- [ ] MTA-STS record added
- [ ] sales@alosralimited.com is primary account
- [ ] info@alosralimited.com configured as alias
- [ ] Test email to sales@ successful
- [ ] Test email to info@ successful (arrives in sales@ inbox)
- [ ] Can send from both addresses
- [ ] MXToolbox shows all green (no amber/red)
- [ ] Mail-tester score 9/10 or 10/10
- [ ] All devices configured and tested

---

**Quick Links:**
- [EMAIL_SETUP.md](EMAIL_SETUP.md) - Full setup guide
- [EMAIL_ALIAS_GUIDE.md](EMAIL_ALIAS_GUIDE.md) - Alias configuration
- [DNS_CONFIGURATION.md](DNS_CONFIGURATION.md) - DNS records reference

**Last Updated:** 2025-10-21  
**Repository:** https://github.com/alosralimited/print-label-barcode-scanner

# Email and DNS Documentation Index

Complete documentation for managing email and DNS configuration for alosralimited.com domain.

## Quick Links

### 🚀 Getting Started
- **[Quick Start Guide](EMAIL_QUICK_START.md)** - Fast setup in 10 minutes
  - Essential DNS records
  - Email alias configuration
  - Testing checklist

### 📧 Email Configuration
- **[Email Setup Guide](EMAIL_SETUP.md)** - Comprehensive email configuration
  - MX, SPF, DKIM, DMARC records
  - MTA-STS security setup
  - Email authentication testing
  - Cost optimization strategies
  - Security best practices

- **[Email Alias Guide](EMAIL_ALIAS_GUIDE.md)** - Managing email aliases
  - Setting sales@ as primary, info@ as alias
  - Provider-specific instructions (Google, Microsoft, cPanel, Zoho)
  - Reversing email migrations
  - Testing and troubleshooting

### 🌐 DNS Configuration
- **[DNS Configuration Reference](DNS_CONFIGURATION.md)** - Complete DNS guide
  - All DNS record types and templates
  - Provider-specific setup (Cloudflare, GoDaddy, Namecheap, Route 53)
  - DNS propagation and testing
  - Security features (DNSSEC, CAA records)

## Documentation Structure

```
email-docs/
├── EMAIL_QUICK_START.md      # Start here - 10 minute setup
├── EMAIL_SETUP.md             # Complete email configuration
├── EMAIL_ALIAS_GUIDE.md       # Alias management details
├── DNS_CONFIGURATION.md       # DNS records reference
└── EMAIL_DOCS_INDEX.md        # This file
```

## Use Cases

### I want to quickly set up email
→ **[EMAIL_QUICK_START.md](EMAIL_QUICK_START.md)**

### I need to configure DNS records
→ **[DNS_CONFIGURATION.md](DNS_CONFIGURATION.md)**

### I want to manage email aliases (sales@, info@)
→ **[EMAIL_ALIAS_GUIDE.md](EMAIL_ALIAS_GUIDE.md)**

### I need to reverse an email migration
→ **[EMAIL_ALIAS_GUIDE.md](EMAIL_ALIAS_GUIDE.md)** (Section: Reversing Email Migration)

### I'm getting amber warnings on MXToolbox
→ **[EMAIL_SETUP.md](EMAIL_SETUP.md)** (Section: Common Issues)

### I need to test my email configuration
→ **[EMAIL_SETUP.md](EMAIL_SETUP.md)** (Section: Checking Configuration)

### I want to understand MTA-STS
→ **[EMAIL_SETUP.md](EMAIL_SETUP.md)** (Section: MTA-STS Configuration)

### I need provider-specific instructions
→ **[EMAIL_ALIAS_GUIDE.md](EMAIL_ALIAS_GUIDE.md)** (Section: Provider-Specific Instructions)

### I want to optimize email costs
→ **[EMAIL_SETUP.md](EMAIL_SETUP.md)** (Section: Cost Optimization)

## Current Configuration Status

### Email Accounts
- **Primary:** sales@alosralimited.com
- **Alias:** info@alosralimited.com

### Domain
- **Main Domain:** alosralimited.com
- **Subdomain:** scanner.alosralimited.com (this app)
- **MTA-STS Subdomain:** mta-sts.alosralimited.com

### Required DNS Records

#### Essential (Must Have)
- [x] MX records (mail delivery)
- [x] SPF record (sender authentication)
- [ ] DKIM record (email signing) - Get from provider
- [ ] DMARC record (policy enforcement)

#### Recommended (Should Have)
- [ ] MTA-STS record (transport security)
- [x] MTA-STS policy file (`web/.well-known/mta-sts.txt`)
- [ ] TLS reporting record

#### Optional (Nice to Have)
- [ ] DNSSEC (DNS security)
- [ ] CAA records (certificate authority authorization)

## Testing Tools

### Email Configuration Testing
- **MXToolbox:** https://mxtoolbox.com - Check all email records
- **Mail Tester:** https://www.mail-tester.com - Test email deliverability
- **Port25 Verifier:** check-auth@verifier.port25.com - Email authentication check
- **DMARC Analyzer:** https://www.dmarcanalyzer.com - DMARC reports

### DNS Testing
- **DNS Checker:** https://dnschecker.org - Global DNS propagation
- **What's My DNS:** https://whatsmydns.net - Worldwide DNS check
- **IntoDNS:** https://intodns.com - Comprehensive DNS health check

### Security Testing
- **MTA-STS Validator:** https://aykevl.nl/apps/mta-sts/
- **SSL Labs:** https://www.ssllabs.com/ssltest/ - SSL/TLS testing
- **Security Headers:** https://securityheaders.com - Security header check

## Common Tasks

### Task: Add a new email alias
1. Log into email provider admin panel
2. Navigate to user settings for primary account (sales@)
3. Add new alias
4. Test by sending email to alias
5. Verify it arrives in primary inbox

**Detailed instructions:** [EMAIL_ALIAS_GUIDE.md](EMAIL_ALIAS_GUIDE.md)

### Task: Fix SPF authentication
1. Check current SPF: `nslookup -type=TXT alosralimited.com`
2. Add/update SPF record in DNS
3. Wait for propagation (1-4 hours)
4. Test: Send email to check-auth@verifier.port25.com
5. Verify SPF shows PASS

**Detailed instructions:** [EMAIL_SETUP.md](EMAIL_SETUP.md)

### Task: Enable DMARC
1. Start with monitoring policy: `v=DMARC1; p=none; rua=mailto:dmarc@alosralimited.com`
2. Add TXT record for _dmarc.alosralimited.com
3. Wait 24 hours for first reports
4. Review reports and fix any issues
5. Gradually increase policy to quarantine, then reject

**Detailed instructions:** [EMAIL_SETUP.md](EMAIL_SETUP.md)

### Task: Set up MTA-STS
1. Add DNS TXT record: `_mta-sts` with value `v=STSv1; id=20231021`
2. Publish policy file at: `https://mta-sts.alosralimited.com/.well-known/mta-sts.txt`
3. Ensure HTTPS works (valid SSL certificate)
4. Test at: https://aykevl.nl/apps/mta-sts/
5. When updating policy, increment the id in DNS record

**Detailed instructions:** [EMAIL_SETUP.md](EMAIL_SETUP.md)

**Note:** Policy file already created at `web/.well-known/mta-sts.txt`

## Troubleshooting Guide

### Issue: Emails not being received

**Quick checks:**
1. Verify MX records: `nslookup -type=MX alosralimited.com`
2. Check spam folder
3. Verify email quota not full
4. Check provider status page

**Full troubleshooting:** [EMAIL_SETUP.md](EMAIL_SETUP.md#checking-configuration)

### Issue: Emails going to spam

**Quick fixes:**
1. Add SPF record
2. Enable DKIM signing
3. Add DMARC record (start with p=none)
4. Send test to mail-tester.com
5. Fix issues shown in report

**Full troubleshooting:** [EMAIL_SETUP.md](EMAIL_SETUP.md#common-issues-amber-signs)

### Issue: Cannot send from alias

**Quick fixes:**
1. Verify alias is properly configured (not just forwarder)
2. Check "Send As" settings in email client
3. Verify email client is updated
4. Re-authenticate email account

**Full troubleshooting:** [EMAIL_ALIAS_GUIDE.md](EMAIL_ALIAS_GUIDE.md#troubleshooting)

### Issue: DNS changes not taking effect

**Quick fixes:**
1. Wait for DNS propagation (up to 48 hours)
2. Check at: https://dnschecker.org
3. Clear local DNS cache
4. Verify records entered correctly in DNS panel

**Full troubleshooting:** [DNS_CONFIGURATION.md](DNS_CONFIGURATION.md#dns-propagation-and-testing)

## Best Practices Summary

### Email Security
- ✅ Use strong, unique passwords
- ✅ Enable two-factor authentication (2FA)
- ✅ Implement SPF, DKIM, DMARC
- ✅ Monitor DMARC reports regularly
- ✅ Use MTA-STS for transport security
- ✅ Keep software and apps updated

### DNS Management
- ✅ Use low TTL (3600s) when making changes
- ✅ Increase TTL (86400s) once stable
- ✅ Enable DNSSEC if possible
- ✅ Document all DNS changes
- ✅ Regular DNS audits (monthly)
- ✅ Use DNS provider with good support

### Email Management
- ✅ Use role-based addresses (sales@, support@)
- ✅ Regular email backups
- ✅ Clear naming conventions for aliases
- ✅ Document alias purposes
- ✅ Remove unused aliases
- ✅ Monitor email usage and quotas

## Support and Resources

### Getting Help
1. **Check documentation:** Start with relevant guide above
2. **Test configuration:** Use testing tools listed
3. **Search issues:** Check GitHub repository issues
4. **Provider support:** Contact email/DNS provider
5. **Create issue:** Open new issue in repository

### External Resources
- **RFC 5321** - SMTP Protocol
- **RFC 7208** - SPF
- **RFC 6376** - DKIM
- **RFC 7489** - DMARC
- **RFC 8461** - MTA-STS
- **Email Provider Docs:** Google Workspace, Microsoft 365, Zoho

### Provider Support Links
- **Google Workspace:** https://support.google.com/a
- **Microsoft 365:** https://docs.microsoft.com/microsoft-365/
- **Cloudflare:** https://support.cloudflare.com
- **GoDaddy:** https://www.godaddy.com/help
- **Namecheap:** https://www.namecheap.com/support/

## Maintenance Schedule

### Daily
- Monitor email delivery
- Check spam folder
- Respond to DMARC reports if issues detected

### Weekly
- Review spam filters
- Check email storage quotas
- Test email sending/receiving

### Monthly
- Review DMARC reports
- Check DNS records are correct
- Verify SSL certificates valid
- Review email security settings
- Backup important emails

### Quarterly
- Audit DNS records (remove unused)
- Review email aliases (remove unused)
- Update passwords
- Review access permissions
- Test disaster recovery procedures

### Annually
- Review email provider costs
- Consider alternative providers
- Update documentation
- Full security audit
- Review and update policies

## Change Log

### 2025-10-21
- Initial documentation created
- EMAIL_SETUP.md - Complete email configuration guide
- EMAIL_ALIAS_GUIDE.md - Email alias management
- DNS_CONFIGURATION.md - DNS records reference
- EMAIL_QUICK_START.md - Quick setup guide
- MTA-STS policy file created
- README.md updated with email documentation links

### Future Updates
- Add DMARC report examples
- Add email provider comparison table
- Create video tutorials
- Add mobile app setup guides
- Create troubleshooting flowcharts

## Contributing

To contribute to this documentation:

1. **Report issues:** Open GitHub issue for errors or unclear sections
2. **Suggest improvements:** Submit pull request with changes
3. **Share experiences:** Add provider-specific tips
4. **Update examples:** Keep screenshots and examples current

---

**Repository:** https://github.com/alosralimited/print-label-barcode-scanner  
**Last Updated:** 2025-10-21  
**Maintained by:** Alosra Limited

---

## Quick Reference Card

```
┌─────────────────────────────────────────────────────────┐
│ ALOSRALIMITED.COM - EMAIL QUICK REFERENCE               │
├─────────────────────────────────────────────────────────┤
│                                                          │
│ PRIMARY EMAIL:    sales@alosralimited.com               │
│ ALIAS:            info@alosralimited.com                │
│                                                          │
│ TESTING TOOLS:                                          │
│   • MXToolbox:       https://mxtoolbox.com             │
│   • Mail Tester:     https://mail-tester.com           │
│   • DNS Checker:     https://dnschecker.org            │
│                                                          │
│ DOCUMENTATION:                                          │
│   • Quick Start:     EMAIL_QUICK_START.md              │
│   • Email Setup:     EMAIL_SETUP.md                    │
│   • Alias Guide:     EMAIL_ALIAS_GUIDE.md              │
│   • DNS Config:      DNS_CONFIGURATION.md              │
│                                                          │
│ REQUIRED DNS RECORDS:                                   │
│   [x] MX      - Mail delivery                          │
│   [x] SPF     - Sender authentication                  │
│   [ ] DKIM    - Email signing                          │
│   [ ] DMARC   - Policy enforcement                     │
│   [ ] MTA-STS - Transport security                     │
│                                                          │
└─────────────────────────────────────────────────────────┘
```

Print this card for quick reference!

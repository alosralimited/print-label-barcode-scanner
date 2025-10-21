# Email Setup Guide for alosralimited.com

This document provides comprehensive instructions for managing email configuration for the alosralimited.com domain.

## Current Email Configuration Status

### Primary Email Accounts
- **Primary:** sales@alosralimited.com
- **Alternative:** info@alosralimited.com

## DNS Records Configuration

### MX Records (Mail Exchange)

Configure these MX records in your DNS provider (e.g., Cloudflare, GoDaddy, Namecheap):

```
Type: MX
Name: @
Priority: 10
Value: mx1.yourmailprovider.com

Type: MX
Name: @
Priority: 20
Value: mx2.yourmailprovider.com
```

**Note:** Replace `yourmailprovider.com` with your actual mail provider's MX servers.

### SPF Record (Sender Policy Framework)

Add an SPF record to prevent email spoofing:

```
Type: TXT
Name: @
Value: v=spf1 include:_spf.yourmailprovider.com ~all
```

**Example for common providers:**
- Google Workspace: `v=spf1 include:_spf.google.com ~all`
- Microsoft 365: `v=spf1 include:spf.protection.outlook.com ~all`
- Mailgun: `v=spf1 include:mailgun.org ~all`

### DKIM Record (DomainKeys Identified Mail)

DKIM adds a digital signature to your emails. Your email provider will give you specific DKIM records.

```
Type: TXT
Name: default._domainkey
Value: [Your provider will supply this long key]
```

### DMARC Record (Domain-based Message Authentication)

Add a DMARC policy to monitor and protect your domain:

```
Type: TXT
Name: _dmarc
Value: v=DMARC1; p=quarantine; rua=mailto:dmarc@alosralimited.com; ruf=mailto:dmarc@alosralimited.com; fo=1
```

**Policy options:**
- `p=none` - Monitor only (recommended for testing)
- `p=quarantine` - Send suspicious emails to spam
- `p=reject` - Reject suspicious emails

## MTA-STS Configuration

MTA-STS (Mail Transfer Agent Strict Transport Security) ensures email is only sent over encrypted connections.

### Setup Instructions

1. **DNS TXT Record:**
   ```
   Type: TXT
   Name: _mta-sts
   Value: v=STSv1; id=20231021
   ```

2. **Policy File:** Already configured in `.well-known/mta-sts.txt` (see section below)

3. **HTTPS Certificate:** Ensure `mta-sts.alosralimited.com` has a valid SSL certificate

## Email Alias Configuration

### Current Setup
- **sales@alosralimited.com** - Primary contact for sales inquiries
- **info@alosralimited.com** - General information and support

### Setting Up Aliases (Provider Specific)

#### Google Workspace
1. Go to admin.google.com
2. Navigate to Users
3. Select the user (e.g., sales@alosralimited.com)
4. Click "User information" → "Email aliases"
5. Add info@alosralimited.com as an alias

#### Microsoft 365
1. Go to admin.microsoft.com
2. Navigate to Users → Active users
3. Select the user
4. Click "Manage email aliases"
5. Add the alias

#### cPanel/Webmail
1. Log into cPanel
2. Navigate to "Email Accounts"
3. Click "Forwarders"
4. Create a forwarder from info@ to sales@

## Reversing Email Migration

If you've migrated emails and want to reverse the setup:

### Step 1: Backup Current Emails
- Export all emails from the current account
- Use IMAP to download to local client (Thunderbird, Outlook)
- Export as PST (Outlook) or MBOX format

### Step 2: Reverse Primary/Alternative Setup

To make **sales@alosralimited.com** the primary account:

1. **In your email provider:**
   - Make sales@ the main account
   - Set info@ as an alias or forwarder

2. **Update DNS if needed:**
   - Verify MX records point to correct mail servers
   - Update SPF to include both sending addresses

3. **Configure email client:**
   - Set sales@ as default sending address
   - Add info@ as "Send As" or alias

### Step 3: Test Email Flow

Send test emails to both addresses:
```
1. Send to: sales@alosralimited.com
   Verify: Arrives in primary inbox

2. Send to: info@alosralimited.com
   Verify: Forwards to or aliases sales@

3. Reply from both addresses
   Verify: SPF/DKIM pass checks
```

## Checking Configuration

### Tools for Testing

1. **MX Records:**
   - https://mxtoolbox.com/SuperTool.aspx
   - Enter: alosralimited.com

2. **SPF/DKIM/DMARC:**
   - https://mxtoolbox.com/spf.aspx
   - https://mxtoolbox.com/dkim.aspx
   - https://mxtoolbox.com/dmarc.aspx

3. **Email Authentication:**
   - Send test email to: check-auth@verifier.port25.com
   - Review the automated response

4. **MTA-STS:**
   - https://aykevl.nl/apps/mta-sts/
   - Enter: alosralimited.com

### Common Issues ("Amber Signs")

If you see warnings on MXToolbox or similar services:

#### Issue: Missing SPF Record
**Solution:** Add SPF TXT record as shown above

#### Issue: Missing DKIM
**Solution:** Configure DKIM in your email provider, add DNS records

#### Issue: No DMARC Policy
**Solution:** Add DMARC TXT record (start with p=none)

#### Issue: MTA-STS Not Configured
**Solution:** Follow MTA-STS setup instructions above

#### Issue: Reverse DNS (PTR) Mismatch
**Solution:** Contact your email hosting provider to set up PTR records

## Cost Optimization

To consolidate services and reduce costs:

### Option 1: Google Workspace
- Cost: $6/user/month
- Includes: Email, Drive, Calendar, Meets
- Professional email with excellent deliverability

### Option 2: Microsoft 365
- Cost: $5/user/month (Business Basic)
- Includes: Email, OneDrive, Office Online, Teams

### Option 3: Zoho Mail
- Cost: Free for up to 5 users (Lite plan)
- $1/user/month for paid plan
- Good for small businesses

### Option 4: Cloudflare Email Routing (Free)
- Cost: Free
- Features: Email forwarding only (no mailboxes)
- Route emails to existing Gmail/Outlook accounts

## Security Best Practices

1. **Enable 2FA:** Two-factor authentication for all email accounts
2. **Use App Passwords:** For email clients and mobile devices
3. **Regular Backups:** Export emails monthly
4. **Monitor DMARC Reports:** Review authentication failures
5. **Update Passwords:** Change every 90 days
6. **Filter Spam:** Configure spam filters appropriately

## Support Contacts

For email configuration help:
- **DNS Provider:** Contact your domain registrar support
- **Email Host:** Contact your email hosting provider
- **General Help:** Create issue at repository or email admin

## Quick Reference

### DNS Records Checklist
- [ ] MX records configured (priority 10, 20)
- [ ] SPF record added
- [ ] DKIM record added
- [ ] DMARC record added (start with p=none)
- [ ] _mta-sts TXT record added
- [ ] MTA-STS policy file published

### Email Accounts Checklist
- [ ] sales@alosralimited.com set as primary
- [ ] info@alosralimited.com configured as alias/forward
- [ ] Email clients configured
- [ ] Mobile devices configured
- [ ] Test emails sent and received
- [ ] SPF/DKIM passing on test emails

### Testing Checklist
- [ ] Send email to sales@ (receive successfully)
- [ ] Send email to info@ (receive successfully)
- [ ] Reply from sales@ (SPF/DKIM pass)
- [ ] Reply from info@ (SPF/DKIM pass)
- [ ] Check MXToolbox (no red or amber warnings)
- [ ] Verify MTA-STS policy accessible

## Additional Resources

- [RFC 7208 - SPF](https://tools.ietf.org/html/rfc7208)
- [RFC 6376 - DKIM](https://tools.ietf.org/html/rfc6376)
- [RFC 7489 - DMARC](https://tools.ietf.org/html/rfc7489)
- [RFC 8461 - MTA-STS](https://tools.ietf.org/html/rfc8461)
- [Google Workspace Admin Help](https://support.google.com/a)
- [Microsoft 365 Admin Help](https://docs.microsoft.com/microsoft-365/)

---

**Last Updated:** 2025-10-21  
**Maintained by:** Alosra Limited  
**Repository:** https://github.com/alosralimited/print-label-barcode-scanner

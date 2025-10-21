# DNS Configuration Reference for alosralimited.com

This document provides DNS record templates and configurations for alosralimited.com domain.

## Overview

This reference includes all DNS records needed for:
- Email delivery (MX)
- Email authentication (SPF, DKIM, DMARC)
- Email security (MTA-STS)
- Web hosting
- Subdomain configuration

## Current Domain Structure

```
alosralimited.com (main domain)
├── www.alosralimited.com (website)
├── scanner.alosralimited.com (barcode scanner app)
└── mta-sts.alosralimited.com (email security)
```

## DNS Record Templates

### A Records (IPv4 Addresses)

```
Type: A
Name: @
Value: [Your server IP]
TTL: 3600

Type: A
Name: www
Value: [Your server IP]
TTL: 3600

Type: A
Name: scanner
Value: [Your server IP or CDN IP]
TTL: 3600
```

**For GitHub Pages:**
```
Type: A
Name: scanner
Value: 185.199.108.153
TTL: 3600

Type: A
Name: scanner
Value: 185.199.109.153
TTL: 3600

Type: A
Name: scanner
Value: 185.199.110.153
TTL: 3600

Type: A
Name: scanner
Value: 185.199.111.153
TTL: 3600
```

### AAAA Records (IPv6 Addresses)

```
Type: AAAA
Name: scanner
Value: 2606:50c0:8000::153
TTL: 3600

Type: AAAA
Name: scanner
Value: 2606:50c0:8001::153
TTL: 3600

Type: AAAA
Name: scanner
Value: 2606:50c0:8002::153
TTL: 3600

Type: AAAA
Name: scanner
Value: 2606:50c0:8003::153
TTL: 3600
```

### CNAME Records (Aliases)

```
Type: CNAME
Name: www
Value: alosralimited.com
TTL: 3600

Type: CNAME
Name: mta-sts
Value: alosralimited.github.io
TTL: 3600
```

## Email DNS Records

### MX Records (Mail Exchange)

**Template for Generic Mail Provider:**
```
Type: MX
Name: @
Priority: 10
Value: mx1.mailprovider.com
TTL: 3600

Type: MX
Name: @
Priority: 20
Value: mx2.mailprovider.com
TTL: 3600
```

**Google Workspace:**
```
Type: MX
Name: @
Priority: 1
Value: aspmx.l.google.com
TTL: 3600

Type: MX
Name: @
Priority: 5
Value: alt1.aspmx.l.google.com
TTL: 3600

Type: MX
Name: @
Priority: 5
Value: alt2.aspmx.l.google.com
TTL: 3600

Type: MX
Name: @
Priority: 10
Value: alt3.aspmx.l.google.com
TTL: 3600

Type: MX
Name: @
Priority: 10
Value: alt4.aspmx.l.google.com
TTL: 3600
```

**Microsoft 365:**
```
Type: MX
Name: @
Priority: 0
Value: alosralimited-com.mail.protection.outlook.com
TTL: 3600
```

**Zoho Mail:**
```
Type: MX
Name: @
Priority: 10
Value: mx.zoho.com
TTL: 3600

Type: MX
Name: @
Priority: 20
Value: mx2.zoho.com
TTL: 3600

Type: MX
Name: @
Priority: 50
Value: mx3.zoho.com
TTL: 3600
```

### SPF Records (Sender Policy Framework)

**Google Workspace:**
```
Type: TXT
Name: @
Value: v=spf1 include:_spf.google.com ~all
TTL: 3600
```

**Microsoft 365:**
```
Type: TXT
Name: @
Value: v=spf1 include:spf.protection.outlook.com ~all
TTL: 3600
```

**Zoho Mail:**
```
Type: TXT
Name: @
Value: v=spf1 include:zoho.com ~all
TTL: 3600
```

**Multiple Providers (Example):**
```
Type: TXT
Name: @
Value: v=spf1 include:_spf.google.com include:sendgrid.net ~all
TTL: 3600
```

**SPF Mechanisms Explained:**
- `v=spf1` - Version identifier
- `include:domain.com` - Include SPF record from another domain
- `ip4:192.0.2.0/24` - Allow specific IP range
- `a` - Allow domain's A record
- `mx` - Allow domain's MX records
- `~all` - Soft fail (recommended for testing)
- `-all` - Hard fail (strict, use after testing)

### DKIM Records (DomainKeys Identified Mail)

**Google Workspace Example:**
```
Type: TXT
Name: google._domainkey
Value: v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC...
TTL: 3600
```

**Microsoft 365 Example:**
```
Type: CNAME
Name: selector1._domainkey
Value: selector1-alosralimited-com._domainkey.alosralimited.onmicrosoft.com
TTL: 3600

Type: CNAME
Name: selector2._domainkey
Value: selector2-alosralimited-com._domainkey.alosralimited.onmicrosoft.com
TTL: 3600
```

**Zoho Mail Example:**
```
Type: TXT
Name: zoho._domainkey
Value: v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC...
TTL: 3600
```

**Note:** Your email provider will give you the exact DKIM record to use.

### DMARC Records

**Monitor Only (Recommended for Start):**
```
Type: TXT
Name: _dmarc
Value: v=DMARC1; p=none; rua=mailto:dmarc-reports@alosralimited.com; ruf=mailto:dmarc-failures@alosralimited.com; fo=1; adkim=r; aspf=r; pct=100; ri=86400
TTL: 3600
```

**Quarantine (Moderate Protection):**
```
Type: TXT
Name: _dmarc
Value: v=DMARC1; p=quarantine; rua=mailto:dmarc-reports@alosralimited.com; ruf=mailto:dmarc-failures@alosralimited.com; fo=1; adkim=s; aspf=s; pct=100
TTL: 3600
```

**Reject (Strict Protection):**
```
Type: TXT
Name: _dmarc
Value: v=DMARC1; p=reject; rua=mailto:dmarc-reports@alosralimited.com; ruf=mailto:dmarc-failures@alosralimited.com; fo=1; adkim=s; aspf=s; pct=100
TTL: 3600
```

**DMARC Tags Explained:**
- `v=DMARC1` - Version identifier
- `p=none|quarantine|reject` - Policy for failed emails
- `rua=mailto:email@domain.com` - Aggregate reports destination
- `ruf=mailto:email@domain.com` - Forensic reports destination
- `fo=1` - Generate forensic reports for any failure
- `adkim=r|s` - DKIM alignment (relaxed or strict)
- `aspf=r|s` - SPF alignment (relaxed or strict)
- `pct=100` - Percentage of messages to apply policy to
- `ri=86400` - Report interval in seconds (86400 = 24 hours)

### MTA-STS Records

**DNS TXT Record:**
```
Type: TXT
Name: _mta-sts
Value: v=STSv1; id=20231021
TTL: 3600
```

**Policy File Location:**
- URL: `https://mta-sts.alosralimited.com/.well-known/mta-sts.txt`
- Already configured in: `web/.well-known/mta-sts.txt`

**Policy File Contents:**
```
version: STSv1
mode: enforce
mx: mx1.alosralimited.com
mx: mx2.alosralimited.com
max_age: 604800
```

**Update DNS id when policy changes:**
```
# When you update mta-sts.txt, increment the id:
v=STSv1; id=20231022  # Changed from 20231021
```

### TLS Reporting (SMTP TLS Reporting)

```
Type: TXT
Name: _smtp._tls
Value: v=TLSRPTv1; rua=mailto:tls-reports@alosralimited.com
TTL: 3600
```

This provides reports about TLS connection attempts to your mail servers.

## Verification Records

### Google Workspace Verification

```
Type: TXT
Name: @
Value: google-site-verification=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
TTL: 3600
```

### Microsoft 365 Verification

```
Type: TXT
Name: @
Value: MS=msxxxxxxxxxx
TTL: 3600
```

### Domain Ownership Verification (Generic)

```
Type: TXT
Name: @
Value: verification-code-from-provider
TTL: 3600
```

## Complete DNS Record Set Example

Here's a complete example for alosralimited.com using Google Workspace:

```dns
; A Records
@ IN A 185.199.108.153
@ IN A 185.199.109.153
@ IN A 185.199.110.153
@ IN A 185.199.111.153
scanner IN A 185.199.108.153
scanner IN A 185.199.109.153
scanner IN A 185.199.110.153
scanner IN A 185.199.111.153

; CNAME Records
www IN CNAME alosralimited.com.
mta-sts IN CNAME alosralimited.github.io.

; MX Records
@ IN MX 1 aspmx.l.google.com.
@ IN MX 5 alt1.aspmx.l.google.com.
@ IN MX 5 alt2.aspmx.l.google.com.
@ IN MX 10 alt3.aspmx.l.google.com.
@ IN MX 10 alt4.aspmx.l.google.com.

; SPF Record
@ IN TXT "v=spf1 include:_spf.google.com ~all"

; DKIM Record (example - get actual from Google)
google._domainkey IN TXT "v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA..."

; DMARC Record
_dmarc IN TXT "v=DMARC1; p=quarantine; rua=mailto:dmarc@alosralimited.com"

; MTA-STS Record
_mta-sts IN TXT "v=STSv1; id=20231021"

; SMTP TLS Reporting
_smtp._tls IN TXT "v=TLSRPTv1; rua=mailto:tls-reports@alosralimited.com"

; Google Verification (example)
@ IN TXT "google-site-verification=xxxxxxxxxxxxxxxxxxxx"
```

## DNS Configuration by Provider

### Cloudflare DNS

**Access:**
1. Log into https://dash.cloudflare.com
2. Select domain: alosralimited.com
3. Navigate to: DNS → Records

**Recommended Settings:**
- Proxy status (orange cloud): OFF for email records (MX, SPF, DKIM)
- Proxy status (orange cloud): ON for web records (A, CNAME for websites)
- TTL: Auto (or 3600 seconds)

**Example Configuration:**

| Type | Name | Content | Proxy | TTL |
|------|------|---------|-------|-----|
| MX | @ | aspmx.l.google.com | No | Auto |
| TXT | @ | v=spf1 include:_spf.google.com ~all | No | Auto |
| TXT | _dmarc | v=DMARC1; p=quarantine; rua=... | No | Auto |
| TXT | _mta-sts | v=STSv1; id=20231021 | No | Auto |
| A | scanner | 185.199.108.153 | Yes | Auto |

### GoDaddy DNS

**Access:**
1. Log into https://account.godaddy.com
2. My Products → Domains
3. Click domain → DNS Management

**Add Records:**
- Click "ADD" for each record
- Select record type
- Fill in name, value, TTL
- Save

**Note:** GoDaddy may take 1-48 hours to propagate changes.

### Namecheap DNS

**Access:**
1. Log into https://www.namecheap.com
2. Domain List → Manage
3. Advanced DNS tab

**Add Records:**
- Click "ADD NEW RECORD"
- Select type from dropdown
- Enter host, value, TTL
- Save all changes

### Route 53 (AWS)

**Access:**
1. AWS Console → Route 53
2. Hosted zones → alosralimited.com

**Add Records:**
```
1. Click "Create record"
2. Record name: [subdomain or leave blank for root]
3. Record type: [Select from dropdown]
4. Value: [Enter value]
5. TTL: 3600
6. Routing policy: Simple routing
7. Create records
```

## DNS Propagation and Testing

### How Long Does DNS Propagation Take?

- **TTL expired:** Immediate to 1 hour
- **New records:** 1-4 hours typically
- **Global propagation:** Up to 24-48 hours maximum

### Check DNS Propagation

**Online Tools:**

1. **DNS Checker:** https://dnschecker.org
   ```
   Enter: alosralimited.com
   Type: [Select record type]
   View: Propagation status globally
   ```

2. **What's My DNS:** https://whatsmydns.net
   ```
   Enter: alosralimited.com
   Select: Record type
   Check: Propagation worldwide
   ```

3. **MXToolbox:** https://mxtoolbox.com/SuperTool.aspx
   ```
   Enter: alosralimited.com
   Automatically checks: MX, A, SPF, DMARC
   ```

**Command Line Tools:**

```bash
# Check MX records
nslookup -type=MX alosralimited.com

# Check A records
nslookup -type=A alosralimited.com

# Check TXT records (SPF/DKIM/DMARC)
nslookup -type=TXT alosralimited.com

# Check specific DKIM record
nslookup -type=TXT google._domainkey.alosralimited.com

# Check DMARC record
nslookup -type=TXT _dmarc.alosralimited.com

# Check MTA-STS record
nslookup -type=TXT _mta-sts.alosralimited.com

# Using dig (Linux/Mac)
dig alosralimited.com MX
dig alosralimited.com TXT
dig _dmarc.alosralimited.com TXT
```

### Flush DNS Cache

If you don't see changes:

**Windows:**
```powershell
ipconfig /flushdns
```

**Mac:**
```bash
sudo dscacheutil -flushcache
sudo killall -HUP mDNSResponder
```

**Linux:**
```bash
sudo systemd-resolve --flush-caches
# or
sudo service nscd restart
```

**Browser:**
- Chrome: chrome://net-internals/#dns → Clear host cache
- Firefox: Close and restart browser

## Common DNS Issues and Solutions

### Issue: MX Records Not Working

**Symptoms:** Emails bounce or not received

**Check:**
```bash
nslookup -type=MX alosralimited.com
```

**Expected Output:**
```
alosralimited.com mail exchanger = 1 aspmx.l.google.com
alosralimited.com mail exchanger = 5 alt1.aspmx.l.google.com
```

**Solutions:**
1. Verify MX records entered correctly
2. Check priority numbers (lower = higher priority)
3. Ensure trailing dot in value if required by provider
4. Wait for DNS propagation (up to 48 hours)

### Issue: SPF Record Not Found

**Symptoms:** Emails marked as spam

**Check:**
```bash
nslookup -type=TXT alosralimited.com | grep spf
```

**Expected Output:**
```
alosralimited.com text = "v=spf1 include:_spf.google.com ~all"
```

**Solutions:**
1. Ensure only ONE SPF record (multiple SPF records cause failures)
2. Check syntax carefully (spaces matter)
3. Verify include domains are correct
4. Test at: https://mxtoolbox.com/spf.aspx

### Issue: DKIM Not Signing

**Symptoms:** DKIM verification fails

**Check:**
```bash
nslookup -type=TXT google._domainkey.alosralimited.com
```

**Solutions:**
1. Verify DKIM record name matches email provider's requirements
2. Check public key is complete (very long string)
3. Ensure no extra spaces or quotes
4. Check provider has DKIM enabled for domain
5. Send test email to: check-auth@verifier.port25.com

### Issue: DMARC Policy Not Applied

**Symptoms:** DMARC reports not received

**Check:**
```bash
nslookup -type=TXT _dmarc.alosralimited.com
```

**Solutions:**
1. Verify record name is exactly: _dmarc
2. Check email address in rua/ruf tags is valid
3. Start with p=none for testing
4. Wait 24 hours for first reports
5. Verify at: https://mxtoolbox.com/dmarc.aspx

## Security Best Practices

### DNSSEC (DNS Security Extensions)

**Why Enable DNSSEC:**
- Prevents DNS spoofing
- Ensures DNS responses are authentic
- Required by some email providers

**How to Enable:**

1. **Cloudflare:**
   ```
   DNS → DNSSEC → Enable DNSSEC
   Copy DS records → Add to domain registrar
   ```

2. **GoDaddy:**
   ```
   Domain Settings → DNSSEC → Enable
   Automatic (if GoDaddy is registrar)
   ```

3. **Route 53:**
   ```
   Hosted zone → DNSSEC signing → Enable
   Copy DS records → Add to registrar
   ```

### CAA Records (Certification Authority Authorization)

Specify which CAs can issue SSL certificates:

```
Type: CAA
Name: @
Flags: 0
Tag: issue
Value: letsencrypt.org
TTL: 3600

Type: CAA
Name: @
Flags: 0
Tag: issuewild
Value: letsencrypt.org
TTL: 3600

Type: CAA
Name: @
Flags: 0
Tag: iodef
Value: mailto:security@alosralimited.com
TTL: 3600
```

### Regular DNS Audits

**Monthly Checklist:**
- [ ] Verify all MX records point to correct servers
- [ ] Check SPF record includes all sending sources
- [ ] Confirm DKIM records are present and valid
- [ ] Review DMARC reports for authentication issues
- [ ] Test email deliverability
- [ ] Remove unused DNS records
- [ ] Check for unauthorized DNS changes

## Reference Links

**DNS Lookup Tools:**
- MXToolbox: https://mxtoolbox.com
- DNS Checker: https://dnschecker.org
- What's My DNS: https://whatsmydns.net
- Google Toolbox: https://toolbox.googleapps.com/apps/checkmx/

**Email Testing:**
- Mail Tester: https://www.mail-tester.com
- Port25 Verifier: check-auth@verifier.port25.com
- DMARC Analyzer: https://www.dmarcanalyzer.com

**Documentation:**
- SPF: http://www.open-spf.org
- DKIM: http://www.dkim.org
- DMARC: https://dmarc.org
- MTA-STS: https://datatracker.ietf.org/doc/html/rfc8461

**Provider Documentation:**
- Google Workspace: https://support.google.com/a/answer/140034
- Microsoft 365: https://docs.microsoft.com/microsoft-365/admin/get-help-with-domains/create-dns-records-at-any-dns-hosting-provider
- Zoho Mail: https://www.zoho.com/mail/help/adminconsole/configure-dns-records.html

---

**Last Updated:** 2025-10-21  
**Maintained by:** Alosra Limited  
**Repository:** https://github.com/alosralimited/print-label-barcode-scanner

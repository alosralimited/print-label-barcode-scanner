# 📧 Email Configuration Guide for alosralimited.com

## Table of Contents

1. [Current Email Setup](#current-email-setup)
2. [MX Records Configuration](#mx-records-configuration)
3. [Reversing Email Migration](#reversing-email-migration)
4. [Email Alias Setup](#email-alias-setup)
5. [DNS Records Configuration](#dns-records-configuration)
6. [Troubleshooting](#troubleshooting)
7. [Best Practices](#best-practices)

---

## 📊 Current Email Setup

### Domain
- **Domain**: alosralimited.com
- **Email Provider**: Google Workspace (Gmail for Business)

### Current MX Records
Based on your domain DNS configuration:

```
Priority  Mail Exchanger
1         aspmx.l.google.com
5         alt1.aspmx.l.google.com
5         alt2.aspmx.l.google.com
10        alt3.aspmx.l.google.com
10        alt4.aspmx.l.google.com
```

✅ **Status**: MX records are correctly configured for Google Workspace

### Email Addresses
- **sales@alosralimited.com** - Primary business email
- **info@alosralimited.com** - Alternative/alias email

---

## 🔄 Reversing Email Migration

### Problem Statement
You previously migrated from one email setup to another, and now you want to:
- **Make** `sales@alosralimited.com` the **primary email address**
- **Make** `info@alosralimited.com` an **alias/alternative** email address

### Solution: Configure Email Aliases in Google Workspace

#### Step 1: Access Google Admin Console

1. **Sign in to Google Admin Console**:
   - Go to: https://admin.google.com
   - Sign in with your administrator account

2. **Navigate to Users**:
   - Click **"Directory"** → **"Users"**
   - Or go directly to: https://admin.google.com/ac/users

#### Step 2: Configure Primary Email (sales@alosralimited.com)

1. **Find or create the sales@ user**:
   - If `sales@alosralimited.com` exists:
     - Click on the user
     - Verify it's active
   - If it doesn't exist:
     - Click **"Add new user"**
     - First name: Sales
     - Last name: Team (or your company name)
     - Primary email: `sales@alosralimited.com`
     - Create a strong password
     - Click **"Add new user"**

2. **Set as primary account**:
   - This will be your main email for business communications
   - Configure forwarding if needed (see below)

#### Step 3: Configure Alias (info@alosralimited.com)

**Option A: Make info@ an alias of sales@ (Recommended for your use case)**

1. **In Google Admin Console**:
   - Go to **Directory** → **Users**
   - Click on `sales@alosralimited.com`
   
2. **Add Email Alias**:
   - Click on **"User information"** (or scroll down to "Email aliases")
   - Click **"Add alternate email"** or **"Add alias"**
   - Enter: `info@alosralimited.com`
   - Click **"Add"** or **"Save"**

3. **Result**:
   - ✅ All emails sent to `info@alosralimited.com` will arrive in `sales@alosralimited.com` inbox
   - ✅ You can send emails from both addresses
   - ✅ Both addresses use the same inbox (no duplication)

**Option B: Set up forwarding from info@ to sales@**

If `info@alosralimited.com` already exists as a separate account:

1. **Sign in to info@alosralimited.com**:
   - Go to: https://mail.google.com
   - Sign in with info@ credentials

2. **Configure Forwarding**:
   - Click **Settings** (gear icon) → **"See all settings"**
   - Go to **"Forwarding and POP/IMAP"** tab
   - Click **"Add a forwarding address"**
   - Enter: `sales@alosralimited.com`
   - Click **"Next"** → **"Proceed"** → **"OK"**
   
3. **Verify Forwarding**:
   - Check `sales@alosralimited.com` inbox
   - You'll receive a confirmation email
   - Click the verification link
   
4. **Enable Forwarding**:
   - Go back to info@ Settings → Forwarding
   - Select **"Forward a copy of incoming mail to"** → `sales@alosralimited.com`
   - Choose: **"Keep Gmail's copy in the Inbox"** or **"Archive Gmail's copy"**
   - Click **"Save Changes"**

5. **Optional - Deactivate info@ account** (to save license):
   - Go to Google Admin Console
   - Find `info@alosralimited.com`
   - Click **"More options"** → **"Suspend user"**
   - This frees up a user license while preserving the account

---

## 📧 Email Alias Setup

### How Email Aliases Work in Google Workspace

**Email Aliases** allow multiple email addresses to deliver to the same inbox:

- **Primary email**: `sales@alosralimited.com`
- **Aliases**: `info@alosralimited.com`, `support@alosralimited.com`, etc.

### Benefits of Using Aliases

✅ **Single Inbox**: All emails arrive in one place  
✅ **Send From Multiple Addresses**: You can reply from any alias  
✅ **Cost Effective**: Aliases don't count as additional users  
✅ **Professional**: Different emails for different purposes  
✅ **Easy Management**: Manage all communications from one account  

### Setting Up Multiple Aliases

1. **In Google Admin Console**:
   - Users → Click on `sales@alosralimited.com`
   - User information → Email aliases
   
2. **Add multiple aliases**:
   ```
   info@alosralimited.com
   support@alosralimited.com
   contact@alosralimited.com
   orders@alosralimited.com
   ```

3. **Send email from an alias**:
   - Open Gmail
   - Click **"Compose"**
   - Click the **From** field
   - Select which email address to send from
   - If alias doesn't appear, add it in Gmail Settings → Accounts

### Configure "Send Mail As" in Gmail

1. **Sign in to Gmail** as `sales@alosralimited.com`

2. **Open Settings**:
   - Click **Settings** (gear icon) → **"See all settings"**
   - Go to **"Accounts and Import"** tab

3. **Add alias to "Send mail as"**:
   - Under "Send mail as", click **"Add another email address"**
   - Name: `ALOS RA Limited - Info`
   - Email: `info@alosralimited.com`
   - ☑️ Check **"Treat as an alias"**
   - Click **"Next Step"** → **"Send verification"**
   
4. **Verify**:
   - Check your inbox for verification email
   - Click the verification link
   - Or enter the confirmation code

5. **Set default send address** (optional):
   - In "Send mail as" section
   - Click **"make default"** next to your preferred address

---

## 🔒 DNS Records Configuration

### Required DNS Records for Email

To ensure emails are delivered properly and avoid spam filters:

#### 1. MX Records (Already Configured ✅)

```
Priority  Hostname              Mail Server
1         alosralimited.com     aspmx.l.google.com
5         alosralimited.com     alt1.aspmx.l.google.com
5         alosralimited.com     alt2.aspmx.l.google.com
10        alosralimited.com     alt3.aspmx.l.google.com
10        alosralimited.com     alt4.aspmx.l.google.com
```

**How to verify**:
```bash
nslookup -type=MX alosralimited.com
```

#### 2. SPF Record (Sender Policy Framework)

**Purpose**: Prevents email spoofing by specifying which servers can send email on your behalf

**Add this TXT record to your DNS**:

```
Type: TXT
Name: @ (or alosralimited.com)
Value: v=spf1 include:_spf.google.com ~all
TTL: 3600 (or default)
```

**Verify SPF**:
```bash
nslookup -type=TXT alosralimited.com
```

Or use: https://mxtoolbox.com/spf.aspx

#### 3. DKIM Record (DomainKeys Identified Mail)

**Purpose**: Authenticates that emails actually came from your domain

**Steps to configure**:

1. **In Google Admin Console**:
   - Go to **Apps** → **Google Workspace** → **Gmail**
   - Click **"Authenticate email"**
   - Select your domain: `alosralimited.com`
   - Click **"Generate New Record"**

2. **Copy the DKIM record**:
   - Google will show something like:
   ```
   Name: google._domainkey.alosralimited.com
   Type: TXT
   Value: v=DKIM1; k=rsa; p=MIIBIjANBgkq...
   ```

3. **Add to your DNS provider**:
   - Name/Host: `google._domainkey`
   - Type: `TXT`
   - Value: (paste the long string from Google)
   - TTL: 3600

4. **Start Authentication in Google**:
   - Click **"Start Authentication"**
   - Wait 24-48 hours for DNS propagation

**Verify DKIM**:
```bash
nslookup -type=TXT google._domainkey.alosralimited.com
```

#### 4. DMARC Record

**Purpose**: Tells receiving servers what to do with emails that fail SPF or DKIM

**Add this TXT record**:

```
Type: TXT
Name: _dmarc
Value: v=DMARC1; p=quarantine; rua=mailto:dmarc@alosralimited.com; ruf=mailto:dmarc@alosralimited.com; fo=1; adkim=r; aspf=r; pct=100; ri=86400
TTL: 3600
```

**Simplified DMARC for beginners**:
```
v=DMARC1; p=none; rua=mailto:sales@alosralimited.com
```

- `p=none`: Monitor mode (doesn't reject emails, good for testing)
- `p=quarantine`: Send suspicious emails to spam
- `p=reject`: Block suspicious emails completely

**Verify DMARC**:
```bash
nslookup -type=TXT _dmarc.alosralimited.com
```

---

## 🔧 Troubleshooting

### Issue 1: "Amber Signs" in Email Configuration Checks

**What are amber signs?**
- Warnings from email validation tools (like checkmx.com)
- Usually indicate missing or misconfigured DNS records

**Common Warnings**:

#### ⚠️ SPF Record Missing or Invalid

**Check**:
```bash
nslookup -type=TXT alosralimited.com
```

**Fix**:
- Add SPF record: `v=spf1 include:_spf.google.com ~all`
- Wait 1-24 hours for DNS propagation

#### ⚠️ DKIM Not Configured

**Check**:
```bash
nslookup -type=TXT google._domainkey.alosralimited.com
```

**Fix**:
- Configure DKIM in Google Admin Console (see above)
- Add TXT record to DNS
- Start authentication in Google Workspace

#### ⚠️ DMARC Record Missing

**Check**:
```bash
nslookup -type=TXT _dmarc.alosralimited.com
```

**Fix**:
- Add DMARC TXT record: `v=DMARC1; p=none; rua=mailto:sales@alosralimited.com`

#### ⚠️ Reverse DNS (PTR) Issues

**What it means**: Mail server IP doesn't have proper reverse DNS

**Fix**:
- This is usually handled by Google
- Contact your DNS provider or Google support if persistent

### Issue 2: Emails Going to Spam

**Causes**:
- Missing SPF/DKIM/DMARC records
- Low sender reputation
- Suspicious email content

**Solutions**:

1. **Verify all DNS records are set correctly**
2. **Warm up your email domain**:
   - Start with small volume
   - Gradually increase sending
3. **Avoid spam triggers**:
   - Don't use all caps in subject
   - Include unsubscribe link for marketing emails
   - Use proper HTML formatting
4. **Monitor your reputation**:
   - Use: https://mxtoolbox.com/domain/
   - Check if domain is blacklisted

### Issue 3: Cannot Send From Alias

**Problem**: Alias doesn't appear in Gmail "From" dropdown

**Solutions**:

1. **Verify alias is added in Google Admin**:
   - Admin Console → Users → [user] → Email aliases
   - Confirm alias is listed

2. **Add alias to "Send mail as"**:
   - Gmail → Settings → Accounts and Import
   - Add the alias address
   - Verify the alias

3. **Wait for propagation**:
   - Changes can take 10-30 minutes

### Issue 4: Emails Not Arriving

**Diagnostic Steps**:

1. **Check MX records**:
   ```bash
   nslookup -type=MX alosralimited.com
   ```
   Should show Google's mail servers

2. **Test email delivery**:
   - Send test email from another account
   - Check spam folder
   - Check Gmail filters (Settings → Filters and Blocked Addresses)

3. **Check Google Admin Console**:
   - Go to Reports → Audit and investigation → Email log search
   - Search for the missing email
   - Check delivery status

4. **Verify user is active**:
   - Admin Console → Directory → Users
   - Ensure user is not suspended

### Issue 5: "User Not Found" Error

**Problem**: Email bounces back with "user not found"

**Solutions**:

1. **For primary email**:
   - Verify user exists in Google Admin Console
   - Check spelling of email address
   - Ensure user is active (not suspended)

2. **For alias**:
   - Verify alias is correctly configured
   - Wait 10-30 minutes after adding alias
   - Check for typos in alias configuration

---

## 🎯 Best Practices

### Email Management

✅ **Use Aliases Instead of Multiple Accounts**:
- Saves money (no extra licenses)
- Centralized inbox
- Easier to manage

✅ **Set Up Email Forwarding for Old Addresses**:
- Ensure you don't miss emails during transition
- Set up vacation responder with new address

✅ **Configure Email Signature**:
- Include both addresses in signature if needed
- Example:
  ```
  John Doe
  ALOS RA Limited
  Email: sales@alosralimited.com | info@alosralimited.com
  Web: alosralimited.com
  ```

✅ **Use Labels and Filters**:
- Create labels for emails sent to different aliases
- Auto-categorize based on "To" address

### Security Best Practices

🔒 **Enable 2-Factor Authentication**:
- Admin Console → Security → 2-Step Verification
- Enforce for all users

🔒 **Use Strong Passwords**:
- Minimum 12 characters
- Mix of letters, numbers, symbols
- Use password manager

🔒 **Monitor Admin Activity**:
- Regularly check Admin Console → Reports
- Review login attempts
- Monitor email forwarding rules

🔒 **Configure Advanced Phishing Protection**:
- Admin Console → Security → Advanced Phishing and Malware Protection
- Enable all protections

### WooCommerce Integration

Since you mentioned WooCommerce for your online shop:

1. **Configure WooCommerce Email Settings**:
   - Use `orders@alosralimited.com` (alias) for order notifications
   - Use `sales@alosralimited.com` for customer communication

2. **SMTP Configuration**:
   - Install WP Mail SMTP plugin
   - Configure with Google Workspace credentials
   - From Email: `orders@alosralimited.com`
   - From Name: "ALOS RA Limited"

3. **Test Email Delivery**:
   - Send test orders
   - Verify order confirmations arrive
   - Check spam folders

---

## 📋 Quick Reference

### DNS Records Checklist

- [ ] MX records pointing to Google Workspace
- [ ] SPF record: `v=spf1 include:_spf.google.com ~all`
- [ ] DKIM record configured and authenticated
- [ ] DMARC record added (start with `p=none`)

### Email Configuration Checklist

- [ ] `sales@alosralimited.com` created as primary account
- [ ] `info@alosralimited.com` added as alias
- [ ] Aliases configured in "Send mail as"
- [ ] Email signature updated
- [ ] Test emails sent and received successfully
- [ ] Verified on checkmx.com (no critical errors)

### Testing Checklist

- [ ] Send email from sales@ to external account
- [ ] Send email from info@ to external account
- [ ] Receive email to sales@
- [ ] Receive email to info@ (should arrive in sales@ inbox)
- [ ] Check emails don't go to spam
- [ ] Verify all DNS records with online tools

---

## 🛠️ Useful Tools

### Email Validation Tools

1. **MX Toolbox**: https://mxtoolbox.com/
   - Check MX records, SPF, DKIM, DMARC
   - Check domain reputation
   - Blacklist monitoring

2. **Google Admin Toolbox**: https://toolbox.googleapps.com/apps/checkmx/
   - Official Google tool
   - Validates Google Workspace email configuration

3. **Mail Tester**: https://www.mail-tester.com/
   - Send test email to check spam score
   - Identifies configuration issues

4. **DMARC Analyzer**: https://dmarcian.com/dmarc-inspector/
   - Validate DMARC configuration
   - Review DMARC reports

### DNS Lookup Commands

```bash
# Check MX records
nslookup -type=MX alosralimited.com

# Check SPF record
nslookup -type=TXT alosralimited.com

# Check DKIM record
nslookup -type=TXT google._domainkey.alosralimited.com

# Check DMARC record
nslookup -type=TXT _dmarc.alosralimited.com

# Check all DNS records
nslookup -type=ANY alosralimited.com
```

---

## 📞 Support Resources

### Google Workspace Support

- **Help Center**: https://support.google.com/a/
- **Admin Console Help**: Click "?" icon in top right
- **Community Forum**: https://support.google.com/a/community
- **Contact Support**: https://support.google.com/a/answer/1047213

### Common Google Workspace Support Topics

- [Set up MX records](https://support.google.com/a/answer/140034)
- [Add email aliases](https://support.google.com/a/answer/33327)
- [Configure SPF](https://support.google.com/a/answer/33786)
- [Set up DKIM](https://support.google.com/a/answer/180504)
- [Add DMARC record](https://support.google.com/a/answer/2466580)

---

## 🎉 Summary

### What You've Accomplished

After following this guide, you will have:

✅ Configured `sales@alosralimited.com` as your primary email  
✅ Set up `info@alosralimited.com` as an alias  
✅ All emails from both addresses arrive in one inbox  
✅ Proper DNS records (MX, SPF, DKIM, DMARC) configured  
✅ Improved email deliverability  
✅ Resolved "amber signs" from email checkers  
✅ Professional email setup for business communications  

### Next Steps

1. **Monitor Email Deliverability**:
   - Check DMARC reports regularly
   - Monitor spam complaints
   - Adjust policies as needed

2. **Educate Team Members**:
   - Show them how to send from different aliases
   - Set up email signatures
   - Configure email filters

3. **Consider Additional Aliases**:
   ```
   support@alosralimited.com
   orders@alosralimited.com
   billing@alosralimited.com
   ```

---

**Questions or Issues?**

If you encounter any problems:

1. Check the [Troubleshooting](#troubleshooting) section
2. Use the validation tools listed above
3. Review Google Workspace support documentation
4. Contact Google Workspace support for complex issues

---

*Last Updated: October 21, 2025*  
*Domain: alosralimited.com*  
*Email Provider: Google Workspace*

# Email Alias Configuration Guide

This guide provides step-by-step instructions for managing email aliases for alosralimited.com domain.

## Overview

**Current Configuration:**
- **Primary Email:** sales@alosralimited.com
- **Alias/Alternative:** info@alosralimited.com

The alias configuration ensures that emails sent to info@alosralimited.com are delivered to the same inbox as sales@alosralimited.com, or forwarded appropriately.

## Table of Contents

1. [Understanding Email Aliases](#understanding-email-aliases)
2. [Setting Up Aliases](#setting-up-aliases)
3. [Reversing Email Migration](#reversing-email-migration)
4. [Provider-Specific Instructions](#provider-specific-instructions)
5. [Testing Configuration](#testing-configuration)
6. [Troubleshooting](#troubleshooting)

## Understanding Email Aliases

### What is an Email Alias?

An email alias is an additional email address that delivers messages to an existing email account. Think of it as a nickname for your email account.

**Example:**
- Primary: sales@alosralimited.com (actual mailbox)
- Alias: info@alosralimited.com (forwards to sales@)

**Benefits:**
- ✅ One inbox to manage
- ✅ Multiple professional email addresses
- ✅ No additional cost for extra addresses
- ✅ Can send from both addresses

### Alias vs. Forwarder

| Feature | Alias | Forwarder |
|---------|-------|-----------|
| Receives email | ✅ Yes | ✅ Yes |
| Can send from address | ✅ Yes | ❌ No (usually) |
| Appears in address book | ✅ Yes | ❌ No |
| Counts as separate user | ❌ No | ❌ No |
| Cost | Free | Free |

**Recommendation:** Use aliases when you want to send AND receive from the address.

## Setting Up Aliases

### Current Desired Configuration

Make `sales@alosralimited.com` the primary account with `info@alosralimited.com` as an alias:

```
sales@alosralimited.com (Primary Mailbox)
  └── info@alosralimited.com (Alias)
```

### Prerequisites

Before setting up aliases:
- [ ] Primary email account (sales@alosralimited.com) must exist
- [ ] You must have admin access to your email provider
- [ ] Domain DNS records must point to your email provider

## Reversing Email Migration

If you previously migrated and want to reverse the setup:

### Scenario: info@ was Primary, Now want sales@ as Primary

#### Step 1: Assessment

Check your current setup:
1. Log into your email admin panel
2. Identify which account has the mailbox
3. List all current aliases and forwarders

#### Step 2: Backup Everything

**Critical:** Before making changes, backup all emails!

**Method A: IMAP Download**
```
1. Configure email client (Thunderbird, Outlook, Apple Mail)
2. Add both accounts via IMAP
3. Create local folders
4. Drag all emails from server to local folders
5. Wait for download to complete
```

**Method B: Provider Export**
- Google Workspace: Use Google Takeout
- Microsoft 365: Use Export feature in admin center
- cPanel: Use "Backup" feature in email accounts

#### Step 3: Reconfigure Accounts

**Option A: Keep Both as Separate Accounts**

If both have separate inboxes and you want to merge:

1. Export all emails from info@alosralimited.com
2. Import them into sales@alosralimited.com
3. Convert info@ to an alias of sales@
4. Verify emails in sales@ inbox

**Option B: Make sales@ Primary with info@ Alias**

If info@ is currently primary:

1. Create sales@ as new primary account (if doesn't exist)
2. Migrate all emails from info@ to sales@
3. Convert info@ to an alias or forwarder
4. Update all services to use sales@ for login

### Step 4: Update Email Clients

Update configurations on all devices:

**Desktop Email Clients:**
```
1. Open email client settings
2. Update account settings:
   - Username: sales@alosralimited.com
   - Keep same password (or update if changed)
3. Add info@ as "Send As" or alias
4. Test sending and receiving
```

**Mobile Devices:**
```
1. Remove old account
2. Add new account:
   - Email: sales@alosralimited.com
   - Password: [your password]
3. Configure alias settings if available
```

**Webmail:**
```
1. Log in with: sales@alosralimited.com
2. Go to Settings
3. Add "Send As" address: info@alosralimited.com
4. Verify the alias
```

## Provider-Specific Instructions

### Google Workspace (Gmail for Business)

#### Adding an Alias

1. **Admin Console:**
   ```
   1. Go to admin.google.com
   2. Sign in with admin account
   3. Navigate to: Users → Active users
   4. Click on: sales@alosralimited.com
   5. Click: User information
   6. Under "Email aliases", click "Manage aliases"
   7. Click: Add an alias
   8. Enter: info
   9. Click: Save
   ```

2. **Verify Alias Works:**
   ```
   1. Send test email to info@alosralimited.com
   2. Check it arrives in sales@ inbox
   3. Reply from info@ address
   4. Verify recipient sees "From: info@alosralimited.com"
   ```

#### Sending From Alias

1. **In Gmail:**
   ```
   1. Click Settings (gear icon)
   2. Go to "Accounts and Import" tab
   3. Under "Send mail as", your alias should appear
   4. When composing, click "From" dropdown
   5. Select info@alosralimited.com
   ```

### Microsoft 365 (Outlook)

#### Adding an Alias

1. **Admin Center:**
   ```
   1. Go to admin.microsoft.com
   2. Sign in with admin account
   3. Navigate to: Users → Active users
   4. Click on: sales@alosralimited.com
   5. Click: Manage email aliases
   6. Click: + Add an alias
   7. Enter: info
   8. Uncheck "Make this the primary email address"
   9. Click: Save
   ```

2. **Using the Alias:**
   ```
   1. Open Outlook (web or desktop)
   2. When composing new email
   3. Click "From" button
   4. Select: info@alosralimited.com
   5. Compose and send
   ```

### cPanel / Webmail

#### Creating an Alias (Forwarder)

1. **cPanel Method:**
   ```
   1. Log into cPanel
   2. Find "Email" section
   3. Click "Forwarders"
   4. Click "Add Forwarder"
   5. Address to Forward: info
   6. Domain: alosralimited.com
   7. Forward to email address: sales@alosralimited.com
   8. Click "Add Forwarder"
   ```

2. **Alternative: Email Filter**
   ```
   1. Log into webmail
   2. Settings → Filters
   3. Create new filter:
      - If: To contains "info@alosralimited.com"
      - Then: Forward to "sales@alosralimited.com"
   4. Save filter
   ```

### Zoho Mail

#### Adding an Alias

1. **Admin Panel:**
   ```
   1. Log into Zoho Mail Admin
   2. Navigate to: Users → User List
   3. Click on: sales@alosralimited.com
   4. Go to "Email Aliases" section
   5. Click "Add Alias"
   6. Enter: info
   7. Click "Add"
   ```

### Cloudflare Email Routing (Free)

#### Setting Up Email Routing

1. **Cloudflare Dashboard:**
   ```
   1. Log into Cloudflare
   2. Select domain: alosralimited.com
   3. Navigate to: Email → Email Routing
   4. Enable Email Routing
   5. Add destination: sales@alosralimited.com
   6. Add routing rule:
      - Custom address: info@alosralimited.com
      - Action: Send to → sales@alosralimited.com
   7. Save
   ```

**Note:** Cloudflare Email Routing only forwards emails. You cannot send FROM the alias.

## Testing Configuration

### Comprehensive Testing Checklist

#### Test 1: Receiving Emails

```
1. Send email to: sales@alosralimited.com
   Expected: Email arrives in sales@ inbox
   Status: [ ]

2. Send email to: info@alosralimited.com
   Expected: Email arrives in sales@ inbox
   Status: [ ]

3. Send email with CC to both addresses
   Expected: Only one email in inbox (not duplicate)
   Status: [ ]
```

#### Test 2: Sending Emails

```
1. Compose from sales@alosralimited.com
   Expected: Sends successfully
   Status: [ ]

2. Compose from info@alosralimited.com (use Send As)
   Expected: Sends successfully
   Recipient sees: From: info@alosralimited.com
   Status: [ ]

3. Check sent folder
   Expected: Both sent emails appear in sent folder
   Status: [ ]
```

#### Test 3: Reply Handling

```
1. Receive email at info@
   Reply from sales@
   Expected: Reply shows "From: sales@alosralimited.com"
   Status: [ ]

2. Receive email at info@
   Reply from info@
   Expected: Reply shows "From: info@alosralimited.com"
   Status: [ ]
```

#### Test 4: Spam/Authentication

```
1. Send test to: check-auth@verifier.port25.com
   From: sales@alosralimited.com
   Check response for:
   - SPF: PASS [ ]
   - DKIM: PASS [ ]
   - DMARC: PASS [ ]

2. Send test to: check-auth@verifier.port25.com
   From: info@alosralimited.com
   Check response for:
   - SPF: PASS [ ]
   - DKIM: PASS [ ]
   - DMARC: PASS [ ]
```

### Automated Testing Tools

**Mail-Tester:**
```
1. Go to: https://www.mail-tester.com
2. Note the test email address
3. Send email from sales@
4. Click "Then check your score"
5. Aim for: 9/10 or 10/10
6. Review any issues
```

**MXToolbox:**
```
1. Go to: https://mxtoolbox.com
2. Enter: alosralimited.com
3. Check for:
   - MX records: Green ✓
   - SPF records: Green ✓
   - DMARC records: Green ✓
4. Fix any amber/red warnings
```

## Troubleshooting

### Issue: Alias Not Receiving Emails

**Symptoms:** Emails sent to info@ don't arrive at sales@

**Solutions:**

1. **Check alias is properly configured:**
   - Log into email admin panel
   - Verify info@ is listed as alias of sales@
   - Not as separate account or forwarder

2. **Check DNS propagation:**
   ```
   Wait 24-48 hours after DNS changes
   Check: https://dnschecker.org
   Enter: alosralimited.com
   Type: MX
   Verify: Shows correct mail servers globally
   ```

3. **Check spam folder:**
   - Emails might be filtered as spam
   - Add sender to safe senders list
   - Check email provider's spam quarantine

4. **Test with external email:**
   - Send from Gmail to info@
   - Send from Outlook to info@
   - Check both arrive at sales@

### Issue: Cannot Send From Alias

**Symptoms:** Can't select info@ when composing email

**Solutions:**

1. **Google Workspace:**
   ```
   Settings → Accounts → Send mail as
   If info@ not listed:
   - Click "Add another email address"
   - Enter: info@alosralimited.com
   - Select: "Treat as an alias"
   - Save
   ```

2. **Microsoft 365:**
   ```
   The alias should automatically appear
   In Outlook, click "From" when composing
   If not shown:
   - Wait 15 minutes for sync
   - Close and reopen Outlook
   - Sign out and sign back in
   ```

3. **Verification required:**
   - Some providers send verification email
   - Check sales@ inbox for verification
   - Click verification link

### Issue: Duplicate Emails

**Symptoms:** Receiving same email twice (once at sales@, once at info@)

**Cause:** info@ is set up as both alias AND forwarder

**Solution:**
```
1. Check email settings
2. Remove forwarder for info@
3. Keep only as alias
4. Test with new email
```

### Issue: SPF/DKIM Failures from Alias

**Symptoms:** Emails from info@ fail authentication

**Solutions:**

1. **Check SPF record includes all servers:**
   ```
   Current: v=spf1 include:_spf.google.com ~all
   Should include all mail servers you send from
   ```

2. **Verify DKIM signing:**
   ```
   1. Email admin panel → DKIM settings
   2. Ensure DKIM enabled for domain
   3. Check DNS has DKIM record
   4. Test: Send to check-auth@verifier.port25.com
   ```

3. **Check DMARC policy:**
   ```
   _dmarc.alosralimited.com should exist
   Policy should allow aliases
   ```

### Issue: Mobile Device Not Syncing

**Symptoms:** Alias works on web, not on mobile

**Solutions:**

1. **iOS Mail App:**
   ```
   Settings → Mail → Accounts
   Tap your account
   Tap Email
   Under "From", all aliases should be listed
   If not:
   - Remove account
   - Re-add account
   - Wait for full sync
   ```

2. **Android Gmail App:**
   ```
   Gmail app → Settings → Your account
   Under "Send mail as"
   All aliases should appear
   If not:
   - Update Gmail app
   - Clear app cache
   - Re-sync account
   ```

3. **Outlook Mobile:**
   ```
   Outlook app → Settings → Account
   Your account → Aliases
   Should show all aliases
   If not:
   - Force sync
   - Log out and log back in
   ```

## Best Practices

### Naming Conventions

Choose aliases that clearly indicate their purpose:

✅ **Good Examples:**
- sales@alosralimited.com (sales inquiries)
- info@alosralimited.com (general information)
- support@alosralimited.com (customer support)
- hello@alosralimited.com (friendly greeting)
- contact@alosralimited.com (contact form)

❌ **Avoid:**
- admin@alosralimited.com (security target)
- test@alosralimited.com (looks unprofessional)
- noreply@alosralimited.com (as primary address)

### Managing Multiple Aliases

If you have many aliases:

1. **Use labels/folders:**
   ```
   Create filter rules:
   - If TO: info@ → Label: "Info Inquiries"
   - If TO: sales@ → Label: "Sales"
   ```

2. **Use templates for replies:**
   ```
   Save templates for common responses
   Customize based on which alias received email
   ```

3. **Document your setup:**
   ```
   Keep list of all aliases and purposes
   Share with team members
   Update when changes made
   ```

### Security Considerations

1. **Avoid common aliases for security:**
   - Don't use: admin@, root@, postmaster@
   - These are common targets for hackers

2. **Use role-based aliases:**
   - Good for teams: support@, sales@
   - Not tied to individual person
   - Easier to manage turnover

3. **Monitor alias usage:**
   - Check for unauthorized sending
   - Review spam from aliases
   - Disable unused aliases

## Quick Reference

### Command to Test Email Configuration

```bash
# Test DNS records
nslookup -type=MX alosralimited.com

# Test SPF record  
nslookup -type=TXT alosralimited.com

# Test DKIM record
nslookup -type=TXT default._domainkey.alosralimited.com

# Test DMARC record
nslookup -type=TXT _dmarc.alosralimited.com
```

### Checklist: Alias Configuration Complete

- [ ] sales@alosralimited.com exists as primary mailbox
- [ ] info@alosralimited.com added as alias
- [ ] Test email sent to sales@ (received)
- [ ] Test email sent to info@ (received in sales@ inbox)
- [ ] Can compose and send from sales@
- [ ] Can compose and send from info@ (using Send As)
- [ ] SPF/DKIM passing for both addresses
- [ ] Mobile devices configured
- [ ] Desktop email clients configured
- [ ] Webmail tested and working
- [ ] Documentation updated

## Getting Help

If you encounter issues not covered in this guide:

1. **Check provider documentation:**
   - Google Workspace: support.google.com/a
   - Microsoft 365: docs.microsoft.com/microsoft-365
   - Zoho: help.zoho.com/portal/en/home

2. **Community forums:**
   - Stack Overflow: stackoverflow.com/questions/tagged/email
   - Email provider community forums

3. **Contact support:**
   - Email provider support
   - DNS provider support

4. **Create repository issue:**
   - Open issue at: github.com/alosralimited/print-label-barcode-scanner
   - Describe the problem
   - Include screenshots if possible

---

**Last Updated:** 2025-10-21  
**Maintained by:** Alosra Limited  
**Repository:** https://github.com/alosralimited/print-label-barcode-scanner

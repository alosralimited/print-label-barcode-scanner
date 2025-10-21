# Email Migration and DNS Configuration Guide

## Overview
This guide documents the email configuration and DNS setup for alosralimited.com, including how to reverse email migrations and manage email aliases.

## Current Email Setup

### Email Addresses
- **Primary Email**: sales@alosralimited.com
- **Alternative Email**: info@alosralimited.com

### MX Records (Google Workspace)
Current MX records for alosralimited.com:
```
Priority 1:  aspmx.l.google.com
Priority 5:  alt1.aspmx.l.google.com
Priority 5:  alt2.aspmx.l.google.com
Priority 10: alt3.aspmx.l.google.com
Priority 10: alt4.aspmx.l.google.com
```

## Reversing Email Migration

### Goal
To reverse a previous migration and establish:
- **sales@alosralimited.com** as the primary email
- **info@alosralimited.com** as an alternative/alias

### Steps to Reverse Migration

1. **Access Google Workspace Admin Console**
   - Go to admin.google.com
   - Sign in with admin credentials

2. **Set Primary Email**
   - Navigate to Users
   - Select the user account
   - Under "User information" → "Primary email", set to sales@alosralimited.com
   - Click "Save"

3. **Add Email Alias**
   - In the same user settings
   - Under "User information" → "Email aliases"
   - Click "Add an alias"
   - Add info@alosralimited.com as an alias
   - Click "Save"

4. **Update Email Client Settings** (if applicable)
   - Update any email clients to use sales@alosralimited.com as the primary sending address
   - Configure reply-to addresses as needed

## DNS Configuration and Consolidation

### Recommended Approach: Single DNS Host

#### Choosing Between SiteGround and SpaceSquare

**Recommendation: SiteGround**

Reasons:
- More established company with better track record
- Better uptime and reliability
- Easier integration with Google Workspace
- Better support for WooCommerce
- More comprehensive DNS management tools

**If choosing SpaceSquare:**
- May offer lower costs
- Evaluate their support quality first
- Ensure they support all required DNS record types

### DNS Consolidation Steps

1. **Choose Primary DNS Host** (SiteGround recommended)
   - Sign up for hosting if not already done
   - Note down the nameservers provided

2. **Update Domain Nameservers**
   - Log in to your domain registrar
   - Update nameservers to point to your chosen host
   - Example for SiteGround:
     ```
     ns1.siteground.net
     ns2.siteground.net
     ```

3. **Configure DNS Records at New Host**
   
   **MX Records (Email):**
   ```
   Priority 1:  aspmx.l.google.com
   Priority 5:  alt1.aspmx.l.google.com
   Priority 5:  alt2.aspmx.l.google.com
   Priority 10: alt3.aspmx.l.google.com
   Priority 10: alt4.aspmx.l.google.com
   ```

   **SPF Record (TXT):**
   ```
   v=spf1 include:_spf.google.com ~all
   ```

   **DKIM Record (TXT):**
   - Get from Google Workspace Admin Console
   - Navigate to Apps → Google Workspace → Gmail → Authenticate email
   - Copy the DKIM record and add to DNS

   **DMARC Record (TXT):**
   ```
   v=DMARC1; p=quarantine; rua=mailto:sales@alosralimited.com
   ```

   **A Records (Website):**
   - Point @ (root domain) to your web server IP
   - Point www to your web server IP or create CNAME to root

4. **Wait for DNS Propagation**
   - Typically 24-48 hours
   - Use tools like whatsmydns.net to check propagation

## Email Deliverability Checks

### Tools to Verify Configuration

1. **MX Toolbox** (https://mxtoolbox.com/)
   - Check MX records
   - Verify SPF, DKIM, DMARC
   - Check blacklist status

2. **CheckMX** (https://www.checkmx.com/)
   - Comprehensive email server testing
   - Identifies amber/warning signs
   - Provides recommendations

### Addressing Amber Signs in CheckMX

Common amber warnings and solutions:

1. **Reverse DNS (PTR) Record Missing**
   - Contact your hosting provider to set up PTR record
   - Should point to your mail server hostname

2. **Missing DMARC Record**
   - Add DMARC TXT record as shown above

3. **Open Relay Test Failed**
   - This is normal for Google Workspace (closed relay)
   - Not a concern if using Google Workspace

4. **Connection Time**
   - Ensure MX records are properly configured
   - Check firewall rules allow email traffic

## WooCommerce Integration

### Email Configuration for WooCommerce

1. **Install WooCommerce Plugin**
   - In WordPress admin: Plugins → Add New
   - Search for "WooCommerce"
   - Install and activate

2. **Configure Email Settings**
   - Go to WooCommerce → Settings → Emails
   - Set "From" name: Your business name
   - Set "From" email: sales@alosralimited.com

3. **Install SMTP Plugin** (Recommended)
   - Install "WP Mail SMTP" or "Post SMTP" plugin
   - Configure with Google Workspace settings:
     ```
     SMTP Host: smtp.gmail.com
     SMTP Port: 587 (TLS) or 465 (SSL)
     Username: sales@alosralimited.com
     Password: App-specific password (from Google)
     ```

4. **Generate App Password for SMTP**
   - Go to Google Account → Security
   - Enable 2-Step Verification (if not enabled)
   - Under "Signing in to Google" → "App passwords"
   - Generate a new app password for "Mail"
   - Use this password in WooCommerce SMTP settings

5. **Test Email Delivery**
   - Send a test email from WooCommerce
   - Verify it arrives and isn't marked as spam
   - Check sender shows as sales@alosralimited.com

### Email Templates

Configure email templates for:
- Order confirmation
- Order processing
- Order completed
- Order cancelled
- Customer invoice
- New account registration
- Password reset

Access via: WooCommerce → Settings → Emails

## High-Level Implementation Plan

### Phase 1: DNS Consolidation
- [ ] Choose primary DNS host (SiteGround recommended)
- [ ] Document all current DNS records
- [ ] Set up DNS records at new host
- [ ] Update nameservers at registrar
- [ ] Wait for propagation (24-48 hours)
- [ ] Verify all services working

### Phase 2: Email Migration Reversal
- [ ] Access Google Workspace Admin Console
- [ ] Change primary email to sales@alosralimited.com
- [ ] Add info@alosralimited.com as alias
- [ ] Update email client configurations
- [ ] Test email delivery both directions
- [ ] Verify both addresses receive emails

### Phase 3: Email Authentication
- [ ] Configure SPF record
- [ ] Set up DKIM signing
- [ ] Add DMARC policy
- [ ] Run email deliverability tests
- [ ] Address any amber warnings
- [ ] Monitor email delivery rates

### Phase 4: WooCommerce Integration
- [ ] Install WooCommerce plugin
- [ ] Configure basic email settings
- [ ] Install and configure SMTP plugin
- [ ] Generate app password for SMTP
- [ ] Test email delivery
- [ ] Customize email templates
- [ ] Set up order notification routing

## Best Practices

### Email Management
1. **Use Primary Email for All Official Communications**
   - Use sales@alosralimited.com for outgoing emails
   - Set up proper signatures

2. **Alias Management**
   - info@alosralimited.com receives emails, delivered to same inbox
   - Can reply from either address using Gmail's "Send as" feature

3. **Email Organization**
   - Use labels/folders for different purposes
   - Set up filters for automated organization
   - Enable important mail notifications

### DNS Management
1. **Keep Records Documented**
   - Maintain a spreadsheet of all DNS records
   - Document purpose of each record
   - Note when changes were made

2. **Regular Monitoring**
   - Check email deliverability monthly
   - Monitor website uptime
   - Review DNS propagation status

3. **Backup Configuration**
   - Export DNS zone file periodically
   - Keep copies of configuration settings
   - Document access credentials securely

### Cost Optimization
1. **Consolidate Services**
   - Use one host for DNS, web, and domain
   - Reduces management complexity
   - Often cheaper in bundle deals

2. **Review Service Needs**
   - Ensure you're not paying for unused features
   - Evaluate hosting plan requirements
   - Consider usage patterns

## Troubleshooting

### Email Not Receiving
1. Check MX records are correct
2. Verify SPF record includes Google
3. Check mailbox storage quota
4. Review spam/junk folders
5. Test with mail-tester.com

### Email Marked as Spam
1. Ensure DKIM is properly configured
2. Verify SPF record is present
3. Add DMARC record
4. Check sender reputation
5. Avoid spam trigger words in content

### DNS Changes Not Taking Effect
1. Verify changes at DNS host
2. Check TTL values (Time To Live)
3. Wait appropriate propagation time
4. Clear local DNS cache
5. Use different DNS checker tools

### WooCommerce Emails Not Sending
1. Verify SMTP credentials
2. Check app password is valid
3. Test with SMTP plugin diagnostics
4. Review WordPress error logs
5. Ensure outbound port 587 is open

## Additional Resources

### Email Verification Tools
- MX Toolbox: https://mxtoolbox.com/
- CheckMX: https://www.checkmx.com/
- Mail Tester: https://www.mail-tester.com/
- What's My DNS: https://whatsmydns.net/

### Google Workspace Documentation
- Admin Console: https://admin.google.com/
- MX Record Values: https://support.google.com/a/answer/140034
- SPF Records: https://support.google.com/a/answer/33786
- DKIM Setup: https://support.google.com/a/answer/174124

### WooCommerce Resources
- Documentation: https://woocommerce.com/documentation/
- Email Settings: https://woocommerce.com/document/email-faq/
- SMTP Plugins: Search WordPress plugin directory

## Support Contacts

### DNS/Hosting Support
- **SiteGround**: Available via hosting account dashboard
- **SpaceSquare**: Contact through their support portal

### Email Support
- **Google Workspace**: https://support.google.com/a/

### Domain Registrar
- Contact your domain registrar for nameserver updates

---

## Document Version
- Version: 1.0
- Last Updated: 2025-10-21
- Maintained by: alosralimited

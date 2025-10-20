# Custom Domain Setup Guide for alosralimited.com

## Overview

This guide helps you complete the setup of your custom domain (alosralimited.com) for your GitHub Pages site. The CNAME file has been added to the repository and will be automatically deployed.

## What Has Been Done

✅ **CNAME File Created**: The file `web/CNAME` contains your domain "alosralimited.com"  
✅ **Automatic Deployment**: GitHub Actions workflow will include CNAME in every deployment  
✅ **Manual Deployment Support**: PowerShell script also includes CNAME file  

## What You Need To Do

### Step 1: Configure DNS on Squarespace

1. **Log into Squarespace** and navigate to:
   - https://account.squarespace.com/domains/managed/alosralimited.com/dns/dns-settings

2. **Add A Records** for the apex domain (alosralimited.com):
   
   | Type | Host | Points To        |
   |------|------|------------------|
   | A    | @    | 185.199.108.153  |
   | A    | @    | 185.199.109.153  |
   | A    | @    | 185.199.110.153  |
   | A    | @    | 185.199.111.153  |

3. **Add CNAME Record** for www subdomain (recommended):
   
   | Type  | Host | Points To              |
   |-------|------|------------------------|
   | CNAME | www  | alosralimited.github.io |

4. **Save Changes** in Squarespace DNS settings

### Step 2: Configure GitHub Pages

1. **Go to your repository settings**:
   - Navigate to: https://github.com/alosralimited/print-label-barcode-scanner/settings/pages

2. **Enter Custom Domain**:
   - In the "Custom domain" field, enter: `alosralimited.com`
   - Click **Save**

3. **Wait for DNS Check**:
   - GitHub will verify your DNS configuration
   - This may take a few minutes to 24-48 hours

4. **Enable HTTPS** (after DNS check passes):
   - Check the box: "Enforce HTTPS"
   - This ensures your site is served securely

### Step 3: Verify DNS Propagation

1. **Check DNS with dnschecker.org**:
   - Visit: https://dnschecker.org
   - Check for `alosralimited.com` → should show GitHub Pages IPs
   - Check for `www.alosralimited.com` → should point to `alosralimited.github.io`

2. **Be Patient**:
   - DNS changes can take 24-48 hours to propagate globally
   - Different locations may see changes at different times

## After Setup

Once everything is configured and propagated, your site will be accessible at:

- ✅ `https://alosralimited.com`
- ✅ `https://www.alosralimited.com` (if www CNAME is configured)
- ✅ `https://alosralimited.github.io/print-label-barcode-scanner/` (original URL still works)

## Troubleshooting

### "Domain is improperly configured" Error

**Problem**: GitHub Pages shows this error when adding custom domain.

**Solutions**:
- Verify all 4 A records are correctly entered in Squarespace
- Ensure you saved the DNS changes in Squarespace
- Wait 10-15 minutes and try again
- Check for typos in the DNS records

### CNAME Record Not Visible

**Problem**: dnschecker.org shows no CNAME record for www subdomain.

**Solutions**:
- Verify you saved the CNAME record in Squarespace
- Check that the host is "www" (not "@")
- Check that it points to "alosralimited.github.io" (not the full URL)
- Wait for DNS propagation (can take hours)

### Site Shows 404 Error

**Problem**: Custom domain loads but shows 404 error.

**Solutions**:
- Wait for the next deployment (push a commit to trigger it)
- Check that CNAME file is in the deployed site (should be automatic)
- Clear your browser cache
- Try incognito/private mode

### HTTPS Not Available

**Problem**: Can't enable "Enforce HTTPS" option.

**Solutions**:
- Wait for DNS to fully propagate (24-48 hours)
- Ensure DNS check has passed in GitHub Pages settings
- Try removing and re-adding the custom domain
- Wait a few hours and try again

## Important Notes

- 🔐 **HTTPS is Required**: iOS devices require HTTPS for camera access (barcode scanning)
- 📱 **PWA Features**: Custom domain with HTTPS enables full PWA capabilities
- 🔄 **Automatic Updates**: Every push to `main` branch redeploys with CNAME file
- 📝 **Don't Modify CNAME**: The file is managed in the repository; changes via GitHub UI may be overwritten

## Need Help?

If you encounter issues:

1. Double-check all DNS records in Squarespace
2. Verify GitHub Pages settings
3. Wait for DNS propagation (patience is key!)
4. Review detailed instructions in `GITHUB_PAGES_DEPLOYMENT.md`

## References

- GitHub Pages Custom Domain Documentation: https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site
- DNS Checker: https://dnschecker.org
- GitHub Pages IPs: https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site/managing-a-custom-domain-for-your-github-pages-site

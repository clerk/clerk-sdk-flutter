# Documentation Deployment Guide

This guide explains how the Clerk Dart & Flutter SDK documentation is deployed to GitHub Pages.

## 🌐 Live Site

The documentation is available at: **https://clerk.github.io/clerk-sdk-flutter/**

---

## 📋 Deployment Overview

The documentation uses:
- **Jekyll** - Static site generator
- **Just the Docs** - Documentation theme
- **GitHub Actions** - Automated deployment
- **GitHub Pages** - Hosting

---

## 🚀 Automatic Deployment

### Trigger Conditions

The documentation is automatically deployed when:

1. Changes are pushed to the `main` branch
2. Changes affect files in the `docs/` directory
3. Changes affect `.github/workflows/deploy-docs.yml`

### Workflow Steps

The deployment workflow (`.github/workflows/deploy-docs.yml`) performs:

1. **Checkout** - Checks out the repository
2. **Setup Ruby** - Installs Ruby 3.1 and dependencies
3. **Setup Pages** - Configures GitHub Pages
4. **Build** - Builds the Jekyll site
5. **Upload** - Uploads the built site as an artifact
6. **Deploy** - Deploys to GitHub Pages

### Viewing Deployment Status

1. Go to the [Actions tab](https://github.com/clerk/clerk-sdk-flutter/actions)
2. Look for "Deploy Documentation to GitHub Pages" workflow
3. Click on a run to see details and logs

---

## 🔧 Manual Deployment

### Trigger Manual Deployment

1. Go to the [Actions tab](https://github.com/clerk/clerk-sdk-flutter/actions)
2. Select "Deploy Documentation to GitHub Pages"
3. Click "Run workflow"
4. Select the `main` branch
5. Click "Run workflow"

### Local Build Test

Before deploying, test the build locally:

```bash
cd docs
bundle install
bundle exec jekyll build --baseurl "/clerk-sdk-flutter"
```

The built site will be in `docs/_site/`.

---

## ⚙️ GitHub Pages Configuration

### Repository Settings

To enable GitHub Pages for this repository:

1. Go to **Settings** → **Pages**
2. Under **Source**, select:
   - Source: **GitHub Actions**
3. The site will be published to: `https://clerk.github.io/clerk-sdk-flutter/`

### Custom Domain (Optional)

To use a custom domain:

1. Add a `CNAME` file to `docs/` with your domain
2. Configure DNS settings with your domain provider
3. Update `baseurl` in `docs/_config.yml`

---

## 🐛 Troubleshooting

### Build Failures

If the build fails:

1. Check the [Actions tab](https://github.com/clerk/clerk-sdk-flutter/actions) for error logs
2. Common issues:
   - **Jekyll build errors**: Check Markdown syntax and front matter
   - **Missing dependencies**: Ensure `Gemfile` is up to date
   - **Configuration errors**: Verify `_config.yml` syntax

### Local Testing

Always test locally before pushing:

```bash
cd docs
bundle exec jekyll serve
```

Visit http://localhost:4000/clerk-sdk-flutter to preview.

### Common Errors

**Error: "Could not find gem"**
```bash
cd docs
bundle install
```

**Error: "Permission denied"**
- Check repository permissions
- Ensure GitHub Actions has write access to Pages

**Error: "404 Not Found" after deployment**
- Verify `baseurl` in `_config.yml` is set to `/clerk-sdk-flutter`
- Check that files are in the `docs/` directory
- Ensure GitHub Pages is enabled in repository settings

---

## 📝 Deployment Checklist

Before deploying major changes:

- [ ] Test locally with `bundle exec jekyll serve`
- [ ] Verify all links work
- [ ] Check code examples are correct
- [ ] Review for typos and formatting
- [ ] Ensure front matter is correct on all pages
- [ ] Test responsive design (mobile/desktop)
- [ ] Verify navigation hierarchy
- [ ] Check that search works (if enabled)

---

## 🔄 Rollback

If you need to rollback a deployment:

1. Go to the [Actions tab](https://github.com/clerk/clerk-sdk-flutter/actions)
2. Find the last successful deployment
3. Click "Re-run all jobs"

Or revert the commit:

```bash
git revert <commit-hash>
git push origin main
```

---

## 📊 Monitoring

### Analytics

To add Google Analytics:

1. Add your tracking ID to `docs/_config.yml`:
   ```yaml
   google_analytics: UA-XXXXXXXXX-X
   ```

2. The Just the Docs theme will automatically include the tracking code

### Performance

Monitor site performance:
- Use [Google PageSpeed Insights](https://pagespeed.web.dev/)
- Check [Lighthouse](https://developers.google.com/web/tools/lighthouse) scores
- Monitor build times in GitHub Actions

---

## 🔐 Security

### Permissions

The workflow requires these permissions:
- `contents: read` - Read repository contents
- `pages: write` - Write to GitHub Pages
- `id-token: write` - Generate deployment token

These are configured in `.github/workflows/deploy-docs.yml`.

### Secrets

No secrets are required for basic deployment. If you add custom features that need secrets:

1. Go to **Settings** → **Secrets and variables** → **Actions**
2. Add your secrets
3. Reference them in the workflow with `${{ secrets.SECRET_NAME }}`

---

## 📚 Additional Resources

- [Jekyll Documentation](https://jekyllrb.com/docs/)
- [Just the Docs Theme](https://just-the-docs.github.io/just-the-docs/)
- [GitHub Pages Documentation](https://docs.github.com/en/pages)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)

---

## 🆘 Support

If you encounter issues with deployment:

- 💬 [Join our Discord](https://clerk.com/discord)
- 🐛 [Open an issue](https://github.com/clerk/clerk-sdk-flutter/issues)
- 📧 Email: support@clerk.com


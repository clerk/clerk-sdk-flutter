# Clerk Dart & Flutter SDK Documentation

This directory contains the documentation site for Clerk's Dart and Flutter SDKs, built with Jekyll and hosted on GitHub Pages.

## 🌐 Live Documentation

Visit the live documentation at: **https://clerk.github.io/clerk-sdk-flutter/**

## 📁 Structure

```
docs/
├── _config.yml              # Jekyll configuration
├── index.md                 # Homepage
├── getting-started.md       # Getting started overview
├── getting-started/         # Quickstart guides
│   ├── quickstart-dart.md
│   └── quickstart-flutter.md
├── guides/                  # Comprehensive guides
│   ├── authentication.md
│   ├── user-management.md
│   ├── customization.md
│   └── ...
├── packages/                # Package-specific documentation
│   ├── clerk-auth.md
│   └── clerk-flutter.md
└── assets/                  # Images and static assets
```

## 🚀 Local Development

### Prerequisites

- Ruby >= 3.1
- Bundler

### Setup

1. Install dependencies:

```bash
cd docs
bundle install
```

2. Run the local server:

```bash
bundle exec jekyll serve
```

3. Open http://localhost:4000/clerk-sdk-flutter in your browser

{: .note }
> The site uses the local `just-the-docs` gem for development and `remote_theme` for GitHub Pages deployment. This is configured automatically via `_config.yml` and `_config_production.yml`.

### Live Reload

The server will automatically reload when you make changes to the documentation files.

## 📝 Writing Documentation

### Adding a New Page

1. Create a new Markdown file in the appropriate directory
2. Add front matter at the top:

```yaml
---
layout: default
title: Your Page Title
parent: Parent Page (optional)
nav_order: 1
---
```

3. Write your content in Markdown

### Front Matter Options

| Option | Description |
|--------|-------------|
| `layout` | Page layout (usually `default`) |
| `title` | Page title |
| `parent` | Parent page for navigation hierarchy |
| `nav_order` | Order in navigation menu |
| `has_children` | Set to `true` if page has child pages |
| `permalink` | Custom URL path |

### Markdown Features

The documentation supports:

- Standard Markdown syntax
- Code blocks with syntax highlighting
- Tables
- Callouts (notes, warnings, etc.)
- Table of contents

#### Code Blocks

````markdown
```dart
import 'package:clerk_flutter/clerk_flutter.dart';

void main() {
  runApp(MyApp());
}
```
````

#### Callouts

```markdown
{: .note }
> This is a note callout

{: .warning }
> This is a warning callout
```

## 🎨 Theme

The documentation uses the [Just the Docs](https://just-the-docs.github.io/just-the-docs/) theme with custom Clerk branding.

## 🚢 Deployment

The documentation is automatically deployed to GitHub Pages when changes are pushed to the `main` branch.

### GitHub Actions Workflow

The deployment is handled by `.github/workflows/deploy-docs.yml`:

1. Triggered on push to `main` branch (when `docs/**` files change)
2. Builds the Jekyll site
3. Deploys to GitHub Pages

### Manual Deployment

You can also trigger a manual deployment:

1. Go to the [Actions tab](https://github.com/clerk/clerk-sdk-flutter/actions)
2. Select "Deploy Documentation to GitHub Pages"
3. Click "Run workflow"

## 📦 Dependencies

- **Jekyll** - Static site generator
- **just-the-docs** - Documentation theme
- **jekyll-seo-tag** - SEO optimization
- **jekyll-github-metadata** - GitHub integration

## 🤝 Contributing

To contribute to the documentation:

1. Fork the [repository](https://github.com/clerk/clerk-sdk-flutter)
2. Create a new branch for your changes
3. Make your edits in the `docs/` directory
4. Test locally with `bundle exec jekyll serve`
5. Submit a pull request

## 📄 License

This documentation is part of the Clerk Dart & Flutter SDK and is licensed under the MIT License.


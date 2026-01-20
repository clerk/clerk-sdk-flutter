# Contributing to Clerk Dart & Flutter Documentation

Thank you for your interest in contributing to the Clerk Dart & Flutter SDK documentation! This guide will help you get started.

## 📋 Table of Contents

- [Getting Started](#getting-started)
- [Documentation Structure](#documentation-structure)
- [Writing Guidelines](#writing-guidelines)
- [Local Development](#local-development)
- [Submitting Changes](#submitting-changes)

---

## Getting Started

### Prerequisites

- Ruby >= 3.1
- Bundler
- Git

### Setup

1. Fork the repository
2. Clone your fork:
   ```bash
   git clone https://github.com/YOUR_USERNAME/clerk-sdk-flutter.git
   cd clerk-sdk-flutter/docs
   ```

3. Install dependencies:
   ```bash
   bundle install
   ```

4. Start the local server:
   ```bash
   bundle exec jekyll serve
   ```

5. Open http://localhost:4000/clerk-sdk-flutter in your browser

---

## Documentation Structure

```
docs/
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
├── packages/                # Package-specific docs
│   ├── clerk-auth.md
│   └── clerk-flutter.md
├── api/                     # API reference
│   └── widgets.md
└── assets/                  # Images and static files
```

---

## Writing Guidelines

### Front Matter

Every page must include front matter at the top:

```yaml
---
layout: default
title: Your Page Title
parent: Parent Page (optional)
nav_order: 1
---
```

### Front Matter Options

| Option | Description | Required |
|--------|-------------|----------|
| `layout` | Page layout (usually `default`) | Yes |
| `title` | Page title shown in navigation | Yes |
| `parent` | Parent page for hierarchy | No |
| `nav_order` | Order in navigation menu | No |
| `has_children` | Set to `true` if page has children | No |
| `permalink` | Custom URL path | No |

### Markdown Style

#### Headings

Use ATX-style headings with proper hierarchy:

```markdown
# Page Title (H1 - only one per page)

## Section (H2)

### Subsection (H3)

#### Detail (H4)
```

#### Code Blocks

Always specify the language for syntax highlighting:

````markdown
```dart
import 'package:clerk_flutter/clerk_flutter.dart';

void main() {
  runApp(MyApp());
}
```
````

Supported languages: `dart`, `yaml`, `bash`, `json`, `xml`, `swift`, `kotlin`

#### Tables

Use tables for structured information:

```markdown
| Column 1 | Column 2 | Column 3 |
|----------|----------|----------|
| Value 1  | Value 2  | Value 3  |
```

#### Callouts

Use callouts for important information:

```markdown
{: .note }
> This is a note callout

{: .warning }
> This is a warning callout

{: .tip }
> This is a tip callout
```

#### Links

- **Internal links:** Use relative paths: `[Link Text](/guides/authentication)`
- **External links:** Use full URLs: `[Clerk Docs](https://clerk.com/docs)`
- **API references:** Link to pub.dev for detailed API docs

### Content Guidelines

1. **Be Clear and Concise**
   - Use simple, direct language
   - Avoid jargon when possible
   - Explain technical terms when first used

2. **Provide Examples**
   - Include code examples for all features
   - Show complete, working code when possible
   - Add comments to explain complex code

3. **Be Consistent**
   - Use consistent terminology throughout
   - Follow the existing documentation style
   - Use the same code formatting conventions

4. **Keep It Updated**
   - Ensure code examples work with the latest SDK version
   - Update version numbers when they change
   - Remove deprecated features

5. **Think About the User**
   - Start with the most common use cases
   - Provide step-by-step instructions
   - Include troubleshooting tips

---

## Local Development

### Running the Site Locally

```bash
cd docs
bundle exec jekyll serve
```

The site will be available at http://localhost:4000/clerk-sdk-flutter

### Live Reload

Jekyll automatically reloads when you save changes to Markdown files. Refresh your browser to see updates.

### Building for Production

```bash
bundle exec jekyll build
```

The built site will be in `docs/_site/`.

---

## Submitting Changes

### Before Submitting

1. **Test Locally**
   - Run the site locally and verify your changes
   - Check all links work correctly
   - Ensure code examples are correct

2. **Check Formatting**
   - Use proper Markdown syntax
   - Include required front matter
   - Follow the style guidelines

3. **Review Content**
   - Proofread for typos and grammar
   - Ensure technical accuracy
   - Verify code examples work

### Pull Request Process

1. Create a new branch:
   ```bash
   git checkout -b docs/your-feature-name
   ```

2. Make your changes and commit:
   ```bash
   git add .
   git commit -m "docs: Add guide for X feature"
   ```

3. Push to your fork:
   ```bash
   git push origin docs/your-feature-name
   ```

4. Open a Pull Request on GitHub

5. Fill out the PR template with:
   - Description of changes
   - Screenshots (if applicable)
   - Related issues

### Commit Message Format

Use conventional commits:

- `docs: Add new guide for authentication`
- `docs: Update Flutter quickstart`
- `docs: Fix typo in user management guide`
- `docs: Improve code examples in customization`

---

## Questions?

If you have questions about contributing to the documentation:

- 💬 [Join our Discord](https://clerk.com/discord)
- 🐛 [Open an issue](https://github.com/clerk/clerk-sdk-flutter/issues)
- 📧 Email: support@clerk.com

---

Thank you for contributing to Clerk's documentation! 🎉


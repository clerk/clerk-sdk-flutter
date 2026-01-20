---
layout: default
title: Getting Started
nav_order: 2
has_children: true
permalink: /getting-started
---

# Getting Started with Clerk Dart & Flutter SDKs

This guide will help you integrate Clerk authentication into your Dart or Flutter application.

## Choose Your SDK

Clerk provides two SDKs for Dart and Flutter development:

### clerk_auth (Dart SDK)

The `clerk_auth` package is a pure Dart SDK suitable for:
- Backend applications
- CLI tools
- Server-side Dart applications
- Any Dart environment where you need authentication

**[Get started with clerk_auth →]({{ '/getting-started/quickstart-dart' | relative_url }})**

### clerk_flutter (Flutter SDK)

The `clerk_flutter` package is designed for Flutter applications and includes:
- Pre-built UI components
- Material Design integration
- Cross-platform support (iOS, Android, Web, Desktop)
- Seamless integration with Flutter's widget tree

**[Get started with clerk_flutter →]({{ '/getting-started/quickstart-flutter' | relative_url }})**

---

## Prerequisites

Before you begin, you'll need:

1. **A Clerk Account** - [Sign up for free](https://dashboard.clerk.com/sign-up)
2. **A Clerk Application** - Create one in the [Clerk Dashboard](https://dashboard.clerk.com)
3. **Your Publishable Key** - Found in your application's API Keys section

### Finding Your Publishable Key

1. Navigate to the [Clerk Dashboard](https://dashboard.clerk.com)
2. Select your application
3. Go to **API Keys** in the sidebar
4. Copy your **Publishable Key** (starts with `pk_test_` or `pk_live_`)

{: .warning }
> Never commit your secret keys to version control. Use environment variables or secure configuration management.

---

## Installation

### For Dart Projects (clerk_auth)

Add `clerk_auth` to your `pubspec.yaml`:

```yaml
dependencies:
  clerk_auth: ^0.0.13-beta
```

Then run:

```bash
dart pub get
```

### For Flutter Projects (clerk_flutter)

Add `clerk_flutter` to your `pubspec.yaml`:

```yaml
dependencies:
  clerk_flutter: ^0.0.13-beta
```

Then run:

```bash
flutter pub get
```

{: .note }
> The `clerk_flutter` package automatically includes `clerk_auth` as a dependency, so you don't need to add both.

---

## Platform-Specific Setup

### Android

Add the following permission to your `android/app/src/main/AndroidManifest.xml`:

```xml
<uses-permission android:name="android.permission.INTERNET" />
```

### iOS

No additional setup required for basic functionality.

### Web

No additional setup required for basic functionality.

### Desktop (Windows, macOS, Linux)

No additional setup required for basic functionality.

---

## Next Steps

Choose your quickstart guide based on your project type:

- **[Dart Quickstart]({{ '/getting-started/quickstart-dart' | relative_url }})** - For pure Dart applications
- **[Flutter Quickstart]({{ '/getting-started/quickstart-flutter' | relative_url }})** - For Flutter applications

Or explore specific topics:

- [Authentication Flows]({{ '/guides/authentication' | relative_url }})
- [User Management]({{ '/guides/user-management' | relative_url }})
- [Organizations]({{ '/guides/organizations' | relative_url }})
- [Customization]({{ '/guides/customization' | relative_url }})


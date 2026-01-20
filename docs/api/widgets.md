---
layout: default
title: Widget Reference
parent: API Reference
nav_order: 1
---

# Widget Reference
{: .no_toc }

Complete reference for all Clerk Flutter widgets.
{: .fs-6 .fw-300 }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Control Widgets

### ClerkAuth

The root widget that initializes and provides Clerk authentication to your app.

```dart
ClerkAuth(
  config: ClerkAuthConfig(
    publishableKey: 'pk_test_xxxxxxxxxxxxx',
  ),
  child: MaterialApp(/* ... */),
)
```

**Properties:**

| Name | Type | Required | Description |
|------|------|----------|-------------|
| `config` | `ClerkAuthConfig` | Yes | Configuration object |
| `child` | `Widget` | Yes | Your app widget |
| `persistor` | `Persistor?` | No | Custom storage mechanism |
| `httpService` | `HttpService?` | No | Custom HTTP service |
| `authState` | `ClerkAuthState?` | No | Pre-initialized auth state |

---

### ClerkAuthBuilder

Builds different UI based on authentication state.

```dart
ClerkAuthBuilder(
  signedInBuilder: (context, authState) => SignedInWidget(),
  signedOutBuilder: (context, authState) => SignedOutWidget(),
)
```

**Properties:**

| Name | Type | Required | Description |
|------|------|----------|-------------|
| `signedInBuilder` | `AuthWidgetBuilder?` | No | Builder when user is signed in |
| `signedOutBuilder` | `AuthWidgetBuilder?` | No | Builder when user is signed out |
| `builder` | `AuthWidgetBuilder?` | No | Fallback builder |

---

### ClerkSignedIn

Only renders its child when a user is signed in.

```dart
ClerkSignedIn(
  child: Text('Protected content'),
)
```

**Properties:**

| Name | Type | Required | Description |
|------|------|----------|-------------|
| `child` | `Widget` | Yes | Widget to show when signed in |

---

### ClerkSignedOut

Only renders its child when no user is signed in.

```dart
ClerkSignedOut(
  child: Text('Please sign in'),
)
```

**Properties:**

| Name | Type | Required | Description |
|------|------|----------|-------------|
| `child` | `Widget` | Yes | Widget to show when signed out |

---

### ClerkErrorListener

Listens for authentication errors and displays them.

```dart
ClerkErrorListener(
  child: YourWidget(),
)
```

**Properties:**

| Name | Type | Required | Description |
|------|------|----------|-------------|
| `child` | `Widget` | Yes | Child widget |

---

## Authentication Widgets

### ClerkAuthentication

Pre-built authentication UI with sign-in and sign-up flows.

```dart
const ClerkAuthentication()
```

**Features:**
- Email/password authentication
- OAuth provider buttons
- Email verification
- Password reset
- Automatic error handling
- Responsive design

---

## User Widgets

### ClerkUserButton

User menu button with profile and sign-out options.

```dart
ClerkUserButton(
  showName: true,
  sessionActions: [
    ClerkUserAction(
      label: 'Settings',
      icon: Icons.settings,
      onPressed: (context, authState) {
        // Handle action
      },
    ),
  ],
)
```

**Properties:**

| Name | Type | Required | Default | Description |
|------|------|----------|---------|-------------|
| `showName` | `bool` | No | `true` | Show user's name next to avatar |
| `sessionActions` | `List<ClerkUserAction>?` | No | `null` | Custom actions for session row |
| `additionalActions` | `List<ClerkUserAction>?` | No | `null` | Additional menu items |

---

### ClerkUserAction

Defines a custom action for the user menu.

```dart
ClerkUserAction(
  label: 'Settings',
  icon: Icons.settings,
  onPressed: (context, authState) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => SettingsPage()),
    );
  },
)
```

**Properties:**

| Name | Type | Required | Description |
|------|------|----------|-------------|
| `label` | `String` | Yes | Action label text |
| `icon` | `IconData` | Yes | Action icon |
| `onPressed` | `Function(BuildContext, ClerkAuthState)` | Yes | Callback when pressed |

---

## Organization Widgets

### ClerkOrganizationList

Display and manage organizations (if enabled in your Clerk instance).

```dart
const ClerkOrganizationList()
```

**Features:**
- List all user's organizations
- Create new organizations
- Switch active organization
- Manage organization settings

---

## Accessing ClerkAuth

### ClerkAuth.of()

Access the ClerkAuthState from anywhere in your widget tree.

```dart
final authState = ClerkAuth.of(context);
final user = authState.user;
```

**Parameters:**

| Name | Type | Required | Default | Description |
|------|------|----------|---------|-------------|
| `context` | `BuildContext` | Yes | - | Build context |
| `listen` | `bool` | No | `true` | Whether to rebuild on changes |

**Returns:** `ClerkAuthState`

---

## ClerkAuthState

The main state object for Clerk authentication.

### Properties

| Name | Type | Description |
|------|------|-------------|
| `user` | `User?` | Current signed-in user |
| `client` | `Client` | Client object with sessions |
| `env` | `Environment` | Environment configuration |
| `isSignedIn` | `bool` | Whether a user is signed in |
| `sessionTokenStream` | `Stream<String?>` | Stream of session tokens |

### Methods

| Method | Description |
|--------|-------------|
| `attemptSignIn()` | Start a sign-in attempt |
| `attemptSignUp()` | Start a sign-up attempt |
| `attemptSignInVerification()` | Verify a sign-in attempt |
| `attemptSignUpVerification()` | Verify a sign-up attempt |
| `signOut()` | Sign out the current user |
| `signOutOf(Session)` | Sign out of a specific session |
| `safelyCall()` | Execute async operation with error handling |

---

## Configuration

### ClerkAuthConfig

Configuration object for ClerkAuth.

```dart
ClerkAuthConfig(
  publishableKey: 'pk_test_xxxxxxxxxxxxx',
  redirectionGenerator: (url) => Uri.parse('myapp://oauth'),
  deepLinkStream: AppLinks().allUriLinkStream.map(
    (uri) => ClerkDeepLink(uri: uri),
  ),
  loading: CircularProgressIndicator(),
)
```

**Properties:**

| Name | Type | Required | Description |
|------|------|----------|-------------|
| `publishableKey` | `String` | Yes | Your Clerk publishable key |
| `redirectionGenerator` | `Function(String)?` | No | Generate OAuth redirect URLs |
| `deepLinkStream` | `Stream<ClerkDeepLink>?` | No | Handle OAuth callbacks |
| `loading` | `Widget?` | No | Widget shown during initialization |

---

## Next Steps

- [Customization Guide]({{ '/guides/customization' | relative_url }}) - Theme and style your widgets
- [Flutter Quickstart]({{ '/getting-started/quickstart-flutter' | relative_url }}) - Get started quickly
- [Authentication Flows]({{ '/guides/authentication' | relative_url }}) - Implement auth flows
- [User Management]({{ '/guides/user-management' | relative_url }}) - Manage user profiles


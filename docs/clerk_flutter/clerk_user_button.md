# ClerkUserButton Widget Documentation

The `ClerkUserButton` widget renders a user profile button with multi-session management, profile access, and sign-out functionality.

## Overview

`ClerkUserButton` displays the current user's avatar and provides access to:
- User profile management
- Multi-session switching
- Organization management
- Sign-out functionality
- Custom actions

## Class Definition

```dart
class ClerkUserButton extends StatefulWidget {
  const ClerkUserButton({
    super.key,
    this.showName = true,
    this.sessionActions,
    this.additionalActions,
  });
}
```

---

## Parameters

### `showName`

**Type:** `bool`  
**Default:** `true`

Whether to display the user's name next to the avatar.

**Example:**
```dart
ClerkUserButton(showName: false) // Avatar only
```

---

### `sessionActions`

**Type:** `List<ClerkUserAction>?`

Custom actions to display for each session. If null, uses default actions (Profile, Sign Out, Organizations).

**Example:**
```dart
ClerkUserButton(
  sessionActions: [
    ClerkUserAction(
      icon: Icons.settings,
      label: 'Settings',
      callback: (context, authState) {
        Navigator.pushNamed(context, '/settings');
      },
    ),
  ],
)
```

---

### `additionalActions`

**Type:** `List<ClerkUserAction>?`

Additional actions to display in the user panel. If null, uses default action (Add Account).

**Example:**
```dart
ClerkUserButton(
  additionalActions: [
    ClerkUserAction(
      icon: Icons.help,
      label: 'Help',
      callback: (context, authState) {
        // Show help
      },
    ),
  ],
)
```

---

## ClerkUserAction

```dart
class ClerkUserAction {
  ClerkUserAction({
    this.icon,
    this.asset,
    required this.label,
    required this.callback,
  });
  
  final IconData? icon;
  final String? asset;
  final String label;
  final Future<void> Function(BuildContext, ClerkAuthState) callback;
}
```

---

## Complete Examples

### Basic Usage

```dart
class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('My App'),
      actions: const [
        ClerkUserButton(),
      ],
    );
  }
}
```

### Avatar Only

```dart
AppBar(
  actions: const [
    ClerkUserButton(showName: false),
  ],
)
```

### Custom Session Actions

```dart
ClerkUserButton(
  sessionActions: [
    ClerkUserAction(
      icon: Icons.person,
      label: 'Profile',
      callback: (context, authState) async {
        Navigator.pushNamed(context, '/profile');
      },
    ),
    ClerkUserAction(
      icon: Icons.settings,
      label: 'Settings',
      callback: (context, authState) async {
        Navigator.pushNamed(context, '/settings');
      },
    ),
    ClerkUserAction(
      icon: Icons.logout,
      label: 'Sign Out',
      callback: (context, authState) async {
        await authState.signOut();
      },
    ),
  ],
)
```

### With Additional Actions

```dart
ClerkUserButton(
  additionalActions: [
    ClerkUserAction(
      icon: Icons.add,
      label: 'Add Account',
      callback: (context, authState) async {
        // Add account logic
      },
    ),
    ClerkUserAction(
      icon: Icons.help,
      label: 'Help & Support',
      callback: (context, authState) async {
        Navigator.pushNamed(context, '/help');
      },
    ),
  ],
)
```

### In Drawer

```dart
class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: ClerkSignedIn(
              child: const ClerkUserButton(),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () => Navigator.pop(context),
          ),
          // ... more items
        ],
      ),
    );
  }
}
```

---

## Features

### Multi-Session Support

When multiple sessions exist, the button displays all sessions and allows switching between them:

```dart
// Users can:
// 1. See all active sessions
// 2. Click to switch between sessions
// 3. Sign out of individual sessions
// 4. Add new accounts
```

### Profile Management

Clicking the profile action opens the user profile panel where users can:
- Edit name and username
- Manage email addresses
- Manage phone numbers
- Add/remove passkeys
- Connect/disconnect OAuth accounts
- Update profile image

### Organization Management

If organizations are enabled, users can:
- View their organizations
- Switch active organization
- Create new organizations
- Accept invitations

---

## Default Actions

### Session Actions (default)

1. **Profile** - Opens user profile panel
2. **Sign Out** - Signs out of the current session
3. **Organizations** - Opens organization list (if enabled)

### Additional Actions (default)

1. **Add Account** - Adds a new account (if multi-session enabled)

---

## Best Practices

1. **Use in signed-in areas**: Only show when user is signed in
2. **Place in AppBar**: Common pattern is to place in AppBar actions
3. **Customize for your app**: Add custom actions relevant to your app
4. **Test multi-session**: Test with multiple accounts if multi-session is enabled
5. **Consider mobile**: The button adapts to mobile screens

---

## Common Patterns

### Conditional Display

```dart
AppBar(
  actions: [
    ClerkSignedIn(
      child: const ClerkUserButton(),
    ),
    ClerkSignedOut(
      child: TextButton(
        onPressed: () => Navigator.pushNamed(context, '/login'),
        child: const Text('Sign In'),
      ),
    ),
  ],
)
```

### With Navigation

```dart
ClerkUserButton(
  sessionActions: [
    ClerkUserAction(
      icon: Icons.dashboard,
      label: 'Dashboard',
      callback: (context, authState) async {
        Navigator.pushNamed(context, '/dashboard');
      },
    ),
    ClerkUserAction(
      icon: Icons.person,
      label: 'Profile',
      callback: (context, authState) async {
        Navigator.pushNamed(context, '/profile');
      },
    ),
    ClerkUserAction(
      icon: Icons.logout,
      label: 'Sign Out',
      callback: (context, authState) async {
        await authState.signOut();
        Navigator.pushReplacementNamed(context, '/');
      },
    ),
  ],
)
```

---

## Related Documentation

- [ClerkAuth](clerk_auth.md)
- [ClerkSignedIn](clerk_signed_in.md)
- [ClerkOrganizationList](clerk_organization_list.md)

---

*Generated for clerk_flutter version 0.0.14-beta*


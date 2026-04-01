# ClerkOrganizationList Widget Documentation

The `ClerkOrganizationList` widget renders a list of the user's organizations with management capabilities.

## Overview

`ClerkOrganizationList` displays:
- All organizations the user belongs to
- Organization invitations
- Ability to switch active organization
- Ability to create new organizations
- Ability to manage organization settings

## Class Definition

```dart
class ClerkOrganizationList extends StatefulWidget {
  const ClerkOrganizationList({
    super.key,
    this.actions,
  });
}
```

---

## Parameters

### `actions`

**Type:** `List<ClerkUserAction>?`

Custom actions to display in the organization list. If null, uses default actions (Create Organization).

**Example:**
```dart
ClerkOrganizationList(
  actions: [
    ClerkUserAction(
      icon: Icons.add,
      label: 'Create Organization',
      callback: (context, authState) async {
        // Custom create logic
      },
    ),
  ],
)
```

---

## Complete Examples

### Basic Usage

```dart
class OrganizationsPage extends StatelessWidget {
  const OrganizationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Organizations'),
      ),
      body: const ClerkOrganizationList(),
    );
  }
}
```

### In a Dialog

```dart
void showOrganizationList(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 500, maxHeight: 600),
        child: const ClerkOrganizationList(),
      ),
    ),
  );
}
```

### With Custom Actions

```dart
ClerkOrganizationList(
  actions: [
    ClerkUserAction(
      icon: Icons.add,
      label: 'Create Organization',
      callback: (context, authState) async {
        // Show custom create dialog
        showDialog(
          context: context,
          builder: (context) => const CreateOrgDialog(),
        );
      },
    ),
    ClerkUserAction(
      icon: Icons.help,
      label: 'Help',
      callback: (context, authState) async {
        // Show help
      },
    ),
  ],
)
```

### Conditional Display

```dart
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = ClerkAuth.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          if (authState.env.organization.isEnabled)
            IconButton(
              icon: const Icon(Icons.business),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Scaffold(
                      body: ClerkOrganizationList(),
                    ),
                  ),
                );
              },
            ),
        ],
      ),
      body: const Center(child: Text('Content')),
    );
  }
}
```

---

## Features

### Organization List

- Displays all organizations the user is a member of
- Shows current active organization
- Allows switching between organizations
- Shows organization role (admin, member, etc.)

### Invitations

- Displays pending organization invitations
- Allows accepting invitations
- Shows invitation details (organization name, role)

### Organization Creation

- Create new organizations (if enabled)
- Set organization name and slug
- Upload organization logo

### Organization Management

- Access organization settings
- Manage members
- Manage domains
- Leave organization

---

## Default Actions

1. **Create Organization** - Opens create organization panel (if user has permission)

---

## Best Practices

1. **Check if enabled**: Verify organizations are enabled before showing
2. **Handle permissions**: Check if user can create organizations
3. **Provide navigation**: Make it easy to access from your app
4. **Test invitations**: Test accepting and declining invitations
5. **Consider mobile**: The widget adapts to mobile screens

---

## Common Patterns

### In Navigation Drawer

```dart
class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = ClerkAuth.of(context);
    
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            child: Text('Menu'),
          ),
          if (authState.env.organization.isEnabled)
            ListTile(
              leading: const Icon(Icons.business),
              title: const Text('Organizations'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Scaffold(
                      appBar: AppBar(title: Text('Organizations')),
                      body: ClerkOrganizationList(),
                    ),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}
```

### With Current Organization Display

```dart
class OrganizationHeader extends StatelessWidget {
  const OrganizationHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = ClerkAuth.of(context);
    final org = authState.organization;
    
    return ListTile(
      leading: const Icon(Icons.business),
      title: Text(org?.name ?? 'No Organization'),
      subtitle: const Text('Tap to switch'),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Scaffold(
              body: ClerkOrganizationList(),
            ),
          ),
        );
      },
    );
  }
}
```

---

## Checking Organization Support

```dart
final authState = ClerkAuth.of(context);

// Check if organizations are enabled
if (authState.env.organization.isEnabled) {
  // Show organization features
}

// Check if user can create organizations
if (authState.user?.createOrganizationEnabled == true) {
  // Show create button
}

// Get current organization
final currentOrg = authState.organization;
```

---

## Related Documentation

- [ClerkAuth](clerk_auth.md)
- [ClerkUserButton](clerk_user_button.md)
- [Auth - Organization Management](../clerk_auth/auth.md#organization-management)

---

*Generated for clerk_flutter version 0.0.14-beta*


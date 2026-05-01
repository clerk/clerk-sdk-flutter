# ClerkSignedIn Widget Documentation

The `ClerkSignedIn` widget conditionally renders its child only when a user is signed in.

## Overview

`ClerkSignedIn` is a simple conditional widget that shows its child when `authState.user` is not null. It automatically rebuilds when authentication state changes.

## Class Definition

```dart
class ClerkSignedIn extends StatefulWidget {
  const ClerkSignedIn({
    super.key,
    required this.child,
  });
}
```

---

## Parameters

### `child`

**Type:** `Widget` (required)

The widget to display when a user is signed in.

**Example:**
```dart
ClerkSignedIn(
  child: Text('You are signed in!'),
)
```

---

## Behavior

- **When signed in** (user is not null): Renders the `child` widget
- **When signed out** (user is null): Renders an empty widget (nothing)

---

## Complete Examples

### Basic Usage

```dart
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Column(
        children: [
          ClerkSignedIn(
            child: Text('Welcome back!'),
          ),
          ClerkSignedOut(
            child: Text('Please sign in'),
          ),
        ],
      ),
    );
  }
}
```

### Protected Content

```dart
class ProtectedPage extends StatelessWidget {
  const ProtectedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Protected Page'),
      ),
      body: ClerkSignedIn(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('This is protected content'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final authState = ClerkAuth.of(context, listen: false);
                  authState.signOut();
                },
                child: const Text('Sign Out'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

### Conditional AppBar Actions

```dart
class MyScaffold extends StatelessWidget {
  const MyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'),
        actions: [
          ClerkSignedIn(
            child: const ClerkUserButton(),
          ),
        ],
      ),
      body: const Center(child: Text('Content')),
    );
  }
}
```

### Navigation Drawer

```dart
class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            child: Text('Menu'),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () => Navigator.pop(context),
          ),
          ClerkSignedIn(
            child: ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/profile');
              },
            ),
          ),
          ClerkSignedIn(
            child: ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/settings');
              },
            ),
          ),
        ],
      ),
    );
  }
}
```

### With User Data

```dart
class UserGreeting extends StatelessWidget {
  const UserGreeting({super.key});

  @override
  Widget build(BuildContext context) {
    return ClerkSignedIn(
      child: Builder(
        builder: (context) {
          final user = ClerkAuth.userOf(context);
          return Text('Hello, ${user?.firstName ?? "User"}!');
        },
      ),
    );
  }
}
```

---

## Best Practices

1. **Use with ClerkSignedOut**: Pair with `ClerkSignedOut` to cover both states
2. **Keep it simple**: Use for simple conditional rendering; use `ClerkAuthBuilder` for complex logic
3. **Avoid nesting**: Don't nest multiple `ClerkSignedIn` widgets unnecessarily
4. **Consider loading state**: This widget doesn't handle loading state; use `ClerkAuthBuilder` if needed

---

## Comparison with ClerkAuthBuilder

**Use ClerkSignedIn when:**
- You only need to show/hide content based on sign-in state
- You want simple, declarative code
- You're building a list of conditional widgets

**Use ClerkAuthBuilder when:**
- You need access to the full `authState`
- You want to handle both signed-in and signed-out states differently
- You need to handle loading or other intermediate states

---

## Related Documentation

- [ClerkSignedOut](clerk_signed_out.md)
- [ClerkAuthBuilder](clerk_auth_builder.md)
- [ClerkAuth](clerk_auth.md)

---

*Generated for clerk_flutter version 0.0.14-beta*


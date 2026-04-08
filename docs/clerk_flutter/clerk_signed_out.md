# ClerkSignedOut Widget Documentation

The `ClerkSignedOut` widget conditionally renders its child only when no user is signed in.

## Overview

`ClerkSignedOut` is the complement to `ClerkSignedIn`. It shows its child when `authState.user` is null and automatically rebuilds when authentication state changes.

## Class Definition

```dart
class ClerkSignedOut extends StatefulWidget {
  const ClerkSignedOut({
    super.key,
    required this.child,
  });
}
```

---

## Parameters

### `child`

**Type:** `Widget` (required)

The widget to display when no user is signed in.

**Example:**
```dart
ClerkSignedOut(
  child: Text('Please sign in'),
)
```

---

## Behavior

- **When signed out** (user is null): Renders the `child` widget
- **When signed in** (user is not null): Renders an empty widget (nothing)

---

## Complete Examples

### Basic Usage

```dart
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClerkSignedOut(
              child: const ClerkAuthentication(),
            ),
            ClerkSignedIn(
              child: const Text('You are signed in!'),
            ),
          ],
        ),
      ),
    );
  }
}
```

### Login Page

```dart
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ClerkSignedOut(
        child: const Center(
          child: ClerkAuthentication(),
        ),
      ),
    );
  }
}
```

### Conditional Navigation

```dart
class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClerkSignedOut(
          child: ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/login'),
            child: const Text('Sign In'),
          ),
        ),
        ClerkSignedIn(
          child: ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/dashboard'),
            child: const Text('Go to Dashboard'),
          ),
        ),
      ],
    );
  }
}
```

### AppBar Actions

```dart
class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('My App'),
      actions: [
        ClerkSignedOut(
          child: TextButton(
            onPressed: () => Navigator.pushNamed(context, '/login'),
            child: const Text('Sign In'),
          ),
        ),
        ClerkSignedIn(
          child: const ClerkUserButton(),
        ),
      ],
    );
  }
}
```

---

## Best Practices

1. **Use with ClerkSignedIn**: Pair with `ClerkSignedIn` to cover both states
2. **Show authentication UI**: Commonly used to display `ClerkAuthentication` widget
3. **Keep it simple**: Use for simple conditional rendering
4. **Consider user experience**: Provide clear calls-to-action for signing in

---

## Related Documentation

- [ClerkSignedIn](clerk_signed_in.md)
- [ClerkAuthBuilder](clerk_auth_builder.md)
- [ClerkAuthentication](clerk_authentication.md)

---

*Generated for clerk_flutter version 0.0.14-beta*


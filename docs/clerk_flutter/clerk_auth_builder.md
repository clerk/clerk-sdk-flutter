# ClerkAuthBuilder Widget Documentation

The `ClerkAuthBuilder` widget provides a flexible builder pattern for rendering different UI based on authentication state.

## Overview

`ClerkAuthBuilder` allows you to specify different builders for signed-in and signed-out states, giving you fine-grained control over your UI. It automatically rebuilds when authentication state changes.

## Class Definition

```dart
class ClerkAuthBuilder extends StatefulWidget {
  const ClerkAuthBuilder({
    super.key,
    this.signedInBuilder,
    this.signedOutBuilder,
    this.builder,
  });
}
```

---

## Parameters

### `signedInBuilder`

**Type:** `AuthWidgetBuilder?` (i.e., `Widget Function(BuildContext, ClerkAuthState)`)

Builder invoked when a user is signed in (i.e., when `authState.user` is not null).

**Example:**
```dart
ClerkAuthBuilder(
  signedInBuilder: (context, authState) {
    return Text('Welcome, ${authState.user?.fullName}!');
  },
)
```

---

### `signedOutBuilder`

**Type:** `AuthWidgetBuilder?`

Builder invoked when no user is signed in (i.e., when `authState.user` is null).

**Example:**
```dart
ClerkAuthBuilder(
  signedOutBuilder: (context, authState) {
    return const Text('Please sign in');
  },
)
```

---

### `builder`

**Type:** `AuthWidgetBuilder?`

Fallback builder invoked when neither `signedInBuilder` nor `signedOutBuilder` is provided, or when they don't match the current state.

**Example:**
```dart
ClerkAuthBuilder(
  builder: (context, authState) {
    return Text('Auth state: ${authState.isSignedIn}');
  },
)
```

---

## Behavior

The widget chooses which builder to invoke based on the following logic:

1. If `signedInBuilder` is provided AND user is signed in → use `signedInBuilder`
2. Else if `signedOutBuilder` is provided AND user is signed out → use `signedOutBuilder`
3. Else if `builder` is provided → use `builder`
4. Else → return empty widget

---

## Complete Examples

### Basic Sign-In/Sign-Out UI

```dart
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ClerkAuthBuilder(
        signedInBuilder: (context, authState) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Welcome, ${authState.user?.fullName}!'),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => authState.signOut(),
                  child: const Text('Sign Out'),
                ),
              ],
            ),
          );
        },
        signedOutBuilder: (context, authState) {
          return const Center(
            child: ClerkAuthentication(),
          );
        },
      ),
    );
  }
}
```

### With Loading State

```dart
class LoadingAwareBuilder extends StatelessWidget {
  const LoadingAwareBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return ClerkAuthBuilder(
      builder: (context, authState) {
        if (authState.isNotAvailable) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        
        if (authState.isSignedIn) {
          return Text('Signed in as ${authState.user?.emailAddress}');
        }
        
        return const Text('Not signed in');
      },
    );
  }
}
```

### Accessing User Data

```dart
class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return ClerkAuthBuilder(
      signedInBuilder: (context, authState) {
        final user = authState.user!;
        
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (user.imageUrl != null)
                  CircleAvatar(
                    backgroundImage: NetworkImage(user.imageUrl!),
                    radius: 40,
                  ),
                const SizedBox(height: 16),
                Text('Name: ${user.fullName}'),
                Text('Email: ${user.emailAddress}'),
                Text('Username: ${user.username ?? "N/A"}'),
                Text('Created: ${user.createdAt}'),
              ],
            ),
          ),
        );
      },
      signedOutBuilder: (context, authState) {
        return const Card(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Text('No user profile available'),
          ),
        );
      },
    );
  }
}
```

### Nested Builders

```dart
class NestedExample extends StatelessWidget {
  const NestedExample({super.key});

  @override
  Widget build(BuildContext context) {
    return ClerkAuthBuilder(
      signedInBuilder: (context, authState) {
        return Column(
          children: [
            Text('User: ${authState.user?.fullName}'),
            // Nested builder for organization state
            if (authState.organization != null)
              Text('Org: ${authState.organization?.name}')
            else
              const Text('No active organization'),
          ],
        );
      },
      signedOutBuilder: (context, authState) {
        return const ClerkAuthentication();
      },
    );
  }
}
```

### Conditional Navigation

```dart
class ConditionalNavigation extends StatelessWidget {
  const ConditionalNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return ClerkAuthBuilder(
      signedInBuilder: (context, authState) {
        // Navigate to home when signed in
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.of(context).pushReplacementNamed('/home');
        });
        return const SizedBox.shrink();
      },
      signedOutBuilder: (context, authState) {
        // Navigate to login when signed out
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.of(context).pushReplacementNamed('/login');
        });
        return const SizedBox.shrink();
      },
    );
  }
}
```

---

## Best Practices

1. **Use specific builders**: Prefer `signedInBuilder` and `signedOutBuilder` over the generic `builder` for clarity
2. **Handle all states**: Consider what happens during loading, signing in, and signing up
3. **Avoid side effects in builders**: Don't perform navigation or state changes directly in builders (use `addPostFrameCallback` if needed)
4. **Keep builders pure**: Builders should only return widgets based on the current state
5. **Access authState parameter**: Use the provided `authState` parameter instead of calling `ClerkAuth.of(context)` again

---

## Common Patterns

### Dashboard with Sidebar

```dart
class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return ClerkAuthBuilder(
      signedInBuilder: (context, authState) {
        return Row(
          children: [
            // Sidebar
            NavigationRail(
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  label: Text('Home'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.settings),
                  label: Text('Settings'),
                ),
              ],
              selectedIndex: 0,
            ),
            // Main content
            Expanded(
              child: Center(
                child: Text('Welcome, ${authState.user?.firstName}!'),
              ),
            ),
          ],
        );
      },
      signedOutBuilder: (context, authState) {
        return const Center(
          child: ClerkAuthentication(),
        );
      },
    );
  }
}
```

---

## Related Documentation

- [ClerkAuth](clerk_auth.md)
- [ClerkSignedIn](clerk_signed_in.md)
- [ClerkSignedOut](clerk_signed_out.md)
- [ClerkAuthentication](clerk_authentication.md)

---

*Generated for clerk_flutter version 0.0.14-beta*


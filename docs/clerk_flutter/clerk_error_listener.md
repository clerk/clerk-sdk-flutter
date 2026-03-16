# ClerkErrorListener Widget Documentation

The `ClerkErrorListener` widget listens to authentication errors and displays them to the user.

## Overview

`ClerkErrorListener` subscribes to the error stream from `ClerkAuthState` and automatically displays errors as SnackBars. You can also provide a custom error handler.

## Class Definition

```dart
class ClerkErrorListener extends StatefulWidget {
  const ClerkErrorListener({
    super.key,
    this.handler,
    required this.child,
  });
}
```

---

## Parameters

### `handler`

**Type:** `ClerkErrorHandler?` (i.e., `FutureOr<void> Function(BuildContext, ClerkError)`)

Optional custom error handler. If not provided, errors are displayed as SnackBars.

**Example:**
```dart
ClerkErrorListener(
  handler: (context, error) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(error.message),
      ),
    );
  },
  child: myApp,
)
```

---

### `child`

**Type:** `Widget` (required)

The widget tree to wrap.

---

## Behavior

**Default behavior (no handler):**
- Listens to `ClerkAuth.errorStreamOf(context)`
- Displays errors as SnackBars using `ScaffoldMessenger`
- Requires a `Scaffold` or `ScaffoldMessenger` ancestor in the widget tree

**With custom handler:**
- Calls your handler function for each error
- You have full control over error display

---

## Complete Examples

### Basic Usage (Default Handler)

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: ClerkAuth.materialAppBuilder(
        config: ClerkAuthConfig(
          publishableKey: 'pk_test_...',
        ),
      ),
      home: const HomePage(),
    );
  }
}

// Note: ClerkAuth.materialAppBuilder automatically includes ClerkErrorListener
```

### Manual Setup

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return ClerkAuth(
          config: ClerkAuthConfig(
            publishableKey: 'pk_test_...',
          ),
          child: ClerkErrorListener(child: child!),
        );
      },
      home: const HomePage(),
    );
  }
}
```

### Custom Error Handler (Dialog)

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return ClerkAuth(
          config: ClerkAuthConfig(
            publishableKey: 'pk_test_...',
          ),
          child: ClerkErrorListener(
            handler: (context, error) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Authentication Error'),
                  content: Text(error.message),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            },
            child: child!,
          ),
        );
      },
      home: const HomePage(),
    );
  }
}
```

### Custom Error Handler (Toast)

```dart
import 'package:fluttertoast/fluttertoast.dart';

ClerkErrorListener(
  handler: (context, error) {
    Fluttertoast.showToast(
      msg: error.message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
  },
  child: myApp,
)
```

### Logging Errors

```dart
import 'dart:developer' as developer;

ClerkErrorListener(
  handler: (context, error) async {
    // Log to console
    developer.log(
      'Clerk Error: ${error.message}',
      name: 'clerk_flutter',
      error: error,
    );
    
    // Also show to user
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(error.message)),
    );
  },
  child: myApp,
)
```

### Error Analytics

```dart
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

ClerkErrorListener(
  handler: (context, error) async {
    // Report to Crashlytics
    await FirebaseCrashlytics.instance.recordError(
      error,
      StackTrace.current,
      reason: 'Clerk authentication error',
    );
    
    // Show to user
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(error.message)),
    );
  },
  child: myApp,
)
```

---

## Error Types

Errors are instances of `ClerkError` with the following properties:

- `message`: Human-readable error message
- `code`: Error code (e.g., `'form_password_incorrect'`)
- `localizedMessage(localizations)`: Get localized error message

---

## Best Practices

1. **Place below ClerkAuth**: Always place `ClerkErrorListener` as a child of `ClerkAuth`
2. **Ensure Scaffold exists**: Default handler requires a `Scaffold` ancestor
3. **Use custom handler for special cases**: Implement custom handler for dialogs, logging, or analytics
4. **Don't throw in handler**: Handle errors gracefully in your custom handler
5. **Consider user experience**: Show clear, actionable error messages

---

## Common Patterns

### Conditional Error Display

```dart
ClerkErrorListener(
  handler: (context, error) {
    // Only show certain errors to users
    if (error.code == 'network_error') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Network error. Please check your connection.'),
        ),
      );
    } else {
      // Log other errors silently
      print('Clerk error: ${error.message}');
    }
  },
  child: myApp,
)
```

---

## Related Documentation

- [ClerkAuth](clerk_auth.md)
- [ClerkError (clerk_auth)](../clerk_auth/auth.md#error-handling)

---

*Generated for clerk_flutter version 0.0.14-beta*


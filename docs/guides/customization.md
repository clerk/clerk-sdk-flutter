---
layout: default
title: Customization
parent: Guides
nav_order: 4
---

# Customization
{: .no_toc }

Learn how to customize the appearance and behavior of Clerk's Flutter UI components to match your brand.
{: .fs-6 .fw-300 }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Overview

Clerk's Flutter SDK provides extensive customization options through:

- **ClerkTheme** - Theme extension for colors, typography, and spacing
- **Widget Properties** - Customize individual widget behavior
- **Custom Builders** - Build your own authentication UI

---

## Theming with ClerkTheme

### Basic Theme Setup

Apply a custom theme to your Clerk components:

```dart
import 'package:flutter/material.dart';
import 'package:clerk_flutter/clerk_flutter.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ClerkAuth(
      config: ClerkAuthConfig(
        publishableKey: 'pk_test_xxxxxxxxxxxxx',
      ),
      child: MaterialApp(
        title: 'My App',
        theme: ThemeData.light().copyWith(
          extensions: [
            ClerkTheme(
              colors: ClerkColors.light(
                primary: Colors.blue,
                background: Colors.white,
                text: Colors.black87,
              ),
            ),
          ],
        ),
        darkTheme: ThemeData.dark().copyWith(
          extensions: [
            ClerkTheme(
              colors: ClerkColors.dark(
                primary: Colors.blueAccent,
                background: Colors.grey[900]!,
                text: Colors.white,
              ),
            ),
          ],
        ),
        home: const HomePage(),
      ),
    );
  }
}
```

### Custom Colors

Define a complete custom color scheme:

```dart
ClerkTheme(
  colors: ClerkColors(
    primary: Color(0xFF6366F1),           // Primary brand color
    secondary: Color(0xFF8B5CF6),         // Secondary accent
    background: Color(0xFFFFFFFF),        // Background color
    altBackground: Color(0xFFF9FAFB),     // Alternative background
    text: Color(0xFF111827),              // Primary text
    textSecondary: Color(0xFF6B7280),     // Secondary text
    border: Color(0xFFE5E7EB),            // Border color
    error: Color(0xFFEF4444),             // Error color
    success: Color(0xFF10B981),           // Success color
    warning: Color(0xFFF59E0B),           // Warning color
  ),
)
```

### Typography Customization

Customize text styles:

```dart
ClerkTheme(
  typography: ClerkTypography(
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      fontFamily: 'YourCustomFont',
    ),
    headlineMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
    ),
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
  ),
)
```

---

## Customizing Individual Widgets

### ClerkAuthentication Widget

Customize the authentication flow:

```dart
import 'package:clerk_flutter/clerk_flutter.dart';

ClerkAuthentication(
  // Customize which strategies are shown
  // (Note: This depends on your Clerk Dashboard configuration)
  
  // Add custom styling
  // The widget respects your ClerkTheme configuration
)
```

### ClerkUserButton Widget

Customize the user button:

```dart
import 'package:clerk_flutter/clerk_flutter.dart';

ClerkUserButton(
  showName: true,  // Show user's name next to avatar
  
  // Add custom actions
  sessionActions: [
    ClerkUserAction(
      label: 'Custom Action',
      icon: Icons.star,
      onPressed: (context, authState) {
        // Handle custom action
        print('Custom action pressed');
      },
    ),
  ],
  
  // Add additional menu items
  additionalActions: [
    ClerkUserAction(
      label: 'Settings',
      icon: Icons.settings,
      onPressed: (context, authState) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => SettingsPage()),
        );
      },
    ),
    ClerkUserAction(
      label: 'Help',
      icon: Icons.help,
      onPressed: (context, authState) {
        // Show help dialog
      },
    ),
  ],
)
```

---

## Building Custom Authentication UI

### Custom Sign-In Form

Build your own sign-in UI using the Auth API:

```dart
import 'package:flutter/material.dart';
import 'package:clerk_flutter/clerk_flutter.dart';

class CustomSignInForm extends StatefulWidget {
  const CustomSignInForm({super.key});

  @override
  State<CustomSignInForm> createState() => _CustomSignInFormState();
}

class _CustomSignInFormState extends State<CustomSignInForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signIn() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final authState = ClerkAuth.of(context, listen: false);

    try {
      await authState.attemptSignIn(
        strategy: Strategy.password,
        identifier: _emailController.text,
        password: _passwordController.text,
      );
      
      // Success - navigation handled by ClerkAuthBuilder
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Sign In',
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            
            // Email Field
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
              keyboardType: TextInputType.emailAddress,
              enabled: !_isLoading,
            ),
            const SizedBox(height: 16),
            
            // Password Field
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
              enabled: !_isLoading,
            ),
            const SizedBox(height: 24),
            
            // Error Message
            if (_errorMessage != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(
                  _errorMessage!,
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                  textAlign: TextAlign.center,
                ),
              ),
            
            // Sign In Button
            ElevatedButton(
              onPressed: _isLoading ? null : _signIn,
              child: _isLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
```

### Custom OAuth Buttons

Create custom-styled OAuth buttons:

```dart
import 'package:flutter/material.dart';
import 'package:clerk_flutter/clerk_flutter.dart';

class CustomOAuthButtons extends StatelessWidget {
  const CustomOAuthButtons({super.key});

  Widget _buildOAuthButton({
    required BuildContext context,
    required String label,
    required IconData icon,
    required Color color,
    required OAuthProvider provider,
  }) {
    final authState = ClerkAuth.of(context, listen: false);
    
    return ElevatedButton.icon(
      icon: Icon(icon),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 48),
      ),
      onPressed: () async {
        try {
          await authState.attemptSignIn(
            strategy: Strategy.oauth(provider),
          );
        } catch (e) {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Sign in failed: $e')),
            );
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildOAuthButton(
          context: context,
          label: 'Continue with Google',
          icon: Icons.g_mobiledata,
          color: Colors.red,
          provider: OAuthProvider.google,
        ),
        const SizedBox(height: 12),
        _buildOAuthButton(
          context: context,
          label: 'Continue with GitHub',
          icon: Icons.code,
          color: Colors.black,
          provider: OAuthProvider.github,
        ),
      ],
    );
  }
}
```

---

## Localization

Clerk supports localization through Flutter's localization system:

```dart
import 'package:flutter/material.dart';
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

MaterialApp(
  localizationsDelegates: const [
    ClerkSdkLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ],
  supportedLocales: const [
    Locale('en', ''), // English
    // Add more locales as needed
  ],
  // ...
)
```

---

## Responsive Design

Make your authentication UI responsive:

```dart
import 'package:flutter/material.dart';
import 'package:clerk_flutter/clerk_flutter.dart';

class ResponsiveAuthPage extends StatelessWidget {
  const ResponsiveAuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: const ClerkAuthentication(),
        ),
      ),
    );
  }
}
```

---

## Next Steps

- [Widget Reference]({{ '/api/widgets' | relative_url }}) - Complete widget API documentation
- [ClerkTheme API]({{ '/api/clerk-theme' | relative_url }}) - Detailed theming options
- [Examples](https://github.com/clerk/clerk-sdk-flutter/tree/main/packages/clerk_flutter/example) - See complete examples


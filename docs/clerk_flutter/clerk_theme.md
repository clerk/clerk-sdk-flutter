# ClerkTheme Documentation

The `ClerkThemeExtension` class provides theming capabilities for Clerk widgets in Flutter.

## Overview

`ClerkThemeExtension` is a Flutter `ThemeExtension` that allows you to customize the appearance of all Clerk widgets including colors, text styles, and component styles.

## Class Definition

```dart
class ClerkThemeExtension extends ThemeExtension<ClerkThemeExtension> {
  const ClerkThemeExtension({
    required this.colors,
    this.styles,
  });
  
  final ClerkThemeColors colors;
  final ClerkThemeStyles? styles;
}
```

---

## ClerkThemeColors

```dart
class ClerkThemeColors {
  const ClerkThemeColors({
    required this.background,
    required this.altBackground,
    required this.borderSide,
    required this.text,
    required this.icon,
    required this.lightweightText,
    required this.error,
    required this.accent,
  });
  
  final Color background;
  final Color altBackground;
  final Color borderSide;
  final Color text;
  final Color icon;
  final Color lightweightText;
  final Color error;
  final Color accent;
}
```

---

## ClerkThemeStyles

```dart
class ClerkThemeStyles {
  const ClerkThemeStyles({
    this.heading,
    this.subheading,
    this.text,
    this.lightweightText,
    this.button,
  });
  
  final TextStyle? heading;
  final TextStyle? subheading;
  final TextStyle? text;
  final TextStyle? lightweightText;
  final TextStyle? button;
}
```

---

## Complete Examples

### Light Theme

```dart
MaterialApp(
  theme: ThemeData.light().copyWith(
    extensions: [
      ClerkThemeExtension(
        colors: ClerkThemeColors(
          background: Colors.white,
          altBackground: Colors.grey[100]!,
          borderSide: Colors.grey[300]!,
          text: Colors.black87,
          icon: Colors.grey[600]!,
          lightweightText: Colors.grey[500]!,
          error: Colors.red[700]!,
          accent: Colors.blue[600]!,
        ),
      ),
    ],
  ),
  // ... rest of app
)
```

### Dark Theme

```dart
MaterialApp(
  darkTheme: ThemeData.dark().copyWith(
    extensions: [
      ClerkThemeExtension(
        colors: ClerkThemeColors(
          background: Colors.grey[900]!,
          altBackground: Colors.grey[850]!,
          borderSide: Colors.grey[700]!,
          text: Colors.white,
          icon: Colors.grey[400]!,
          lightweightText: Colors.grey[500]!,
          error: Colors.red[400]!,
          accent: Colors.blue[400]!,
        ),
      ),
    ],
  ),
  themeMode: ThemeMode.dark,
  // ... rest of app
)
```

### Custom Brand Colors

```dart
const brandPrimary = Color(0xFF6366F1); // Indigo
const brandSecondary = Color(0xFF8B5CF6); // Purple

MaterialApp(
  theme: ThemeData.light().copyWith(
    extensions: [
      ClerkThemeExtension(
        colors: ClerkThemeColors(
          background: Colors.white,
          altBackground: const Color(0xFFF9FAFB),
          borderSide: const Color(0xFFE5E7EB),
          text: const Color(0xFF111827),
          icon: const Color(0xFF6B7280),
          lightweightText: const Color(0xFF9CA3AF),
          error: const Color(0xFFEF4444),
          accent: brandPrimary,
        ),
        styles: ClerkThemeStyles(
          heading: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF111827),
          ),
          subheading: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF374151),
          ),
          text: const TextStyle(
            fontSize: 14,
            color: Color(0xFF111827),
          ),
          button: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    ],
  ),
)
```

### With Custom Fonts

```dart
ClerkThemeExtension(
  colors: ClerkThemeColors(
    // ... colors
  ),
  styles: ClerkThemeStyles(
    heading: GoogleFonts.inter(
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    subheading: GoogleFonts.inter(
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    text: GoogleFonts.inter(
      fontSize: 14,
    ),
    button: GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
  ),
)
```

---

## Accessing Theme in Widgets

```dart
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ClerkAuth.themeExtensionOf(context);
    
    return Container(
      decoration: BoxDecoration(
        color: theme.colors.background,
        border: Border.all(color: theme.colors.borderSide),
      ),
      child: Column(
        children: [
          Text(
            'Heading',
            style: theme.styles.heading,
          ),
          Text(
            'Body text',
            style: theme.styles.text,
          ),
        ],
      ),
    );
  }
}
```

---

## Color Properties

- **background**: Main background color for panels and cards
- **altBackground**: Alternative background for sections
- **borderSide**: Border color for inputs and dividers
- **text**: Primary text color
- **icon**: Icon color
- **lightweightText**: Secondary/muted text color
- **error**: Error message and validation color
- **accent**: Primary action color (buttons, links)

---

## Best Practices

1. **Match your app theme**: Keep Clerk widgets consistent with your app
2. **Support dark mode**: Provide both light and dark themes
3. **Test contrast**: Ensure text is readable on backgrounds
4. **Use semantic colors**: Don't use accent color for errors
5. **Consider accessibility**: Follow WCAG guidelines for color contrast

---

## Related Documentation

- [ClerkAuth](clerk_auth.md)
- [ClerkAuthentication](clerk_authentication.md)

---

*Generated for clerk_flutter version 0.0.14-beta*


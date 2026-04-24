# Futsmandu Design System

A comprehensive Flutter design system package for Futsmandu applications. Provides consistent theming, reusable components, and design tokens shared across the Player and Owner apps.

## Features

- **Complete Material 3 Theme** — Light and dark mode support with custom color schemes
- **Reusable Components** — Buttons, cards, inputs, profile headers, auth screens
- **Design Tokens** — Spacing, elevation, radius, typography scales
- **Dual-App Support** — Player and Owner app variants with role-based theming
- **Accessibility-First** — Responsive typography with accessibility scaling

## Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  futsmandu_design_system:
    path: ../futsmandu_design_system
```

## Project Structure

```
lib/
├── components/           # Reusable UI components
│   ├── auth/            # Auth-specific components
│   ├── buttons/         # Button variants
│   ├── cards/           # Card containers
│   ├── common/          # Common utilities
│   ├── inputs/          # Form inputs
│   ├── profile/         # Profile screen components
│   └── text/            # Text components
├── core/
│   └── theme/           # Theme configuration
│       ├── app_colors.dart
│       ├── app_elevation.dart
│       ├── app_radius.dart
│       ├── app_spacing.dart
│       ├── app_theme.dart
│       └── app_typography.dart
└── futsmandu_design_system.dart
```

## Running the Package

This is a Flutter package (not a standalone app). To develop or preview components:

### Option 1: Link to an Example App

Create an `example/` folder with a Flutter app that imports this package:

```yaml
# example/pubspec.yaml
dependencies:
  flutter:
    sdk: flutter
  futsmandu_design_system:
    path: ..
```

Then run the example app:

```bash
cd example
flutter pub get
flutter run
```

### Option 2: Run Static Analysis

Check for issues without running:

```bash
dart analyze
```

### Option 3: Run Tests (if available)

```bash
flutter test
```

### Option 4: Preview with Widgetbook (Recommended)

For component previewing, integrate [Widgetbook](https://widgetbook.io) or [Storybook Flutter](https://pub.dev/packages/storybook_flutter) to browse all components in isolation.

## Dependencies

- `flutter` — SDK
- `google_fonts: ^8.0.2` — Poppins font family
- `pinput: ^6.0.2` — OTP input field

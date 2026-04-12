import 'package:flutter/material.dart';

/// Identifies which app variant is being rendered.
///
/// Drives all role-specific visual differentiation:
/// - Accent color (teal for player, navy for owner)
/// - Role badge icon and label in [AuthScaffold]
/// - Card title color in [AuthCard]
enum AppRole {
  player,
  owner;

  String get label => switch (this) {
        AppRole.player => 'Player',
        AppRole.owner => 'Owner',
      };

  IconData get icon => switch (this) {
        AppRole.player => Icons.sports_soccer_rounded,
        AppRole.owner => Icons.storefront_rounded,
      };

  /// Teal for player, navy for owner.
  Color accentColor(ColorScheme cs) => switch (this) {
        AppRole.player => cs.primary,
        AppRole.owner => cs.secondary,
      };

  Color onAccentColor(ColorScheme cs) => switch (this) {
        AppRole.player => cs.onPrimary,
        AppRole.owner => cs.onSecondary,
      };

  Color accentContainerColor(ColorScheme cs) => switch (this) {
        AppRole.player => cs.primaryContainer,
        AppRole.owner => cs.secondaryContainer,
      };

  Color onAccentContainerColor(ColorScheme cs) => switch (this) {
        AppRole.player => cs.onPrimaryContainer,
        AppRole.owner => cs.onSecondaryContainer,
      };
}

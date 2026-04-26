import 'package:flutter/material.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';
import 'empty_state_illustrations.dart';

/// Enhanced empty state widget with built-in illustrations.
///
/// Use [EmptyStateType] for predefined configurations or customize
/// with your own illustration, title, subtitle, and action.
///
/// Example:
/// ```dart
/// EmptyStateWidget(
///   type: EmptyStateType.noData,
///   action: TextButton(
///     onPressed: () {},
///     child: Text('Refresh'),
///   ),
/// )
/// ```
class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({
    super.key,
    this.type,
    this.illustration,
    this.title,
    this.subtitle,
    this.action,
    this.padding = const EdgeInsets.all(AppSpacing.lg),
    this.illustrationSize = 140,
    this.compact = false,
  }) : assert(
          type != null || (illustration != null && title != null),
          'Either provide a type or custom illustration and title',
        );

  /// Predefined empty state configuration.
  final EmptyStateType? type;

  /// Custom illustration widget (required if type is null).
  final Widget? illustration;

  /// Custom title (required if type is null).
  final String? title;

  /// Custom subtitle (required if type is null).
  final String? subtitle;

  /// Optional action button or widget.
  final Widget? action;

  /// Padding around the empty state content.
  final EdgeInsets padding;

  /// Size of the illustration.
  final double illustrationSize;

  /// Compact mode - smaller padding and text for tight spaces.
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final config = type?._config ??
        _EmptyStateConfig(
          illustration: illustration!,
          title: title!,
          subtitle: subtitle ?? '',
        );

    return Center(
      child: Padding(
        padding: padding,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 320),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Illustration with optional size wrapper
              SizedBox(
                width: illustrationSize,
                height: illustrationSize,
                child: config.illustration,
              ),
              SizedBox(height: compact ? AppSpacing.sm : AppSpacing.md),
              // Title
              Text(
                config.title,
                style: compact
                    ? theme.textTheme.titleSmall?.copyWith(
                        fontWeight: AppFontWeights.semiBold,
                        color: colorScheme.onSurface,
                      )
                    : theme.textTheme.titleMedium?.copyWith(
                        fontWeight: AppFontWeights.semiBold,
                        color: colorScheme.onSurface,
                      ),
                textAlign: TextAlign.center,
              ),
              // Subtitle (if any)
              if (config.subtitle.isNotEmpty) ...[
                SizedBox(height: compact ? AppSpacing.xs : AppSpacing.sm),
                Text(
                  config.subtitle,
                  style: compact
                      ? theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          height: 1.4,
                        )
                      : theme.textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          height: 1.4,
                        ),
                  textAlign: TextAlign.center,
                ),
              ],
              // Action (if any)
              if (action != null) ...[
                SizedBox(height: compact ? AppSpacing.sm : AppSpacing.md),
                action!,
              ],
            ],
          ),
        ),
      ),
    );
  }
}

/// Predefined empty state types with default configurations.
enum EmptyStateType {
  /// Generic "no data" state.
  noData,

  /// No search results found.
  noSearchResults,

  /// Error state with retry suggestion.
  error,

  /// No notifications available.
  noNotifications,

  /// No bookings/appointments.
  noBookings,

  /// Offline/no internet connection.
  offline,

  /// Success/completed action (e.g., all tasks done).
  success,

  /// Custom/empty cart state.
  emptyCart,

  /// No favorites/saved items.
  noFavorites,
}

extension _EmptyStateTypeConfig on EmptyStateType {
  _EmptyStateConfig get _config {
    switch (this) {
      case EmptyStateType.noData:
        return _EmptyStateConfig(
          illustration: const NoDataIllustration(size: 120),
          title: 'No Data Available',
          subtitle: 'Looks like there\'s nothing here yet. Check back later!',
        );
      case EmptyStateType.noSearchResults:
        return _EmptyStateConfig(
          illustration: const NoSearchResultsIllustration(size: 120),
          title: 'No Results Found',
          subtitle: 'We couldn\'t find anything matching your search. Try different keywords.',
        );
      case EmptyStateType.error:
        return _EmptyStateConfig(
          illustration: const ErrorIllustration(size: 120),
          title: 'Something Went Wrong',
          subtitle: 'An error occurred while loading data. Please try again.',
        );
      case EmptyStateType.noNotifications:
        return _EmptyStateConfig(
          illustration: const NoNotificationsIllustration(size: 120),
          title: 'No Notifications',
          subtitle: 'You\'re all caught up! We\'ll notify you when something important happens.',
        );
      case EmptyStateType.noBookings:
        return _EmptyStateConfig(
          illustration: const NoBookingsIllustration(size: 120),
          title: 'No Bookings Yet',
          subtitle: 'Start exploring venues and book your first futsal game!',
        );
      case EmptyStateType.offline:
        return _EmptyStateConfig(
          illustration: const OfflineIllustration(size: 120),
          title: 'You\'re Offline',
          subtitle: 'Please check your internet connection and try again.',
        );
      case EmptyStateType.success:
        return _EmptyStateConfig(
          illustration: const SuccessIllustration(size: 120),
          title: 'All Caught Up!',
          subtitle: 'Great job! You\'ve completed everything on your list.',
        );
      case EmptyStateType.emptyCart:
        return _EmptyStateConfig(
          illustration: _CartIllustration(),
          title: 'Your Cart is Empty',
          subtitle: 'Browse venues and add items to get started.',
        );
      case EmptyStateType.noFavorites:
        return _EmptyStateConfig(
          illustration: _HeartIllustration(),
          title: 'No Favorites Yet',
          subtitle: 'Save your preferred venues to access them quickly.',
        );
    }
  }
}

class _EmptyStateConfig {
  const _EmptyStateConfig({
    required this.illustration,
    required this.title,
    required this.subtitle,
  });

  final Widget illustration;
  final String title;
  final String subtitle;
}

/// Built-in simple illustrations for additional types

class _CartIllustration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: colorScheme.primary.withValues(alpha: 0.08),
          ),
        ),
        Icon(
          Icons.shopping_cart_outlined,
          size: 56,
          color: colorScheme.outline,
        ),
        Positioned(
          bottom: 35,
          right: 35,
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: colorScheme.surface,
              shape: BoxShape.circle,
              border: Border.all(color: colorScheme.outlineVariant, width: 2),
            ),
            child: Icon(
              Icons.search,
              size: 16,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ],
    );
  }
}

class _HeartIllustration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: colorScheme.primary.withValues(alpha: 0.08),
          ),
        ),
        Icon(
          Icons.favorite_border,
          size: 56,
          color: colorScheme.outline,
        ),
        Positioned(
          top: 35,
          right: 35,
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: colorScheme.surface,
              shape: BoxShape.circle,
              border: Border.all(color: colorScheme.outlineVariant, width: 2),
            ),
            child: Icon(
              Icons.add,
              size: 16,
              color: colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}

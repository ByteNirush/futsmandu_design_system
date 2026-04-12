import 'package:flutter/material.dart';

import '../../core/theme/app_radius.dart';
import '../../core/theme/app_spacing.dart';

/// Profile header card for the **Player** app.
///
/// Shows the player's avatar (network image or initials fallback), name,
/// optional handle, skill level chip, verification badge, and a three-column
/// stats row (Matches · ELO · Reliability).
///
/// The [avatarWidget] parameter is intentionally untyped — the calling app
/// supplies a [CachedNetworkImage] or any other [Widget]. When null an
/// initials circle is rendered instead.
class PlayerProfileHeader extends StatelessWidget {
  const PlayerProfileHeader({
    super.key,
    required this.name,
    this.handle,
    this.avatarWidget,
    this.isVerified = false,
    this.eloRating = 0,
    this.reliabilityScore = 0,
    this.matchesPlayed = 0,
    this.skillLevel,
    this.onEditProfile,
  });

  final String name;
  final String? handle;

  /// An optional pre-built avatar widget (e.g. CachedNetworkImage).
  /// Falls back to an initials circle when null.
  final Widget? avatarWidget;

  final bool isVerified;
  final int eloRating;
  final int reliabilityScore;
  final int matchesPlayed;
  final String? skillLevel;
  final VoidCallback? onEditProfile;

  String get _initials {
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty || parts.first.isEmpty) return '?';
    if (parts.length == 1) {
      return parts.first.substring(0, 1).toUpperCase();
    }
    return '${parts.first[0]}${parts.last[0]}'.toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [cs.primary, cs.primaryContainer],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: AppRadius.large,
      ),
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Avatar ────────────────────────────────────────────────
              ClipRRect(
                borderRadius: BorderRadius.circular(28),
                child: SizedBox(
                  width: 56,
                  height: 56,
                  child: avatarWidget ??
                      Container(
                        color: cs.surface,
                        alignment: Alignment.center,
                        child: Text(
                          _initials,
                          style: tt.titleLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: cs.primary,
                          ),
                        ),
                      ),
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              // ── Name + handle + skill ─────────────────────────────────
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: tt.titleLarge?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: cs.onPrimary,
                            ),
                          ),
                        ),
                        if (isVerified) ...[
                          const SizedBox(width: AppSpacing.xs),
                          Icon(
                            Icons.verified_rounded,
                            size: 18,
                            color: cs.onPrimary,
                          ),
                        ],
                      ],
                    ),
                    if (handle != null) ...[
                      const SizedBox(height: AppSpacing.xxs),
                      Text(
                        handle!,
                        style: tt.bodySmall?.copyWith(
                          color: cs.onPrimary.withValues(alpha: 0.80),
                        ),
                      ),
                    ],
                    if (skillLevel != null) ...[
                      const SizedBox(height: AppSpacing.xs),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.sm,
                          vertical: AppSpacing.xxs,
                        ),
                        decoration: BoxDecoration(
                          color: cs.onPrimary.withValues(alpha: 0.18),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          skillLevel!,
                          style: tt.labelSmall?.copyWith(
                            color: cs.onPrimary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              if (onEditProfile != null)
                IconButton(
                  onPressed: onEditProfile,
                  icon: Icon(
                    Icons.edit_outlined,
                    color: cs.onPrimary,
                    size: 20,
                  ),
                  tooltip: 'Edit Profile',
                ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          // ── Stats row ─────────────────────────────────────────────────
          Row(
            children: [
              _StatCell(
                label: 'Matches',
                value: matchesPlayed.toString(),
                onAccent: cs.onPrimary,
              ),
              _Divider(color: cs.onPrimary),
              _StatCell(
                label: 'ELO',
                value: eloRating.toString(),
                onAccent: cs.onPrimary,
              ),
              _Divider(color: cs.onPrimary),
              _StatCell(
                label: 'Reliability',
                value: '$reliabilityScore%',
                onAccent: cs.onPrimary,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatCell extends StatelessWidget {
  const _StatCell({
    required this.label,
    required this.value,
    required this.onAccent,
  });

  final String label;
  final String value;
  final Color onAccent;

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    return Expanded(
      child: Column(
        children: [
          Text(
            value,
            style: tt.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
              color: onAccent,
            ),
          ),
          const SizedBox(height: AppSpacing.xxs),
          Text(
            label,
            style: tt.bodySmall?.copyWith(
              color: onAccent.withValues(alpha: 0.72),
            ),
          ),
        ],
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider({required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 1,
      color: color.withValues(alpha: 0.28),
    );
  }
}

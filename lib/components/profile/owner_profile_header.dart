import 'package:flutter/material.dart';

import '../../core/theme/app_radius.dart';
import '../../core/theme/app_spacing.dart';

/// Profile header card for the **Owner** app.
///
/// Shows the owner's initials avatar, business name, email, phone,
/// verification/KYC status chips, and an optional "Update KYC" action button.
class OwnerProfileHeader extends StatelessWidget {
  const OwnerProfileHeader({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
    this.isVerified = false,
    this.kycStatusLabel,
    this.onUpdateKyc,
    this.kycActionLabel,
    this.avatarWidget,
  });

  final String name;
  final String email;
  final String phone;
  final bool isVerified;

  /// Short label describing the KYC state, e.g. "Pending", "Approved".
  final String? kycStatusLabel;

  final VoidCallback? onUpdateKyc;
  final String? kycActionLabel;

  /// Optional widget rendered in place of the default initials avatar.
  /// Pass an [OwnerAvatarUploader] (or any widget) to enable photo uploads.
  final Widget? avatarWidget;

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
        color: cs.surface,
        borderRadius: AppRadius.large,
        border: Border.all(color: cs.outlineVariant.withValues(alpha: 0.85)),
      ),
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Avatar (custom widget or initials fallback) ──────────
              SizedBox(
                width: 56,
                height: 56,
                child: avatarWidget ??
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: cs.primaryContainer,
                        borderRadius: BorderRadius.circular(28),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        _initials,
                        style: tt.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: cs.onPrimaryContainer,
                        ),
                      ),
                    ),
              ),
              const SizedBox(width: AppSpacing.sm),
              // ── Business info ────────────────────────────────────────
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
                              color: cs.onSurface,
                            ),
                          ),
                        ),
                        if (isVerified) ...[
                          const SizedBox(width: AppSpacing.xs),
                          Icon(
                            Icons.verified_rounded,
                            size: 18,
                            color: cs.primary,
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: AppSpacing.xxs),
                    Text(
                      email,
                      style: tt.bodySmall?.copyWith(
                        color: cs.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xxs),
                    Text(
                      phone,
                      style: tt.bodySmall?.copyWith(
                        color: cs.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          // ── Status chips ─────────────────────────────────────────────
          Wrap(
            spacing: AppSpacing.xs,
            runSpacing: AppSpacing.xs,
            children: [
              _OwnerChip(
                icon: Icons.shield_outlined,
                label: isVerified ? 'Verified' : 'Unverified',
                foreground: cs.onSurface,
                background: cs.surfaceContainerHighest,
              ),
              if (kycStatusLabel != null)
                _OwnerChip(
                  icon: Icons.assignment_turned_in_outlined,
                  label: kycStatusLabel!,
                  foreground: cs.onSurface,
                  background: cs.surfaceContainerHighest,
                ),
            ],
          ),
          if (onUpdateKyc != null) ...[
            const SizedBox(height: AppSpacing.sm),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: onUpdateKyc,
                icon: Icon(
                  (kycActionLabel ?? 'Update KYC') == 'Upload KYC'
                      ? Icons.cloud_upload_rounded
                      : Icons.verified_user_outlined,
                  size: 18,
                ),
                label: Text(kycActionLabel ?? 'Update KYC'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: cs.onSurface,
                  side: BorderSide(color: cs.outlineVariant),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _OwnerChip extends StatelessWidget {
  const _OwnerChip({
    required this.icon,
    required this.label,
    required this.foreground,
    required this.background,
  });

  final IconData icon;
  final String label;
  final Color foreground;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 13, color: foreground),
          const SizedBox(width: AppSpacing.xs),
          Text(
            label,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: foreground,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ],
      ),
    );
  }
}

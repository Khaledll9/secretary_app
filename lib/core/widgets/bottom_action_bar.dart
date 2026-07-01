import 'package:flutter/material.dart';
import 'package:secretary_app/core/theme/text_styles.dart';

class BottomActionBar extends StatelessWidget {
  final String mainLabel;
  final String secondaryLabel;
  final VoidCallback onMainPressed;
  final VoidCallback? onSecondaryPressed;
  final bool isLoading;
  final Widget? loadingWidget;

  const BottomActionBar({
    super.key,
    required this.mainLabel,
    required this.secondaryLabel,
    required this.onMainPressed,
    this.onSecondaryPressed,
    this.isLoading = false,
    this.loadingWidget,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: isLoading ? null : onMainPressed,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 14),
                decoration: BoxDecoration(
                  color: isLoading
                      ? theme.colorScheme.onPrimaryContainer
                      : theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: theme.colorScheme.primary.withValues(alpha: 0.2),
                      blurRadius: 6,
                      offset: const Offset(0, 4),
                    ),
                    BoxShadow(
                      color: theme.colorScheme.primary.withValues(alpha: 0.2),
                      blurRadius: 15,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: isLoading
                    ? (loadingWidget ??
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                theme.colorScheme.surface,
                              ),
                            ),
                          ))
                    : Text(
                        mainLabel,
                        style: AppTextStyles.bold16.copyWith(
                          color: theme.colorScheme.surface,
                        ),
                      ),
              ),
            ),
          ),
          const SizedBox(width: 8),

          Expanded(
            child: GestureDetector(
              onTap: onSecondaryPressed,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 14),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    secondaryLabel,
                    style: AppTextStyles.bold16.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

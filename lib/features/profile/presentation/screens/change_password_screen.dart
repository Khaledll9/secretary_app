import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/text_styles.dart';
import '../providers/reset_password_provider.dart';
import '../widgets/password_form_field.dart';
import '../widgets/password_requirement_banner.dart';

class ChangePasswordScreen extends ConsumerWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(resetPasswordProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('تغيير كلمة المرور', style: AppTextStyles.bold20),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 16,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Container(
              width: 80,
              height: 70,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainer,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Icon(
                Icons.lock_outline,
                size: 30,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'يجب أن تحتوي كلمة المرور على 8 أحرف على الأقل، وتشمل أحرفاً وأرقاماً ورموزاً.',
              style: AppTextStyles.regular14,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            PasswordFormField(
              label: 'كلمة المرور الحالية',
              hintText: 'أدخل كلمة المرور الحالية',
              obscureText: state.obscureCurrent,
              onToggleVisibility: () => ref
                  .read(resetPasswordProvider.notifier)
                  .toggleCurrentVisibility(),
              onChanged: (v) =>
                  ref.read(resetPasswordProvider.notifier).setCurrentPassword(v),
            ),
            const SizedBox(height: 18),
            PasswordFormField(
              label: 'كلمة المرور الجديدة',
              hintText: 'أدخل كلمة المرور الجديدة',
              obscureText: state.obscureNew,
              onToggleVisibility: () =>
                  ref.read(resetPasswordProvider.notifier).toggleNewVisibility(),
              onChanged: (v) =>
                  ref.read(resetPasswordProvider.notifier).setNewPassword(v),
            ),
            const SizedBox(height: 18),
            PasswordFormField(
              label: 'تأكيد كلمة المرور الجديدة',
              hintText: 'أعد إدخال كلمة المرور الجديدة',
              obscureText: state.obscureConfirm,
              onToggleVisibility: () => ref
                  .read(resetPasswordProvider.notifier)
                  .toggleConfirmVisibility(),
              onChanged: (v) =>
                  ref.read(resetPasswordProvider.notifier).setConfirmPassword(v),
            ),
            const SizedBox(height: 24),
            const PasswordRequirementBanner(),
            const SizedBox(height: 24),
            SizedBox(
              width: 358,
              height: 56,
              child: ElevatedButton(
                onPressed: state.saveState.isLoading
                    ? null
                    : () => ref.read(resetPasswordProvider.notifier).submit(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  disabledBackgroundColor: Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: state.saveState.isLoading
                    ? SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Theme.of(context).colorScheme.surface,
                          ),
                        ),
                      )
                    : Text(
                        'حفظ كلمة المرور',
                        style: AppTextStyles.bold18.copyWith(
                          color: Theme.of(context).colorScheme.surface,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

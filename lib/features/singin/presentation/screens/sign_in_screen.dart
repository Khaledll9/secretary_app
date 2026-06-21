import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/text_styles.dart';
import '../../../../core/utils/app_routes.dart';
import '../providers/sign_in_provider.dart';
import '../widgets/sign_in_form_field.dart';

class SignInScreen extends ConsumerWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(signInProvider);

    ref.listen<SignInState>(signInProvider, (prev, next) {
      next.authState.whenOrNull(
        data: (user) {
          if (user != null) {
            context.goNamed(AppRoutes.home);
          }
        },
        error: (message, _) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(message.toString()),
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
          );
        },
      );
    });

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 25),
              Container(
                width: 80,
                height: 60,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Icon(
                    Icons.school,
                    size: 40,
                    color: Theme.of(context).colorScheme.outlineVariant,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('تسجيل الدخول', style: AppTextStyles.bold24),
                    const SizedBox(height: 11),
                    SignInFormField(
                      label: 'البريد الإلكتروني',
                      hintText: 'example@mail.com',
                      prefixIcon: Icons.email_outlined,
                      errorText: state.loginIdError,
                      onChanged: (v) =>
                          ref.read(signInProvider.notifier).setEmail(v),
                    ),
                    if (state.loginIdError != null) ...[
                      const SizedBox(height: 4.0),
                      Text(
                        state.loginIdError!,
                        style: AppTextStyles.medium16.copyWith(
                          color: Theme.of(context).colorScheme.error,
                          fontSize: 12,
                        ),
                      ),
                    ],
                    const SizedBox(height: 16),
                    SignInFormField(
                      label: 'كلمة المرور',
                      hintText: '********',
                      prefixIcon: Icons.lock_outline,
                      errorText: state.passwordError,
                      obscureText: state.obscurePassword,
                      suffixWidget: GestureDetector(
                        onTap: () => ref
                            .read(signInProvider.notifier)
                            .togglePasswordVisibility(),
                        child: Container(
                          width: 24,
                          height: 24,
                          alignment: Alignment.center,
                          child: Icon(
                            state.obscurePassword
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            size: 20,
                            color: Theme.of(context).colorScheme.outline,
                          ),
                        ),
                      ),
                      onChanged: (v) =>
                          ref.read(signInProvider.notifier).setPassword(v),
                    ),
                    if (state.passwordError != null) ...[
                      const SizedBox(height: 4.0),
                      Text(
                        state.passwordError!,
                        style: AppTextStyles.medium16.copyWith(
                          color: Theme.of(context).colorScheme.error,
                          fontSize: 12,
                        ),
                      ),
                    ],
                    const SizedBox(height: 32),
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: state.isAuthLoading
                            ? null
                            : () => ref.read(signInProvider.notifier).submit(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(
                            context,
                          ).colorScheme.primary,
                          disabledBackgroundColor: Theme.of(
                            context,
                          ).colorScheme.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsetsDirectional.fromSTEB(
                            103,
                            16,
                            103,
                            16,
                          ),
                        ),
                        child: state.isAuthLoading
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.white,
                                  ),
                                ),
                              )
                            : Text(
                                'تسجيل الدخول',
                                style: AppTextStyles.bold16.copyWith(
                                  color: Theme.of(context).colorScheme.surface,
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('ليس لديك حساب؟', style: AppTextStyles.regular16),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'قم بإنشاء حساب',
                      style: AppTextStyles.bold16.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

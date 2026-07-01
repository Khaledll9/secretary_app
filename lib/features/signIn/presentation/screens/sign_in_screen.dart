import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:secretary_app/core/utils/app_routes.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/text_styles.dart';
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
            context.goNamed(AppRoutes.mainWrapper);
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
              const _Logo(),
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
                          ref.read(signInProvider.notifier).setLoginId(v),
                    ),
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
                    const SizedBox(height: 32),
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: state.authState.isLoading
                            ? null
                            : () => ref.read(signInProvider.notifier).submit(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.primary,
                          disabledBackgroundColor: Theme.of(context).colorScheme.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsetsDirectional.fromSTEB(103, 16, 103, 16),
                        ),
                        child: state.authState.isLoading
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
                                'تسجيل الدخول',
                                style: AppTextStyles.bold16.copyWith(
                                  color: Theme.of(context).colorScheme.onPrimary,
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              const _SignUpRow(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;
    return Container(
      width: 80,
      height: 60,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            isLight
                ? 'assets/images/app_icon_white.png'
                : 'assets/images/app_icon_black.png',
          ),
          fit: BoxFit.contain,
          colorFilter: const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
        ),
        color: Theme.of(context).colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}

class _SignUpRow extends StatelessWidget {
  const _SignUpRow();

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}

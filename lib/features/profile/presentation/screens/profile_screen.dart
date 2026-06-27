import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart' show GoRouterHelper;

import '../../../../core/theme/text_styles.dart';
import '../../../../core/theme/theme_mode_provider.dart';
import '../../../../core/utils/app_routes.dart';
import '../providers/profile_provider.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_menu_section.dart';

class ProfileScreen extends ConsumerWidget {
  final ScrollController? scrollController;

  const ProfileScreen({super.key, this.scrollController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(profileProvider);

    return state.content.when(
      data: (data) => SingleChildScrollView(
        controller: scrollController,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ProfileHeader(data: data),
            const SizedBox(height: 20),
            ProfileMenuSection(
              sectionTitle: 'الإعدادات العامة',
              items: [
                MenuItem(
                  title: 'المعلومات الشخصية',
                  icon: Icons.person_outline,
                  onTap: () => context.pushNamed(AppRoutes.editProfile),
                ),
                MenuItem(
                  title: 'معلومات المعهد',
                  icon: Icons.school_outlined,
                  onTap: () => context.pushNamed(AppRoutes.instituteInfo),
                ),
                MenuItem(
                  title: 'تغير كلمة المرور',
                  icon: Icons.lock_outline,
                  onTap: () => context.pushNamed(AppRoutes.changePassword),
                ),
                MenuItem(
                  title: 'الإشعارات',
                  icon: Icons.notifications_outlined,
                  onTap: () => context.pushNamed(AppRoutes.notifications),
                ),
                MenuItem(
                  title: 'المحفظة المالية',
                  icon: Icons.account_balance_wallet_outlined,
                  onTap: () {},
                ),
                MenuItem(
                  title: 'الوضع الليلي',
                  icon: Icons.dark_mode_outlined,
                  type: MenuItemType.darkMode,
                  onTap: () => ref.read(themeModeProvider.notifier).toggle(),
                ),
                MenuItem(
                  title: 'اللغة',
                  icon: Icons.language_outlined,
                  onTap: () {},
                ),
                MenuItem(
                  title: 'الدعم الفني',
                  icon: Icons.support_agent_outlined,
                  onTap: () {},
                ),
                MenuItem(
                  title: 'الخصوصية والسياسة',
                  icon: Icons.privacy_tip_outlined,
                  onTap: () {},
                ),
                MenuItem(
                  title: 'تسجيل الخروج',
                  icon: Icons.logout,
                  type: MenuItemType.logout,
                  onTap: () {
                    context.goNamed(AppRoutes.singin);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(
        child: Text(
          'حدث خطأ أثناء تحميل المحتوى',
          style: AppTextStyles.regular14.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ),
    );
  }
}

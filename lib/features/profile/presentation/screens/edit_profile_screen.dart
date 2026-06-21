import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/text_styles.dart';
import '../providers/edit_profile_provider.dart';
import '../widgets/edit_profile_form_field.dart';
import '../widgets/gender_toggle.dart';

class EditProfileScreen extends ConsumerWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(editProfileProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('تعديل الملف الشخصي', style: AppTextStyles.bold18),
        leading: IconButton(
          icon: Icon(
            Icons.close,
            size: 20,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),
            Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: 128,
                      height: 128,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).colorScheme.surfaceContainer,
                      ),
                      child: Icon(
                        Icons.person,
                        size: 64,
                        color: Theme.of(context).colorScheme.outlineVariant,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 30.5,
                        height: 30.5,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.camera_alt_outlined,
                          size: 14,
                          color: Theme.of(context).colorScheme.surface,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'تغيير صورة الملف الشخصي',
                    style: AppTextStyles.bold14.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
              child: Column(
                children: [
                  EditProfileFormField(
                    label: 'الاسم الكامل',
                    initialValue: state.data.fullName,
                    prefixIcon: Icons.person_outline,
                    onChanged: (v) =>
                        ref.read(editProfileProvider.notifier).setFullName(v),
                  ),
                  const SizedBox(height: 8),
                  EditProfileFormField(
                    label: 'البريد الإلكتروني',
                    initialValue: state.data.email,
                    prefixIcon: Icons.email_outlined,
                    onChanged: (v) =>
                        ref.read(editProfileProvider.notifier).setEmail(v),
                  ),
                  const SizedBox(height: 8),
                  EditProfileFormField(
                    label: 'رقم الجوال',
                    initialValue: state.data.phone,
                    prefixIcon: Icons.phone_outlined,
                    onChanged: (v) =>
                        ref.read(editProfileProvider.notifier).setPhone(v),
                  ),
                  const SizedBox(height: 8),
                  EditProfileFormField(
                    label: 'الجنسية',
                    initialValue: state.data.nationality,
                    prefixIcon: Icons.language_outlined,
                    onChanged: (v) => ref
                        .read(editProfileProvider.notifier)
                        .setNationality(v),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
              child: GenderToggle(
                selectedGender: state.data.gender,
                onChanged: (v) =>
                    ref.read(editProfileProvider.notifier).setGender(v),
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: 358,
              height: 56,
              child: ElevatedButton(
                onPressed: state.saveState.isLoading
                    ? null
                    : () => ref.read(editProfileProvider.notifier).submit(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  disabledBackgroundColor: Theme.of(
                    context,
                  ).colorScheme.primary,
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
                        'حفظ التغييرات',
                        style: AppTextStyles.bold18.copyWith(
                          color: Theme.of(context).colorScheme.surface,
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

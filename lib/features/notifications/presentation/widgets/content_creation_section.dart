import 'package:flutter/material.dart';

import '../../../../core/theme/text_styles.dart';

class ContentCreationSection extends StatelessWidget {
  final String title;
  final String body;
  final ValueChanged<String> onTitleChanged;
  final ValueChanged<String> onBodyChanged;
  final VoidCallback onAddImage;
  final VoidCallback onAddFile;

  const ContentCreationSection({
    super.key,
    required this.title,
    required this.body,
    required this.onTitleChanged,
    required this.onBodyChanged,
    required this.onAddImage,
    required this.onAddFile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 154),
            child: Row(
              children: [
                Icon(Icons.edit_note, size: 18, color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 8),
                Text('محتوى الإشعار', style: AppTextStyles.bold18),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'عنوان الإشعار',
                style: AppTextStyles.medium14.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 9, 9),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerLowest,

                  borderRadius: BorderRadius.circular(8),
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: TextField(
                    onChanged: onTitleChanged,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      isCollapsed: true,
                      hintText: 'مثال: موعد الدورة التدريبية القادمة',
                      hintStyle: AppTextStyles.regular16,
                    ),
                    style: AppTextStyles.medium16,
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'نص الإشعار',
                style: AppTextStyles.medium14.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 12, 84),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerLowest,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: TextField(
                    onChanged: onBodyChanged,
                    maxLines: 5,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      isCollapsed: true,
                      hintText: 'أكتب محتوى الإشعار الذي تريد إرساله لـ...',
                      hintStyle: AppTextStyles.regular16,
                    ),
                    style: AppTextStyles.medium16,
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _MediaButton(
                label: 'إضافة ملف',
                icon: Icons.attach_file,
                onTap: onAddFile,
              ),
              const SizedBox(width: 16),
              _MediaButton(
                label: 'إضافة صورة',
                icon: Icons.image_outlined,
                onTap: onAddImage,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MediaButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const _MediaButton({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsetsDirectional.fromSTEB(21.7, 21.7, 16, 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Theme.of(context).colorScheme.primary),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: AppTextStyles.bold14.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(width: 8),
              Icon(icon, size: 18, color: Theme.of(context).colorScheme.primary),
            ],
          ),
        ),
      ),
    );
  }
}

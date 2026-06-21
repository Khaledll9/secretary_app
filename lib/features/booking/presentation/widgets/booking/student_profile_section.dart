import 'package:flutter/material.dart';
import 'package:secretary_app/core/theme/text_styles.dart';

class StudentProfileSection extends StatelessWidget {
  final String studentName;
  final String bookingCode;

  const StudentProfileSection({
    super.key,
    required this.studentName,
    required this.bookingCode,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(studentName, style: AppTextStyles.bold20),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text('رمز الحجز:', style: AppTextStyles.bold14),
                    const SizedBox(width: 4),
                    Container(
                      padding: const EdgeInsetsDirectional.fromSTEB(8, 2, 8, 2),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        bookingCode,
                        style: AppTextStyles.bold14.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../core/theme/text_styles.dart';
import '../../../../core/widgets/view_all_widget.dart';
import '../../domain/entities/reports_data.dart';
import 'stat_card.dart';

class StatGrid extends StatelessWidget {
  final String title;
  final List<StatItem> items;
  final VoidCallback? onViewAll;

  const StatGrid({
    super.key,
    required this.title,
    required this.items,
    this.onViewAll,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: AppTextStyles.bold18),
              InkWell(onTap: onViewAll, child: ViewAllWidget()),
            ],
          ),
        ),
        const SizedBox(height: 16),

        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.3,
          ),
          itemBuilder: (context, index) {
            return StatCard(item: items[index]);
          },
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:secretary_app/core/widgets/custom_search_field.dart';

import '../../../../core/theme/text_styles.dart';
import '../widgets/balance_card.dart';
import '../widgets/booking_requests.dart';
import '../widgets/daily_summary.dart';
import '../widgets/quick_actions.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('مرحباً، محمد أحمد', style: AppTextStyles.bold20),
          const SizedBox(height: 4.0),
          Text(
            'لديك 5 مهام معلقة اليوم و 3 طلبات حجز جديدة.',
            style: AppTextStyles.regular14.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 8),
          CustomSearchField(
            hintText: 'رقم الحجز مثال (1665)',
            icon: Icons.search,
          ),
          const SizedBox(height: 12.0),
          const BalanceCard(),
          const SizedBox(height: 8.0),
          const BookingRequestsSection(),
          const SizedBox(height: 20.0),
          const QuickActionsSection(),
          const SizedBox(height: 20.0),
          const DailySummarySection(),
          const SizedBox(height: 32.0),
        ],
      ),
    );
  }
}

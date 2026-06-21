import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:secretary_app/core/theme/text_styles.dart';

import '../../../../core/widgets/custom_search_filed.dart';
import '../providers/booking_provider.dart';
import '../widgets/booking_card.dart';
import '../widgets/booking_filter_tabs.dart';

class BookingsScreen extends ConsumerWidget {
  final ScrollController? scrollController;

  const BookingsScreen({super.key, this.scrollController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(bookingProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          const CustomSearchFiled(
            hintText: 'ابحث عن حجز أو دورة',
            icon: Icons.search,
          ),
          SizedBox(height: 12),
          const BookingFilterTabs(),
          SizedBox(height: 12),
          Expanded(
            child: state.isLoading
                ? const Center(child: CircularProgressIndicator())
                : state.filteredBookings.isEmpty
                ? Center(
                    child: Text(
                      'لا توجد حجوزات',
                      style: AppTextStyles.regular16.copyWith(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                    ),
                  )
                : ListView.builder(
                    controller: scrollController,
                    itemCount: state.filteredBookings.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: BookingCard(
                        booking: state.filteredBookings[index],
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

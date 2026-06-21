import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:secretary_app/core/theme/text_styles.dart';

import 'payment_breakdown_row.dart';

class PaymentBreakdownSection extends StatelessWidget {
  final double registrationFee;
  final double remainingFee;
  final double totalPaid;

  const PaymentBreakdownSection({
    super.key,
    this.registrationFee = 7000,
    this.remainingFee = 2000,
    this.totalPaid = 5000,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'تفاصيل الدفع',
          style: AppTextStyles.bold18.copyWith(color: Theme.of(context).colorScheme.onSurface),
        ),
        const SizedBox(height: 12),
        Card(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                PaymentBreakdownRow(
                  amount: '${_formatCurrency(registrationFee)} ر.ي',
                  label: 'رسوم التسجيل الأساسية',
                  amountStyle: AppTextStyles.bold16,
                  labelStyle: AppTextStyles.regular16.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
                Divider(height: 24, color: Theme.of(context).colorScheme.surfaceContainer),
                PaymentBreakdownRow(
                  amount: '${_formatCurrency(remainingFee)} ر.ي',
                  label: 'الرسوم المتبقية',
                  amountStyle: AppTextStyles.bold16.copyWith(
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                  labelStyle: AppTextStyles.regular16.copyWith(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: PaymentBreakdownRow(
                    amount: '${_formatCurrency(totalPaid)} ر.ي',
                    label: 'إجمالي المبلغ المدفوع',
                    amountStyle: AppTextStyles.bold18.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    labelStyle: AppTextStyles.medium16.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  String _formatCurrency(double amount) {
    return NumberFormat('#,###').format(amount);
  }
}

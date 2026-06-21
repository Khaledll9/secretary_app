import 'package:flutter/material.dart';

import '../../../../core/theme/text_styles.dart';

class PricingSection extends StatelessWidget {
  final TextEditingController? discountController;
  final ValueChanged<String>? onDiscountChanged;

  const PricingSection({
    super.key,
    this.discountController,
    this.onDiscountChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainer,
            borderRadius: BorderRadius.circular(16),
          ),
          child: TextFormField(
            controller: discountController,
            onChanged: onDiscountChanged,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              label: Text('مبلغ الخصم'),
              labelStyle: AppTextStyles.regular12.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
              hintText: '0.00',
              hintStyle: AppTextStyles.bold18.copyWith(
                fontWeight: FontWeight.w600,
              ),
              filled: true,
              fillColor: Theme.of(context).colorScheme.surface,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              contentPadding: const EdgeInsetsDirectional.fromSTEB(
                18,
                13,
                18,
                13,
              ),
            ),
            style: AppTextStyles.bold18.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: Icon(
                Icons.percent,
                size: 18,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            SizedBox(width: 7),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'السعر النهائي بعد الخصم',
                  style: AppTextStyles.medium14.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '0.00',
                      style: AppTextStyles.bold24.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(width: 6),
                    Text('ريال', style: AppTextStyles.medium16),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

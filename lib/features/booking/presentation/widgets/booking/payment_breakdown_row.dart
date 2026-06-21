import 'package:flutter/material.dart';

class PaymentBreakdownRow extends StatelessWidget {
  final String amount;
  final String label;
  final TextStyle amountStyle;
  final TextStyle labelStyle;

  const PaymentBreakdownRow({
    super.key,
    required this.amount,
    required this.label,
    required this.amountStyle,
    required this.labelStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: labelStyle),
        Text(amount, style: amountStyle),
      ],
    );
  }
}

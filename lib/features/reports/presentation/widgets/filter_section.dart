// import 'package:flutter/material.dart';

// import '../../../../core/theme/text_styles.dart';

// class FilterSection extends StatelessWidget {
//   const FilterSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Theme.of(context).colorScheme.surface,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text('تصفية حسب الفئة', style: AppTextStyles.bold14),
//           const SizedBox(height: 12),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Expanded(
//                 child: Container(
//                   height: 42,
//                   padding: const EdgeInsets.symmetric(horizontal: 16),
//                   decoration: BoxDecoration(
//                     color: Theme.of(context).colorScheme.surfaceContainerLowest,
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Row(
//                     children: [
//                       Icon(
//                         Icons.expand_more,
//                         size: 16,
//                         color: Theme.of(context).colorScheme.onSurface,
//                       ),
//                       const SizedBox(width: 8),
//                       Text(
//                         'حاسوب',
//                         style: AppTextStyles.regular14.copyWith(
//                           color: Theme.of(context).colorScheme.onSurfaceVariant,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(width: 12),
//               Container(
//                 height: 34,
//                 padding: const EdgeInsets.symmetric(horizontal: 12),
//                 alignment: Alignment.center,
//                 decoration: BoxDecoration(
//                   color: Theme.of(context).colorScheme.surfaceContainerHighest,

//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Text('عدد الدورات: 12', style: AppTextStyles.bold12),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

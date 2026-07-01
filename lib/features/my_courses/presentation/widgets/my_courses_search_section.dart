import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_search_field.dart';

class MyCoursesSearchSection extends StatelessWidget {
  const MyCoursesSearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomSearchField(
            hintText: 'ابحث عن دورة او دبلوم...',
            icon: Icons.search,
          ),
        ),
        const SizedBox(width: 8.0),
        IconButton(
          icon: Icon(
            Icons.filter_list,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          onPressed: () {},
          iconSize: 26,
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(
              Theme.of(context).colorScheme.primary,
            ),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ),
      ],
    );
  }
}

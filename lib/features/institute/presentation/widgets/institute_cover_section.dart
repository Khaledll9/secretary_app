import 'package:flutter/material.dart';

import '../../../../core/theme/text_styles.dart';

class InstituteCoverSection extends StatelessWidget {
  final String name;
  final String address;

  const InstituteCoverSection({
    super.key,
    required this.name,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          height: 256,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/institute.jpg'),
              fit: BoxFit.cover,
            ),
            color: Theme.of(context).colorScheme.surfaceContainer,
            borderRadius: BorderRadius.circular(32),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 190,
          child: Column(
            children: [
              Container(
                width: 128,
                height: 128,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(40),
                ),
                padding: const EdgeInsets.all(4),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceContainer,
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: Center(
                    child: Image(
                      image: Theme.of(context).brightness == Brightness.light
                          ? AssetImage('assets/images/app_icon_black.png')
                          : AssetImage('assets/images/app_icon_white.png'),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Column(
                children: [
                  Text(
                    name,
                    style: AppTextStyles.bold24.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 20,
                        color: Theme.of(context).colorScheme.outline,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        address,
                        style: AppTextStyles.medium16,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

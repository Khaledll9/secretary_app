import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:secretary_app/core/theme/text_styles.dart';
import 'package:secretary_app/core/utils/app_routes.dart';
import 'package:secretary_app/features/booking/presentation/screens/bookings_screen.dart';
import 'package:secretary_app/features/home/presentation/screens/home_screen.dart';
import 'package:secretary_app/features/my_courses/presentation/screens/my_courses_screen.dart';
import 'package:secretary_app/features/profile/presentation/screens/profile_screen.dart';
import 'package:secretary_app/features/reports/presentation/screens/reports_screen.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _AddMenuButton extends StatelessWidget {
  const _AddMenuButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      margin: EdgeInsets.only(left: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
        ),
      ),
      child: PopupMenuButton<String>(
        icon: Icon(
          Icons.add_circle_outline,
          color: Theme.of(context).colorScheme.onSurface,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        onSelected: (value) {
          switch (value) {
            case 'addBooking':
              context.pushNamed(AppRoutes.addBooking);
            case 'addCourse':
              context.pushNamed(AppRoutes.addCourse);
          }
        },
        itemBuilder: (context) => [
          PopupMenuItem(
            value: 'addBooking',
            child: ListTile(
              leading: Icon(
                Icons.calendar_today,
                color: Theme.of(context).colorScheme.primary,
              ),
              title: Text('إضافة حجز'),
              contentPadding: EdgeInsets.zero,
              visualDensity: VisualDensity.compact,
            ),
          ),
          PopupMenuItem(
            value: 'addCourse',
            child: ListTile(
              leading: Icon(
                Icons.school,
                color: Theme.of(context).colorScheme.primary,
              ),
              title: Text('إضافة دورة'),
              contentPadding: EdgeInsets.zero,
              visualDensity: VisualDensity.compact,
            ),
          ),
        ],
      ),
    );
  }
}

class _MainWrapperState extends State<MainWrapper>
    with TickerProviderStateMixin {
  int _selectedIndex = 2;
  late AnimationController _animationController;

  final List<String> _titles = [
    'دوراتي',
    'التقارير',
    'الرئيسية',
    'الحجوزات',
    'حسابي',
  ];

  final List<Widget> _screens = const [
    MyCoursesScreen(),
    ReportsScreen(),
    HomeScreen(),
    BookingsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final double barWidth = MediaQuery.of(context).size.width * 0.9;
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
          color: Theme.of(context).colorScheme.onSurface,
        ),
        title: Text(_titles[_selectedIndex], style: AppTextStyles.bold20),
        actions: [
          if (_selectedIndex == 0)
            const _AddMenuButton()
          else
            const _NotificationBadge(),
        ],
      ),
      body: BottomBar(
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          switchInCurve: Curves.easeInOut,
          switchOutCurve: Curves.easeInOut,
          child: IndexedStack(
            key: ValueKey(_selectedIndex),
            index: _selectedIndex,
            children: _screens,
          ),
        ),
        showIcon: false,
        layout: BottomBarLayout(
          offset: 18,
          respectSafeArea: true,
          width: barWidth,
        ),
        theme: BottomBarThemeData(
          barDecoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF000000).withValues(alpha: 0.03),
                blurRadius: 12,
                offset: const Offset(0, -2),
              ),

              BoxShadow(
                color: const Color(0xFF000000).withValues(alpha: 0.08),
                blurRadius: 25,
                offset: const Offset(0, 10),
                spreadRadius: -5,
              ),
            ],
          ),
        ),
        child: _buildBottomBar(),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
  }

  Widget _buildBottomBar() {
    return BottomBarItems(
      spacing: MainAxisAlignment.spaceAround,
      children: [
        _buildNavItem(Icons.school_outlined, Icons.school, 'دوراتي', 0),
        _buildNavItem(Icons.bar_chart_outlined, Icons.bar_chart, 'التقارير', 1),
        _buildNavItem(Icons.home_outlined, Icons.home, 'الرئيسية', 2),
        _buildNavItem(
          Icons.calendar_month_outlined,
          Icons.calendar_month,
          'الحجوزات',
          3,
        ),
        _buildNavItem(Icons.person_outline, Icons.person, 'حسابي', 4),
      ],
    );
  }

  Widget _buildNavItem(
    IconData icon,
    IconData activeIcon,
    String label,
    int index,
  ) {
    final bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).colorScheme.primaryContainer
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: Theme.of(
                            context,
                          ).colorScheme.primary.withValues(alpha: 0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ]
                    : null,
              ),
              child: Icon(
                isSelected ? activeIcon : icon,
                size: 22,
                color: isSelected
                    ? Theme.of(context).colorScheme.onPrimary
                    : Theme.of(context).colorScheme.outlineVariant,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: AppTextStyles.bold12.copyWith(
                color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.outlineVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    if (_selectedIndex != index) {
      _animationController.forward(from: 0);
      setState(() => _selectedIndex = index);
    }
  }
}

class _NotificationBadge extends StatelessWidget {
  const _NotificationBadge();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Stack(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
              ),
            ),
            child: Icon(
              Icons.notifications_outlined,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          Positioned(
            right: 10,
            top: 8,
            child: Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.error,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Theme.of(context).colorScheme.surfaceContainerHigh,
                  width: 1.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

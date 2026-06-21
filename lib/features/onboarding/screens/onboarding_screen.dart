import 'package:flutter/material.dart';

import '../data/onboarding_data.dart';
import '../models/onboarding_model.dart';
import '../widgets/onboarding_action_card.dart';
import '../widgets/onboarding_page_body.dart';

class OnboardingScreen extends StatefulWidget {
  final VoidCallback? onSkip;
  final VoidCallback? onComplete;

  const OnboardingScreen({super.key, this.onSkip, this.onComplete});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  final OnboardingDataSource _dataSource = LocalOnboardingDataSource();
  late final List<OnboardingModel> _items = _dataSource.getItems();

  int _currentIndex = 0;
  bool _precached = false;

  bool get _isLastPage => _currentIndex == _items.length - 1;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_precached) {
      _precached = true;
      for (final item in _items) {
        precacheImage(AssetImage(item.bgImage), context);
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onNextPressed() {
    if (_currentIndex < _items.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      widget.onComplete?.call();
    }
  }

  void _onPageChanged(int index) {
    setState(() => _currentIndex = index);
  }

  void _onSkipPressed() {
    widget.onSkip?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            child: Image.asset(
              _items[_currentIndex].bgImage,
              key: ValueKey(_currentIndex),
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          Column(
            children: [
              Expanded(
                child: SafeArea(
                  bottom: false,
                  child: Column(
                    children: [
                      _SkipButton(
                          visible: !_isLastPage, onPressed: _onSkipPressed),
                      Expanded(
                        child: PageView.builder(
                          controller: _controller,
                          onPageChanged: _onPageChanged,
                          itemCount: _items.length,
                          itemBuilder: (_, index) =>
                              OnboardingPageBody(item: _items[index]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              OnboardingActionCard(
                currentIndex: _currentIndex,
                totalCount: _items.length,
                onNext: _onNextPressed,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SkipButton extends StatelessWidget {
  final bool visible;
  final VoidCallback onPressed;

  const _SkipButton({required this.visible, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Visibility(
        visible: visible,
        child: TextButton(
          onPressed: onPressed,
          child: const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "تخطي",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}

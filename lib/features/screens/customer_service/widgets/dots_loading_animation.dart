import 'package:flutter/material.dart';

import '../../../../utils/constants/qaf_colors.dart';

class DotsLoadingAnimation extends StatefulWidget {
  const DotsLoadingAnimation({super.key});

  @override
  State<DotsLoadingAnimation> createState() => _DotsLoadingAnimationState();
}

class _DotsLoadingAnimationState extends State<DotsLoadingAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1500))
          ..repeat();
  }

  Animation<double> _getScaleAnimation(int dotIndex) {
    final startTime = dotIndex * 0.2;

    return Tween<double>(
      begin: 0.5,
      end: 1.5,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(startTime, (startTime + 0.4).clamp(0.0, 1.0),
            curve: Curves.elasticInOut),
      ),
    );
  }

  Animation<double> _getOpacityAnimation(int dotIndex) {
    final startTime = dotIndex * 0.2;
    return Tween<double>(begin: 0.3, end: 1.0).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(startTime, (startTime + 0.4).clamp(0.0, 1.0),
            curve: Curves.easeInOut)));
  }

  Widget _buildDot(int dotIndex) {
    final scale = _getScaleAnimation(dotIndex).value.clamp(0.1, 2.0);
    final opacity = _getOpacityAnimation(dotIndex).value.clamp(0.0, 1.0);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: Transform.scale(
        scale: scale,
        child: Opacity(
          opacity: opacity,
          child: Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: QafColors.primary,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          3,
          (index) => _buildDot(index),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

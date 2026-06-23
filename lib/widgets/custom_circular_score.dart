import 'package:flutter/material.dart';
import 'dart:math' as math;

class CustomCircularScore extends StatefulWidget {
  final int score;
  final double size;

  const CustomCircularScore({
    super.key,
    required this.score,
    this.size = 90,
  });

  @override
  State<CustomCircularScore> createState() => _CustomCircularScoreState();
}

class _CustomCircularScoreState extends State<CustomCircularScore>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _animation = Tween<double>(
      begin: 0,
      end: widget.score / 100,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return SizedBox(
          width: widget.size,
          height: widget.size,
          child: CustomPaint(
            painter: _CirclePainter(progress: _animation.value),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${(widget.score * _animation.value).round()}%',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF1A73E8),
                    ),
                  ),
                  const Text(
                    'Match',
                    style: TextStyle(
                      fontSize: 10,
                      color: Color(0xFF888888),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _CirclePainter extends CustomPainter {
  final double progress;

  _CirclePainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 6;

    // Background circle
    final bgPaint = Paint()
      ..color = const Color(0xFFE8F0FE)
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, bgPaint);

    // Progress arc
    final progressPaint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFF1A73E8), Color(0xFF34A853)],
      ).createShader(Rect.fromCircle(center: center, radius: radius))
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      2 * math.pi * progress,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(_CirclePainter oldDelegate) =>
      oldDelegate.progress != progress;
}
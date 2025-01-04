import 'package:flutter/material.dart';

class TextShimmer extends StatefulWidget {
  const TextShimmer({super.key});

  @override
  TextShimmerState createState() => TextShimmerState();
}

class TextShimmerState extends State<TextShimmer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.3, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FadeTransition(
          opacity: _animation,
          child: Container(
            height: 16,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        const SizedBox(height: 8),
        FadeTransition(
          opacity: _animation,
          child: Container(
            height: 16,
            width: 150,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }
}

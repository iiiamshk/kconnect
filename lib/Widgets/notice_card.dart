import 'package:flutter/material.dart';

class NoticeCard extends StatefulWidget {
  @override
  _NoticeCardState createState() => _NoticeCardState();
}

class _NoticeCardState extends State<NoticeCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  final List<String> _notices = [
    'Notice 1: Important update!',
    'Notice 2: Scheduled maintenance tonight.',
    'Notice 3: New feature released!',
    'Notice 4: Please update your app.',
  ];

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      duration: Duration(milliseconds: 1000), // Animation duration
      vsync: this,
    );

    // Define the animation curve and range
    _animation = Tween<double>(begin: -200, end: 20).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    // Start the animation when the page loads
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
        return Positioned(
          bottom: _animation.value, // Animate the bottom position
          left: 20,
          right: 20,
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Container(
              padding: EdgeInsets.all(16),
              height: 200, // Fixed height for the notice card
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: _notices.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      _notices[index],
                      style: TextStyle(fontSize: 16),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

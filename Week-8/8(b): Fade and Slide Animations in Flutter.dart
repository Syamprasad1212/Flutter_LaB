
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: FadeSlideDemo(),
  ));
}

class FadeSlideDemo extends StatefulWidget {
  @override
  State<FadeSlideDemo> createState() => _FadeSlideDemoState();
}

class _FadeSlideDemoState extends State<FadeSlideDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> fade;
  late Animation<Offset> slide;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    fade = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(controller);

    slide = Tween<Offset>(
      begin: Offset(0, 1),
      end: Offset.zero,
    ).animate(controller);

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fade & Slide Animation'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.deepPurple.shade50,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SlideTransition(
              position: slide,
              child: FadeTransition(
                opacity: fade,
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Icon(
                    Icons.star,
                    size: 75,
                    color: Colors.amber,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                controller.forward(from: 0);
              },
              child: Text('Replay Animation'),
            ),
          ],
        ),
      ),
    );
  }
}

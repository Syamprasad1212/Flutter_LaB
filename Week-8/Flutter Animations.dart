
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AnimationDemo(),
  ));
}

class AnimationDemo extends StatefulWidget {
  @override
  State<AnimationDemo> createState() => _AnimationDemoState();
}

class _AnimationDemoState extends State<AnimationDemo> {
  bool changed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Animation'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.deepPurple.shade50,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: Duration(seconds: 1),
              curve: Curves.easeInOut,
              width: changed ? 200 : 120,
              height: changed ? 200 : 120,
              decoration: BoxDecoration(
                color: changed ? Colors.orange : Colors.deepPurple,
                borderRadius: BorderRadius.circular(
                  changed ? 100 : 15,
                ),
              ),
              child: Icon(
                Icons.star,
                color: Colors.white,
                size: 55,
              ),
            ),
            SizedBox(height: 35),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  changed = !changed;
                });
              },
              child: Text('Animate'),
            ),
          ],
        ),
      ),
    );
  }
}

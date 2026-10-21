
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: DebugDemo(),
  ));
}

class DebugDemo extends StatefulWidget {
  @override
  State<DebugDemo> createState() => _DebugDemoState();
}

class _DebugDemoState extends State<DebugDemo> {
  int number = 10;
  String message = 'Press the button to check the number';

  void checkNumber() {
    try {
      print('Debug: Current number = $number');

      if (number > 0) {
        setState(() {
          message = 'Number is positive';
        });
      } else {
        setState(() {
          message = 'Number is zero or negative';
        });
      }

      print('Debug: $message');
    } catch (e) {
      setState(() {
        message = 'Error: $e';
      });
      print('Debug Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Debugging'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.bug_report, size: 60, color: Colors.teal),
            SizedBox(height: 20),
            Text(
              'Number: $number',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 15),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.teal,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: checkNumber,
              child: Text('Check Number'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  number = -5;
                  message = 'Number changed to -5';
                });
              },
              child: Text('Change Number'),
            ),
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CounterTest(),
  ));
}

class CounterTest extends StatefulWidget {
  @override
  State<CounterTest> createState() => _CounterTestState();
}

class _CounterTestState extends State<CounterTest> {
  int count = 0;
  String result = 'Test not started';

  void runTest() {
    setState(() {
      count = 0;

      // Check the initial counter value.
      bool initialTest = count == 0;

      // Simulate pressing the increment button.
      count++;

      // Check whether the counter increments correctly.
      bool incrementTest = count == 1;

      result = initialTest && incrementTest
          ? 'All tests passed!'
          : 'Test failed!';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter UI Test'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Counter Value',
                style: TextStyle(fontSize: 20)),
            Text('$count',
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.teal,
                    fontWeight: FontWeight.bold)),
            ElevatedButton(
              onPressed: () {
                setState(() => count++);
              },
              child: Text('Increment'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: runTest,
              child: Text('Run Test'),
            ),
            SizedBox(height: 20),
            Text(
              result,
              style: TextStyle(
                fontSize: 20,
                color: result == 'All tests passed!'
                    ? Colors.green
                    : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

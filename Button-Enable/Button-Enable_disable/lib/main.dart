import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: true,
      home: ButtonMode(),
    ),
  );
}

class ButtonMode extends StatefulWidget {
  const ButtonMode({super.key});

  @override
  State<ButtonMode> createState() => _ButtonModeState();
}

class _ButtonModeState extends State<ButtonMode> {
  bool isEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF6366F1),
        foregroundColor: Colors.white,
        title: const Text("Button Mode"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isEnabled ? Icons.toggle_on : Icons.toggle_off,
              size: 80,
              color: isEnabled ? Colors.green : Colors.red,
            ),
            const SizedBox(height: 10),
            Text(
              isEnabled ? "Button Enabled" : "Button Disabled",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: isEnabled ? Colors.green : Colors.red,
              ),
            ),
            const SizedBox(height: 20),
            Switch(
              value: isEnabled,
              activeColor: Colors.green,
              onChanged: (value) {
                setState(() {
                  isEnabled = value;
                });
              },
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: isEnabled
                  ? () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Button Pressed"),
                        ),
                      );
                    }
                  : null,
              child: const Text("Click Me"),
            ),
          ],
        ),
      ),
    );
  }
}

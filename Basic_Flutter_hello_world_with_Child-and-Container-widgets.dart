import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue.shade100,
        appBar: AppBar(
          title: Text('MY FIRST APP'),
        ),
        body: Center(
          child: Container(
            width: 200,
            height: 300,
            color: Colors.orange,
            alignment: Alignment.center,
            child: Text(
              "Hello FLutter",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
/*Main Dart File*/

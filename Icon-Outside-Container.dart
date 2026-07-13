import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue.shade100,
        appBar: AppBar(
          title: Text('MY FIRST APP'),
          backgroundColor: Colors.pink,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.train,
                color: Colors.white,
                size: 50,
              ),
              const SizedBox(height: 10),
              Container(
                width: 200,
                height: 300,
                color: Colors.orange,
                alignment: Alignment.center,
                child: Text(
                  "Syam Prasad",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

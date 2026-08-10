import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Responsive UI",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("android/asserts/images/wallpaper1.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: width < 400
              ? Text(
                  "Mobile Screen",
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.red,
                  ),
                )
              : Text(
                  "Large Screen",
                  style: TextStyle(fontSize: 25),
                ),
        ),
      ),
    ));
  }
}


import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: Text('Custom Widgets'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.indigo.shade50,
      body: Center(
        child: StudentCard(
          name: 'Syam',
          course: 'Computer Science',
          icon: Icons.school,
        ),
      ),
    ),
  ));
}

class StudentCard extends StatelessWidget {
  final String name;
  final String course;
  final IconData icon;

  const StudentCard({
    super.key,
    required this.name,
    required this.course,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(20),
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 35,
              backgroundColor: Colors.indigo,
              child: Icon(icon, size: 40, color: Colors.white),
            ),
            SizedBox(height: 15),
            Text(
              name,
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            SizedBox(height: 8),
            Text(course, style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text('Flutter Lab Student'),
          ],
        ),
      ),
    );
  }
}

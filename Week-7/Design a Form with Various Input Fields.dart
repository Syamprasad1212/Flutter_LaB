
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: StudentForm(),
  ));
}

class StudentForm extends StatefulWidget {
  @override
  State<StudentForm> createState() => _StudentFormState();
}

class _StudentFormState extends State<StudentForm> {
  String gender = 'Male';
  String course = 'CSE';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Student Registration')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Student Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: gender,
              decoration: InputDecoration(labelText: 'Gender'),
              items: ['Male', 'Female', 'Other']
                  .map((g) => DropdownMenuItem(
                        value: g,
                        child: Text(g),
                      ))
                  .toList(),
              onChanged: (v) => setState(() => gender = v!),
            ),
            SizedBox(height: 15),
            DropdownButtonFormField<String>(
              value: course,
              decoration: InputDecoration(labelText: 'Course'),
              items: ['CSE', 'ECE', 'EEE', 'Mechanical']
                  .map((c) => DropdownMenuItem(
                        value: c,
                        child: Text(c),
                      ))
                  .toList(),
              onChanged: (v) => setState(() => course = v!),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Registration Submitted')),
                );
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

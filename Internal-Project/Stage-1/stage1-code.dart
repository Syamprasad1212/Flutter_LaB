import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title:'Student Profile DashBoard',
      theme:ThemeData(
        colorScheme:ColorScheme.fromSeed(
          seedColor:Colors.blue,
        ),
        useMaterial3:true,
      ),
      home: const StudentProfilePage(),
    );
  }
}

class StudentProfilePage extends StatelessWidget{
  const StudentProfilePage({super.key});

    @override
    Widget build(BuildContext context){
      return Scaffold(
        appBar:AppBar(
          title:const Text('Student Profile'),
        ),
        body:Padding(
          padding:const EdgeInsets.all(16.0),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            const Text(
              'Welcome to My Profile',
              style:TextStyle(
                fontSize:24,
                fontWeight:FontWeight.bold,
              ),
            ),
            const SizedBox(height:20),
            const Text(
              'Name:Syam'
            ),
            const Text('Department:Computer Science'),
            const Text('Year:3rd Year'),
          ],
        ),
        ),
      );
  }
}

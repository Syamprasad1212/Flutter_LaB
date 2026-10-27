import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner:false,
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
            Card(
              child:Padding(
                padding:const EdgeInsets.all(16.0),
                child:Row(
                  children:[
                    const CircleAvatar(
                      radius:40,
                      backgroundColor:Colors.blue,
                      child:Icon(
                        Icons.person,
                        size:40,
                        color:Colors.white,
                      ),
                    ),
                    const SizedBox(width:16),
                    const Column(
                     crossAxisAlignment:CrossAxisAlignment.start,
                      children:[
                        Text(
                          'Syam',
                          style: TextStyle(
                            fontSize:20,
                            fontWeight:FontWeight.bold,
                          ),
                        ),
                       SizedBox(height:6),
                       Text('Department:Computer Science'),
                       Text('Year:3rd Year'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          
          ],
        ),
        ),
      );
  }
}

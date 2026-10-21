
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: DisplayAPI(),
  ));
}

class DisplayAPI extends StatefulWidget {
  @override
  State<DisplayAPI> createState() => _DisplayAPIState();
}

class _DisplayAPIState extends State<DisplayAPI> {
  List users = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse(
        'https://jsonplaceholder.typicode.com/users',
      ));

      if (response.statusCode == 200) {
        setState(() {
          users = jsonDecode(response.body);
          loading = false;
        });
      } else {
        setState(() => loading = false);
      }
    } catch (e) {
      setState(() => loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API User Details'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : users.isEmpty
              ? Center(child: Text('Failed to load data'))
              : ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index];

                    return Card(
                      margin: EdgeInsets.all(10),
                      color: Colors.indigo.shade50,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.indigo,
                          child: Text(
                            '${user['id']}',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        title: Text(
                          user['name'],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(user['email']),
                        trailing: Icon(
                          Icons.person,
                          color: Colors.indigo,
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}

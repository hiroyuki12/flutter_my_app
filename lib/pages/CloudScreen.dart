import 'package:flutter/material.dart';

class CloudScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[100],
        // Appbar
        appBar: AppBar(
          backgroundColor: Colors.blue[100],
          title: Text(
            'Cloud',
            style: TextStyle(fontSize: 16),
          ),
        ),
        body: Center(child: Icon(Icons.cloud)));
  }
}
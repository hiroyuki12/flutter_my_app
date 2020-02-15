import 'package:flutter/material.dart';

class BookScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[100],
        // Appbar
        appBar: AppBar(
          backgroundColor: Colors.green[100],
          title: Text(
            'Book',
            style: TextStyle(fontSize: 16),
          ),
        ),
        body: Center(child: Icon(Icons.book)));
  }
}
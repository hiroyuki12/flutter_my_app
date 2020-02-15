import 'package:flutter/material.dart';

class CakeScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink[100],
        // Appbar
        appBar: AppBar(
          backgroundColor: Colors.pink[100],
          title: Text(
            'Cake',
            style: TextStyle(fontSize: 16),
          ),
        ),
        body: Center(child: Icon(Icons.cake)));
  }
}
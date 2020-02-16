import 'package:flutter/material.dart';

class LayoutScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<LayoutScreen> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //return MaterialApp(
    //  theme: dark ? ThemeData.dark() : ThemeData.light(),
    //  home: Scaffold(
        appBar: AppBar(
          title: Text('Layout'),
        ),
        body: Container(
          padding: EdgeInsets.all(30.0),
          child: Column(
            children: <Widget>[

              //1
              Text('Hello World!'),

              //2 wrap with Center
              Center(child: Text('Hello World2!')),

              //3 wrap with column
              Column(
                children: <Widget>[
                  Text('Hello World3!'),
                  Text('Hello World4!'),
                ],
              ),

              //4 wrap with row
              Row(
                children: <Widget>[
                  Text('Hello World!'),
                ],
              ),

            ],
          ),
        ),
      //),
    );
  }
}
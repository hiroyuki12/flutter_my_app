import 'package:flutter/material.dart';

class MySnackBar extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MySnackBar> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MySnackBar"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('OK'),
          onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Hello snackbar'),
              duration: const Duration(seconds: 5),
              action: SnackBarAction(
                label: 'DONE',
                onPressed: () {},
              ),
            ),
          ),
        ),
      )
    );
  }
}

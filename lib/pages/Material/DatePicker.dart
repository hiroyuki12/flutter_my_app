import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class MyDatePicker extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MyDatePicker> {
  var _labelText = 'Select Date';

  Future<void> _selectDate(BuildContext context) async {
    final DateTime selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2090),
    );
    if (selected != null) {
      setState(() {
        _labelText = (DateFormat.yMMMd()).format(selected);
        print(_labelText);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DatePicker"),
      ),
      body: Center(
        child: IconButton(
          icon: Icon(Icons.date_range), 
          onPressed: () => _selectDate(context))),
      );
  }
}

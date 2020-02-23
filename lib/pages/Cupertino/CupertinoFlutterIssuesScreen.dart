import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_app/pages/StackScreen.dart';
import 'package:http/http.dart' as http;

class CupertinoFlutterIssues extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class Issue {
  Issue({
    this.title,
    this.avatarUrl,
  });

  final String title;
  final String avatarUrl;
}

class _State extends State<CupertinoFlutterIssues> {
  String _data = '';

  var myTextStyle = new TextStyle(
    fontWeight: FontWeight.w100,
    decoration: TextDecoration.none,
    fontSize: 16,
    color: CupertinoColors.white);

  List<Issue> _issues = <Issue>[];
  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final res = await http.get('https://api.github.com/repositories/31792824/issues');
    setState(() {
      _data = res.body;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("CupertinoFlutterIssues", style: myTextStyle),
        //trailing: Text("Edit", style: myTextStyle),
        backgroundColor: const Color(0xff333333),
      ),
      child: Text(_data, style: myTextStyle),
    );
  }
}


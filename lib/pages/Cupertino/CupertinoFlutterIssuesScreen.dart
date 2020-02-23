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
    final data = json.decode(res.body);
    setState(() {
      final issues = data as List;
      issues.forEach((dynamic element) {
        final issue = element as Map;
        _issues.add(Issue(
          title: issue['title'] as String,
          avatarUrl: issue['user']['avatar_url'] as String,
        ));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("CupertinoFlutterIssues", style: myTextStyle),
        backgroundColor: const Color(0xff333333),
      ),
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          if (index >= _issues.length) {
            return null;
          }

          final issue = _issues[index];
          return Row(
            children: <Widget>[
              Padding(
                //padding: const EdgeInsets.all(6.0),
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: ClipOval(
                  child: Image.network(issue.avatarUrl,
                    width: 50,),
                ),
              ),
              Expanded(
                child: Text(issue.title, 
                  style: myTextStyle,)
              ),
            ],
          );
        },
      ),
    );
  }
}
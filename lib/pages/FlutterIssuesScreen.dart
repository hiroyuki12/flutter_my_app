import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FlutterIssuesScreen extends StatefulWidget {
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

class _State extends State<FlutterIssuesScreen> {
  List<Issue> _issues = <Issue>[];
  @override
  void initState() {
    super.initState();
    _load();
  }

  // This widget is the root of your application.
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
  //var _city = '';
    return Scaffold(
      /*
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Flutter Issues',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Setting'),
              onTap: () {
                //setState(() => _city = 'Setting');
                Navigator.pop(context);
                setState(() => _onPressed);
              },
            ),
            ListTile(
              title: Text('Honolulu'),
              onTap: () {
                setState(() => _city = 'Honolulu, HI');
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),*/
      appBar: AppBar(
        title: Text("Flutter Issues"),
      ),
      floatingActionButton: Column(
        verticalDirection: VerticalDirection.up, // childrenの先頭を下に配置
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
        ],
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          if (index >= _issues.length) {
            return null;
          }

          final issue = _issues[index];
          return ListTile(
            leading: ClipOval(
              child: Image.network(issue.avatarUrl),
            ),
            title: Text(issue.title),
          );
        },
      ),
    );
  }
}


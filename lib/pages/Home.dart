import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Issues',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage1(title: 'Flutter Issues'),
    );
  }
}

class MyHomePage1 extends StatefulWidget {
  MyHomePage1({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState1 createState() => _MyHomePageState1();
}

class Issue {
  Issue({
    this.title,
    this.avatarUrl,
  });

  final String title;
  final String avatarUrl;
}

class _MyHomePageState1 extends State<MyHomePage1> {
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
  var _city = '';
    return Scaffold(
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
                title: Text('Los Angeles'),
                onTap: () {
                  setState(() => _city = 'Los Angeles, CA');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Honolulu'),
                onTap: () {
                  setState(() => _city = 'Honolulu, HI');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Dallas'),
                onTap: () {
                  setState(() => _city = 'Dallas, TX');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Seattle'),
                onTap: () {
                  setState(() => _city = 'Seattle, WA');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Tokyo'),
                onTap: () {
                  setState(() => _city = 'Tokyo, Japan');
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text(widget.title),
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


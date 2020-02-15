import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CloudScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qiita',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Qiita'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class Item {
  Item({
    this.title,
    this.profileImageUrl,
  });

  final String title;
  final String profileImageUrl;
}

class _MyHomePageState extends State<MyHomePage> {
  List<Item> _items = <Item>[];

  @override
  void initState() {
    super.initState();
    _load();
  }
  // This widget is the root of your application.
  Future<void> _load() async {
    final res = await http.get('http://qiita.com/api/v2/items');
    final data = json.decode(res.body);
    setState(() {
      final issues = data as List;
      issues.forEach((dynamic element) {
        final issue = element as Map;
        _items.add(Item(
          title: issue['title'] as String,
          profileImageUrl: issue['user']['profile_image_url'] as String,
        ));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          if (index >= _items.length) {
            return null;
          }

          final issue = _items[index];
          return ListTile(
            leading: ClipOval(
              child: Image.network(issue.profileImageUrl),
            ),
            title: Text(issue.title),
          );
        },
      ),
    );
  }
}


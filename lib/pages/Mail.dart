import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CakeScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qiita2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage3(title: 'Qiita2'),
    );
  }
}

class MyHomePage3 extends StatefulWidget {
  MyHomePage3({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState3 createState() => _MyHomePageState3();
}

class Item {
  Item({
    this.title,
    //this.profileImageUrl,
  });

  final String title;
  //final String profileImageUrl;
}

class _MyHomePageState3 extends State<MyHomePage3> {
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
          //profileImageUrl: issue['user']['profile_image_url'] as String,
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
            //leading: ClipOval(
            //  child: Image.network(issue.profileImageUrl),
            //),
            title: Text(issue.title),
          );
        },
      ),
    );
  }
}


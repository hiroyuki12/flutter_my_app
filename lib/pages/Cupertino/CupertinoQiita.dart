import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CupertinoQiita extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class Item {
   Item({
     this.title,
     this.profileImageUrl,
   });

   final String title;
   final String profileImageUrl;
 }

class _State extends State<CupertinoQiita> {
  var myTextStyle = new TextStyle(
    fontWeight: FontWeight.w100,
    decoration: TextDecoration.none,
    fontSize: 16,
    color: CupertinoColors.white);

  List<Item> _items = <Item>[];

  @override
  void initState() {
    super.initState();
    _load();
  }

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
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("CupertinoQiita", style: myTextStyle),
        backgroundColor: const Color(0xff333333),
      ),
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          if (index >= _items.length) {
            return null;
          }

          final issue = _items[index];
          return Row(
            children: <Widget>[
              Padding(
                //padding: const EdgeInsets.all(6.0),
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: ClipOval(
                  child: Image.network(issue.profileImageUrl,
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
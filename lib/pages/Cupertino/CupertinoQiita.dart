import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'DarkModeColor.dart';

class CupertinoQiita extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<CupertinoQiita> {
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
    isDarkMode = true;  // switch darkMode
    return CupertinoPageScaffold(
      backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
      navigationBar: CupertinoNavigationBar(
        middle: Text("CupertinoQiita", style: _buildFont()),
        // backgroundColor: const Color(0xff333333),
        backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
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
                  style: _buildFont(),)
              ),
            ],
          );
        },
      ),
    );
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

List<Item> _items = <Item>[];

var myTextStyle = new TextStyle();
TextStyle _buildFont() {
  return myTextStyle = new TextStyle(
  fontWeight: FontWeight.w100,
  decoration: TextDecoration.none,
  fontSize: 16,
  // color: CupertinoColors.white
  color: isDarkMode ? darkModeForeColor : foreColor,  //black , darkMode=white
  );
}

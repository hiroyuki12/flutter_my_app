import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'DarkModeColor.dart';
import 'CupertinoWebView.dart';

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
    // final res = await http.get('http://qiita.com/api/v2/items');
    final res = await http.get('https://qiita.com/api/v2/tags/flutter/items');
    final data = json.decode(res.body);
    setState(() {
      final issues = data as List;
      issues.forEach((dynamic element) {
        final issue = element as Map;
        _items.add(Item(
          title: issue['title'] as String,
          profileImageUrl: issue['user']['profile_image_url'] as String,
          id: issue['user']['id'] as String,
          likesCount: issue['likes_count'].toString() as String,
          createdAt: issue['created_at'] as String,
          url: issue['url'] as String,
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
        backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
        middle: Text("CupertinoQiita", style: _buildTextStyle()),
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
                padding: const EdgeInsets.all(3.0),
                // padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                // child: ClipOval(
                //   child: Image.network(issue.profileImageUrl,
                //     width: 50,),
                // ),
                child: Image.network(issue.profileImageUrl,
                  width: 50,),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(issue.title, style: _buildTextStyle(),),
                    Text(issue.createdAt + ' ' + issue.id, style: _buildSubTitleTextStyle(),),
                    Row(
                      children: <Widget>[
                        Text(issue.likesCount + ' likes', style: _buildSubTitleTextStyle(),),
                      ],
                    ),
                    CupertinoButton(
                      //color: CupertinoColors.activeBlue,
                      //borderRadius: new BorderRadius.circular(30.0),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) => MyCupertinoWebView(
                              // url: 'https://www.yahoo.co.jp/',
                              url: issue.url,
                            ),
                          ),
                        );
                      },
                      child: Text('link', style: _buildTextStyle()),
                    ),
                  ],
                )
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
     this.id,
     this.likesCount,
     this.createdAt,
     this.url,
   });

   final String title;
   final String profileImageUrl;
   final String id;
   final String likesCount;
   final String createdAt;
   final String url;
 }

List<Item> _items = <Item>[];

var myTextStyle = new TextStyle();
TextStyle _buildTextStyle() {
  return myTextStyle = new TextStyle(
  fontWeight: FontWeight.w100,
  decoration: TextDecoration.none,
  fontSize: 16,
  color: isDarkMode ? darkModeForeColor : foreColor,  //black , darkMode=white
  );
}

var subTitleTextStyle = new TextStyle();
TextStyle _buildSubTitleTextStyle() {
  return subTitleTextStyle = new TextStyle(
  fontWeight: FontWeight.w100,
  decoration: TextDecoration.none,
  fontSize: 13,
  color: CupertinoColors.systemYellow,  //black , darkMode=white
  );
}

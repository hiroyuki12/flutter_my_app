import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'DarkModeColor.dart';
import 'CupertinoWebView.dart';

class CupertinoAdventCalender2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoAdventCalender(
    );
  }
}

class CupertinoAdventCalender extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<CupertinoAdventCalender> {
  var _data;

  @override
  void initState() {
    super.initState();
    _updateJsonData();
  }

  var _json = 'json/flutterAdventCalender2019-2.json';

  void _updateJsonData() {
    setState(() {
      loadJsonAsset();
    });
  }
  
  Future<void> loadJsonAsset() async {
    String loadData = await rootBundle.loadString(_json);

    setState(() {
      final jsonResponse = json.decode(loadData);
      // print("### getLocalTestJSONData:" + jsonResponse.toString());
      _data = jsonResponse['list'];
    });

    var res = _data;
    setState(() {
      final items = res as List;
      _items.clear();
      items.forEach((dynamic element) {
        final issue = element as Map;
        _items.add(Item(
          title: issue['title'] as String,
          profileImageUrl: issue['image_url'] as String,
          id: issue['username'] as String,
          // likesCount: issue['likes_count'].toString(),
          createdAt: issue['date'] as String,
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
        middle: Text("Cupertino Flutter Advent Calender 2019 " , style: _buildTextStyle()),
        // trailing: CupertinoButton(
        //   onPressed: () {
        //     _load(tags);
        //     if(tags == 'flutter')  tags = tagsAll;
        //     else tags = 'flutter';
        //   },
        //   child: Text(tags, style: _buildTextStyle()),
        // ),
        ////////////////////////////////////////////////////////
        trailing: CupertinoButton(
          onPressed: () {
            showCupertinoModalPopup(
              context: context,
              builder: (BuildContext context) {
                return CupertinoActionSheet(
                  //title: const Text('選択した項目が画面に表示されます'),
                  actions: <Widget>[
                    CupertinoActionSheetAction(
                      child: const Text('2018-1'),
                      onPressed: () {
                        _json = 'json/flutterAdventCalender2018.json';
                        loadJsonAsset();
                        Navigator.pop(context, '2018-1');
                      },
                    ),
                    CupertinoActionSheetAction(
                      child: const Text('2018-2'),
                      onPressed: () {
                        _json = 'json/flutterAdventCalender2018-2.json';
                        loadJsonAsset();
                        Navigator.pop(context, '2018-2');
                      },
                    ),
                    CupertinoActionSheetAction(
                      child: const Text('2019-1'),
                      onPressed: () {
                        _json = 'json/flutterAdventCalender2019.json';
                        loadJsonAsset();
                        Navigator.pop(context, '2019-1');
                      },
                    ),
                    CupertinoActionSheetAction(
                      child: const Text('2019-2'),
                      onPressed: () {
                        _json = 'json/flutterAdventCalender2019-2.json';
                        loadJsonAsset();
                        Navigator.pop(context, '2019-2');
                      },
                    ),
                  ],
                );
              });
          },
          child: Text('menu'),
        ),
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
                // child: Image.network(issue.profileImageUrl,
                //   width: 70,),
                // child: Container(width: 70,)
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Material(  //for InkWell
                      type: MaterialType.transparency,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) => MyCupertinoWebView(
                                url: issue.url,
                              ),
                            ),
                          );
                        },
                        child: Text(issue.title, 
                          style: _buildTextStyle(),),
                      ),
                    ),
                    Text(issue.createdAt + ' ' + issue.id, style: _buildSubTitleTextStyle(),),
                    // Row(
                    //   children: <Widget>[
                    //     // Text(issue.likesCount + ' likes', style: _buildSubTitleTextStyle(),),
                    //     Text('999' + ' likes', style: _buildSubTitleTextStyle(),),
                    //   ],
                    // ),
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

var myValue;

class Item {
   Item({
     this.title,
     this.profileImageUrl,
     this.id,
     this.createdAt,
     this.url,
   });

   final String title;
   final String profileImageUrl;
   final String id;
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

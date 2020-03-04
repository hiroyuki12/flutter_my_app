import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'DarkModeColor.dart';
import 'CupertinoWebView.dart';

class CupertinoQiita2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoQiita(
      
    );
  }
}

class CupertinoQiita extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<CupertinoQiita> {
  var tags = 'flutter';
  var tagsTrends = 'trends';
  var tagsFlutter = 'flutter';
  int page = 1;
  @override
  void initState() {
    super.initState();
    _load(tags, page);
  }

  Future<void> _load(String _tags, int _page) async {
    var res;
    if(_tags == tagsTrends) {
      // res = await http.get('http://qiita.com/api/v2/items' + 
      res = await http.get('https://qiita-api.netlify.com/trend.json');
      if(res.statusCode == 200)
      {
        final data = json.decode(res.body);
        setState(() {
          final items = data as List;
          _items.clear();
          items.forEach((dynamic element) {
            final issue = element as Map;
            _items.add(Item(
              title: issue['node']['title'] as String,
              profileImageUrl: issue['node']['author']['profileImageUrl'] as String,
              id: issue['node']['author']['urlName'] as String,
              likesCount: issue['node']['likesCount'].toString() as String,
              createdAt: issue['node']['createdAt'] as String,
              url: 'https://qiita.com/items/' + issue['node']['uuid'] as String,
            ));
          });
        });
      }
    }
    else {
      res = await http.get('https://qiita.com/api/v2/tags/flutter/items?page=' + page.toString() + '&per_page=10');
      if(res.statusCode == 200)
      {
        final data = json.decode(res.body);
        setState(() {
          final items = data as List;
          _items.clear();
          items.forEach((dynamic element) {
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
    }
  }

  @override
  Widget build(BuildContext context) {
    isDarkMode = true;  // switch darkMode
    return CupertinoPageScaffold(
      backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
      navigationBar: CupertinoNavigationBar(
        backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
        middle: Text("CupertinoQiita", style: _buildTextStyle()),
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
                      child: const Text('Next Page'),
                      onPressed: () {
                        page++;
                        _load(tags, page);
                        Navigator.pop(context, 'Next Page');
                      },
                    ),
                    CupertinoActionSheetAction(
                      child: const Text('Next 5Page'),
                      onPressed: () {
                        page += 5;
                        _load(tags, page);
                        Navigator.pop(context, 'Next Page');
                      },
                    ),
                    CupertinoActionSheetAction(
                      child: const Text('Prev Page'),
                      onPressed: () {
                        page--;
                        if(page < 1)  page = 1;
                        _load(tags, page);
                        Navigator.pop(context, 'Prev Page');
                      },
                    ),
                    CupertinoActionSheetAction(
                      child: const Text('Flutter'),
                      onPressed: () {
                        page = 1;
                        tags = tagsFlutter;
                        _load(tags, page);
                        Navigator.pop(context, 'Flutter');
                      },
                    ),
                    CupertinoActionSheetAction(
                      child: const Text('Trends'),
                      onPressed: () {
                        page = 1;
                        tags = tagsTrends;
                        _load(tags, page);
                        Navigator.pop(context, 'Trends');
                      },
                    ),
                  ],
                  // cancelButton: CupertinoActionSheetAction(
                  //   child: const Text('Cancel'),
                  //   isDefaultAction: true,
                  //   onPressed: () {
                  //     Navigator.pop(context, 'Cancel');
                  //   },
                  // ),
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
                child: Image.network(issue.profileImageUrl,
                  width: 70,),
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
                                // url: 'https://www.yahoo.co.jp/',
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
                    Row(
                      children: <Widget>[
                        Text(issue.likesCount + ' likes', style: _buildSubTitleTextStyle(),),
                      ],
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

var myValue;

// Widget _buildPickerButton(BuildContext context) {
//   return CupertinoButton(
//     onPressed: () {
//       showCupertinoModalPopup(
//         context: context,
//         builder: (context) {
//           return Container(
//             height: 300.0,
//             child: CupertinoPicker(
//               onSelectedItemChanged: (value) {myValue = value;},
//               itemExtent: 30.0,
//               children: <Widget>[
//                 Center(child: Text("Next Page")),
//                 Center(child: Text("Prev Page")),
//                 Center(child: Text("--------")),
//                 Center(child: Text("Trends")),
//                 Center(child: Text("Flutter")),
//               ],
//             ),
//           );
//         }
//       );
//     },
//     child: Text("Tap me"),
//   );
// }

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

// var pickerTextStyle = new TextStyle();
// TextStyle _buildSubTitleTextStyle() {
//   return subTitleTextStyle = new TextStyle(
//   fontWeight: FontWeight.w100,
//   decoration: TextDecoration.none,
//   fontSize: 13,
//   color: CupertinoColors.systemYellow,  //black , darkMode=white
//   );
// }
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_app/model/Page.dart';
import 'package:flutter_my_app/repositories/DBProviderQiita.dart';
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
  ScrollController _scrollController;
  bool _isLoading = false;

  List<Item> _items = <Item>[];

  final Page page = Page.newPage();

  int _sqliteSavedPage = 0;
  int _sqlliteSavedPerPage = 0;

  var _tag = 'flutter';
  // var _tag = 'flutterweekly';
  // var _tag = 'vim';
  // var _tag = 'swiftui';

  final _tagsTrends = 'trends';
  final _tagFlutter = 'flutter';
  // final _tagFlutterWeekly = 'flutterweekly';
  // final _tagSwiftUI = 'swiftui';
  final _tagSwift = 'swift';
  int _savedPage = 1;
  int _perPage = 20;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener); // ←追加
    _load(_savedPage, _perPage);
  }

  void _scrollListener() {
    // スクロールを検知したときに呼ばれる
    double positionRate =
        _scrollController.offset / _scrollController.position.maxScrollExtent;
    if (positionRate > 0.99) {
      if (_isLoading == false) {
        _isLoading = true;
        _savedPage++;
        _load(_savedPage, _perPage);
        print('_load');
        print(positionRate);
      }
    } else {
      _isLoading = false;
      print(positionRate);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _load(int _page, int _perPage) async {
    var res;

    if (_tag != _tagsTrends) {
      //Qiita Flutter
      res = await http.get('https://qiita.com/api/v2/tags/' +
          _tag +
          '/items?page=' +
          _page.toString() +
          '&per_page=' +
          _perPage.toString());
      // res = await http.get('https://qiita.com/api/v2/tags/flutterweekly/items?page=' + _page.toString() + '&per_page=' + _perPage.toString());
      // if(res.type == 'rate_limit_exceeded') {
      if (res.statusCode == 400) {
        print('error!  res.statusCode == 400');
        setState(() {
          _savedPage = 0;
        });
        // throw new Error();
      } else if (res.statusCode == 200) {
        final data = json.decode(res.body);
        setState(() {
          final items = data as List;
          // _items.clear();
          items.forEach((dynamic element) {
            final issue = element as Map;
            _items.add(Item(
              title: issue['title'] as String,
              profileImageUrl: issue['user']['profile_image_url'] as String,
              id: issue['user']['id'] as String,
              // likesCount: issue['likes_count'].toString() as String,
              likesCount: issue['likes_count'].toString(),
              createdAt: issue['created_at'] as String,
              url: issue['url'] as String,
              // tags: issue['tags'] as List,
            ));
          });
        });
      } else {
        print('error! res.statusCode=' + res.statusCode.toString());
        setState(() {
          _savedPage = res.statusCode;
        });
      }
    } else if (_tag == _tagsTrends) {
      // Qiita Trends
      res = await http.get('https://qiita-api.netlify.com/trend.json');
      if (res.statusCode == 200) {
        final data = json.decode(res.body);
        setState(() {
          final items = data as List;
          _items.clear();
          items.forEach((dynamic element) {
            final issue = element as Map;
            _items.add(Item(
              title: issue['node']['title'] as String,
              profileImageUrl:
                  issue['node']['author']['profileImageUrl'] as String,
              id: issue['node']['author']['urlName'] as String,
              likesCount: issue['node']['likesCount'].toString(),
              createdAt: issue['node']['createdAt'] as String,
              url: 'https://qiita.com/items/' + issue['node']['uuid'],
            ));
          });
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    _loadSqlitePage();
    isDarkMode = true; // switch darkMode
    return CupertinoPageScaffold(
      backgroundColor:
          isDarkMode ? darkModeBackColor : backColor, //white , darkMode=black
      navigationBar: CupertinoNavigationBar(
        backgroundColor:
            isDarkMode ? darkModeBackColor : backColor, //white , darkMode=black
        middle: Text(
            // "CupertinoQiita Page " +
            _tag +
                " Page " +
                _savedPage.toString() +
                '/' +
                _perPage.toString() +
                'posts/' +
                (((_savedPage - 1) * _perPage) + 1).toString() +
                '~',
            style: _buildTextStyle()),
        trailing: CupertinoButton(
          onPressed: () {
            showCupertinoModalPopup(
                context: context,
                builder: (BuildContext context) {
                  return _buildCupertinoActionSheet();
                });
          },
          child: Text('menu'),
        ),
      ),
      child: ListView.builder(
        controller: _scrollController,
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
                child: Image.network(
                  issue.profileImageUrl,
                  width: 70,
                ),
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Material(
                    //for InkWell
                    type: MaterialType.transparency,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                MyCupertinoWebView(
                                    url: issue.url, title: issue.title),
                          ),
                        );
                      },
                      child: Text(
                        issue.title,
                        style: _buildTextStyle(),
                      ),
                    ),
                  ),
                  Text(
                    issue.createdAt + ' ' + issue.id,
                    style: _buildSubTitleTextStyle(),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        issue.likesCount + ' likes',
                        style: _buildSubTitleTextStyle(),
                      ),
                    ],
                  ),
                  // Text(
                  //   // issue.tags.length == 1 ? issue.tags[0][0] : "",
                  //   issue.tags.name,
                  // ),
                ],
              )),
            ],
          );
        },
      ),
    );
  } //build

  void _saveSqlitePage() async {
    page.page = _savedPage;
    page.perPage = _perPage;

    DBProviderQiita.db.deletePage('1');
    DBProviderQiita.db.createPage(page);
    //DBProviderQiita.db.updatePage(page);

    _sqliteSavedPage = _savedPage;
    _sqlliteSavedPerPage = _perPage;

    print('_saveSqlitePage() _sqliteSavedPage $_sqliteSavedPage');
  }

  void _loadSqlitePage() async {
    List<Page> _pages = <Page>[];

    _pages = await DBProviderQiita.db.getAllPage();

    if (_pages.length > 0) {
      _sqliteSavedPage = _pages[0].page;
      _sqlliteSavedPerPage = _pages[0].perPage;
    }

    print('_loadSqlitePage() _sqliteSavedPage $_sqliteSavedPage');
  }

  Widget _buildCupertinoActionSheet() {
    return CupertinoActionSheet(
      //title: const Text('選択した項目が画面に表示されます'),
      actions: <Widget>[
        CupertinoActionSheetAction(
          child: const Text('Clear'),
          onPressed: () {
            // _savedPage++;
            // _load(tags, _savedPage, _perPage);
            setState(() {
              _items.clear();
            });
            Navigator.pop(context, 'Clear');
          },
        ),
        CupertinoActionSheetAction(
          child: const Text('Flutter/Swift'),
          onPressed: () {
            _items.clear();
            // _savedPage = 1;
            _perPage = 20;
            if (_tag == _tagFlutter)
              _tag = _tagSwift;
            else
              _tag = _tagFlutter;
            _load(_savedPage, _perPage);
            Navigator.pop(context, 'Flutter/Swift');
          },
        ),
        CupertinoActionSheetAction(
          child: const Text('Next Page'),
          onPressed: () {
            _savedPage++;
            _load(_savedPage, _perPage);
            Navigator.pop(context, 'Next Page');
          },
        ),
        // CupertinoActionSheetAction(
        //   child: const Text('Next 5Page'),
        //   onPressed: () {
        //     _savedPage += 5;
        //     _load(_savedPage, _perPage);
        //     Navigator.pop(context, 'Next 5Page');
        //   },
        // ),
        CupertinoActionSheetAction(
          child: const Text('Prev Page'),
          onPressed: () {
            _savedPage--;
            if (_savedPage < 1) _savedPage = 1;
            _load(_savedPage, _perPage);
            Navigator.pop(context, 'Prev Page');
          },
        ),
        // CupertinoActionSheetAction(
        //   child: const Text('Prev 5Page'),
        //   onPressed: () {
        //     _savedPage -= 5;
        //     if (_savedPage < 1) _savedPage = 1;
        //     _load(_savedPage, _perPage);
        //     Navigator.pop(context, 'Prev 5Page');
        //   },
        // ),
        // CupertinoActionSheetAction(
        //   child: const Text('Swift page70/100posts'),
        //   onPressed: () {
        //     _savedPage = 70; //max (100page, 10item) (15page, 100item)
        //     _perPage = 100;
        //     _tag = _tagSwift;
        //     _load(_savedPage, _perPage);
        //     Navigator.pop(context, 'Flutter page70/100posts');
        //   },
        // ),
        // CupertinoActionSheetAction(
        //   child: const Text('Flutter page71/20posts'),
        //   onPressed: () {
        //     _savedPage = 71; //max 100page
        //     _perPage = 20; //max 100item
        //     _tag = _tagFlutter;
        //     _load(_savedPage, _perPage);
        //     Navigator.pop(context, 'Flutter');
        //   },
        // ),
        CupertinoActionSheetAction(
          child: const Text('Swift page1/20posts'),
          onPressed: () {
            _items.clear();
            _savedPage = 1;
            _perPage = 20;
            _tag = _tagSwift;
            _load(_savedPage, _perPage);
            Navigator.pop(context, 'Swift');
          },
        ),
        CupertinoActionSheetAction(
          child: const Text('Flutter page1/20posts'),
          onPressed: () {
            _items.clear();
            _savedPage = 1;
            _perPage = 20;
            _tag = _tagFlutter;
            _load(_savedPage, _perPage);
            Navigator.pop(context, 'Flutter');
          },
        ),
        // CupertinoActionSheetAction(
        //   child: const Text('Trends'),
        //   onPressed: () {
        //     _items.clear();
        //     _savedPage = 1;
        //     _perPage = 20;
        //     _tag = _tagsTrends;
        //     _load(_savedPage, _perPage);
        //     Navigator.pop(context, 'Trends');
        //   },
        // ),
        // CupertinoActionSheetAction(
        //   child: const Text('Flutter Weekly'),
        //   onPressed: () {
        //     _items.clear();
        //     _savedPage = 1;
        //     _perPage = 20;
        //     _tag = _tagFlutterWeekly;
        //     _load(_savedPage, _perPage);
        //     Navigator.pop(context, 'Flutter Weekly');
        //   },
        // ),
        CupertinoActionSheetAction(
          child: Text('Save Flutter Page ! ' + _savedPage.toString()),
          onPressed: () {
            _saveSqlitePage();
            Navigator.pop(context, 'Flutter');
          },
        ),
        CupertinoActionSheetAction(
          child: Text('Load Flutter Page !' + _sqliteSavedPage.toString()),
          onPressed: () {
            _loadSqlitePage();

            if (_sqliteSavedPage != 0) {
              _items.clear();
              _savedPage = _sqliteSavedPage;
              _load(_sqliteSavedPage, _sqlliteSavedPerPage);
            } else {
              print('_sqliteSavedPage=0');
            }
            Navigator.pop(context, 'Flutter');
          },
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        child: const Text('Cancel'),
        isDefaultAction: true,
        onPressed: () {
          Navigator.pop(context, 'Cancel');
        },
      ),
    );
  }
} //state

var myValue;

class Item {
  Item({
    this.title,
    this.profileImageUrl,
    this.id,
    this.likesCount,
    this.createdAt,
    this.url,
    this.tags,
  });

  final String title;
  final String profileImageUrl;
  final String id;
  final String likesCount;
  final String createdAt;
  final String url;
  final Tag tags;
}

class Tag {
  Tag({
    this.name,
    this.versions,
  });

  final String name;
  final String versions;
}

var myTextStyle = new TextStyle();
TextStyle _buildTextStyle() {
  return myTextStyle = new TextStyle(
    fontWeight: FontWeight.w100,
    decoration: TextDecoration.none,
    fontSize: 16,
    color: isDarkMode ? darkModeForeColor : foreColor, //black , darkMode=white
  );
}

var subTitleTextStyle = new TextStyle();
TextStyle _buildSubTitleTextStyle() {
  return subTitleTextStyle = new TextStyle(
    fontWeight: FontWeight.w100,
    decoration: TextDecoration.none,
    fontSize: 13,
    color: CupertinoColors.systemYellow, //black , darkMode=white
  );
}

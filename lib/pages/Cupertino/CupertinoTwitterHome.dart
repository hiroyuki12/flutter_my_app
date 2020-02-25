import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

const button_size = 17.0;

class CupertinoTwitterHome extends StatelessWidget {
  final titleTextStyle = new TextStyle(
    fontWeight: FontWeight.w100,
    decoration: TextDecoration.none,
    fontSize: 18,
    color: CupertinoColors.black);

  @override
  Widget build(BuildContext context) {
    var _homeListItems = List<HomeListItem>.generate(
      8,
      (i) => HomeListItem(),
    );
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        // leading: Icon(Icons.account_circle, size: 40.0, color: const Color(0xff26a7de)),
        // leading: Icon(Icons.account_circle, size: 40.0, color: const Color(0xff00aaee)),
        leading: Icon(Icons.account_circle, size: 40.0, color: const Color(0xff888888)),
        middle: Text('Home', style: titleTextStyle,),
        trailing: Icon(Icons.star_border, size:25.0, color: Colors.blue),
      ),
      child: ListView.builder(
        itemCount: _homeListItems.length,
        itemBuilder: (context, index) {
          return _homeListItems[index];
        }),
    );
  }
}

class HomeListItem extends StatelessWidget {
  final myTextStyle = new TextStyle(
    fontWeight: FontWeight.w300,
    decoration: TextDecoration.none,
    fontSize: 13,
    color: CupertinoColors.black
  );

  final myBoldTextStyle = new TextStyle(
    fontWeight: FontWeight.w700,
    decoration: TextDecoration.none,
    fontSize: 13,
    color: CupertinoColors.black
  );

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 0.1,
              color: Colors.grey,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(15.0, 12.0, 10.0, 10.0),
            child: Container(
              height: 65.0,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // Icon(Icons.account_circle, size: 55.0, color: const Color(0xff00aaee)),
                        Icon(Icons.account_circle, size: 55.0, color: const Color(0xff888888)),
                        //Expanded(child: Container()),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          child: Text(
                                            'あいうえおかきくけ  ',
                                            // style: TextStyle(
                                            //     fontSize: 15.0,
                                            //     fontWeight: FontWeight.bold),
                                            style: myBoldTextStyle,
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            '@abcdefghijkl ･ 1h', style: myTextStyle,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      child: Wrap(
                                        children: <Widget>[
                                          Text(
                                            'てすとてすとてすとてすとてすとてすと', style: myTextStyle,
                                          ),
                                        ],
                                      ),
                                    ), //contents
                                  ],
                                ),
                              ],
                            ),
                            Icon(
                              Icons.expand_more, color: Colors.grey,
                            )
                          ],
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.chat_bubble_outline,
                                  size: button_size,
                                  color: Colors.grey,
                                ),
                                Text(' 712', style: myTextStyle)
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.transform,
                                  size: button_size,
                                  color: Colors.grey,
                                ),
                                Text(' 29.8K', style: myTextStyle)
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.favorite_border,
                                  size: button_size,
                                  color: Colors.grey,
                                ),
                                Text(' 96.1K', style: myTextStyle)
                              ],
                            ),
                            Icon(
                              Icons.save_alt,
                              size: button_size,
                              color: Colors.grey,
                            ),
                            // Container(),
                            Row(),
                            // Icon(
                            //   Icons.equalizer,
                            //   size: button_size,
                            //   color: Colors.grey,
                            // )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
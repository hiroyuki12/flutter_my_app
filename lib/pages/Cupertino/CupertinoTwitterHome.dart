import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'DarkModeColor.dart';

class CupertinoTwitterHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    isDarkMode = true;  // switch darkMode
    _buildFont();
    var _homeListItems = List<HomeListItem>.generate(
      12,
      (i) => HomeListItem(),
    );
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
        // leading: Icon(Icons.account_circle, size: 40.0, color: const Color(0xff26a7de)),
        // leading: Icon(Icons.account_circle, size: 40.0, color: const Color(0xff00aaee)),
        // leading: Icon(Icons.account_circle, size: 40.0, color: const Color(0xff888888)),
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
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(  //外枠
        color: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
        border: Border.all(
          width: 0.1,
          color: Colors.grey,
        ),
      ),
      child: Container(
        color: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
        height: content_height,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildAvater(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildTopLikedRow(),
                  _buildTopRow(),
                  _buildContents(),
                  _buildImage(),
                  Expanded(
                    child: Container(),
                  ),
                  _buildButtonList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvater() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 5.0, 0.0),
      // child: Icon(Icons.account_circle, size: 50.0, color: const Color(0xff888888)),
      child: FlutterLogo(size: 40.0, style: FlutterLogoStyle.markOnly),
    );
  }

  Widget _buildTopLikedRow() {
    return Row(
      children: <Widget>[
        Text(
          'mnopqrst and 4 others liked', style: myLikedTextStyle,
        ),
      ],
    );
  }

  Widget _buildTopRow() {
    return Row(
      children: <Widget>[
        Container(
          child: Text(
            'こんにちは世界  ',
            style: myBoldTextStyle,
          ),
        ),
        Container(
          child: Text(
            '@abcdefghijkl ･ 1h', style: myIdTextStyle,
          ),
        ),
        Expanded(child: Container()),
        Icon(
          Icons.expand_more, color: Colors.grey,
        ),
      ],
    );
  }

  Widget _buildContents() {
    return Container(
      margin: const EdgeInsets.only(right: 13.0),
      child: Wrap(
        children: <Widget>[
          Text(
            '【世界】てすとてすとてすとてすとてすとてすとてすとてすとてすとてすと', style: myTextStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildImage()
  {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.0),
          topRight: Radius.circular(12.0),
          bottomRight: Radius.circular(12.0),
          bottomLeft: Radius.circular(12.0),
        ),
        child: Align(
          alignment: Alignment.bottomRight,
          heightFactor: 0.7,
          widthFactor: 0.97,
          child: Image.asset(
            'images/lake.jpg',
            width: 480,
            height: 260,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  //Reply, Retweet, Like, Shareボタン の列
  Widget _buildButtonList() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon(
              Icons.chat_bubble_outline,
              size: button_size,
              color: Colors.grey,
            ),
            Text(' 712', style: myNumberTextStyle)
          ],
        ),
        Row(
          children: <Widget>[
            Icon(
              Icons.transform,
              size: button_size,
              color: Colors.grey,
            ),
            Text(' 29.8K', style: myNumberTextStyle)
          ],
        ),
        Row(
          children: <Widget>[
            Icon(
              Icons.favorite_border,
              size: button_size,
              color: Colors.grey,
            ),
            Text(' 96.1K', style: myNumberTextStyle)
          ],
        ),
        Icon(
          Icons.save_alt,
          size: button_size,
          color: Colors.grey,
        ),
        // Container(),
        Row(),
      ],
    );
  }
}



const button_size = 17.0;
const title_font_size = 18.0;
const username_font_size = 15.0;
const text_font_size = 14.0;
const liked_font_size = 13.0;
const id_font_size = 16.0;
const number_font_size = 14.0;
const content_height = 291.0;

TextStyle titleTextStyle = new TextStyle();
TextStyle myTextStyle = new TextStyle();
TextStyle myBoldTextStyle = new TextStyle();
void _buildFont()
{
  myBoldTextStyle = new TextStyle(
    fontWeight: FontWeight.w700,
    decoration: TextDecoration.none,
    fontSize: username_font_size,
    color: isDarkMode ? darkModeForeColor : foreColor,  //black , darkMode=white
  );
  
  myTextStyle = new TextStyle(
    fontWeight: FontWeight.w300,
    decoration: TextDecoration.none,
    fontSize: text_font_size,
    color: isDarkMode ? darkModeForeColor : foreColor,  //black , darkMode=white
  );

  titleTextStyle = new TextStyle(
    fontWeight: FontWeight.w100,
    decoration: TextDecoration.none,
    fontSize: title_font_size,
    color: isDarkMode ? darkModeForeColor : foreColor,  //black , darkMode=white
    );
}

final myIdTextStyle = new TextStyle(
  fontWeight: FontWeight.w400,
  decoration: TextDecoration.none,
  fontSize: id_font_size,
  color: CupertinoColors.systemGrey
);

final myLikedTextStyle = new TextStyle(
  fontWeight: FontWeight.w400,
  decoration: TextDecoration.none,
  fontSize: liked_font_size,
  color: CupertinoColors.systemGrey
);

final myNumberTextStyle = new TextStyle(
  fontWeight: FontWeight.w400,
  decoration: TextDecoration.none,
  fontSize: number_font_size,
  color: CupertinoColors.systemGrey
);
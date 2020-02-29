import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'DarkModeColor.dart';

class CupertinoBuildingLayouts extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<CupertinoBuildingLayouts> {
  @override
  Widget build(BuildContext context) {
    isDarkMode = true;  // switch darkMode
    Widget titleSection   = _buildTitleSection();
    Widget buttonSection  = _buildButtonSection();
    Widget textSection    = _buildTextSection();
    return CupertinoPageScaffold(
      backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
      navigationBar: CupertinoNavigationBar(
        middle: Text("BuildingLayouts", 
          style: _buildFont()),
        // backgroundColor: const Color(0xff333333),
        backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
      ),
      child: Column(
        children: [
            Image.asset(
              'images/lake.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
        ],
      ),
    );
  }
  
  Widget _buildTitleSection() {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  color: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Oeschinen Lake Campground',
                    // style: TextStyle(
                    //   fontWeight: FontWeight.bold,
                    // ),
                    style: _buildTitleStyle(),
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: _subTitleTextStyle,
                ),
              ],
            ),
          ),
          /*3*/
          Icon(
            Icons.star,
            //color: Colors.red[500],
            color: CupertinoColors.systemRed,
          ),
          Text('41',
            style: _buildIconTextStyle(),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonSection() {
    Color buttonColor = Theme.of(context).primaryColor;

    return Container(
      color: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(buttonColor, Icons.call, 'CALL'),
          _buildButtonColumn(buttonColor, Icons.near_me, 'ROUTE'),
          _buildButtonColumn(buttonColor, Icons.share, 'SHARE'),
        ],
      ),
    );
  }

  Widget _buildTextSection() {
    return Container(
      color: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
      padding: const EdgeInsets.all(32),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
            'Alps. Situated 1,578 meters above sea level, it is one of the '
            'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
            'half-hour walk through pastures and pine forest, leads you to the '
            'lake, which warms to 20 degrees Celsius in the summer. Activities '
            'enjoyed here include rowing, and riding the summer toboggan run.',
        style: _buildFont(),
        softWrap: true,
      ),
    );
  }

  Column _buildButtonColumn(Color color,IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
        color: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            // style: TextStyle(
            //   fontSize: 12,
            //   fontWeight:  FontWeight.w400,
            //   color: color,
            // style: iconTextStyle,
            style: _buildIconTextStyle(),
          ),
        )
      ],
    );
  }

}

var _myTextStyle = new TextStyle();
TextStyle _buildFont() {
  return _myTextStyle = new TextStyle(
  fontWeight: FontWeight.w100,
  decoration: TextDecoration.none,
  fontSize: 16,
  // color: CupertinoColors.white
  color: isDarkMode ? darkModeForeColor : foreColor,  //black , darkMode=white
  );
}

var _iconTextStyle = new TextStyle();
TextStyle _buildIconTextStyle() {
  return _iconTextStyle = new TextStyle(
  fontWeight: FontWeight.w100,
  decoration: TextDecoration.none,
  fontSize: 12,
  // color: CupertinoColors.white
  color: isDarkMode ? darkModeForeColor : foreColor,  //black , darkMode=white
  );
}

var _titleTextStyle = new TextStyle();
TextStyle _buildTitleStyle() {
  return _titleTextStyle = new TextStyle(
  fontWeight: FontWeight.w100,
  decoration: TextDecoration.none,
  fontSize: 20,
  // color: CupertinoColors.white
  color: isDarkMode ? darkModeForeColor : foreColor,  //black , darkMode=white
  );
}

TextStyle _subTitleTextStyle = new TextStyle(
  fontWeight: FontWeight.w100,
  decoration: TextDecoration.none,
  fontSize: 16,
  // color: CupertinoColors.white
  color: CupertinoColors.systemBlue,
);
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoBuildingLayouts extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

var titleTextStyle = new TextStyle(
  fontWeight: FontWeight.w100,
  decoration: TextDecoration.none,
  fontSize: 16,
  color: CupertinoColors.white);

var subTtitleTextStyle = new TextStyle(
  fontWeight: FontWeight.w100,
  decoration: TextDecoration.none,
  fontSize: 16,
  color: CupertinoColors.systemBlue);

var bodyTextStyle = new TextStyle(
  fontWeight: FontWeight.w100,
  decoration: TextDecoration.none,
  fontSize: 15,
  color: CupertinoColors.white);

var iconTextStyle = new TextStyle(
  fontWeight: FontWeight.w100,
  decoration: TextDecoration.none,
  fontSize: 13,
  color: CupertinoColors.white);


class _State extends State<CupertinoBuildingLayouts> {
  Widget _buildTitleSection = Container(
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
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  'Oeschinen Lake Campground',
                  // style: TextStyle(
                  //   fontWeight: FontWeight.bold,
                  // ),
                  style: titleTextStyle,
                ),
              ),
              Text(
                'Kandersteg, Switzerland',
                // style: TextStyle(
                //   color: Colors.grey[500],
                // ),
                style: subTtitleTextStyle,
              ),
            ],
          ),
        ),
        /*3*/
        Icon(
          Icons.star,
          color: Colors.red[500],
        ),
        Text('41',
          style: iconTextStyle,),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    Widget titleSection = _buildTitleSection;
    Color color = Theme.of(context).primaryColor;
    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.call, 'CALL'),
          _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
          _buildButtonColumn(color, Icons.share, 'SHARE'),
        ],
      ),
    );
    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
            'Alps. Situated 1,578 meters above sea level, it is one of the '
            'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
            'half-hour walk through pastures and pine forest, leads you to the '
            'lake, which warms to 20 degrees Celsius in the summer. Activities '
            'enjoyed here include rowing, and riding the summer toboggan run.',
        style: bodyTextStyle,
        softWrap: true,
      ),
    );

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("BuildingLayouts", 
          //style: new TextStyle(color: CupertinoColors.white)),
          style: titleTextStyle),
        backgroundColor: const Color(0xff333333),
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
  
Column _buildButtonColumn(Color color,IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, color: color),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          label,
          // style: TextStyle(
          //   fontSize: 12,
          //   fontWeight:  FontWeight.w400,
          //   color: color,
          style: iconTextStyle,
        ),
      )
    ],
  );
}

}

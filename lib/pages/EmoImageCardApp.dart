import 'package:flutter/material.dart';

void main() => runApp(EmoImageCardApp());

class EmoImageCardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'emoi card',
      home: Scaffold(
        appBar: AppBar(
          title: Text('エモい感じで画像表示するやつ'),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 64.0, bottom: 64.0),
          child: PageView(
            controller: PageController(viewportFraction: 0.85),
            children: List.generate(5, (i) => _emoImage(i)),
          ),
        ),
      ),
    );
  }

  Padding _emoImage(page) {
    bool favorited = page % 2 == 0 ? true : false;
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black45,
                blurRadius: 4.0,
                spreadRadius: 2.0,
                offset: Offset(0.0, 4.0),
              ),
            ],
            image: DecorationImage(
                image: NetworkImage('http://picsum.photos/800/1400'),
                fit: BoxFit.fitWidth)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(
                favorited ? Icons.favorite : Icons.favorite_border,
                color: favorited ? Colors.red : Colors.white54,
              ),
              iconSize: 48.0,
              padding: EdgeInsets.all(16.0),
              onPressed: null,
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'satsueisha',
                style: TextStyle(color: Colors.white54, fontSize: 32.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
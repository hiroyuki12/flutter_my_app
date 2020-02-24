import 'package:flutter/material.dart';
import 'Picture_card.dart';

class MyCard extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MyCard> {
  var _cardList = List<PictureCard>();

  @override
  void initState() {
    _cardList.add(PictureCard(
      'Torrance Beach',
      'The best beach in Torrance',
      // 'torrance-beach.jpg',
      'lake.jpg',
    ));
    _cardList.add(PictureCard(
      'Shake Shack',
      'American fast casual restaurant',
      // 'shake-shack.jpg',
      'lake.jpg',
    ));
    _cardList.add(PictureCard(
      'The Hat',
      'The best pastrami dip sandwich',
      // 'the-hat.jpg',
      'lake.jpg',
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Card"),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: _cardList.length,
          itemBuilder: (BuildContext context, int index) {
            return _cardList[index];
          },
        ),
      ),
    );
  }
}

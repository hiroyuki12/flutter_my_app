import 'package:flutter/cupertino.dart';

class MyCupertinoGridView extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MyCupertinoGridView> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("CupertinoGridView", style: new TextStyle(color: CupertinoColors.white)),
        backgroundColor: const Color(0xff333333),
      ),
      child: Center(
        child: _buildGrid(),
      ),
    );
  }

  Widget _buildGrid() => GridView.extent(
    maxCrossAxisExtent: 150,
    padding: const EdgeInsets.all(4),
    mainAxisSpacing: 4,
    crossAxisSpacing: 4,
    children: _buildGridTileList(30));

    // The images are saved with names pic0.jpg, pic1.jpg...pic29.jpg.
    // The List.generate() constructor allows an easy way to create
    // a list when objects have a predictable naming pattern.
    List<Container> _buildGridTileList(int count) => List.generate(
        count, (i) => Container(child: Image.asset('images/lake.jpg')));
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoremPicsum extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class Item {
   Item({
     this.author,
     this.downloadUrl,
   });

   final String author;
   final String downloadUrl;
 }

class _State extends State<LoremPicsum> {
  List<Item> _items = <Item>[];
  @override
  void initState() {
    super.initState();
    _load();
  }
  
  // This widget is the root of your application.
  Future<void> _load() async {
    final res = await http.get('https://picsum.photos/v2/list?page=2&limit=20');
    final data = json.decode(res.body);
    setState(() {
      final issues = data as List;
      issues.forEach((dynamic element) {
        final item = element as Map;
        _items.add(Item(
          author: item['author'] as String,
          downloadUrl: item['download_url'] as String,
        ));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var list = [
      _photoItem(_items[0].downloadUrl, _items[0].author),
      _photoItem(_items[1].downloadUrl, _items[1].author),
      _photoItem(_items[2].downloadUrl, _items[2].author),
      _photoItem(_items[3].downloadUrl, _items[3].author),
      _photoItem(_items[4].downloadUrl, _items[4].author),
      _photoItem(_items[5].downloadUrl, _items[5].author),
      _photoItem(_items[6].downloadUrl, _items[6].author),
      _photoItem(_items[7].downloadUrl, _items[7].author),
      _photoItem(_items[8].downloadUrl, _items[8].author),
      _photoItem(_items[9].downloadUrl, _items[9].author),
      _photoItem(_items[10].downloadUrl, _items[10].author),
      _photoItem(_items[11].downloadUrl, _items[11].author),
      _photoItem(_items[12].downloadUrl, _items[12].author),
      _photoItem(_items[13].downloadUrl, _items[13].author),
      _photoItem(_items[14].downloadUrl, _items[14].author),
      _photoItem(_items[15].downloadUrl, _items[15].author),
      _photoItem(_items[16].downloadUrl, _items[16].author),
      _photoItem(_items[17].downloadUrl, _items[17].author),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Lorem Picsum"),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        children: list
      )
    );
  }

  Widget _photoItem(String image, String author) {
    var assetsImage = image;
    return Container(
      //decoration: BoxDecoration(color: Colors.grey),
      child: Image.network(assetsImage, fit: BoxFit.cover,),
    );
  }

  // Widget _photoItem(String image, String author) {
  //   var assetsImage = image;
  //   return Stack(
  //     alignment: const Alignment(1.0, 1.0),
  //     children: [
  //       // Image.network(assetsImage, fit: BoxFit.cover,),
  //       Image.network(assetsImage, ),
  //       Container(
  //         decoration: BoxDecoration(color: Colors.grey),
  //         //child: Image.network(assetsImage, fit: BoxFit.cover,),
  //         child: Text(author,
  //         // style: TextStyle(
  //         //   // fontSize: 20,
  //         //   // fontWeight: FontWeight.bold,
  //         //   // color: Colors.white,
  //         // ),
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
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
     this.download_url,
   });

   final String author;
   final String download_url;
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
          download_url: item['download_url'] as String,
        ));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lorem Picsum"),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          if (index >= _items.length) {
            return null;
          }

          final item = _items[index];
          return ListTile(
            leading: Image.network(item.download_url),
            title: Text(item.author),
          );
        },
      ),
    );
  }
}
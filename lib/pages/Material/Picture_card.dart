import 'package:flutter/material.dart';

class PictureCard extends StatelessWidget {

  final String _name;
  final String _desc;
  final String _picture;

  PictureCard(this._name, this._desc, this._picture);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.map),
            title: Text(_name),
            subtitle: Text(_desc),
          ),
          //Image.asset('assets/$_picture'),
          Image.asset('images/$_picture'),
          ButtonTheme.bar(
            child: ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: const Text('DIRECTION'),
                  onPressed: () {},
                ),
                FlatButton(
                  child: const Text('MAP'),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';

class Header extends StatelessWidget with PreferredSizeWidget{
 @override
 Size get preferredSize => Size.fromHeight(kToolbarHeight);

 @override
 Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        //padding: const EdgeInsets.all(8.0),
        //padding: const EdgeInsets.only(top: 8.0),
        padding: const EdgeInsets.only(top: 10.0, right: 20.0, bottom: 30.0, left: 40.0),
        child: Icon(Icons.settings),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.add),
        ),
      ],
      title: Text('LayoutHeader'),
    );
  }
}
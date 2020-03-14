import 'package:flutter/cupertino.dart';
import '../../contents.dart';
import 'DarkModeColor.dart';

class CupertinoMonitoringScroll extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<CupertinoMonitoringScroll> {
  ScrollController _scrollController;
  bool _isLoading = false;

  List<String> _items;

  @override
  void initState() {
    _items = List<String>();
    Contents.forEach((content) => _items.add(content));

    _scrollController = ScrollController();
    _scrollController.addListener(() {
      final maxScrollExtent = _scrollController.position.maxScrollExtent;
      final currentPosition = _scrollController.position.pixels;
      if (maxScrollExtent > 0 &&
          (maxScrollExtent - 20.0) <= currentPosition) {
        _addContents();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    isDarkMode = true;  // switch darkMode
    return CupertinoPageScaffold(
      backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
      navigationBar: CupertinoNavigationBar(
        backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
        middle: Text("Cupertino Monitoring Scroll", style: _buildTextStyle()),
        //trailing: Text("Edit", style: myTextStyle),
      ),
      child: Center(
        child:  ListView.builder(
          controller: _scrollController,
          itemBuilder: (context, index) {
            return _buildListItem(_items[index]);
          },
          itemCount: _items.length,
        ),
      ),
    );
  }

  Widget _buildListItem(String content) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(12.0),
      child: Text(content, style: myTextStyle,),
    );
  }

  _addContents() {
    if (_isLoading) {
      return;
    }
    _isLoading = true;
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        Contents.forEach((content) => _items.add(content));
      });
      _isLoading = false;
    });
  }
}

var myTextStyle = new TextStyle();
TextStyle _buildTextStyle() {
  return myTextStyle = new TextStyle(
  fontWeight: FontWeight.w100,
  decoration: TextDecoration.none,
  fontSize: 16,
  color: isDarkMode ? darkModeForeColor : foreColor,  //black , darkMode=white
  );
}

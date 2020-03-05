import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

import 'DarkModeColor.dart';


class CupertinoCamera extends StatefulWidget {
  CupertinoCamera({Key key, this.title}) : super(key: key);

  // タイトル
  final String title;

  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<CupertinoCamera> {
  //カメラリスト
  List<CameraDescription> _cameras;

  //カメラコントローラ
  CameraController _controller;
  
  //
  double _aspectRatio = 1.0;

  @override
  void initState() {
    super.initState();

    initCamera();
  }

  //
  // カメラを準備
  //
  initCamera() async {
    _cameras = await availableCameras();

    if (_cameras.length != 0) {
      _controller = CameraController(_cameras[0], ResolutionPreset.high);
      _controller.initialize().then((_) {
        if (!mounted) {
          return;
        }

        //カメラ接続時にbuildするようsetStateを呼び出し
        setState(() {});
      });
    }
  }

  //
  // カメラの表示比率を変更する
  //
  _toggle() {
    setState(() {
      _aspectRatio = _aspectRatio == 1.0 ? 0.7 : 1.0;
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size.width;
    isDarkMode = true;  // switch darkMode
    return CupertinoPageScaffold(
      backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
      navigationBar: CupertinoNavigationBar(
        backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
        middle: Text("Cupertino Camera", style: _buildTextStyle()),
        trailing: RaisedButton(onPressed: _toggle(), 
          child: Text("Toggle", style: _buildTextStyle()),) 
      ),
      child: _controller != null && _controller.value.isInitialized
        ? AspectRatio(
        aspectRatio:
        _controller.value.aspectRatio,
        child: CameraPreview(_controller)) : Container(),
      /*child: Container(
        alignment: Alignment.center,
        child: AspectRatio(
          aspectRatio: _aspectRatio,
          child: FittedBox(
            alignment: Alignment.center,
            fit: BoxFit.fitWidth,
            child: _controller != null && _controller.value.isInitialized
              ? Container(
                  width: size,
                  height: size / _controller.value.aspectRatio,
                  child: CameraPreview(_controller))
              : Container(),
          ),
        ),
      ),*/


    );
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

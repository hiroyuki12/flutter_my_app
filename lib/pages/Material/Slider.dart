import 'package:flutter/material.dart';

class MySlider extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MySlider> {
  var _sliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Slider"),
      ),
      body: Center(
        child: Slider(
          value: _sliderValue,
          min: 0,
          max: 100,
          divisions: 5,
          onChanged: (double value) {
            setState(() {
              _sliderValue = value.roundToDouble();
              print(_sliderValue);
            });
          },
        ),
      ),
    );
  }
}

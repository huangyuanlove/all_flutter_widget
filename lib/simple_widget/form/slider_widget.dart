import 'package:flutter/material.dart';

class SliderWidget extends StatefulWidget {
  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SliderWidget"),
      ),
      body: ListView(
        children: <Widget>[
          DefaultSlider(),
          CustomSliderTheme(),
        ],
      ),
    );
  }
}

class DefaultSlider extends StatefulWidget {
  @override
  _DefaultSliderState createState() => _DefaultSliderState();
}

class _DefaultSliderState extends State<DefaultSlider> {
  double value = 0;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: value,
      onChanged: (value) {
        setState(() {
          this.value = value;
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("value $value")));
          print("DefaultSlider value $value");
        });
      },
    );
  }
}

class CustomSliderTheme extends StatefulWidget {
  @override
  _CustomSliderThemeState createState() => _CustomSliderThemeState();
}

class _CustomSliderThemeState extends State<CustomSliderTheme> {
  double value = 0;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTickMarkColor: Colors.yellowAccent,
        activeTrackColor: Colors.yellowAccent,
        //实际进度的颜色
//                inactiveTickMarkColor:Colors.black
        thumbColor: Colors.black,
        //滑块中心的颜色
        inactiveTrackColor: Colors.red,
        //默 认进度条的颜色
        valueIndicatorColor: Colors.blue,
        //提示进度的气派的背景色
        valueIndicatorTextStyle: TextStyle(
          //提示气泡里面文字的样式
          color: Colors.white,
        ),
        inactiveTickMarkColor: Colors.blue,
        //divisions对进度线分割后 断续线中间间隔的颜色
        overlayColor: Colors.pink, //滑块边缘颜色
      ),
      child: Slider(
          value: value,
          divisions: 10,
          min: 0.0,
          max: 100.0,
          onChanged: (value) {
            setState(() {
              this.value = value;
              print("CustomSliderTheme value $value");
            });
          }),
    );
  }
}

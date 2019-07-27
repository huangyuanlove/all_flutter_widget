import 'package:flutter/material.dart';

class GridViewWidget extends StatefulWidget {
  @override
  _GridViewWidgetState createState() => _GridViewWidgetState();
}

class _GridViewWidgetState extends State<GridViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GridViewWidget"),
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          ///列数
          crossAxisCount: 3,

          ///列间距
          mainAxisSpacing: 10.0,

          ///横轴距离
          crossAxisSpacing: 4.0,

          ///缩放比例
          childAspectRatio: 1.3,
        ),
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        children: <Widget>[
          Image.network(
              'https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png',
              scale: 1,
              fit: BoxFit.cover),
          Image.network(
              'https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png',
              scale: 1,
              fit: BoxFit.cover),
          Image.network(
              'https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png',
              scale: 1,
              fit: BoxFit.cover),
          Image.network(
              'https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png',
              scale: 1,
              fit: BoxFit.cover),
          Image.network(
              'https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png',
              scale: 1,
              fit: BoxFit.cover),
          Image.network(
              'https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png',
              scale: 1,
              fit: BoxFit.cover),
        ],
      ),
    );
  }
}

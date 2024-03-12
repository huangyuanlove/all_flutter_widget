import 'package:flutter/material.dart';

class GridTileWidget extends StatefulWidget {
  @override
  _GridTileWidgetState createState() => _GridTileWidgetState();
}

class _GridTileWidgetState extends State<GridTileWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GridTitleWidget"),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: <Widget>[
          GridTile(
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Text("GridTile child",
                  style: TextStyle(backgroundColor: Colors.amber)),
            ),
            header: Text(
              "GridTileHeader",
              style: TextStyle(backgroundColor: Colors.pink),
            ),
            footer: Text(
              "GridTileFooter",
              style: TextStyle(backgroundColor: Colors.blue),
            ),
          ),
          GridPaper(
            color: Colors.red,
            child: Image.network(
                'https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png',
                scale: 1,
                fit: BoxFit.cover),
          ),
          GridTile(
            header: GridTileBar(
              backgroundColor: Colors.blueAccent,
              title: Text('title'),
              subtitle: Text('subtitle'),
              leading: Icon(Icons.add),
              trailing: Text("trailing"),
            ),
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 80, 0, 0),
              child: Text("GridTile child",
                  style: TextStyle(backgroundColor: Colors.amber)),
            ),
            footer: Text(
              "GridTileFooter",
              style: TextStyle(backgroundColor: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}

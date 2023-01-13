import 'package:flutter/material.dart';

class TestSmallWidget extends StatefulWidget {
  @override
  TestSmallWidgetState createState() {
    return TestSmallWidgetState();
  }
}

class TestSmallWidgetState extends State<TestSmallWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text("CustomScrollView"),
              background: Image.asset(
                "assets/image/pic.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.cyan[100 * (index % 9)],
                    child: new Text('grid item $index'),
                  );

                },
                childCount: 20),

                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 4.0,
                )),
          ),
          SliverFixedExtentList(delegate: SliverChildBuilderDelegate((BuildContext context,int index){
            return new Container(
              alignment: Alignment.center,
              color: Colors.lightBlue[100 * (index % 9)],
              child: new Text('list item $index'),
            );
          },
            childCount: 50
          ), itemExtent: 50.0)
        ],
      ),
    );
  }
}

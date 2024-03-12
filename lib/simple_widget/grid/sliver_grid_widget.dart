import 'package:flutter/material.dart';

class SliverGridWidget extends StatefulWidget {
  @override
  _SliverGridWidgetState createState() => _SliverGridWidgetState();
}

class _SliverGridWidgetState extends State<SliverGridWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SliverGridWidget"),
      ),
      body: CustomScrollView(
          slivers:<Widget>[
            SliverGrid(
              gridDelegate:  SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300.0,
                mainAxisSpacing: 20.0,
                crossAxisSpacing: 20.0,
                childAspectRatio: 6.0,
              ),
              delegate:  SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return  Container(
                    alignment: Alignment.center,
                    color: Colors.cyan[100 * (index % 5)],
                    child:  Text('grid item $index'),
                  );
                },
                childCount: 100,
              ),
            ),
            SliverGrid(
              gridDelegate:  SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 4.0,
              ),
              delegate:  SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return  Container(
                    alignment: Alignment.center,
                    color: Colors.cyan[100 * (index % 5)],
                    child:  Text('grid item $index'),
                  );
                },
                childCount: 100,
              ),
            ),


          ],
      ),



    );
  }
}

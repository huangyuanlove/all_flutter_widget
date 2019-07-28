import 'package:flutter/material.dart';

class ScrollPhysicsWidget extends StatefulWidget {
  @override
  _ScrollPhysicsState createState() => _ScrollPhysicsState();
}

class _ScrollPhysicsState extends State<ScrollPhysicsWidget> {
  final PageController _pageController = PageController();
  double _currentPage = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ScrollPhysics"),
      ),
      body: Container(
        height: 300.0,
        width: MediaQuery.of(context).size.width,
        child: LayoutBuilder(
          builder: (context, constraints) => NotificationListener(
            onNotification: (ScrollNotification note) {
              setState(() {
                _currentPage = _pageController.page;
              });
            },
            child: PageView.custom(
              physics: const PageScrollPhysics(
                  parent: const BouncingScrollPhysics()),
              controller: _pageController,
              childrenDelegate: SliverChildBuilderDelegate(
                    (context, index) => _SimplePage(
                  '$index',
                  parallaxOffset:
                  constraints.maxWidth / 2.0 * (index - _currentPage),
                  // 小字 Text 在页面滑动时要比整体移动速度快一倍，所以小字的 translate X 为 \tt{pageWidth / 2 * progress} 。
                ),
                childCount: 10,
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class _SimplePage extends StatelessWidget {
  _SimplePage(this.data, {Key key, this.parallaxOffset = 0.0})
      : super(key: key);

  final String data;
  final double parallaxOffset;

  @override
  Widget build(BuildContext context) =>  Center(
    child: Container(
      color: Theme.of(context).primaryColor,
      child:  Center(
        child:  Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              data,
              style: const TextStyle(fontSize: 60.0,color: Colors.white),
            ),
            SizedBox(height: 40.0),
            Transform(
              transform:
              Matrix4.translationValues(parallaxOffset, 0.0, 0.0),
              child: const Text('左右滑动，这是第二行滚动速度更快的小字',style: const TextStyle(fontSize: 16.0,color: Colors.white),),
            ),
          ],
        ),
      ),
    ),
  );
}
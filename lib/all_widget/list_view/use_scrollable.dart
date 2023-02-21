import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'item_box.dart';

class UseScrollable extends StatefulWidget {
  const UseScrollable({Key? key}) : super(key: key);

  @override
  State<UseScrollable> createState() => _UseScrollableState();
}

class _UseScrollableState extends State<UseScrollable> {
  final List<int> data = List.generate(60, (index) => index + 1);
  final List<ItemBox> itemBoxList =
      List.generate(60, (index) => ItemBox(index: index));
  final ScrollController _scrollController = ScrollController();
  double anchor = 0.2;

  final Key _key = UniqueKey();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      // if(_scrollController.offset == 0 && anchor!=0){
      //   setState((){
      //     anchor = 0;
      //   });
      // }

      print(
          "offset-> ${_scrollController.offset} position->  ${_scrollController.position}");
    });
  }

  Widget _buildSliverList() {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      _buildItemByIndex,
      childCount: data.length,
    ));
  }

  Widget _buildItemByIndex(BuildContext context, int index) {
    return ItemBox(
      index: data[index],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("use scrollable"),
      ),
      body: Scrollable(
          physics: BouncingScrollPhysics(),
          controller: _scrollController,
          viewportBuilder: (BuildContext context, ViewportOffset position) {
            return Viewport(
              center: _key,
              // anchor: anchor,
              offset: position,
              slivers: [

                SliverToBoxAdapter(

                  child: Container(
                    height: 60,
                    color: Colors.amber,
                    child:ListView(
                      children: itemBoxList,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ),

                SliverPadding(
                  key: _key,
                  padding: EdgeInsets.all(8),
                  sliver: _buildSliverGrid(),
                ),
                _buildSliverList()],
            );
          }),
    );
  }
  Widget _buildSliverGrid() {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        _buildItemByIndex,
        childCount: 58,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        childAspectRatio: 1,
        mainAxisSpacing: 8,
      ),
    );
  }
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

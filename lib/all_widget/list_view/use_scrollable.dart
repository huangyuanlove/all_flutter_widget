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
  final List<ItemBox> itemBoxList = List.generate(60, (index) => ItemBox(index: index));
  final ScrollController _scrollController = ScrollController();
  
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      print("offset-> ${_scrollController.offset} position->  ${_scrollController.position}");
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
      appBar: AppBar(title: Text("use scrollable"),),
      body: Scrollable(
          controller: _scrollController,
          viewportBuilder: (BuildContext context, ViewportOffset position) {
            return Viewport(
              offset: position,
              slivers: [
                _buildSliverList()
              ],
            );
          }),
    );
  }
  @override
  void dispose() {
   _scrollController.dispose();
    super.dispose();
  }
}



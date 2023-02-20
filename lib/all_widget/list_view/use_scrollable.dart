import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'item_box.dart';

class UseScrollable extends StatelessWidget {
   UseScrollable({Key? key}) : super(key: key);


  final List<int> data = List.generate(60, (index) => index + 1);
  final List<ItemBox> itemBoxList = List.generate(60, (index) => ItemBox(index: index));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("use scrollable"),),
        body: Scrollable(

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

}

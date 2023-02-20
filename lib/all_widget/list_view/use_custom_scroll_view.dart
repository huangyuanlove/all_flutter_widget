import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'item_box.dart';

class UseCustomScrollView extends StatelessWidget {
  UseCustomScrollView({Key? key}) : super(key: key);

  final List<int> data = List.generate(60, (index) => index + 1);
  final List<ItemBox> itemBoxList = List.generate(60, (index) => ItemBox(index: index));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UseCustomScrollView"),
      ),
      body: CustomScrollView(
        slivers: [
          // SliverToBoxAdapter(
          //     child: GridView.builder(
          //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //           crossAxisCount: 3,
          //         ),
          //         scrollDirection: Axis.horizontal,
          //         itemCount: data.length,
          //         itemBuilder: (BuildContext context, int index) {
          //           return ItemBox(index: index);
          //         })),



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
            // tag1
            padding: EdgeInsets.all(8),
            sliver: _buildSliverGrid(),
          ),

          _buildSliverList()
        ],
      ),
    );
  }

  Widget _buildBox() {
    return SliverToBoxAdapter(
      child: Container(
        height: 58,
        color: Colors.amber,
      ),
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

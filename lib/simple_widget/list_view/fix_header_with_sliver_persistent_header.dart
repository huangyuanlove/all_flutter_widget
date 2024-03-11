import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'item_box.dart';

class FixHeaderWithSliverPersistentHeader extends StatefulWidget {
  const FixHeaderWithSliverPersistentHeader({Key? key}) : super(key: key);

  @override
  State<FixHeaderWithSliverPersistentHeader> createState() =>
      _FixHeaderWithSliverPersistentHeaderState();
}

class _FixHeaderWithSliverPersistentHeaderState
    extends State<FixHeaderWithSliverPersistentHeader> {
  final List<int> data = List.generate(60, (index) => index + 1);
  final List<ItemBox> itemBoxList =
      List.generate(60, (index) => ItemBox(index: index));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FixHeaderWithSliverPersistentHeader"),
      ),
      body: CustomScrollView(
        slivers: [
          _buildBox(),
          _buildStickBox(),
          SliverPadding(
            padding: EdgeInsets.all(8),
            sliver: _buildSliverGrid(),
          ),
          _buildSliverList()
        ],
      ),
    );
  }
  Widget _buildBox(){
    return SliverPersistentHeader(delegate: ShowOnScreenSPHD(),floating: true,);
  }

  Widget _buildStickBox() {
    return SliverPersistentHeader(
      delegate: FixedPersistentHeaderDelegate(),
      pinned: true,
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

class FixedPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: 30,
      color: Colors.redAccent,
      child: Text("吸顶的文字信息"),
    );
  }

  @override
  FloatingHeaderSnapConfiguration? get snapConfiguration {
    return FloatingHeaderSnapConfiguration();
  }

  @override
  double get maxExtent => 30;

  @override
  double get minExtent => 30;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    throw oldDelegate == this;
  }
}

class ShowOnScreenSPHD extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: 50,
      color: Colors.amber,

    );
  }

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return oldDelegate == this;
  }
}

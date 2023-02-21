
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'item_box.dart';

class ElasticityFixHeader extends StatefulWidget {
  const ElasticityFixHeader({Key? key}) : super(key: key);

  @override
  State<ElasticityFixHeader> createState() => _ElasticityFixHeaderState();
}

class _ElasticityFixHeaderState extends State<ElasticityFixHeader> {


  final List<int> data = List.generate(60, (index) => index + 1);
  final List<ItemBox> itemBoxList =
  List.generate(60, (index) => ItemBox(index: index));


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ElasticityFixHeader"),),
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
      delegate: FlexibleSPHD(maxHeight: 100,minHeight: 61.8),
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

class FlexibleSPHD extends SliverPersistentHeaderDelegate{

  final double maxHeight;
  final double minHeight;
  FlexibleSPHD({required this.maxHeight, required this.minHeight});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    double progress = shrinkOffset / (maxHeight - minHeight);
    progress = progress > 1 ? 1 : progress;
    return Container(
      color:Color.lerp(Colors.blue, Colors.red, progress),
      alignment: Alignment.center,
      child: Text(
        'FixedPersistentHeader',
        style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant FlexibleSPHD oldDelegate) {
    return oldDelegate.maxHeight != this.maxHeight || oldDelegate.minHeight != this.minHeight;
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
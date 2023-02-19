

import 'package:flutter/material.dart';

class CustomMultiChildLayoutTest extends StatefulWidget {
  const CustomMultiChildLayoutTest({Key? key}) : super(key: key);

  @override
  State<CustomMultiChildLayoutTest> createState() => _CustomMultiChildLayoutTestState();
}

class _CustomMultiChildLayoutTestState extends State<CustomMultiChildLayoutTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CustomMultiChildLayout"),),
      body: CustomMultiChildLayout(
        delegate: CustomMultiChildLayoutDelegate(),
        children: [
          LayoutId(id: CornerType.topLeft, child: ColoredBox(color: Colors.redAccent,child: SizedBox(width: 50,height: 50,),)),
          LayoutId(id: CornerType.topRight, child:ColoredBox(color: Colors.yellowAccent,child: SizedBox(width: 50,height: 50,),)),
          LayoutId(id: CornerType.bottomLeft, child:ColoredBox(color: Colors.blueAccent,child: SizedBox(width: 50,height: 50,),)),
          LayoutId(id: CornerType.bottomRight, child: ColoredBox(color: Colors.greenAccent,child: SizedBox(width: 50,height: 50,),)),
        ],
      ),
    );
  }
}


class CustomMultiChildLayoutDelegate extends MultiChildLayoutDelegate{
  final EdgeInsets padding;
  CustomMultiChildLayoutDelegate({ this.padding = EdgeInsets.zero});
  @override
  void performLayout(Size size) {
    BoxConstraints childBoxConstraints = BoxConstraints.loose(size);
    if(hasChild(CornerType.topLeft)){
      layoutChild(CornerType.topLeft, childBoxConstraints);
      positionChild(CornerType.topLeft, Offset(padding.left, padding.top));
    }

    if(hasChild(CornerType.topRight)){
     final childSize = layoutChild(CornerType.topRight, childBoxConstraints);
      positionChild(CornerType.topRight, Offset(size.width - childSize.width -padding.right, padding.top));
    }

    if(hasChild(CornerType.bottomLeft)){
      final childSize = layoutChild(CornerType.bottomLeft, childBoxConstraints);
      positionChild(CornerType.bottomLeft, Offset(padding.left, size.height - padding.bottom - childSize.height));
    }
    if(hasChild(CornerType.bottomRight)){
      final childSize = layoutChild(CornerType.bottomRight, childBoxConstraints);
      positionChild(CornerType.bottomRight, Offset(size.width - padding.right - childSize.width , size.height - padding.bottom - childSize.height));
    }


  }

  @override
  bool shouldRelayout(covariant CustomMultiChildLayoutDelegate oldDelegate) {
   return oldDelegate.padding!=padding;
  }

}
enum CornerType{
  topLeft,
  topRight,
  bottomLeft,
  bottomRight
}

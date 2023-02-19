import 'package:flutter/material.dart';
import 'package:wrapper/wrapper.dart';

import '../../logger.dart';

class SomeToolTipWidget extends StatefulWidget {
  const SomeToolTipWidget({Key? key}) : super(key: key);

  @override
  State<SomeToolTipWidget> createState() => _SomeToolTipWidgetState();
}

class _SomeToolTipWidgetState extends State<SomeToolTipWidget> {
  String itemInfo = "初始值";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ToolTip & Overlay"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Tooltip(
            message: "悬浮提示",
            waitDuration: Duration(seconds: 1),
            showDuration: Duration(seconds: 2),
            child: Text("鼠标悬浮一秒，提示两秒"),
          ),
          Container(
            height: 20,
            color: Colors.black12,
          ),

          Wrap(

            alignment: WrapAlignment.center,
            children: [

              _buildItem("三国演义"),
              _buildItem("水浒传"),
              _buildItem("西游记"),
              _buildItem("红楼梦"),
            ],
          ),
          Text(
            itemInfo,
            style: TextStyle(color: Colors.blueAccent),
          )
        ],
      ),
    );
  }


  Widget _buildItem(String name) {
    return   AlertableWidget(
      tip: "$name   tip" * 5,
      child: Container(
        // color: Colors.blue,

        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue,
        ),
        child: Text(
          name,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}


class AlertableWidget extends StatefulWidget {
  AlertableWidget({required this.child,required this.tip, Key? key}) : super(key: key);

  Widget child;
  String tip;

  @override
  State<AlertableWidget> createState() => _AlertableWidgetState();
}

class _AlertableWidgetState extends State<AlertableWidget> {

  OverlayEntry? _overlayEntry;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){_onTap(context);},
      child: widget.child,
    );
  }

  void _onTap(BuildContext context) {
    RenderObject? renderObject = context.findRenderObject();
    if (renderObject != null && renderObject is RenderBox) {
      Size itemSize = renderObject.size;
      Offset itemOffset = renderObject.localToGlobal(Offset.zero);

      OverlayState? overlayState = Overlay.of(context);
      if(overlayState == null){
        return ;
      }


      final double boxWidth = 250;
      final double marginTop = 4;
      final EdgeInsets padding = EdgeInsets.symmetric(horizontal: 8,vertical: 4);

      bool leftOut = (itemOffset.dx +(itemSize.width -boxWidth)/2) < 0;
      bool rightOut = itemOffset.dx +(itemSize.width -boxWidth)/2 + boxWidth >MediaQuery.of(context).size.width;
      logger.d("左侧越界:$leftOut  右侧越界:$rightOut");

      double positionedLeft = itemOffset.dx +(itemSize.width -boxWidth)/2;
      double wrapperSpineOffset = boxWidth/2;
      if(leftOut){
        positionedLeft = itemOffset.dx;
        wrapperSpineOffset = itemSize.width/2;
      }

      if(rightOut){
        positionedLeft = itemSize.width + itemOffset.dx - boxWidth;
        wrapperSpineOffset = boxWidth - itemSize.width/2;
      }



      _overlayEntry =  OverlayEntry(
          builder: (BuildContext context) => Material(
            color: Colors.transparent,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: _removeEntry,
              child: Stack(
                children: [
                  Positioned(
                    width: boxWidth,
                    left: positionedLeft,
                    top: itemOffset.dy + itemSize.height,
                    child: GestureDetector(
                      onTap: _removeEntry,
                      child: Wrapper(
                        padding: padding,
                        spineType : SpineType.top,
                        offset: wrapperSpineOffset,
                        elevation: 1,
                        angle: 60,
                        spineHeight: 6,
                        color: Color(0xff95EC69),
                        child: Text(widget.tip),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ));

      overlayState.insert(_overlayEntry!);
    }
  }

  void _removeEntry(){
    if(_overlayEntry!=null){
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
  }

}


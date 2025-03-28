import 'dart:async';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

const DATA_NAME = [
  "习近平会见国际工商界代表",
  "末日生存游戏七日世界424公测",
  "缅甸发生7.9级地震",
  "乐事薯片被曝含致癌添加剂 客服回应",
  "国家市监局将审查李嘉诚卖港口交易",
  "缅甸地震已造成超过50人死亡",
  "4月起这些新规将影响你我生活",
  "缅甸强震大桥房屋垮塌泳池水飞溅",
  "震中附近华人：酒店倒了几十栋",
  "妻子举报一高校副教授出轨女学生",
];
const DATA_DESC = [
  "“家电华佗”走红 一个月涨粉200万",
  "张小寒爆料双一线真情侣",
  "张朝阳建议一天吃2顿饭",
  "吴宣仪被恐怖箱吓到满地乱爬",
  "男子为救小孩被撞 司机逃逸？假",
  "王思聪带三美女吃日料被偶遇",
  "微信不再需要逐条长按翻译",
  "在泰华人：有人裹着浴巾直接冲下来",
  "董宇辉报平安",
  "是中国人来救了我们"
];
const DATA_IMAGE = [
  "https://t7.baidu.com/it/u=1117794894,4154991203&fm=193&f=GIF",
  "https://t7.baidu.com/it/u=3979143318,65711957&fm=193&f=GIF",
  "https://t7.baidu.com/it/u=2301872827,3431176467&fm=193&f=GIF",
  "https://t7.baidu.com/it/u=4127536459,3471889489&fm=193&f=GIF",
];

class ListviewListener extends StatefulWidget {
  const ListviewListener({super.key});

  @override
  State<ListviewListener> createState() => _ListviewListenerState();
}

class _ListviewListenerState extends State<ListviewListener> {
  List<ListViewItemData> dataList = List.empty(growable: true);

  ScrollController _scrollController = new ScrollController();
  late Timer _timer;

  bool needScrollToBottom = true;

  @override
  void initState() {
    super.initState();

    List.generate(20, (int index) {
      ListViewItemData itemData = new ListViewItemData();
      itemData.type = (index % 3);
      itemData.name = DATA_NAME[(index % DATA_NAME.length)];
      itemData.desc = DATA_DESC[(index % DATA_DESC.length)];
      if ((index * index) % 3 == 0) {
        itemData.imageUrl = DATA_IMAGE[(index * index) % DATA_IMAGE.length];
      }
      dataList.add(itemData);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(_scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300), curve: Curves.easeOut);
    });

    Future.delayed(Duration(seconds: 10)).then((value) {
      _timer = Timer.periodic(Duration(seconds: 2), (timer) {
        print('定时任务执行: ${DateTime.now()}');
        int index = dataList.length + 1;
        ListViewItemData itemData = new ListViewItemData();
        itemData.type = (index % 3);
        itemData.name = DATA_NAME[(index % DATA_NAME.length)];
        itemData.desc = DATA_DESC[(index % DATA_DESC.length)];
        if ((index * index) % 3 == 0) {
          itemData.imageUrl = DATA_IMAGE[(index * index) % DATA_IMAGE.length];
        }
        setState(() {
          dataList.add(itemData);
        });

        WidgetsBinding.instance.addPostFrameCallback((_) {
          if(needScrollToBottom){
            print("$needScrollToBottom  能自动滚动到底部");
            _scrollController.animateTo(
                _scrollController.position.maxScrollExtent,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeOut);
          }else{
            print("$needScrollToBottom  不能自动滚动到底部");
          }

        });
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView滑动监听"),
      ),
      body: SafeArea(
        child: NotificationListener<ScrollNotification>(
          onNotification: (scrollInfo) {
            if (scrollInfo is ScrollStartNotification) {
              print('开始滚动');
              needScrollToBottom = false;
              print('不需要自定滚动到底部');
            } else if (scrollInfo is ScrollUpdateNotification) {
              print('正在滚动');
            } else if (scrollInfo is ScrollEndNotification) {
              print('滚动停止');
              ScrollPosition position = _scrollController.position;
              if (position.pixels == position.maxScrollExtent) {
                needScrollToBottom = true;
                print('需要自定滚动到底部');
              } else {}
            }
            return false;
          },
          child: ListView.separated(
              controller: _scrollController,
              itemBuilder: (BuildContext context, int index) {
                return _buildItem(context, dataList[index]);
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 10,
                );
              },
              itemCount: dataList.length),
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context, ListViewItemData itemData) {
    if (itemData.type == 0) {
      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Color(0xff967100)),
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            itemData.imageUrl.isNotEmpty
                ? ExtendedImage.network(
                    itemData.imageUrl,
                    width: 80,
                  )
                : SizedBox(
                    width: 0,
                  ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    itemData.name,
                    style: TextStyle(fontSize: 16, color: Color(0xff323232)),
                  ),
                  Text(
                    itemData.desc,
                    style: TextStyle(fontSize: 16, color: Color(0xff999999)),
                  )
                ],
              ),
            )
          ],
        ),
      );
    } else if (itemData.type == 1) {
      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Color(0xffb24acc)),
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(
          children: [
            itemData.imageUrl.isNotEmpty
                ? ExtendedImage.network(
                    itemData.imageUrl,
                    width: 80,
                  )
                : SizedBox(
                    width: 0,
                  ),
            Row(
              children: [
                Expanded(
                    child: Text(
                  itemData.name,
                  style: TextStyle(fontSize: 16, color: Color(0xff323232)),
                )),
                Text(
                  itemData.desc,
                  style: TextStyle(fontSize: 16, color: Color(0xff999999)),
                )
              ],
            )
          ],
        ),
      );
    } else {
      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Color(0xff618046)),
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            itemData.imageUrl.isNotEmpty
                ? ExtendedImage.network(
                    itemData.imageUrl,
                    width: 80,
                  )
                : SizedBox(
                    width: 0,
                  ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      itemData.name,
                      style: TextStyle(fontSize: 16, color: Color(0xff323232)),
                    ),
                  ),
                  Text(
                    itemData.desc,
                    style: TextStyle(fontSize: 16, color: Color(0xff999999)),
                  )
                ],
              ),
            )
          ],
        ),
      );
    }
  }
}

class ListViewItemData {
  String name = "";
  String desc = "";
  String imageUrl = "";
  int type = 0;
}

import 'package:flutter/material.dart';

class SomeChipWidget extends StatefulWidget {
  @override
  _SomeChipWidgetState createState() => _SomeChipWidgetState();
}

class _SomeChipWidgetState extends State<SomeChipWidget> {
  String dec = '点击回收';
  int count = 0;

  Color _color = Colors.red;

  String choiceChipSelectedValue = "java";
  List<String> choiceChipItems = ["java", "python", "dart"];

  String filterChipSelectedValue = "";

  List<String> inputChipItems = ["java", "python", "dart"];
  List<String> rawChipItems = ["java", "python", "dart"];

  _modify() {
    setState(() {
      dec = 'delete success: $count';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SomeChipWidget"),
      ),
      body: ListView(
        children: <Widget>[
          Chip(
            //头像
            avatar: CircleAvatar(
              child: Icon(
                Icons.account_circle,
                color: Colors.red.shade200,
              ),
              backgroundColor: Colors.white,
            ),
            //设置widget背景颜色
            backgroundColor: Colors.red.shade100,
            //剪辑窗口widget内容
            // antiAlias:剪辑具有抗锯齿功能，它比antiAliasWithSaveLayer快得多，但比hardEdge慢。
            //antiAliasWithSaveLayer:立即剪辑具有抗锯齿，并且可以分配屏幕外缓冲区，后续涂料都在该缓冲区完成，然后再进行修剪和合成
            clipBehavior: Clip.antiAlias,

            //设置padding值
            labelPadding: EdgeInsets.all(8.0),
            label: Text(dec),
            //设置onDeleted时候显示的图标
            deleteIcon: Icon(
              Icons.delete,
              color: Colors.white,
              size: 20.0,
            ),
            onDeleted: () {
              count++;
              _modify();
            },
            deleteButtonTooltipMessage: '删除',
            deleteIconColor: Colors.blueGrey.shade100,
            //将最小点击目标大小扩展到48*48px
            materialTapTargetSize: MaterialTapTargetSize.padded,
            padding: EdgeInsets.all(2.0),
            //修改字体格式
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            // shape: _MyBorder(),
          ),
          ChipTheme(
            data: ChipTheme.of(context)
                .copyWith(backgroundColor: Colors.red.shade800),
            child: ChoiceChip(
              padding: EdgeInsets.only(
                  left: 100.0, right: 100.0, top: 10.0, bottom: 10.0),
              label: Text('down'),
              labelStyle: TextStyle(color: Colors.white),
              onSelected: (bool value) {
                setState(() {
                  _color = value ? Colors.lightBlue : Colors.red;
                });
              },
              selected: _color == Colors.lightBlue,
            ),
          ),
          ChipTheme(
            data: ChipThemeData.fromDefaults(
                // brightness: Brightness.dark,
                labelStyle: TextStyle(fontSize: 15.0),
                primaryColor: Colors.red,
                secondaryColor: Colors.red.shade800),
            child: ChoiceChip(
              padding: EdgeInsets.only(
                  left: 100.0, right: 100.0, top: 10.0, bottom: 10.0),
              label: Text('down'),
              onSelected: (bool value) {
                setState(() {
                  _color = value ? Colors.black : Colors.red;
                });
              },
              selected: _color == Colors.black,
            ),
          ),
          Wrap(
            direction: Axis.horizontal,
            children: choiceChipItems.map((String value) {
              return ChoiceChip(
                label: Text(value),
                selected: choiceChipSelectedValue == value,
                labelStyle: TextStyle(color: Colors.white),
                labelPadding:
                    EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
                selectedColor: Colors.amber,
                backgroundColor: Colors.red,
                disabledColor: Colors.blue,
                onSelected: (bool isSelected) {
                  setState(() {
                    choiceChipSelectedValue = isSelected ? value : '';
                  });
                },
              );
            }).toList(),
          ),
          Wrap(
            direction: Axis.horizontal,
            children: choiceChipItems.map((String value) {
              return FilterChip(
                  label: Text(value),
                  selected: filterChipSelectedValue == value,
                  onSelected: (bool isSelected) {
                    setState(() {
                      filterChipSelectedValue = isSelected ? value : "";
                    });
                  });
            }).toList(),
          ),
          Wrap(
            direction: Axis.horizontal,
            children: inputChipItems.map((String value) {
              return InputChip(
                label: Text(value),
                selected: inputChipItems.contains(value),
                avatar: CircleAvatar(
                  backgroundColor: Colors.redAccent.shade400,
                ),
                onDeleted: (){
                  setState(() {
                    inputChipItems.remove(value);
                  });
                },
                  deleteIcon:Icon(Icons.remove),
                onSelected: (bool isSelected){
                  setState(() {
                    if(isSelected){
                      if(!inputChipItems.contains(value)){
                        inputChipItems.add(value);
                      }
                    }else{
                      inputChipItems.remove(value);
                    }
                  });
                },
              );
            }).toList(),
          ),
          Wrap(
            direction: Axis.horizontal,
            children: rawChipItems.map((String value){
              return RawChip(
                avatar: CircleAvatar(
                  backgroundColor: Colors.redAccent.shade400,
                  child: Text(value.substring(0,1)),
                ),
                label: Text(value.toUpperCase()),
                onDeleted: (){
                  setState(() {
                    rawChipItems.remove(value);

                  });
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

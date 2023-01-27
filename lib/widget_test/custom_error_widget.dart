import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class TestCustomErrorWidget extends StatelessWidget{


   String show_text = "123";


  @override
  Widget build(BuildContext context) {

    int time = DateTime.now().millisecondsSinceEpoch;
    print(time);

    if(time%2 ==0){
      show_text = "";
    }


    return Scaffold(
      appBar: AppBar(
        title: Text("自定义错误显示"),
      ),
      body: Center(
        child: ListView(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:  Theme.of(context).primaryColor,
              ),
              onPressed: () {  },
              child: Text(show_text),

            ),
          ],
        ),
      ),


    );
  }

}
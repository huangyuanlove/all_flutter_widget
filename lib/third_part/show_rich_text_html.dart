import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class ShowHtmlTextWidget extends StatefulWidget {
  const ShowHtmlTextWidget({Key? key}) : super(key: key);

  @override
  State<ShowHtmlTextWidget> createState() => _ShowHtmlTextWidgetState();
}

class _ShowHtmlTextWidgetState extends State<ShowHtmlTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("富文本标签"),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child:
          ListView(
            children:           [HtmlWidget(
              """请选择举报问题类型，举报对答题医生不可见 <span style='color:#1b91e0'>分类详细说明</span> <span style='color:#308ce8'>《连续订阅服务协议》</span>
              <p>
                  这是超链接，<a href='https://www.baidu.com>点击跳转到百度</a>这是超链接
                  </p>
                  <p>
                  <img src='https://rawgit.flutter-io.cn/daohoangson/flutter_widget_from_html/bd80e2fef38f8d7ed69c388e2b325ea09aa7b817/demo_app/screenshots/HelloWorldScreen3.gif'/>
                  </p>
            <img src='https://rawgit.flutter-io.cn/daohoangson/flutter_widget_from_html/bd80e2fef38f8d7ed69c388e2b325ea09aa7b817/demo_app/screenshots/HelloWorldScreen1.gif'/>
            """
              ,
              onTapUrl: (url){
                print("富文本点击了超链接-> $url");
                return true;
              },
              onTapImage: (imageMetadata){
                print("富文本点击了图片-> $imageMetadata");
              },
            )],
          ),

        ),

    );
  }
}

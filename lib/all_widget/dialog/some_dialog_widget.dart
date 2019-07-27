import 'package:flutter/material.dart';

class DialogWidget extends StatefulWidget {
  @override
  _DialogWidgetState createState() => _DialogWidgetState();
}

class _DialogWidgetState extends State<DialogWidget> {
  @override
  Widget build(BuildContext context) {
    List<Widget> dialogItem = List();
    for (int i = 0; i < 30; i++) {
      dialogItem.add(Text("item at $i"));
    }

    return Scaffold(
      appBar: AppBar(title: Text("some dialog")),
      body: Column(
        children: <Widget>[
          FlatButton(
            child: Text("AlertDialog"),
            onPressed: () {
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("标题"),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: dialogItem,
                        ),
                      ),
                      actions: <Widget>[
                        FlatButton(
                          child: Text("关闭"),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        FlatButton(
                          child: Text("确认"),
                          onPressed: () => Navigator.of(context).pop(),
                        )
                      ],
                    );
                  });
            },
          ),
          FlatButton(
            child: Text("AboutDialog"),
            onPressed: () {
              showAboutDialog(context: context,applicationName:"applicationName",applicationVersion:"applicationVersion",applicationIcon:Text("applicationIcon Widget"),applicationLegalese:"lincense",children: dialogItem);
            },
          )
        ],
      ),
    );
  }


}

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

class SimpleListView extends StatefulWidget {
  SimpleListView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _SimpleListViewState();
  }
}

class _SimpleListViewState extends State<SimpleListView> {
  List widgets = [];

  @override
  void initState() {
    super.initState();

    _loadData();
  }

  _loadData() async {
    var httpClient = new HttpClient();
    String dataUrl =
        "http://i.jandan.net/?oxwlxojflwblxbsapi=jandan.get_duan_comments&page=1";

    var request = await httpClient.getUrl(Uri.parse(dataUrl));
    var response = await request.close();

    if (response.statusCode == HttpStatus.ok) {
      var jsonStr = await response.transform(utf8.decoder).join();
      setState(() {
        widgets = json.decode(jsonStr)["comments"];
      });
    }
  }

  Widget getRow(int i) {
    return new Padding(
        padding: new EdgeInsets.all(16.0),
        child: new Text("${widgets[i]["comment_content"]}"));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("simple http request"),
        ),
        body: new ListView.builder(
            itemCount: widgets.length,
            itemBuilder: (BuildContext context, int position) {
              return getRow(position);
            }));
  }
}

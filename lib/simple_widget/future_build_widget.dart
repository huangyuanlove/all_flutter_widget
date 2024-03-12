import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:async/async.dart';

class FutureBuildWidget extends StatefulWidget {
  @override
  _FutureBuildWidgetState createState() => _FutureBuildWidgetState();
}

class _FutureBuildWidgetState extends State<FutureBuildWidget> {
  var _futureBuilderFuture;

  @override
  void initState() {
    super.initState();

    ///用_futureBuilderFuture来保存_gerData()的结果，以避免不必要的ui重绘
    _futureBuilderFuture = _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FutureBulder"),
      ),
      body: FutureBuilder(
        builder: _buildFuture,
        future: _futureBuilderFuture,
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        setState(() {
          _futureBuilderFuture = _getData();
        });

      },child: Icon(Icons.android),),
    );
  }

  Widget _buildFuture(BuildContext context, AsyncSnapshot snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.none:
        print('还没有开始网络请求');
        return Text('还没有开始网络请求');
      case ConnectionState.active:
        print('active');
        return Text('ConnectionState.active');
      case ConnectionState.waiting:
        print('waiting');
        return Center(
          child: CircularProgressIndicator(),
        );
      case ConnectionState.done:
        print('done');
        if (snapshot.hasError) return Text('Error: ${snapshot.error}');
        return Text(snapshot.data.toString());
      default:
        return Text('默认');
    }
  }

  Future _getData() async {
    var httpClient = new HttpClient();
    var uri =
        new Uri.https('api.douban.com', '/v2/movie/top250', {'count': '15'});
    var request = await httpClient.getUrl(uri);
    var response = await request.close();
    var responseBody = await response.transform(utf8.decoder).join();

    return responseBody;
  }

  Future _test() async {
//   return   HttpClient().getUrl(Uri.parse("http://api.douban.com/v2/movie/top250?count=15")).then((request)=>request.close().then((response)=>response.transform(utf8.decoder).join().then(print)));

    return HttpClient()
        .getUrl(Uri.parse("http://api.douban.com/v2/movie/top250?count=15"))
        .then((request) => request.close())
        .then((response) => response.transform(utf8.decoder).join())
        .then(print);
  }
}

import 'package:flutter/material.dart';

class ListViewWidget extends StatefulWidget {
  @override
  _ListViewWidgetState createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget> {
  List<String> _list = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 5; i++) {
      _list.add("item at $i");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListViewWidget"),
      ),
      body: ListView.builder(
          itemExtent: 80,
          itemCount:_list.length,
          itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.primaries[index % Colors.primaries.length],
          child: Center(
            child: Text('${_list[index]}',
                style: Theme.of(context).textTheme.displayMedium),
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _list.add("item at ${_list.length}");
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

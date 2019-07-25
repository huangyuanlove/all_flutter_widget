import 'package:flutter/material.dart';

class AnimatedListViewWidget extends StatefulWidget {
  @override
  _AnimatedListViewWidgetState createState() => _AnimatedListViewWidgetState();
}

class _AnimatedListViewWidgetState extends State<AnimatedListViewWidget> {
  List<String> _list;

  @override
  void initState() {
    super.initState();
    _list = List();
    for (int i = 0; i < 5; i++) {
      _list.add("item at $i");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedListViewWidget"),
      ),
      body: AnimatedList(
        itemBuilder: _buildItem,
        initialItemCount: _list.length,
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        setState(() {
          _list.add("item at ${_list.length}");
        });
      },child: Icon(Icons.add),),
    );
  }

  Widget _buildItem(
      BuildContext context, int index, Animation<double> animation) {
    return Card(
      color: Colors.primaries[index % Colors.primaries.length],
      child: Center(
        child: Text('${_list[index]}',
            style: Theme.of(context).textTheme.display1),
      ),
    );
  }
}

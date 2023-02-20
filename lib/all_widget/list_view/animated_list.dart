import 'package:flutter/material.dart';

class AnimatedListViewWidget extends StatefulWidget {
  @override
  _AnimatedListViewWidgetState createState() => _AnimatedListViewWidgetState();
}

class _AnimatedListViewWidgetState extends State<AnimatedListViewWidget> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  late ListModel<int> _list;
  int _selectedItem = -1;
  int _nextItem = 0; // The next item inserted when the user presses the '+' button.

  @override
  void initState() {
    super.initState();
    _list = ListModel<int>(
      listKey: _listKey,
      initialItems: <int>[0, 1, 2],
      removedItemBuilder: _buildRemovedItem,
    );
    _nextItem = 3;
  }

  // Used to build list items that haven't been removed.
  Widget _buildItem(
      BuildContext context, int index, Animation<double> animation) {
    return CardItem(
      animation: animation,
      item: _list[index],
      selected: _selectedItem == _list[index],
      onTap: () {
        setState(() {
          _selectedItem = (_selectedItem == _list[index] ? null : _list[index])!;
        });
      },
    );
  }

  // Used to build an item after it has been removed from the list. This method is
  // needed because a removed item remains  visible until its animation has
  // completed (even though it's gone as far this ListModel is concerned).
  // The widget will be used by the [AnimatedListState.removeItem] method's
  // [AnimatedListRemovedItemBuilder] parameter.
  Widget _buildRemovedItem(
      int item, BuildContext context, Animation<double> animation) {
    return CardItem(
      animation: animation,
      item: item,
      selected: false, onTap: () {  },
      // No gesture detector here: we don't want removed items to be interactive.
    );
  }

  // Insert the "next item" into the list model.
  void _insert() {
    int insertIndex = 0;
    if(_selectedItem != -1){
      _selectedItem = 0;
    }else{
      insertIndex = _list.indexOf(_selectedItem);
    }
    if(insertIndex == -1){
      insertIndex = 0;
    }
    _list.insert(insertIndex, _nextItem++);
  }

  // Remove the selected item from the list model.
  void _remove() {
    int removeIndex = 0;
    if(_selectedItem != -1){
      removeIndex = _list.indexOf(_selectedItem);
    }
    if(removeIndex == -1){
      removeIndex = 0;
    }
    _list.removeAt(removeIndex);

    setState(() {
      _selectedItem = -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('AnimatedList'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add_circle),
              onPressed: _insert,
              tooltip: 'insert a new item',
            ),
            IconButton(
              icon: const Icon(Icons.remove_circle),
              onPressed: _remove,
              tooltip: 'remove the selected item',
            ),
          ],
          leading: TextButton(onPressed: (){Navigator.of(context).pop();}, child: Icon(Icons.arrow_back_ios)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: AnimatedList(
            key: _listKey,
            initialItemCount: _list.length,
            itemBuilder: _buildItem,
          ),
        ),
      ),
    );
  }
}
class ListModel<E> {
  ListModel({
    required this.listKey,
    required this.removedItemBuilder,
    required Iterable<E> initialItems,
  })  : assert(removedItemBuilder != null),
        _items = List<E>.from(initialItems);

  final GlobalKey<AnimatedListState> listKey;
  final dynamic removedItemBuilder;
  final List<E> _items;

  AnimatedListState? get _animatedList => listKey.currentState;

  void insert(int index, E item) {
    _items.insert(index, item);
    _animatedList?.insertItem(index);
  }

  E removeAt(int index) {
    final E removedItem = _items.removeAt(index);
    if (removedItem != null) {
      _animatedList?.removeItem(index,
              (BuildContext context, Animation<double> animation) {
            return removedItemBuilder(removedItem, context, animation);
          });
    }
    return removedItem;
  }

  int get length => _items.length;

  E operator [](int index) => _items[index];

  int indexOf(E item) => _items.indexOf(item);
}



class CardItem extends StatelessWidget {
  const CardItem(
      { Key? key,
        required this.animation,
        required this.onTap,
        required this.item,
        this.selected: false})
      : assert(item >= 0),
        super(key: key);

  final Animation<double> animation;
  final VoidCallback onTap;
  final int item;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = Theme.of(context).textTheme.displayMedium;
    if (selected)
      textStyle = textStyle?.copyWith(color: Colors.lightGreenAccent[400]);
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: SizeTransition(
        axis: Axis.vertical,
        sizeFactor: animation,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onTap,
          child: SizedBox(
            height: 128.0,
            child: Card(
              color: Colors.primaries[item % Colors.primaries.length],
              child: Center(
                child: Text('Item $item', style: textStyle),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
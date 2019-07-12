import 'package:flutter/material.dart';

class AllWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("常用控件"),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            EntryItem(data[index]),
        itemCount: data.length,
      ),
    );
  }
}

class Entry {
  Entry(this.title, [this.children = const <Entry>[]]);

  final String title;
  final List<Entry> children;
}

// The entire multilevel list displayed by this app.
final List<Entry> data = <Entry>[
  Entry(
    'Element',
    <Entry>[
      Entry(
        'Form',
        <Entry>[
          Entry('Input'),
          Entry('Checkbox'),
          Entry('Button'),
          Entry('Text'),
          Entry('Radio'),
          Entry('Slider'),
          Entry('Switch'),
        ],
      ),
      Entry('Frame', <Entry>[
        Entry('Align'),
        Entry('Stack'),
        Entry('Layout'),
        Entry('Box'),
        Entry('Expanded'),
        Entry('Spacing'),
        Entry('Table'),
      ]),
      Entry('Media', <Entry>[
        Entry('Image'),
        Entry('Icon'),
        Entry('Cabvas'),
      ]),
    ],
  ),
  Entry(
    'Components',
    <Entry>[
      Entry('Navigation'),
      Entry('List'),
      Entry('Card'),
      Entry('Bar'),
      Entry('Dialog'),
      Entry('Scaffold'),
      Entry('Grid'),
      Entry('Scroll'),
      Entry('Tab'),
      Entry('Menu'),
      Entry('Pick'),
      Entry('Chip'),
      Entry('Panel'),
      Entry('Progress'),
    ],
  ),
  Entry(
    'Themes',
    <Entry>[
      Entry('Material'),
      Entry('Cupertino'),
    ],
  ),
];

class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) {

      return ListTile(title: Text(root.title));
    } else {
      return ExpansionTile(
        key: PageStorageKey<Entry>(root),
        title: Text(root.title,),
        children: root.children.map(_buildTiles).toList(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}

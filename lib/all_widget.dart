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

TextStyle firstStyle = const TextStyle(fontSize: 20);
TextStyle secondStyle = TextStyle(fontSize: 16);
TextStyle thirdStyle = TextStyle(fontSize: 12);

class Entry {

  Entry({required this.title, required this.textStyle,  this.children=const []});
  final String title;
  final TextStyle textStyle;

  List<Entry> children = [];


}

// The entire multilevel list displayed by this app.
final List<Entry> data = <Entry>[
  Entry(
    title: 'Element',
    textStyle:  firstStyle,
    children: <Entry>[
      Entry(
       title: 'Form',
        textStyle: secondStyle,
        children: <Entry>[
          Entry(title:'Checkbox',textStyle:  thirdStyle),
          Entry(title:'Button',textStyle:  thirdStyle),
          Entry(title:'Slider',textStyle:  thirdStyle),
          Entry(title:'Switch',textStyle:  thirdStyle),
        ],
      ),
      Entry(title:'Frame', textStyle:secondStyle,children: <Entry>[
        Entry(title:'Row',textStyle: thirdStyle),
        Entry(title:'Column',textStyle: thirdStyle),
        Entry(title:'Stack', textStyle:thirdStyle),
        Entry(title:'Layout', textStyle:thirdStyle),
        Entry(title:'Box', textStyle:thirdStyle),
        Entry(title:'Expanded',textStyle: thirdStyle),
        Entry(title:'Spacing', textStyle:thirdStyle),
        Entry(title:'Table', textStyle:thirdStyle),
      ]),
      Entry(title:'Media',textStyle: secondStyle, children:<Entry>[
        Entry(title:'Canvas',textStyle: thirdStyle),
      ]),
    ],
  ),
  Entry(
    title: 'Components',
   textStyle: firstStyle,
  children:  <Entry>[
      Entry(title:'List', textStyle:secondStyle,children: <Entry>[
        Entry(title:'ListView', textStyle:thirdStyle),
        Entry(title:'ListBody', textStyle:thirdStyle),
        Entry(title:'AnimatedList', textStyle:thirdStyle),
      ]),
      Entry(title:'Bar',textStyle: secondStyle,children :<Entry>[
        Entry(title:'AppBar', textStyle:thirdStyle),
        Entry(title:'SnackBar',textStyle: thirdStyle),
        Entry(title:'SliverAppBar',textStyle: thirdStyle),
        Entry(title:'FlexbleSpaceBar',textStyle: thirdStyle),
        Entry(title:'SnackBarAction', textStyle:thirdStyle),
      ]),
      Entry(title:'Dialog', textStyle:secondStyle,children: <Entry>[
        Entry(title:'AlertDialog',textStyle: thirdStyle),
        Entry(title:'Dialog',textStyle: thirdStyle),
        Entry(title:'AboutDialog',textStyle: thirdStyle),
        Entry(title:'SimpleDialog',textStyle: thirdStyle),
      ]),
      Entry(title:'Grid',textStyle: secondStyle,children: <Entry>[
        Entry(title:'GridTile', textStyle:thirdStyle),
        Entry(title:'GridView',textStyle: thirdStyle),
        Entry(title:'GridPaper',textStyle: thirdStyle),
        Entry(title:'SliverGrid',textStyle: thirdStyle),
        Entry(title:'GridTileBar',textStyle: thirdStyle),
      ]),
      Entry(title:'Scroll', textStyle:secondStyle,children: <Entry>[
        Entry(title:'ScrollMetrics',textStyle: thirdStyle),
        Entry(title:'ScrollPhysics',textStyle: thirdStyle),
      ]),
      Entry(title:'Menu', textStyle:secondStyle, children:<Entry>[
        Entry(title:'CheckedPopupMenuItem', textStyle:thirdStyle),
        Entry(title:'DropdownMenuItem',textStyle: thirdStyle),
        Entry(title:'PopupMenuButton',textStyle: thirdStyle),
        Entry(title:'PopupMenuDivider',textStyle: thirdStyle),
        Entry(title:'PopupMenuEntry',textStyle: thirdStyle),
        Entry(title:'PopupMenuItem', textStyle:thirdStyle),
      ]),
      Entry(title:'Pick',textStyle: secondStyle,children: <Entry>[
        Entry(title:'DayPicker',textStyle: thirdStyle),
      ]),
      Entry(title:'Chip',textStyle: secondStyle,children: <Entry>[
        Entry(title:'Chip', textStyle:thirdStyle),
        Entry(title:'SomeToolTip', textStyle:thirdStyle),
        Entry(title:'ChipTheme',textStyle: thirdStyle),
        Entry(title:'ChipThemeData',textStyle: thirdStyle),
        Entry(title:'ChoiceChip',textStyle: thirdStyle),
        Entry(title:'FilterChip',textStyle: thirdStyle),
        Entry(title:'InputChip',textStyle: thirdStyle),
        Entry(title:'RawChip',textStyle: thirdStyle),
      ]),
      Entry(title:'Progress', textStyle:secondStyle,children: <Entry>[
        Entry(title:'LinearProgressIndicator',textStyle: thirdStyle),
        Entry(title:'CircularProgressIndicator',textStyle: thirdStyle),
      ]),
    ],
  ),
  Entry(title:"Other",textStyle: firstStyle,children: <Entry>[
    Entry(title:"FutureBuild",textStyle: thirdStyle),
    Entry(title:"Animation",textStyle: thirdStyle),
  ]),
];

class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root, BuildContext context) {
    if (root.children.isEmpty) {
      return ListTile(
          title: FlatButton(
              onPressed: () {
                Navigator.of(context).pushNamed(root.title);
              },
              child: Text(
                root.title,
                style: root.textStyle,
              )));
    } else {
      return ExpansionTile(
        key: PageStorageKey<Entry>(root),
        title: ListTile(
          title: Text(
            root.title,
            style: root.textStyle,
          ),
        ),
        children: root.children.map((it) => _buildTiles(it, context)).toList(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry, context);
  }
}

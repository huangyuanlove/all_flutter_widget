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
  Entry(this.title, [this.textStyle, this.children = const <Entry>[]]);

  final String title;
  final List<Entry> children;
  TextStyle textStyle = thirdStyle;
}

// The entire multilevel list displayed by this app.
final List<Entry> data = <Entry>[
  Entry(
    'Element',
    firstStyle,
    <Entry>[
      Entry(
        'Form',
        secondStyle,
        <Entry>[
          Entry('Checkbox', thirdStyle),
          Entry('Button', thirdStyle),
          Entry('Slider', thirdStyle),
          Entry('Switch', thirdStyle),
        ],
      ),
      Entry('Frame', secondStyle, <Entry>[
        Entry('Row', thirdStyle),
        Entry('Column', thirdStyle),
        Entry('Stack', thirdStyle),
        Entry('Layout', thirdStyle),
        Entry('Box', thirdStyle),
        Entry('Expanded', thirdStyle),
        Entry('Spacing', thirdStyle),
        Entry('Table', thirdStyle),
      ]),
      Entry('Media', secondStyle, <Entry>[
        Entry('Canvas', thirdStyle),
      ]),
    ],
  ),
  Entry(
    'Components',
    firstStyle,
    <Entry>[

      Entry('List', secondStyle, <Entry>[
        Entry('ListView', thirdStyle),
        Entry('ListBody', thirdStyle),
        Entry('AnimatedList', thirdStyle),
      ]),
      Entry('Bar', secondStyle, <Entry>[
        Entry('AppBar', thirdStyle),
        Entry('SnackBar', thirdStyle),
        Entry('SliverAppBar', thirdStyle),
        Entry('FlexbleSpaceBar', thirdStyle),
        Entry('SnackBarAction', thirdStyle),
      ]),
      Entry('Dialog', secondStyle, <Entry>[
        Entry('AlertDialog', thirdStyle),
        Entry('Dialog', thirdStyle),
        Entry('AboutDialog', thirdStyle),
        Entry('SimpleDialog', thirdStyle),
      ]),
      Entry('Grid', secondStyle, <Entry>[
        Entry('GridTile', thirdStyle),
        Entry('GridView', thirdStyle),
        Entry('GridPaper', thirdStyle),
        Entry('SliverGrid', thirdStyle),
        Entry('GridTileBar', thirdStyle),
      ]),
      Entry('Scroll', secondStyle, <Entry>[
        Entry('ScrollMetrics', thirdStyle),
        Entry('ScrollPhysics', thirdStyle),
      ]),
      Entry('Menu', secondStyle, <Entry>[
        Entry('CheckedPopupMenuItem', thirdStyle),
        Entry('DropdownMenuItem', thirdStyle),
        Entry('PopupMenuButton', thirdStyle),
        Entry('PopupMenuDivider', thirdStyle),
        Entry('PopupMenuEntry', thirdStyle),
        Entry('PopupMenuItem', thirdStyle),
      ]),
      Entry('Pick', secondStyle, <Entry>[
        Entry('DayPicker', thirdStyle),
        Entry('MonthPicker', thirdStyle),
        Entry('YearPicker', thirdStyle),
        Entry('ShowdatePicker', thirdStyle),
        Entry('CityPicker', thirdStyle),
      ]),
      Entry('Chip', secondStyle, <Entry>[
        Entry('Chip', thirdStyle),
        Entry('ChipTheme', thirdStyle),
        Entry('ChipThemeData', thirdStyle),
        Entry('ChoiceChip', thirdStyle),
        Entry('FilterChip', thirdStyle),
        Entry('InputChip', thirdStyle),
        Entry('RawChip', thirdStyle),
      ]),
      Entry('Panel', secondStyle, <Entry>[
        Entry('ExpansionPanelList', thirdStyle),
      ]),
      Entry('Progress', secondStyle, <Entry>[
        Entry('LinearProgressIndicator', thirdStyle),
        Entry('CircularProgressIndicator', thirdStyle),
      ]),
    ],
  ),
  Entry(
    'Themes',
    firstStyle,
    <Entry>[
      Entry('Material', secondStyle, <Entry>[
        Entry('MaterialApp', thirdStyle),
        Entry('MaterialColor', thirdStyle),
        Entry('MaterialButton', thirdStyle),
        Entry('MaterialPageRoter', thirdStyle),
        Entry('MaterialAccentColor', thirdStyle),
        Entry('MergeableMaterialItem', thirdStyle),
      ]),
      Entry('Cupertino', secondStyle, <Entry>[
        Entry('CupertinoApp', thirdStyle),
        Entry('CupertinoButton', thirdStyle),
        Entry('CupertinoColors', thirdStyle),
        Entry('CupertinoIcons', thirdStyle),
        Entry('CupertinoNavigationBar', thirdStyle),
        Entry('CupertinoPageRoute', thirdStyle),
        Entry('CupertinoPageScaffold', thirdStyle),
        Entry('CupertinoPicker', thirdStyle),
        Entry('CupertinoPopupSurface', thirdStyle),
        Entry('CupertinoScrollbar', thirdStyle),
        Entry('CupertinoSlider', thirdStyle),
        Entry('CupertinoSegmentedControl', thirdStyle),
        Entry('CupertinoSliverNavigationBar', thirdStyle),
        Entry('CupertinoSwitch', thirdStyle),
        Entry('CupertinoTabBar', thirdStyle),
        Entry('CupertinoTabScaffold', thirdStyle),
        Entry('CupertinoTimerPicker', thirdStyle),
      ]),
    ],
  ),
  Entry("Other",firstStyle,<Entry>[
    Entry("FutureBuild",thirdStyle)
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
        children: root.children.map((it)=>_buildTiles(it,context)).toList(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry, context);
  }
}

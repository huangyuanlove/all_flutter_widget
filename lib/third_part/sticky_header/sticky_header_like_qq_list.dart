import 'package:flutter/material.dart';
import 'package:flutter_widget/third_part/sticky_header/reverse.dart';
import 'package:flutter_widget/third_part/sticky_header/side_header.dart';

import 'animated_header.dart';
import 'grid.dart';
import 'list.dart';
import 'mix_slivers.dart';
import 'nested.dart';
import 'not_sticky.dart';

class StickyHeaderLikeQQList extends StatefulWidget {
  const StickyHeaderLikeQQList({Key? key}) : super(key: key);

  @override
  State<StickyHeaderLikeQQList> createState() => _StickyHeaderLikeQQListState();
}

class _StickyHeaderLikeQQListState extends State<StickyHeaderLikeQQList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Sticky Headers'),
      ),
      body: ListView(
        children: <Widget>[
          _Item(
            text: 'List Example',
            builder: (_) => const ListExample(),
          ),
          _Item(
            text: 'Grid Example',
            builder: (_) => const GridExample(),
          ),
          _Item(
            text: 'Not Sticky Example',
            builder: (_) => const NotStickyExample(),
          ),
          _Item(
            text: 'Side Header Example',
            builder: (_) => const SideHeaderExample(),
          ),
          _Item(
            text: 'Animated Header Example',
            builder: (_) => const AnimatedHeaderExample(),
          ),
          _Item(
            text: 'Reverse List Example',
            builder: (_) => const ReverseExample(),
          ),
          _Item(
            text: 'Mixing other slivers',
            builder: (_) => const MixSliversExample(),
          ),
          _Item(
            text: 'Nested sticky headers',
            builder: (_) => const NestedExample(),
          ),
        ],
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    Key? key,
    required this.text,
    required this.builder,
  }) : super(key: key);

  final String text;
  final WidgetBuilder builder;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue,
      child: InkWell(
        onTap: () =>
            Navigator.push(context, MaterialPageRoute(builder: builder)),
        child: Container(
          padding: EdgeInsets.all(16),
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
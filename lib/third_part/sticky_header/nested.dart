import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'sticky_header_common.dart';
import 'package:sliver_tools/sliver_tools.dart';

class NestedExample extends StatelessWidget {
  const NestedExample({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StickyHeaderScaffold(
      title: 'Nested Sticky Headers',
      slivers: [
        SliverStickyHeader(
          header: Header(title: '1'),
          sliver: MultiSliver(
            children: [
              SliverStickyHeader(
                header: Header(title: '1.1'),
                sliver: _SliverLeaf(),
              ),
              SliverStickyHeader(
                header: Header(title: '1.2'),
                sliver: MultiSliver(
                  children: [
                    SliverStickyHeader(
                      header: Header(title: '1.2.1'),
                      sliver: _SliverLeaf(),
                    ),
                    SliverStickyHeader(
                      header: Header(title: '1.2.2'),
                      sliver: _SliverLeaf(),
                    ),
                    SliverStickyHeader(
                      header: Header(title: '1.2.3'),
                      sliver: _SliverLeaf(),
                    ),
                  ],
                ),
              ),
              SliverStickyHeader(
                header: Header(title: '1.3'),
                sliver: _SliverLeaf(),
              ),
            ],
          ),
        ),
        SliverStickyHeader(
          header: Header(title: '2'),
          sliver: MultiSliver(
            children: [
              SliverStickyHeader(
                header: Header(title: '2.1'),
                sliver: _SliverLeaf(),
              ),
              SliverStickyHeader(
                header: Header(title: '2.2'),
                sliver: MultiSliver(
                  children: [
                    SliverStickyHeader(
                      header: Header(title: '2.2.1'),
                      sliver: _SliverLeaf(),
                    ),
                    SliverStickyHeader(
                      header: Header(title: '2.2.2'),
                      sliver: _SliverLeaf(),
                    ),
                    SliverStickyHeader(
                      header: Header(title: '2.2.3'),
                      sliver: _SliverLeaf(),
                    ),
                  ],
                ),
              ),
              SliverStickyHeader(
                header: Header(title: '2.3'),
                sliver: _SliverLeaf(),
              ),
            ],
          ),
        ),
        SliverStickyHeader(
          header: Header(title: '3'),
          sliver: _SliverLeaf(),
        ),
        SliverStickyHeader(
          header: Header(title: '4'),
          sliver: MultiSliver(
            children: [
              SliverStickyHeader(
                header: Header(title: '4.1'),
                sliver: _SliverLeaf(),
              ),
              SliverStickyHeader(
                header: Header(title: '4.2'),
                sliver: _SliverLeaf(),
              ),
              SliverStickyHeader(
                header: Header(title: '4.3'),
                sliver: _SliverLeaf(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SliverLeaf extends StatelessWidget {
  const _SliverLeaf();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 200,
        color: Colors.amber,
      ),
    );
  }
}

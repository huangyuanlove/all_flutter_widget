import 'package:flutter/material.dart';

class TestNestedScrollView extends StatefulWidget {
  const TestNestedScrollView({Key? key}) : super(key: key);

  @override
  State<TestNestedScrollView> createState() => _TestNestedScrollViewState();
}

class _TestNestedScrollViewState extends State<TestNestedScrollView>
    with SingleTickerProviderStateMixin {
  final List<String> tabTitles = <String>["我的发布", "我的关注"];
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: tabTitles.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: _buildHeader,
        body: TabBarView(
          controller: tabController,
          children: [
            buildScrollPage(Colors.redAccent),
            buildScrollPage(Colors.amberAccent),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildHeader(BuildContext context, bool innerBoxIsScrolled) {
    return [
      SliverOverlapAbsorber(
        sliver: _buildAppbar(),
        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
      ),
    ];
  }

  Widget _buildAppbar() {
    return SliverAppBar(
      expandedHeight: 140,
      title: const Text('CustomScrollView 测试'),
      flexibleSpace: FlexibleSpaceBar(
          collapseMode: CollapseMode.pin,
          background:
          Image.asset('assets/image/pic.png', fit: BoxFit.cover)),
      pinned: true,
      bottom: TabBar(
        controller: tabController,
        tabs: tabTitles.map((String name) => Tab(text: name)).toList(),
      ),
    );
  }

  Widget _buildTabView() {
    return SliverFillRemaining(
      child: TabBarView(
        controller: tabController,
        children: [
          buildScrollPage(Colors.red),
          buildScrollPage(Colors.amber),
        ],
      ),
    );
  }

  Widget buildScrollPage(Color color) {
    return Builder(
      builder: (ctx) => CustomScrollView(
        key: PageStorageKey<Color>(color),
        slivers: [
          SliverOverlapInjector( // tag1
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(ctx),
          ),
          _buildBox(color),
          SliverPadding(
            padding: EdgeInsets.all(8),
            sliver: _buildSliverGrid(),
          ),
          _buildSliverList(),
        ],
      ),
    );
  }

  Widget _buildBox(Color color) {
    return SliverToBoxAdapter(
      child: Container(
        height: 60,
        color: color,
      ),
    );
  }

  final List<int> data = List.generate(60, (index) => index + 1);

  Widget _buildSliverList() {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
          _buildItemByIndex,
          childCount: data.length,
        ));
  }

  Widget _buildSliverGrid() {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        _buildItemByIndex,
        childCount: 8,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 8,
        childAspectRatio: 1,
        mainAxisSpacing: 8,
      ),
    );
  }

  Widget _buildItemByIndex(BuildContext context, int index) {
    return ItemBox(
      index: data[index],
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}


class ItemBox extends StatelessWidget {
  final int index;

  ItemBox({
    Key? key,
    required this.index,
  }) : super(key: key) {
    // print('----构建ItemBox-----$index--------');
  }

  Color get color => Colors.blue.withOpacity((index % 10) * 0.1);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: color,
      height: 56,
      child: Text(
        '第 $index 个',
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
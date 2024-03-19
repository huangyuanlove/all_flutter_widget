import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final globalStateProvider = StateProvider((ref) => 1);
class StateProviderDemoWidget extends ConsumerWidget {
  //不推荐
  final localStateProvider = StateProvider((ref) => 1);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("StateProviderDemoWidget"),
        centerTitle: true,
      ),
      body: Center(
          child: Flex(
        direction: Axis.vertical,
        children: [
          Text("globalStateProvider count ${ref.watch(globalStateProvider)}"),
          Text("localStateProvider count ${ref.watch(localStateProvider)}"),
          Text(
            "StateProvider.state标记为过时，并将在3.0移除",
            style: TextStyle(color: Colors.red, fontSize: 14),
          ),
          Text("声明为全局，则状态一直被保存，直到应用重启。",
              style: TextStyle(color: Colors.blue, fontSize: 14)),
          Text("声明为类成员，则页面重启则重新初始化。",
              style: TextStyle(color: Colors.blue, fontSize: 14)),
          Text("StateProvider适用于存储简单的状态变量，如枚举、字符串、布尔值和数字",
              style: TextStyle(color: Colors.blue, fontSize: 14)),
          IconButton(
            icon: Icon(Icons.plus_one_sharp),
            onPressed: () {
              ref.read(globalStateProvider.notifier).state++;
              ref.read(localStateProvider.notifier).state++;
              debugPrint("-----------");
            },
          ),
        ],
      )),
    );
  }
}

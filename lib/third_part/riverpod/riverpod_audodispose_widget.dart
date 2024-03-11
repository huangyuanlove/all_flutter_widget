import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final autoDisposeProvider = StateProvider.autoDispose<int>(((ref) {
  ref.onDispose(() {
    debugPrint("countProvider onDispose");
  });

  return 1;
}));

final countProvider = StateProvider<int>((ref) => 1);

class RiverpodAutoDisposeWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final autoDisposeValue = ref.watch(autoDisposeProvider);
    final normalValue = ref.watch(countProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("AutoDispose"),
        centerTitle: true,
      ),
      body: Column(children: [
        Text("autoDispose:当privder不被使用时，可以被自动释放"),
        Text("autoDisposeValue-> ${autoDisposeValue}"),
        Text("normalValue-> ${normalValue}"),
        Row(
          children: [
            ElevatedButton(
                onPressed: (() {
                  ref.read(autoDisposeProvider.notifier).state++;
                  ref.read(countProvider.notifier).state++;
                }),
                child: Text("增加计数"))
          ],
        )
      ]),
    );
  }
}

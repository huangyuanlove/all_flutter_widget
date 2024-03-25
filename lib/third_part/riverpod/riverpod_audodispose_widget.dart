import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget/third_part/riverpod/riverpod_cache_widget.dart';

final autoDisposeProvider = StateProvider.autoDispose<int>(((ref) {
  ref.onDispose(() {
    debugPrint("countProvider onDispose");
  });

  return 1;
}));


final cacheTimeProvider = StateProvider.autoDispose<int>((ref) {
  ref.cacheFor(Duration(seconds: 5));
  return 1;
});

final countProviderBase = StateProvider.autoDispose.family<int,int> ((ref,start){
  return start;
});




final countProvider = StateProvider<int>((ref) => 1);

class RiverpodAutoDisposeWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final autoDisposeValue = ref.watch(autoDisposeProvider);
    final normalValue = ref.watch(countProvider);
    final cacheTimeValue = ref.watch(cacheTimeProvider);
    final startValue =  ref.watch(countProviderBase(10));
    return Scaffold(
      appBar: AppBar(
        title: Text("AutoDispose"),
        centerTitle: true,
      ),
      body: Column(children: [
        Text("autoDispose:当privder不被使用时，可以被自动释放"),
        Text("autoDisposeValue-> ${autoDisposeValue}"),
        Text("normalValue-> ${normalValue}"),
        Text("cacheTimeProvider -> ${cacheTimeValue}" ),
        Row(
          children: [
            ElevatedButton(
                onPressed: (() {
                  ref.read(autoDisposeProvider.notifier).state++;
                  ref.read(countProvider.notifier).state++;
                  ref.read(cacheTimeProvider.notifier).state++;
                }),
                child: Text("增加计数"))
          ],
        )
      ]),
    );
  }
}

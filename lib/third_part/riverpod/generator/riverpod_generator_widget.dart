import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget/third_part/riverpod/generator/async_counter.dart';

class RiverpodGeneratorWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    // final asyncValue = ref.watch(asyncCountProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("RiverpodGeneratorWidget"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text("count $count"),
          // asyncValue.when(data: (data) {
          //   return Text(data.toString());
          // }, error: (error, stack) {
          //   return Text(error.toString());
          // }, loading: () {
          //   return CircularProgressIndicator();
          // })
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     ref.read(counterProvider.notifier).increment();
      //     ref.read(asyncCountProvider.notifier).increament();
      //   },
      //   child: Icon(Icons.add),
      // ),
    );
  }
}

class Counter extends Notifier<int> {
  @override
  int build() {
    return 0;
  }

  void increment() {
    state++;
  }
}

final counterProvider = NotifierProvider<Counter, int>(() {
  return Counter();
});
// final counterProvider = NotifierProvider<Counter, int>(Counter.new);



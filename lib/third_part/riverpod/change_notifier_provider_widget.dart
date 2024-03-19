// 创建一个自定义的ChangeNotifier类来管理状态
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterNotifier extends ChangeNotifier {
  int _count = 0;
  int get count => _count;
  void increment() {
    _count++;
    notifyListeners(); // 当计数器值改变时通知所有监听者
  }
}

// 定义ChangeNotifierProvider
final counterProvider = ChangeNotifierProvider<CounterNotifier>((ref) {
  return CounterNotifier();
});

class ChangeNotifierProviderWidget extends ConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return  Scaffold(
        appBar: AppBar(title: Text('ChangeNotifierProviderWidget')),
        body: Center(
          child: Consumer(builder: (context, ref, _) { // 使用Consumer读取并显示状态
            final counter = ref.watch(counterProvider);
            return Text('Count: ${counter.count}');
          }),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // 在点击按钮时，通过ref调用notifier的方法更新状态
            ref.read(counterProvider.notifier).increment();
          },
          child: Icon(Icons.add),
        ),
      );
  }
}
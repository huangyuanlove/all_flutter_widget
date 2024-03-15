import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterNotifier extends Notifier<int> {
  @override
  int build() {
    return 0;
  }

  void increment() {
    state++;
  }
}

final counterProvider = NotifierProvider<CounterNotifier, int>(() {
  return CounterNotifier();
});
final counterProviderOther =
    NotifierProvider<CounterNotifier, int>(CounterNotifier.new);

class CounterNotifierWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {}
}

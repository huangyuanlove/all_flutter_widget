import 'bloc_base.dart';
import 'dart:async';

class CountBLoC extends BLoCBase {
  int _count = 0;

  final _controller = StreamController<int>();
  Stream<int> get stream => _controller.stream;

  int get value => _count;

  increment() {
    _controller.sink.add(++_count);
  }

  @override
  void dispose() {
    _controller.close();
  }
}

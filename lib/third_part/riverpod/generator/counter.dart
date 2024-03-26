
// import 'package:riverpod_annotation/riverpod_annotation.dart';
// part 'counter.g.dart';
// @riverpod
// class Counter extends _$Counter {
//   @override
//   int build() {
//     return 0;
//   }
//   void increment() {
//     state++;
//   }
// }

//counter.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'counter.g.dart';
@riverpod
class Counter extends _$Counter{
  @override
  int build() {
    return 0;
  }
  void increment(){
    state ++;
  }
}
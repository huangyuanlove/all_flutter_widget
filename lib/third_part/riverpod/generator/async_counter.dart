
import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'async_counter.g.dart';
// final asyncCountProvider = AsyncNotifierProvider.autoDispose<AsyncCount,int>(AsyncCount.new);

// class AsyncCount extends AsyncNotifier<int>{
//   @override
//   FutureOr<int> build() {
//     return ref.read(getStartCountProvider.future);
//   }

//   Future<void> increament() async{
//       state = const AsyncLoading();
//       // state = await ref.read(incrementCountProvider(1));
//       // state = AsyncValue.guard(()async{
//       //   return await ref.read(incrementCountProvider(1));
//       // });
//       state = await AsyncValue.guard(() {
//         return  ref.read(incrementCountProvider(1).future);});
     
//   }
// }

final getStartCountProvider = FutureProvider<int>((ref){
  return Future.delayed(Duration(seconds: 5),(){
    return 0;
  });
});

// final incrementCountProvider = FutureProvider.autoDispose.family<int,int> ((ref,currnet){
//    return Future.delayed(Duration(seconds: 5),(){
//     return currnet ++;
//   });
// });




@riverpod
class AsyncCounters extends _$AsyncCounters{
  @override
  FutureOr<int> build(){
    return Future.delayed(Duration(seconds: 3),(){
      return 1;
    });
  }
}
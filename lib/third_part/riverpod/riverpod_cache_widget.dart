import 'package:dio/dio.dart';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'dart:async';

final futureProvider = FutureProvider.autoDispose<String>((ref) async {
  ref.onDispose(() {
    debugPrint("futureProvider dispose");
  });
  ref.keepAlive();

  await Future.delayed(Duration(seconds: 10), () {
    // 在此处执行延迟后的代码
    print('延迟后执行的代码');
  });

  final Response result = await Dio().get<String>("https://www.baidu.com");
  // final json = jsonDecode(result.data);
  // return json['activity']! as String;
  return result.data;
});

//给 AutoDisposeRef 添加扩展，实现定时清除缓存
extension AutoDisposeRefCache on AutoDisposeRef {
  void cacheFor(Duration duration) {
    final link = keepAlive();
    final timer = Timer(duration, () {
      link.close();
    });
    onDispose(() {
      timer.cancel();
    });
  }
}

//使用
final timerCachedProvider = Provider.autoDispose<int>((ref) {
  ref.cacheFor(Duration(minutes: 5));
  return 1;
});

class RiverpodCacheWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<String> value = ref.watch(futureProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("RiverpodCacheWidget"),
        centerTitle: true,
      ),
      body: Column(children: [
        value.when(data: (data) {
          return Text(data);
        }, error: (error, stack) {
          return Text(error.toString());
        }, loading: () {
          return CircularProgressIndicator();
        }),
      ]),
    );
  }
}

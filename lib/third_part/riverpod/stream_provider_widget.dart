import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final streamProvider = StreamProvider.autoDispose<int>((ref) {
    ref.onDispose(() {
      debugPrint("streamProvider autoDispose");
    });

    return Stream.periodic(Duration(seconds: 1), (number) {
      return number + 1;
    });
  });

class StreamProviderWidget extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<int> streamResult = ref.watch(streamProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("StreamProviderWidget"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text(streamResult.toString()),
          streamResult.when(
                  data: (data) {
                    return Text(data.toString());
                  },
                  error: (error, stack) {
                    return Text(error.toString());
                  },
                  loading: () => CircularProgressIndicator())
        ],
      ),
    );
  }
}

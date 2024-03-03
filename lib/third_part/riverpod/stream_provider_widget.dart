import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final exampleProvider = StreamProvider.autoDispose<int>((ref) async* {
  final streamController = StreamController<int>();
  for (var i = 0; i < 100; i++) {
    streamController.add(i);
  }
  ref.onDispose(() {
    debugPrint("exampleProvider autoDispose");
    streamController.close();
  });

  yield* streamController.stream;
});

class StreamProviderWidget extends ConsumerWidget {
  final streamProvider = StreamProvider.autoDispose<int>((ref) {
    ref.onDispose(() {
      debugPrint("streamProvider autoDispose");
    });

    return Stream.periodic(Duration(seconds: 1), (number) {
      return number + 1;
    });
  });

  final dataStreamProvider = StreamProvider<int>((ref) async* {
    ref.onDispose(() {
      debugPrint("dataStreamProvider autoDispose");
    });
    yield* Stream.periodic(Duration(seconds: 1), (number) {
      return number + 1;
    });
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("StreamProviderWidget"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Consumer(
            builder: (context, ref, child) {
              final value = ref.watch(streamProvider);

              return Text(value.toString());
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              final result = ref.watch(streamProvider);
              return result.when(
                  data: (data) {
                    return Text(data.toString());
                  },
                  error: (error, stack) {
                    return Text(error.toString());
                  },
                  loading: () => CircularProgressIndicator());
            },
          ),
          Consumer(builder: (context, ref, child) {
            final result = ref.watch(exampleProvider);
            return result.when(data: (data) {
              return Text(data.toString());
            }, error: (error, stack) {
              return Text(error.toString());
            }, loading: () {
              return const CircularProgressIndicator();
            });
          }),
        ],
      ),
    );
  }
}

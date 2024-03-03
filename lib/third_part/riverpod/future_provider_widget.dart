import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final futureProvider = FutureProvider<int>((ref) async {
  int number = await Future.delayed(const Duration(seconds: 2), () {
    return 2;
  });
  return number;
});

final getConfigFutureProvider =
    FutureProvider<Map<String, dynamic>>((ref) async {
  String configContant =
      await rootBundle.loadString("assets/fake_configurations.json");
  final configMap = jsonDecode(configContant) as Map<String, dynamic>;
  return configMap;
});

class FutureProviderWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FutureProvider"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Consumer(builder: (context, ref, child) {
            AsyncValue<int> value = ref.watch(futureProvider);
            return value.when(
                data: (data) {
                  return Text(data.toString());
                },
                error: (err, stack) => Text("$err"),
                loading: () => const CircularProgressIndicator());
          }),
          Consumer(builder: (context, ref, child) {
            final value = ref.watch(getConfigFutureProvider);
            return value.when(
                data: (data) {
                  return Text(data.toString());
                },
                error: (error, stack) {
                  return Text(error.toString());
                },
                loading: () => const CircularProgressIndicator());
          })
        ],
      ),
    );
  }
}

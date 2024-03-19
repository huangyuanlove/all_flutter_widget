import 'dart:convert';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget/logger.dart';

final wordPairProvider = FutureProvider.autoDispose<String>((ref) async {
  final wordPair = generateWordPairs().first;
  await Future.delayed(Duration(seconds: 2));
  return "${wordPair.first} - ${wordPair.second}";
});

final getConfigFutureProvider =
    FutureProvider.autoDispose<Map<String, dynamic>>((ref) async {
  String configContant =
      await rootBundle.loadString("assets/fake_configurations.json");
  final configMap = jsonDecode(configContant) as Map<String, dynamic>;
  return configMap;
});

class FutureProviderWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<Map<String, dynamic>> getConfigResult =
        ref.watch(getConfigFutureProvider);
    final AsyncValue<String> wordPairResult = ref.watch(wordPairProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("FutureProvider"),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.refresh(wordPairProvider.future),
        child: ListView(
          children: [
            getConfigResult.when(
                data: (data) {
                  return Text(data.toString());
                },
                error: (error, stack) {
                  return Text(error.toString());
                },
                loading: () => const CircularProgressIndicator()),
            wordPairResult.when(data: (data) {
              return Text(data);
            }, error: (error, stack) {
              return ElevatedButton(
                  onPressed: () {
                    ref.refresh(wordPairProvider.future);
                  },
                  child: Text("点击刷新"));
            }, loading: () {
              return CircularProgressIndicator();
            }),
          ],
        ),
      ),
    );
  }
}

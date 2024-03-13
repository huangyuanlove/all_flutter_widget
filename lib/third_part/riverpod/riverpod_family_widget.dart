import 'dart:math';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget/logger.dart';

//todo 还没写完

class Movie {
  Movie(this.name, this.id);
  String name;
  int id;
}

final movieDetailProvider =
    FutureProvider.autoDispose.family<Movie, int>((ref, movieId) async {
  logger.d("开始获取id为 ${movieId} 详情");
  await Future.delayed(Duration(seconds: 2), () {});
  final wordPair = generateWordPairs().first;
  return Movie(wordPair.first + "_" + wordPair.second, movieId);
});

class RiverpodFamilyWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(movieDetailProvider(1));
    return Scaffold(
      appBar: AppBar(
        title: Text("RiverpodFamily"),
        centerTitle: true,
      ),
      body: value.when(data: (movie) {
        return Text("id; ${movie.id}  , name:${movie.name}");
      }, error: (error, stack) {
        return Text(error.toString());
      }, loading: () {
        return Center(
          child: CircularProgressIndicator(),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          int movieId = Random().nextInt(100);
          logger.d("获取id为 ${movieId} 详情");

          ref.refresh(movieDetailProvider(movieId));
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}

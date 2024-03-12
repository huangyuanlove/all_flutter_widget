import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//todo 还没写完

class Movie {
  Movie(this.name, this.id);
  String name;
  int id;
}

class MovieNotifier extends StateNotifier<List<Movie>> {
  MovieNotifier() : super([]);

  void add(List<Movie> movies) {
    state.addAll(movies);
  }
}

final movieListProvider =
    StateNotifierProvider<MovieNotifier, List<Movie>>((ref) {
  return MovieNotifier();
});

final pageNumberProvider = StateProvider.autoDispose<int>((ref) => 1);

final listProvider = FutureProvider.autoDispose
    .family<List<Movie>, int>((ref, perPageCount) async {
  int pageIndex = ref.watch(pageNumberProvider);
  final result = <Movie>[];
  int index = 0;
  await Future.delayed(Duration(seconds: 2), () {
    // 在此处执行延迟后的代码
    print('延迟后执行的代码');
  });

  generateWordPairs().take(perPageCount).forEach((element) {
    index++;
    result.add(Movie(element.first + "  " + element.second,
        (pageIndex - 1) * perPageCount + index));
  });
  ref.watch(mov)
  return result;
});

class RiverpodFamilyWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieList = ref.watch(listProvider(20));
    final movieListResult = ref.watch(movieListProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("RiverpodFamily"),
        centerTitle: true,
      ),
      body: movieList.when(data: (data) {
        return ListView.builder(itemBuilder: (BuildContext context, int index) {
          if (index == data.length) {
            return ElevatedButton(
                onPressed: () {
                  ref.read(pageNumberProvider.notifier).state++;
                },
                child: Text("加载更多"));
          } else {
            return Text("${data[index].id}   ${data[index].name}");
          }
        });
      }, error: (error, stack) {
        return Text(error.toString());
      }, loading: () {
        return CircularProgressIndicator(semanticsLabel: "加载中");
      }),
    );
  }
}

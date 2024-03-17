import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget/logger.dart';

final pagingController =
    StateNotifierProvider<PagingController, PagingState>((ref) {
  logger.d("pagingController created");
  return PagingController();
});

class RiverPodWithPagedList extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return RiverpodPagingState();
  }
}

class RiverpodPagingState extends ConsumerState<ConsumerStatefulWidget> {
  @override
  void initState() {
    super.initState();
    ref.read(pagingController.notifier).fetchMoreData();
  }

  @override
  Widget build(BuildContext context) {
    final pagingState = ref.watch(pagingController);
    final scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        if (pagingState.hasMore) {
          ref.read(pagingController.notifier).fetchMoreData();
        }
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: Text("riverpod paging"),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          final controller = ref.watch(pagingController.notifier);
          await controller.fetchMoreData();
        },
        child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            controller: scrollController,
            itemCount: pagingState.data.length + (pagingState.hasMore ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == pagingState.data.length && pagingState.hasMore) {
                return Center(child: CircularProgressIndicator());
              }
              return ListTile(title: Text(pagingState.data[index].toString()));
            }),
      ),
    );
  }
}

class DataModel {
  DataModel(this.id, this.name);
  String id;
  String name;

  String toString() {
    return "${id} - ${name}";
  }
}

class PagingState {
  final List<DataModel> data;
  final int pageIndex;
  final bool hasMore;
  const PagingState(
      {required this.data, required this.pageIndex, required this.hasMore});

  PagingState.initial() : this(data: [], pageIndex: 0, hasMore: true);
  PagingState copyWith(
      {List<DataModel>? dataCopy, int? pageIndexCopy, bool? hasMoreCopy}) {
    PagingState pagingState = PagingState(
        data: dataCopy ?? this.data,
        pageIndex: pageIndexCopy ?? this.pageIndex,
        hasMore: hasMoreCopy ?? this.hasMore);
    logger.d("copy result--> ${pagingState.pageIndex}  ${pageIndexCopy}");
    return pagingState;
  }
}

class PagingController extends StateNotifier<PagingState> {
  PagingController() : super(PagingState.initial()) {
    logger.d("pagingController created");
  }
  int pageIndex = 0;
  List<DataModel> data = [];
  bool hasMore = true;

  Future<void> fetchMoreData() async {
    if (!hasMore) {
      return;
    }
    final nextPageData = await fetchPageData(pageIndex + 1);
    if (nextPageData.isNotEmpty) {
      List<DataModel> tmp = [];
      if (pageIndex == 1) {
        tmp.addAll(nextPageData);
      } else {
        tmp = List.of(state.data)..addAll(nextPageData);
      }

      int pageIndexCopy = pageIndex + 1;
      logger.d("will copy--> ${pageIndexCopy}");

      state = state.copyWith(
          dataCopy: tmp,
          pageIndexCopy: pageIndexCopy,
          hasMoreCopy: hasNextPage(nextPageData));
    } else {
      hasMore = false;
    }
    logger.d("fetchMoreData finished--> ${state.pageIndex}");
  }

  bool hasNextPage(List<DataModel> nextPage) {
    return nextPage.length == 20;
  }

  Future<List<DataModel>> fetchPageData(int page) async {
    logger.d("fetchPageData start--> ${page}");
    return Future.delayed(Duration(seconds: 2), () {
      List<DataModel> result = [];
      int index = 0;
      generateWordPairs().take(20).forEach((element) {
        index++;
        result.add(DataModel(((page - 1) * 20 + index).toString(),
            element.first + "_" + element.second));
      });
      return result;
    });
  }
}

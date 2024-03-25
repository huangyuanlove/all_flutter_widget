import 'package:dio/dio.dart';
import 'package:english_words/english_words.dart';
// 1. import the riverpod_annotation package
import 'package:riverpod_annotation/riverpod_annotation.dart';
// 2. add a part file
part 'dio_provider.g.dart';


//需要执行 flutter pub run build_runner watch -d 来生成对应代码
@riverpod
Dio dio_generator(Dio_generatorRef ref){
  return Dio();
}

@Riverpod(keepAlive: true)
int counter(CounterRef ref){
  return 1;
}

@riverpod
Future<String> generateName(GenerateNameRef ref) async {
    await Future.delayed(Duration(seconds: 5));
    final wordPair = generateWordPairs().first;
    return "${wordPair.first}  ${wordPair.second}";
}

@riverpod
Stream<int> timeCount(TimeCountRef ref){
  return Stream.periodic(Duration(seconds: 1),(number){
    return number +1;
  });
}



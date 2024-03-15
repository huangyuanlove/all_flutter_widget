import 'package:dio/dio.dart';
// 1. import the riverpod_annotation package
import 'package:riverpod_annotation/riverpod_annotation.dart';
// 2. add a part file
part 'dio_provider.g.dart';

//需要执行 flutter pub run build_runner watch -d 来生成对应代码
@riverpod
Dio dio(DioRef ref) {
  return Dio();
}

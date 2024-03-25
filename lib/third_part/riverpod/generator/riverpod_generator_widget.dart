
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget/third_part/riverpod/generator/dio_provider.dart';

class RiverpodGeneratorWidget extends ConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(dio_generatorProvider);
    throw UnimplementedError();
  }

}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_with_codeview/widget_with_codeview.dart';

class RiverpodObserverLogWidget extends ConsumerWidget {
  final String codeOne = """
class Logger extends ProviderObserver {
    @override
    void didUpdateProvider(
      ProviderBase provider,
      Object? previousValue,
      Object? newValue,
      ProviderContainer container,
    ) {
      print('[\${provider.name ?? provider.runtimeType}] value: \$newValue');
    }
  }


""";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: Text("RiverpodObserverLogWidget"),
          centerTitle: true,
        ),
        body: WidgetWithCodeView(
            filePath: "lib/third_part/riverpod/ProviderObserverLogger.source"));
  }
}

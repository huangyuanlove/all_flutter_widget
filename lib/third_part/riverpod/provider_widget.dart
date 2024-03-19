import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_with_codeview/widget_with_codeview.dart';

final helloWorldProvider = Provider<String>(
  (ref) => "hello world",
);

class ProviderWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ProviderWidget"),
        centerTitle: true,
      ),
      body: WidgetWithCodeView(
        child: Column(children: [
          Text(ref.read(helloWorldProvider)),
          Text(
            "Provider 用于访问不会改变的依赖项和对象。\n您可以使用它来访问存储库、记录器或其他不包含可变状态的类。",
            style: TextStyle(color: Colors.blue, fontSize: 14),
          )
        ]),
        filePath: "lib/third_part/riverpod/provider_widget.dart",
      ),
    );
  }
}

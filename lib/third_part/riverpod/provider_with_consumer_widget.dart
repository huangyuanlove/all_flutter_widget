import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget/third_part/riverpod/riverpod_widget.dart';
import 'package:widget_with_codeview/widget_with_codeview.dart';

class ProviderWithConsumerWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ProviderWithConsumerWidget"),
        centerTitle: true,
      ),
      body: WidgetWithCodeView(
          child: Column(
            children: [
              Text(ref.read(helloWorldProvider)),
              Text(
                "ConsumerWidget可以用来代替StatelessWidget",
                style: TextStyle(color: Colors.blue, fontSize: 16),
              )
            ],
          ),
          filePath:
              "lib/third_part/riverpod/provider_with_consumer_widget.dart"),
    );
  }
}

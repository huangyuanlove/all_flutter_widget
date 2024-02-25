import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget/third_part/riverpod/riverpod_widget.dart';
import 'package:widget_with_codeview/widget_with_codeview.dart';

class ProviderWithConsumer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ProviderWithConsumer"),
        centerTitle: true,
      ),
      body: WidgetWithCodeView(
        child: Column(children: [
          Text(
            "有一个包含复杂布局的大型小部件类，您可以使用 Consumer 来仅重新构建依赖于提供者的小部件\n创建小而可重用的小部件有利于组合，使代码更加简洁、性能更高，更易于理解。\n如果您遵循这一原则并创建小而可重用的小部件，那么大部分时间您将自然而然地使用 ConsumerWidget。",
            style: TextStyle(color: Colors.blue, fontSize: 16),
          ),
          Consumer(builder: (_, ref, __) {
            return Text(ref.read(helloWorldProvider));
          })
        ]),
        filePath: "lib/third_part/riverpod/provider_with_consumer.dart",
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget/third_part/riverpod/riverpod_widget.dart';
import 'package:widget_with_codeview/widget_with_codeview.dart';

class ProviderWithConsumerStatefulWidget extends ConsumerStatefulWidget {
  @override
  ConsumerState<ProviderWithConsumerStatefulWidget> createState() {
    return ProviderWithConsumerStatefulWidgetState();
  }
}

class ProviderWithConsumerStatefulWidgetState
    extends ConsumerState<ProviderWithConsumerStatefulWidget> {
  @override
  void initState() {
    super.initState();
    // 3. if needed, we can read the provider inside initState
    final helloWorld = ref.read(helloWorldProvider);
    print(helloWorld); // "Hello world"
  }

  @override
  Widget build(BuildContext context) {
    // 4. use ref.watch() to get the value of the provider
    final helloWorld = ref.watch(helloWorldProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("ProviderWithConsumerStatefulWidget"),
        centerTitle: true,
      ),
      body: WidgetWithCodeView(
        child: Column(
          children: [
            Text(
              "ConsumerStatefulWidget可以用来代替StatefulWidget\n当我们从ConsumerState进行子类化时，我们可以在所有小部件生命周期方法中访问ref对象。这是因为ConsumerState声明WidgetRef作为属性，类似于Flutter的State类声明BuildContext作为可以在所有小部件生命周期方法中直接访问的属性。",
              style: TextStyle(color: Colors.blue, fontSize: 16),
            ),
            Text(helloWorld),
          ],
        ),
        filePath:
            "lib/third_part/riverpod/provider_with_consumerStatefulWidget.dart",
      ),
    );
  }
}

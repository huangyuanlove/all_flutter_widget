import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget/all_widget/form/button.dart';

final textProvider = Provider((ref) => "textProvider");
class ProviderDemoWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var value = ref.watch(textProvider);
    return Scaffold(
      appBar: AppBar(title: Text("ProviderDemoWidget"), centerTitle: true,),
      body: Container(
        child: Column(
            children:[ 
              Text(value),
            ElevatedButton(onPressed: ()=>{
              textProvider.overrideWithValue("123")
            }, child: Text("点击此处改变文本值"))
            ]
        ),
      ),
    );
  }

}

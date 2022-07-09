import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final textProvider = Provider((ref) => "textProvider");
class ProviderDemoWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var value = ref.watch(textProvider);
    return Scaffold(
      appBar: AppBar(title: Text("ProviderDemoWidget"), centerTitle: true,),
      body: Container(
        child: Center(
            child: Text(value)
        ),
      ),
    );
  }

}

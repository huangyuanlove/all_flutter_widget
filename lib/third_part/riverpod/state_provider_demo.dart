
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final stateProvider = StateProvider((ref) => 1);

class StateProviderDemoWidget extends ConsumerWidget{


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(stateProvider);
    return Scaffold(
      appBar: AppBar(title: Text("ProviderDemoWidget"), centerTitle: true,),
      body: Container(
        child: Center(
            child: Text("count $value")
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        ref.read(stateProvider.state).state++;
      },

      ),
    );
  }

}
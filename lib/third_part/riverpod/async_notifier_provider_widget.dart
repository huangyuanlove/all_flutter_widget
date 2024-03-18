
import 'dart:async';

import 'dart:math';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final studentAsyncNotifier = AsyncNotifierProvider<StudentAsyncNotifier, Student>(() {
  return StudentAsyncNotifier();
},name: "studentAsyncNotifier");


class AsyncNotifierProviderWidget extends ConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final asyncValue = ref.watch(studentAsyncNotifier);

    return Scaffold(
      appBar: AppBar(title: Text("AsyncNotifierProviderWidget"),centerTitle: false,),
      body: asyncValue.when(data: (data){
       return Center(child: Text(data .toString()),);
      }, error: (error,stack){
       return Center(child: Text(error.toString()),);
      }, loading: (){
        return Center(child: CircularProgressIndicator());
      }),
      floatingActionButton: FloatingActionButton(onPressed: (){
        ref.read(studentAsyncNotifier.notifier).refresh();
      },child: Icon(Icons.refresh),),
    );
  }

}

class Student{
  Student({required this.name,required this.id});
  String name;
  String id;

  String toString(){
    return "$id - $name";
  }
}



class StudentAsyncNotifier extends AsyncNotifier<Student>{
  @override
  FutureOr<Student> build() async {

      return getInfo();
  }

 Future<Student> getInfo()async{
    
    await  Future.delayed(Duration(seconds: 3));
    final wordPair = generateWordPairs().first;
    return Student(name: "${wordPair.first} - ${wordPair.second}", id: Random().nextInt(100).toString());
    
  } 

  Future<void> refresh() async{
      state = AsyncValue.loading();
      state = await AsyncValue.guard(()async {
        return getInfo();
      });
  }


}
import 'dart:math';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget/logger.dart';

class Student {
  Student({required this.name, required this.id});
  String name;
  String id;

  Student copyWith({String? copyID, String? copyName}) {
    return Student(name: copyName ?? this.name, id: copyID ?? this.id);
  }
  String toString(){
    return "$id : $name";
  }
}

class StudentNotifier extends Notifier<Student> {
  @override
  Student build() {
    return generateStudent();
  }

  Student generateStudent() {
    final wordPair = generateWordPairs().first;
    final id = Random().nextInt(100);

    return Student(
        name: "${wordPair.first} - ${wordPair.second}", id: id.toString());
  }

  String toString() {
    return "${state.id} : ${state.name}";
  }

  void change() {
    state = generateStudent();
  }

  void changeNameWithCopy(String name) {
    state = state.copyWith(copyName: name);
  }

  void justChangeName(String name) {
    state.name = name;
  }

  void changeIdWithCopy(String id) {
    state = state.copyWith(copyID: id);
  }

  void justChangeId(String id) {
    state.id = id;
  }
}

final counterProvider = NotifierProvider<StudentNotifier, Student>(() {
  return StudentNotifier();
});
final counterProviderOther =
    NotifierProvider<StudentNotifier, Student>(StudentNotifier.new);

class CounterNotifierWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final student = ref.watch(counterProvider);
    ref.listen(counterProvider, (oldValue, newValue) {
      logger.d(
          "oldValue--> ${oldValue?.id.toString()} \n newValue--> ${newValue.id}");
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("CounterNotifierWidget"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text("student ${student.id.toString()} : ${student.name}  --> ${student.toString()}"),

          ElevatedButton(
              onPressed: () {
                ref
                    .read(counterProvider.notifier)
                    .changeIdWithCopy(Random().nextInt(100).toString());
              },
              child: Text("changeIdWithCopy")),
          ElevatedButton(
              onPressed: () {
                final wordPair = generateWordPairs().first;
                ref.read(counterProvider.notifier).changeNameWithCopy(
                    "${wordPair.first} - -${wordPair.second}");
              },
              child: Text("changeNameWithCopy")),

          ElevatedButton(
              onPressed: () {
                ref
                    .read(counterProvider.notifier)
                    .justChangeId(Random().nextInt(100).toString());
              },
              child: Text("justChangeId")),
          ElevatedButton(
              onPressed: () {
                final wordPair = generateWordPairs().first;
                ref
                    .read(counterProvider.notifier)
                    .justChangeName("${wordPair.first} - -${wordPair.second}");
              },
              child: Text("justChangeName")),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).change();
        },
        child: Icon(Icons.change_circle),
      ),
    );
  }
}

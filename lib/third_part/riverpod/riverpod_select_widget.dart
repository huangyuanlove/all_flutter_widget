import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final provider = StateNotifierProvider<SutdentStateNotifier, Student>(
    (ref) => SutdentStateNotifier(Student("huang", "xuan", 18)));

class RiverpodSelectWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Student student = ref.watch(provider);
    final String filterFistName =
        ref.watch(provider.select((value) => value.firstName));

    return Scaffold(
      appBar: AppBar(
        title: Text("select"),
        centerTitle: true,
      ),
      body: Column(children: [
        Text(ref.read(provider.select((value) => value.age.toString()))),
        Text("filterFistName --> $filterFistName"),
        Text(student.firstName + student.lastName + student.age.toString()),
        Row(
          children: [
            ElevatedButton(
                onPressed: () {
                  ref.read(provider.notifier).changeAge();
                },
                child: Text("改变年龄")),
            ElevatedButton(
                onPressed: () {
                  ref.read(provider.notifier).changeName();
                },
                child: Text("改变姓名"))
          ],
        )
      ]),
    );
  }
}

class Student {
  Student(this.firstName, this.lastName, this.age);

  String firstName;
  String lastName;
  int age;
  Student copy() {
    return new Student(firstName, lastName, age);
  }
}

class SutdentStateNotifier extends StateNotifier<Student> {
  SutdentStateNotifier(super.state);

  String getInfo() {
    return state.firstName + " " + state.lastName + " " + state.age.toString();
  }

  void changeName() {
    final wordpair = generateWordPairs().first;
    final student = state.copy();
    student.firstName = wordpair.first;
    student.lastName = wordpair.second;
    state = student;
  }

  void changeAge() {
    final student = state.copy();
    student.age++;
    state = student;
  }
}

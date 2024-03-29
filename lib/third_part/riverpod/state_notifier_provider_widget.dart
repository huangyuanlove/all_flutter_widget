import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final todoProvider =
    StateNotifierProvider<TodosNotifier, List<Todo>>((ref) => TodosNotifier());

class StateNotifierProviderWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Todo> todos = ref.watch(todoProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("State Notifier Provider Widget"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text("StateNotifierProvider和StateNotifier非常适合管理可能会因事件或用户交互而发生变化的状态。"),
          Text("注意StateNotifier中通知更新时是比较的对象内存地址"),
          Divider(),
          Container(
            child: Text(
                "共${todos.length.toString()},完成-》${ref.read(todoProvider.notifier).completedCount()}"),
          ),
          CheckboxListTile(
            value: ref.read(todoProvider.notifier).isSelectAll(),
            onChanged: (value) {
              if (value ?? false) {
                ref.read(todoProvider.notifier).selectAll();
              } else {
                ref.read(todoProvider.notifier).unSelectAll();
              }
            },
            title: Text("全选"),
          ),
          Expanded(
              child: ListView(
            shrinkWrap: true,
            children: [
              for (final todo in todos)
                Dismissible(
                  key: Key(todo.id),
                  child: CheckboxListTile(
                    value: todo.completed,
                    onChanged: (value) =>
                        ref.read(todoProvider.notifier).toggle(todo.id),
                    title: Text(todo.description),
                  ),
                  onDismissed: (direction) =>
                      {ref.read(todoProvider.notifier).removeTodo(todo.id)},
                ),
            ],
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          final notifier = ref.read(todoProvider.notifier);
          notifier.addTodo(Todo(
              id: DateTime.now().microsecond.toString(),
              description: "${DateTime.now().microsecondsSinceEpoch}",
              completed: false));
        },
      ),
    );
  }
}

@immutable
class Todo {
  const Todo(
      {required this.id, required this.description, required this.completed});

  final String id;
  final String description;
  final bool completed;
  Todo copyWith({String? id, String? description, bool? completed}) {
    return Todo(
      id: id ?? this.id,
      description: description ?? this.description,
      completed: completed ?? this.completed,
    );
  }
}

class TodosNotifier extends StateNotifier<List<Todo>> {
  TodosNotifier() : super([]);

  void addTodo(Todo todo) {
    state = [...state, todo];
  }

  int completedCount() {
    int count = 0;
    for (final todo in state) {
      if (todo.completed) {
        count++;
      }
    }
    return count;
  }

  void removeTodo(String todoId) {
    state = [
      for (final todo in state)
        if (todo.id != todoId) todo,
    ];
  }

  void toggle(String todoID) {
    state = [
      for (final todo in state)
        if (todo.id == todoID)
          todo.copyWith(completed: !todo.completed)
        else
          todo
    ];
  }

  void selectAll() {
    state = [for (final todo in state) todo.copyWith(completed: true)];
  }

  void unSelectAll() {
    state = [for (final todo in state) todo.copyWith(completed: false)];
  }

  bool isSelectAll() {
    bool result = true;
    for (final todo in state) {
      if (!todo.completed) {
        result = false;
        break;
      }
    }
    return result;
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/app/model/todo_model.dart';

class StateNotifierProviderViewModel {
  static final stateNotifierProvider =
      StateNotifierProvider<TodoNotifier, List<Todo>>((ref) {
    return TodoNotifier();
  });
}

class TodoNotifier extends StateNotifier<List<Todo>> {
  TodoNotifier() : super([]);

  //TODO:Add
  addTodo(String todo) {
    final item =
        Todo(title: todo, id: DateTime.now().toString(), isCompleted: false);
    state.add(item);
    state = state.toList();
  }

  //TODO:Remove
  removeTodo(String id) {
    state.removeWhere((todo) => todo.id == id);
    state = state.toList();
  }

  //TODO:Toggle
  toggleTodo(String id) {
    state = state.map((todo) {
      if (todo.id == id) {
        return todo.copyWith(isCompleted: !todo.isCompleted);
      }
      return todo;
    }).toList();
  }
}

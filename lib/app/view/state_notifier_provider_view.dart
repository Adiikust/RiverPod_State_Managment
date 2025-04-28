import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/app/view_model/state_notifier_provider_view_model.dart';

class StateNotifierProviderView extends ConsumerWidget {
  const StateNotifierProviderView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: SafeArea(
          child: Consumer(builder: (context, ref, child) {
            final todos =
                ref.watch(StateNotifierProviderViewModel.stateNotifierProvider);
            return todos.isNotEmpty
                ? ListView.builder(
                    itemCount: todos.length,
                    itemBuilder: (context, index) {
                      final todo = todos[index];
                      return ListTile(
                        title: Text(
                          todo.title,
                          style: TextStyle(
                            decoration: todo.isCompleted
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                          ),
                        ),
                        leading: Checkbox(
                          value: todo.isCompleted,
                          onChanged: (_) {
                            ref
                                .watch(StateNotifierProviderViewModel
                                    .stateNotifierProvider.notifier)
                                .toggleTodo(todo.id);
                          },
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            ref
                                .watch(StateNotifierProviderViewModel
                                    .stateNotifierProvider.notifier)
                                .removeTodo(todo.id);
                          },
                        ),
                      );
                    },
                  )
                : const Center(child: Text("Not Found!"));
          }),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ref
                .watch(StateNotifierProviderViewModel
                    .stateNotifierProvider.notifier)
                .addTodo("State Notifier");
          },
          child: const Icon(Icons.add),
        ));
  }
}

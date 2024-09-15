import 'package:flutter/material.dart';
import 'package:todo_app/todo_repository.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return TodoProvider(
      todoRepository: TodoRepository(),
      child: const MaterialApp(
        home: Scaffold(
          body: Center(
            child: Placeholder(),
          ),
        ),
      ),
    );
  }
}

class TodoProvider extends InheritedWidget {
  final TodoRepository todoRepository;

  const TodoProvider({
    super.key,
    required this.todoRepository,
    required super.child,
  });

  @override
  bool updateShouldNotify(covariant TodoProvider oldWidget) =>
      todoRepository != oldWidget.todoRepository;

  static TodoProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TodoProvider>()!;
  }
}

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    final todoRepository = TodoProvider.of(context).todoRepository;

    return const Placeholder();
  }
}

class TodoFilter extends StatefulWidget {
  const TodoFilter({super.key});

  @override
  State<TodoFilter> createState() => _TodoFilterState();
}

class _TodoFilterState extends State<TodoFilter> {
  @override
  Widget build(BuildContext context) {
    final todoRepository = TodoProvider.of(context).todoRepository;

    return const Placeholder();
  }
}

/*
  <!-- Add dynamic number --> items left

  All
  Active 
  Completed

  Clear Completed

  Drag and drop to reorder list
*/
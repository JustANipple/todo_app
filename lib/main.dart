import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/themes.dart';
import 'package:todo_app/todo_filter.dart';
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
      child: MaterialApp(
        theme: lightTheme,
        darkTheme: darkTheme,
        home: const Scaffold(
          body: Center(
            child: TodoFilter(),
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

class TodoCreate extends StatefulWidget {
  const TodoCreate({super.key});

  @override
  State<TodoCreate> createState() => _TodoCreateState();
}

class _TodoCreateState extends State<TodoCreate> {
  @override
  Widget build(BuildContext context) {
    final todoRepository = TodoProvider.of(context).todoRepository;

    return const Placeholder();
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

/*
  <!-- Add dynamic number --> items left

  All
  Active 
  Completed

  Clear Completed

  Drag and drop to reorder list
*/
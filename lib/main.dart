import 'package:flutter/material.dart';
import 'package:todo_app/responsive_container.dart';
import 'package:todo_app/themes.dart';
import 'package:todo_app/todo_create.dart';
import 'package:todo_app/todo_filter.dart';
import 'package:todo_app/todo_list.dart';
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
        // darkTheme: darkTheme,
        themeMode: ThemeMode.system,
        home: const Scaffold(
          body: Center(
            child: ResponsiveContainer(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TodoCreate(),
                    SizedBox(height: 16),
                    TodoList(),
                    SizedBox(height: 16),
                    TodoFilter(),
                  ],
                ),
              ),
            ),
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

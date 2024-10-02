import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/responsive_container.dart';
import 'package:todo_app/themes.dart';
import 'package:todo_app/todo_create.dart';
import 'package:todo_app/todo_filter.dart';
import 'package:todo_app/todo_list.dart';
import 'package:todo_app/todo_provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoProvider(),
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

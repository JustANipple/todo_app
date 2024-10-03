import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/responsive_container.dart';
import 'package:todo_app/themes.dart';
import 'package:todo_app/todo_create.dart';
import 'package:todo_app/todo_filter.dart';
import 'package:todo_app/todo_header.dart';
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
      child: Consumer<TodoProvider>(
        builder: (context, todoProvider, child) => MaterialApp(
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: todoProvider.themeMode,
          home: Scaffold(
            body: SafeArea(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(todoProvider.themeMode == ThemeMode.light
                        ? "assets/images/bg-mobile-light.jpg"
                        : "assets/images/bg-mobile-dark.jpg"),
                    alignment: Alignment.topCenter,
                  ),
                ),
                constraints: const BoxConstraints(maxHeight: 730),
                child: const Align(
                  alignment: Alignment.topCenter,
                  child: ResponsiveContainer(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TodoHeader(),
                          TodoCreate(),
                          SizedBox(height: 16),
                          TodoList(),
                          SizedBox(height: 16),
                          TodoFilter()
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

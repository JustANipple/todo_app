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
      child: Consumer<TodoProvider>(
        builder: (context, todoProvider, child) => MaterialApp(
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: todoProvider.themeMode,
          home: Scaffold(
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(todoProvider.themeMode == ThemeMode.light
                      ? "assets/images/bg-mobile-light.jpg"
                      : "assets/images/bg-mobile-dark.jpg"),
                  alignment: Alignment.topCenter,
                ),
              ),
              child: Center(
                child: ResponsiveContainer(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const TodoHeader(),
                        const TodoCreate(),
                        const SizedBox(height: 16),
                        const TodoList(),
                        const SizedBox(height: 16),
                        const TodoFilter(),
                        const SizedBox(height: 35),
                        Text(
                          "Drag and drop to reorder list",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                        ),
                      ],
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

class TodoHeader extends StatefulWidget {
  const TodoHeader({super.key});

  @override
  State<TodoHeader> createState() => _TodoHeaderState();
}

class _TodoHeaderState extends State<TodoHeader> {
  @override
  Widget build(BuildContext context) {
    TodoProvider todoProvider = Provider.of<TodoProvider>(context);

    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "TODO",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w400,
                  letterSpacing: 10,
                  fontSize: 25,
                  color: Colors.white,
                ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shadowColor: Colors.transparent,
              backgroundColor: Colors.transparent,
              padding: const EdgeInsets.symmetric(
                horizontal: 0,
              ),
            ),
            onPressed: () {
              todoProvider.changeTheme();
            },
            child: Icon(
              todoProvider.themeMode == ThemeMode.light
                  ? Icons.dark_mode
                  : Icons.light_mode,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

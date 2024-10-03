import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/todo_provider.dart';

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
      padding: const EdgeInsets.only(top: 45, bottom: 25),
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

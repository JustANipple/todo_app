import 'package:flutter/material.dart';
import 'package:todo_app/main.dart';

class TodoCreate extends StatefulWidget {
  const TodoCreate({super.key});

  @override
  State<TodoCreate> createState() => _TodoCreateState();
}

class _TodoCreateState extends State<TodoCreate> {
  @override
  Widget build(BuildContext context) {
    bool isChecked = true;
    final todoRepository = TodoProvider.of(context).todoRepository;
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow,
            offset: const Offset(0, 35),
            blurRadius: 50,
            spreadRadius: -15,
          )
        ],
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: IntrinsicWidth(
        child: Row(
          children: [
            Checkbox(
              value: isChecked,
              onChanged: (bool? value) {
                setState() {
                  if (value != null) {
                    isChecked = value;
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

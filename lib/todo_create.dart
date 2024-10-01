import 'package:flutter/material.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/todo_repository.dart';

class TodoCreate extends StatefulWidget {
  const TodoCreate({super.key});

  @override
  State<TodoCreate> createState() => _TodoCreateState();
}

class _TodoCreateState extends State<TodoCreate> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
      child: Form(
        key: _formKey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                  Colors.transparent,
                ),
                shadowColor: WidgetStateProperty.all(Colors.transparent),
                shape: WidgetStateProperty.all(
                  CircleBorder(
                    side: BorderSide(
                      width: 1,
                      color: Theme.of(context).colorScheme.shadow,
                    ),
                  ),
                ),
                minimumSize: WidgetStateProperty.all(const Size(20, 20)),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final todoText = _textController.text.trim();
                  todoRepository.createTodo(todoText);
                  setState(() {});
                }
              },
              child: const Text(
                "",
                textDirection: TextDirection.ltr,
              ),
            ),
            SizedBox(
              width: 250,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Create a new todo...",
                  hintStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary),
                  errorStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: Theme.of(context).colorScheme.error, height: 0),
                  contentPadding: const EdgeInsets.all(0),
                ),
                onFieldSubmitted: (value) {
                  if (_formKey.currentState!.validate()) {
                    final todoText = _textController.text.trim();
                    todoRepository.createTodo(todoText);
                  }
                },
                controller: _textController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                textDirection: TextDirection.ltr,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

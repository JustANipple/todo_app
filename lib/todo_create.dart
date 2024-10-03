import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/todo_provider.dart';

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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.onSecondary,
                  width: .25,
                ),
                shape: BoxShape.circle,
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final todoText = _textController.text.trim();
                    Provider.of<TodoProvider>(context, listen: false)
                        .addTodo(todoText);
                    _textController.clear();
                  }
                },
                child: const Text(
                  "",
                  textDirection: TextDirection.ltr,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
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
                    Provider.of<TodoProvider>(context, listen: false)
                        .addTodo(todoText);
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

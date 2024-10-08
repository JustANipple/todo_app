import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/todo_provider.dart';
import 'package:todo_app/todo_repository.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    final List<Todo> todoList = Provider.of<TodoProvider>(context).getTodos();
    int todosLeft = Provider.of<TodoProvider>(context).getTodosLeft();

    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        color: Theme.of(context).colorScheme.primary,
      ),
      constraints: const BoxConstraints(maxHeight: 368),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: todoList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  key: ValueKey(todoList[index]),
                  child: Container(
                    padding: const EdgeInsets.only(
                        left: 20, right: 6, top: 6, bottom: 6),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Theme.of(context).colorScheme.onSecondary,
                          width: .25,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              RoundedCheckbox(index: index),
                              const SizedBox(width: 12),
                              TodoText(todoList: todoList, index: index),
                            ],
                          ),
                        ),
                        DeleteTodoIcon(index: index),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          TodoFooter(todosLeft: todosLeft),
        ],
      ),
    );
  }
}

class TodoFooter extends StatelessWidget {
  const TodoFooter({
    super.key,
    required this.todosLeft,
  });

  final int todosLeft;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$todosLeft items left",
            textDirection: TextDirection.ltr,
            style: Theme.of(context)
                .textTheme
                .labelSmall!
                .copyWith(color: Theme.of(context).colorScheme.onSecondary),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shadowColor: Colors.transparent,
              backgroundColor: Colors.transparent,
              padding: const EdgeInsets.symmetric(
                horizontal: 6,
              ),
            ),
            onPressed: () {
              Provider.of<TodoProvider>(context, listen: false)
                  .deleteCompletedTodos();
            },
            child: Text(
              "Clear completed",
              textDirection: TextDirection.ltr,
              style: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .copyWith(color: Theme.of(context).colorScheme.onSecondary),
            ),
          )
        ],
      ),
    );
  }
}

class DeleteTodoIcon extends StatelessWidget {
  final int index;
  const DeleteTodoIcon({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.close,
        size: 20,
      ),
      color: Theme.of(context).colorScheme.onSecondary,
      onPressed: () {
        Provider.of<TodoProvider>(context, listen: false).deleteTodo(index);
      },
    );
  }
}

class TodoText extends StatelessWidget {
  final int index;
  const TodoText({
    super.key,
    required this.todoList,
    required this.index,
  });

  final List<Todo> todoList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Text(
          textAlign: TextAlign.left,
          todoList[index].description,
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                decoration:
                    Provider.of<TodoProvider>(context).getTodo(index).completed
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                color:
                    Provider.of<TodoProvider>(context).getTodo(index).completed
                        ? Theme.of(context).colorScheme.onTertiary
                        : Theme.of(context).colorScheme.onPrimary,
              ),
        ),
      ),
    );
  }
}

class RoundedCheckbox extends StatelessWidget {
  final int index;
  const RoundedCheckbox({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        gradient: Provider.of<TodoProvider>(context).getTodo(index).completed
            ? LinearGradient(colors: [
                Theme.of(context).colorScheme.primaryContainer,
                Theme.of(context).colorScheme.secondaryContainer
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)
            : null,
        border: Border.all(
          color: Theme.of(context).colorScheme.onSecondary,
          width: .25,
        ),
      ),
      child: FittedBox(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          onPressed: () {
            Provider.of<TodoProvider>(context, listen: false).toggleTodo(index);
          },
          child: Icon(
            Icons.check,
            size: 70,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
}

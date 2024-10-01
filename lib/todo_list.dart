import 'package:flutter/material.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/todo_repository.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    final TodoRepository todoRepository =
        TodoProvider.of(context).todoRepository;
    final List<String> todoList = todoRepository.getTodos();
    final todosLeft = todoRepository.getTodosLeft();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: todoList.length,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: LinearGradient(
                                  colors: [
                                    Theme.of(context)
                                        .colorScheme
                                        .primaryContainer,
                                    Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                            ),
                            child: FittedBox(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                ),
                                onPressed: () {
                                  todoRepository.toggleTodo(index);
                                  setState(() {});
                                },
                                child: const Icon(
                                  Icons.check,
                                  size: 25,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                textAlign: TextAlign.left,
                                todoList[index],
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .copyWith(
                                      decoration:
                                          todoRepository.isCompleted(index)
                                              ? TextDecoration.lineThrough
                                              : TextDecoration.none,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      color: Theme.of(context).colorScheme.shadow,
                      onPressed: () {
                        todoRepository.deleteTodo(index);
                        setState(() {});
                      },
                    ),
                  ],
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "$todosLeft left",
                  textDirection: TextDirection.ltr,
                ),
                ElevatedButton(
                  onPressed: () {
                    todoRepository.deleteCompletedTodos();
                    setState(() {});
                  },
                  child: const Text(
                    "Clear completed",
                    textDirection: TextDirection.ltr,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

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
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: todoList.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.only(
                      left: 20, right: 6, top: 6, bottom: 6),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Theme.of(context).colorScheme.shadow,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Container(
                              width: 22,
                              height: 22,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                gradient: todoRepository.isCompleted(index)
                                    ? LinearGradient(
                                        colors: [
                                            Theme.of(context)
                                                .colorScheme
                                                .primaryContainer,
                                            Theme.of(context)
                                                .colorScheme
                                                .secondaryContainer
                                          ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight)
                                    : null,
                                border: Border.all(
                                  color: Theme.of(context).colorScheme.shadow,
                                ),
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
                                    size: 70,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
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
                                        color: todoRepository.isCompleted(index)
                                            ? Theme.of(context)
                                                .colorScheme
                                                .onTertiary
                                            : Theme.of(context)
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
                  ),
                );
              },
            ),
          ),
          Container(
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
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary),
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
                    todoRepository.deleteCompletedTodos();
                    setState(() {});
                  },
                  child: Text(
                    "Clear completed",
                    textDirection: TextDirection.ltr,
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: Theme.of(context).colorScheme.onSecondary),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

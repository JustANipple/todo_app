import 'package:flutter/material.dart';
import 'package:todo_app/todo_repository.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return TodoProvider(
      todoRepository: TodoRepository(),
      child: const MaterialApp(
        home: Scaffold(
          body: Center(
            child: TodoFilter(),
          ),
        ),
      ),
    );
  }
}

class TodoProvider extends InheritedWidget {
  final TodoRepository todoRepository;

  const TodoProvider({
    super.key,
    required this.todoRepository,
    required super.child,
  });

  @override
  bool updateShouldNotify(covariant TodoProvider oldWidget) =>
      todoRepository != oldWidget.todoRepository;

  static TodoProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TodoProvider>()!;
  }
}

class TodoCreate extends StatefulWidget {
  const TodoCreate({super.key});

  @override
  State<TodoCreate> createState() => _TodoCreateState();
}

class _TodoCreateState extends State<TodoCreate> {
  @override
  Widget build(BuildContext context) {
    final todoRepository = TodoProvider.of(context).todoRepository;

    return const Placeholder();
  }
}

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    final todoRepository = TodoProvider.of(context).todoRepository;

    return const Placeholder();
  }
}

class TodoFilter extends StatefulWidget {
  const TodoFilter({super.key});

  @override
  State<TodoFilter> createState() => _TodoFilterState();
}

class _TodoFilterState extends State<TodoFilter> {
  @override
  Widget build(BuildContext context) {
    final todoRepository = TodoProvider.of(context).todoRepository;
    var filterList = Filter.values.toList();
    return Container(
      width: 327,
      height: 48,
      decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black, blurRadius: 4)],
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: filterList.length,
          itemBuilder: (context, index) {
            return Row(children: [
              Text(filterList[index].name),
              const SizedBox(
                width: 10,
              )
            ]);
          }),
    );
  }
}

/*
  <!-- Add dynamic number --> items left

  All
  Active 
  Completed

  Clear Completed

  Drag and drop to reorder list
*/
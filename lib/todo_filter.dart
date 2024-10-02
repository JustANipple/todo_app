import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/todo_provider.dart';
import 'todo_repository.dart';

class TodoFilter extends StatefulWidget {
  const TodoFilter({super.key});

  @override
  State<TodoFilter> createState() => _TodoFilterState();
}

class _TodoFilterState extends State<TodoFilter> {
  @override
  Widget build(BuildContext context) {
    List<Filter> filterList = Filter.values.toList();
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
      constraints: const BoxConstraints(
        maxWidth: 327,
        maxHeight: 48,
      ),
      child: Center(
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: filterList.length,
            itemBuilder: (context, index) {
              return Row(children: [
                GestureDetector(
                  onTap: () {
                    setState(() =>
                        Provider.of<TodoProvider>(context, listen: false)
                            .changeFilter(index));
                  },
                  child: Text(
                    filterList[index].name,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: index ==
                              Provider.of<TodoProvider>(context)
                                  .getSelectedIndex()
                          ? Theme.of(context).colorScheme.onSecondaryFixed
                          : Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                ),
                if (index < filterList.length - 1)
                  const SizedBox(
                    width: 19,
                  ),
              ]);
            }),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/themes.dart';
import 'todo_repository.dart';

class TodoFilter extends StatefulWidget {
  const TodoFilter({super.key});

  @override
  State<TodoFilter> createState() => _TodoFilterState();
}

class _TodoFilterState extends State<TodoFilter> {
  @override
  Widget build(BuildContext context) {
    final todoRepository = TodoProvider.of(context).todoRepository;
    List<Filter> filterList = Filter.values.toList();
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
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
                    setState(() => todoRepository.changeFilter(index));
                  },
                  child: Text(
                    filterList[index].name,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: index == todoRepository.selectedIndex
                          ? const Color.fromRGBO(58, 123, 253, 1)
                          : const Color.fromRGBO(147, 148, 165, 1),
                    ),
                  ),
                ),
                if (index < filterList.length - 1) const SizedBox(width: 19),
              ]);
            }),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Filter(),
        ),
      ),
    );
  }
}

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  int selectedFilter = 0;
  final List<String> filters = ["All", "Active", "Completed"];

  void changeFilter(int newFilterIndex) {
    setState(() {
      selectedFilter = newFilterIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        child: Row(
          children: [
            for (int i = 0; i < filters.length; i++)
              TextButton(
                onPressed: () => changeFilter(i),
                child: Text(
                  filters[i],
                  style: TextStyle(
                    color: selectedFilter == i ? Colors.blue : Colors.black,
                  ),
                ),
              )
          ],
        ),
      ),
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
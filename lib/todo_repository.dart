class TodoRepository {
  final List<Todo> _todos = [
    Todo(
      description: "Complete online JavaScript course",
      completed: true,
    ),
    Todo(
      description: "Job around the park 3x",
      completed: false,
    ),
    Todo(
      description: "10 minutes meditation",
      completed: false,
    ),
    Todo(
      description: "Read for 1 hour",
      completed: false,
    ),
    Todo(
      description: "Pick up groceries",
      completed: false,
    ),
    Todo(
      description: "Complete Todo App on Frontend Mentor",
      completed: false,
    ),
    Todo(
      description: "Complete Todo App on Frontend Mentor Mentor Mentor Mentor",
      completed: false,
    ),
  ];

  int _selectedIndex = Filter.All.index;

  int get selectedIndex => _selectedIndex;

  void changeFilter(int newIndex) {
    _selectedIndex = newIndex;
  }

  void createTodo(String description) {
    _todos.add(Todo(description: description, completed: false));
  }

  List<String> getTodos() {
    if (_selectedIndex == 0) {
      return _todos.map((todo) => todo.description).toList();
    } else if (_selectedIndex == 1) {
      return _todos
          .where((todo) => !todo.completed)
          .map((todo) => todo.description)
          .toList();
    } else {
      return _todos
          .where((todo) => todo.completed)
          .map((todo) => todo.description)
          .toList();
    }
  }

  void toggleTodo(int index) {
    _todos[index].completed = !_todos[index].completed;
  }

  void deleteTodo(int index) {
    _todos.removeAt(index);
  }

  void deleteCompletedTodos() {
    _todos.removeWhere((todo) => todo.completed);
  }

  bool isCompleted(index) {
    return _todos[index].completed;
  }

  int getTodosLeft() {
    return _todos.where((todo) => !todo.completed).length;
  }
}

class Todo {
  String description;
  bool completed;
  Todo({
    required this.description,
    required this.completed,
  });
}

// ignore: constant_identifier_names
enum Filter { All, Active, Completed }

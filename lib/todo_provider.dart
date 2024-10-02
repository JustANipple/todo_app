import 'package:flutter/material.dart';
import 'package:todo_app/todo_repository.dart';

class TodoProvider with ChangeNotifier {
  final TodoRepository _todoRepository = TodoRepository();

  List<Todo> get todos => _todoRepository.getTodos();

  TodoRepository get todoRepository => _todoRepository;

  void addTodo(String text) {
    _todoRepository.createTodo(text);
    notifyListeners();
  }

  List<Todo> getTodos() {
    return _todoRepository.getTodos();
  }

  Todo getTodo(int index) {
    return _todoRepository.getTodos()[index];
  }

  int getTodosLeft() {
    return _todoRepository.getTodosLeft();
  }

  void toggleTodo(int index) {
    _todoRepository.toggleTodo(index);
    notifyListeners();
  }

  void deleteTodo(int index) {
    _todoRepository.deleteTodo(index);
    notifyListeners();
  }

  void deleteCompletedTodos() {
    _todoRepository.deleteCompletedTodos();
    notifyListeners();
  }

  void changeFilter(int newIndex) {
    _todoRepository.changeFilter(newIndex);
    notifyListeners();
  }

  int getSelectedIndex() {
    return _todoRepository.selectedIndex;
  }
}

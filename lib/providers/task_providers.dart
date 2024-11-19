import 'package:flutter/foundation.dart';
import 'package:todoapp/models/data_model.dart';

class TaskProvider with ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> get tasks {
    return [..._tasks];
  }

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void deleteTask(String id) {
    _tasks.removeWhere((task) => task.id == id);
    notifyListeners();
  }

  void editTask(String id, String newTitle) {
    final index = _tasks.indexWhere((task) => task.id == id);
    if (index != -1) {
      _tasks[index] = Task(
        id: id,
        title: newTitle,
        isDone: _tasks[index].isDone,
      );
      notifyListeners();
    }
  }

  void toggleTaskStatus(String id) {
    final index = _tasks.indexWhere((task) => task.id == id);
    if (index != -1) {
      _tasks[index] = Task(
        id: id,
        title: _tasks[index].title,
        isDone: !_tasks[index].isDone,
      );
      notifyListeners();
    }
  }
}

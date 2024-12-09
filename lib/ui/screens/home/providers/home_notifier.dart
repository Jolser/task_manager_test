import 'package:flutter/material.dart';
import 'package:tast_managger/domain/entities/task_simple.dart';
import 'package:tast_managger/ui/screens/home/providers/home_provider.dart';

class HomeNotifier extends ChangeNotifier {
  final HomeProvider _tasksProvider = HomeProvider();
  bool _isLoading = true;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  List<TaskSimple> _tasks = [];
  List<TaskSimple> get tasks => _tasks;

  Future<void> loadTasks() async {
    _isLoading = true;
    notifyListeners();
    try {
      _tasks = await _tasksProvider.getTasks();
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deleteTask(int taskId) async {
    try {
      await _tasksProvider.deleteTask(taskId);
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {}
  }

}

import 'package:flutter/material.dart';
import 'package:tast_managger/domain/entities/task.dart';
import 'package:tast_managger/ui/screens/task_details/providers/task_details_provider.dart';

class TaskDetailsNotifier extends ChangeNotifier {
  final TaskDetailsProvider _tasksProvider = TaskDetailsProvider();

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Task? _task;
  Task? get task => _task;

  Future<void> loadTaskDetails(int taskId) async {
    _isLoading = true;
    notifyListeners();
    try {
      final response = await _tasksProvider.getTaskId(taskId);
      _task = response[0];
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

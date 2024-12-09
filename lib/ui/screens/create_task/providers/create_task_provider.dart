import 'package:tast_managger/domain/entities/task.dart';
import 'package:tast_managger/domain/usecases/add_task_use_case.dart';

class CreateTaskProvider {
  final AddTaskUseCase _addTaskUseCase = AddTaskUseCase();

  Future<Task> addTask(
    String title,
    bool isCompleted,
    String? dueDate,
    String? comments,
    String? description,
    String? tags,
  ) async {
    final response = await _addTaskUseCase.addTask(
        title, isCompleted, dueDate, comments, description, tags);
    return response;
  }
}

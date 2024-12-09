import 'package:tast_managger/domain/entities/task.dart';
import 'package:tast_managger/domain/usecases/edit_task_use_case.dart';

class EditTaskProvider {
  final EditTaskUseCase _addTaskUseCase = EditTaskUseCase();

  Future<Task> editTask(
    int taskId,
    String title,
    bool isCompleted,
    String? dueDate,
    String? comments,
    String? description,
    String? tags,
  ) async {
    final response = await _addTaskUseCase.editTask(taskId,
        title, isCompleted, dueDate, comments, description, tags);
    return response;
  }
}

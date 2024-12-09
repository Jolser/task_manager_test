import 'package:tast_managger/core/services/service_locator.dart';
import 'package:tast_managger/domain/entities/task.dart';
import 'package:tast_managger/domain/repositories/tasks_repositorie.dart';

class EditTaskUseCase {
  final TasksRepository _tasksRepository;

  EditTaskUseCase() : _tasksRepository = ServiceLocator.sl<TasksRepository>();

  Future<Task> editTask(
    int taskId,
    String title,
    bool isCompleted,
    String? dueDate,
    String? comments,
    String? description,
    String? tags,
  ) async {
    final response = await _tasksRepository.editTask(taskId, 'Pruebatoken', title,
        isCompleted, dueDate, comments, description, tags);
    return response;
  }
}

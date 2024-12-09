import 'package:tast_managger/core/services/service_locator.dart';
import 'package:tast_managger/domain/repositories/tasks_repositorie.dart';

class DeleteTasksUseCase {
  final TasksRepository _tasksRepository;

  DeleteTasksUseCase() : _tasksRepository = ServiceLocator.sl<TasksRepository>();

  Future<void> deleteTask(int taskId) async {
    await _tasksRepository.deleteTask('Pruebatoken', taskId);
  }
}
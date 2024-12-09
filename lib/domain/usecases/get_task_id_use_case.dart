import 'package:tast_managger/core/services/service_locator.dart';
import 'package:tast_managger/domain/entities/task.dart';
import 'package:tast_managger/domain/repositories/tasks_repositorie.dart';

class GetTaskIdIUseCase {
  final TasksRepository _tasksRepository;

  GetTaskIdIUseCase()
      : _tasksRepository = ServiceLocator.sl<TasksRepository>();

  Future<List<Task>> getTaskId(int taskId) async {
    final response = await _tasksRepository.getTaskId('Pruebatoken', taskId);
    return response;
  }
}

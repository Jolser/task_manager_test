import 'package:tast_managger/core/services/service_locator.dart';
import 'package:tast_managger/domain/entities/task_simple.dart';
import 'package:tast_managger/domain/repositories/tasks_repositorie.dart';

class GetTasksUseCase {
  final TasksRepository _tasksRepository;

  GetTasksUseCase() : _tasksRepository = ServiceLocator.sl<TasksRepository>();

  Future<List<TaskSimple>> getTasks() async {
    final response = await _tasksRepository.getTasks('Pruebatoken');
    return response;
  }
}

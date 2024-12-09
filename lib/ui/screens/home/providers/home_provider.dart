import 'package:tast_managger/domain/entities/task_simple.dart';
import 'package:tast_managger/domain/usecases/delete_task_use_case.dart';
import 'package:tast_managger/domain/usecases/get_tasks_use_case.dart';

class HomeProvider {
  final GetTasksUseCase _getTasksUseCase = GetTasksUseCase();
  final DeleteTasksUseCase _deleteTasksUseCase = DeleteTasksUseCase();


  Future<List<TaskSimple>> getTasks() async {
    final response = await _getTasksUseCase.getTasks();
    return response;
  }

  Future<void> deleteTask(int taskId) async {
    await _deleteTasksUseCase.deleteTask(taskId);
  }
}

import 'package:tast_managger/domain/entities/task.dart';
import 'package:tast_managger/domain/usecases/get_task_id_use_case.dart';

class TaskDetailsProvider {
  final GetTaskIdIUseCase _getTaskIdIUseCase = GetTaskIdIUseCase();


  Future<List<Task>> getTaskId(int taskId) async {
    final response = await _getTaskIdIUseCase.getTaskId(taskId);
    return response;
  }
}

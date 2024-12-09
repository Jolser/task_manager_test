import 'package:tast_managger/domain/entities/task.dart';
import 'package:tast_managger/domain/entities/task_simple.dart';

abstract class TasksRepository {

  Future<List<TaskSimple>> getTasks(String token);
  Future<List<Task>> getTaskId(String token, int taskId);
  Future<Task> addTask(String token, String title, bool isCompleted, String? dueDate, String? comments, String? description, String? tags);
  Future<Task> editTask(int taskId, String token, String title, bool isCompleted, String? dueDate, String? comments, String? description, String? tags);
  Future<void> deleteTask(String token, int taskId);
  
}
import 'package:tast_managger/data/dtos/dto_add_task.dart';
import 'package:tast_managger/data/dtos/dto_edit_task.dart';
import 'package:tast_managger/data/dtos/dto_get_task_id.dart';
import 'package:tast_managger/data/dtos/dto_get_tasks.dart';
import 'package:tast_managger/data/endpoints/add_task.dart';
import 'package:tast_managger/data/endpoints/delete_task.dart';
import 'package:tast_managger/data/endpoints/edit_task.dart';
import 'package:tast_managger/data/endpoints/get_task_id.dart';
import 'package:tast_managger/data/endpoints/get_tasks.dart';
import 'package:tast_managger/domain/entities/task_simple.dart';
import 'package:tast_managger/domain/models/task_request_model.dart';
import 'package:tast_managger/domain/repositories/tasks_repositorie.dart';
import 'package:tast_managger/domain/entities/task.dart';

class TasksRepositoryImpl extends TasksRepository {
  final AddTask addTaskApi;
  final GetTasks getTasksApi;
  final GetTaskId getTaskIdApi;
  final EditTask editTaskApi;
  final DeleteTask deleteTaskApi;

  TasksRepositoryImpl(this.addTaskApi, this.getTasksApi, this.getTaskIdApi,
      this.editTaskApi, this.deleteTaskApi);

  @override
  Future<Task> addTask(
      String token,
      String title,
      bool isCompleted,
      String? dueDate,
      String? comments,
      String? description,
      String? tags) async {
    final params = TaskRequestModel(
      token: token,
      title: title,
      isCompleted: isCompleted,
      dueDate: dueDate,
      comments: comments,
      description: description,
      tags: tags,
    ).toMap();
    final response = await addTaskApi.addTask(params);
    final data = response.data as Map<String, dynamic>;

    final taskData = DtoAddTask.fromJson(data);
    final task = Task(
      id: taskData.task.id,
      isCompleted: taskData.task.isCompleted == '0' ? false : true,
      title: taskData.task.title,
      dueDate: taskData.task.dueDate,
      comments: taskData.task.comments,
      description: taskData.task.description,
      tags: taskData.task.tags,
      token: taskData.task.token,
      createdAt: taskData.task.createdAt,
      updatedAt: taskData.task.updatedAt,
    );
    return task;
  }

  @override
  Future<void> deleteTask(String token, int taskId) async {
    final Map<String, dynamic> params = {'token': token};
    await deleteTaskApi.deleteTaskId(taskId, params);

  }

  @override
  Future<Task> editTask(int taskId, String token, String title, bool isCompleted,
      String? dueDate, String? comments, String? description, String? tags) async {
    final params = TaskRequestModel(
      token: token,
      title: title,
      isCompleted: isCompleted,
      dueDate: dueDate,
      comments: comments,
      description: description,
      tags: tags,
    ).toMap();
    final response = await editTaskApi.editTask(taskId, params);
    final data = response.data as Map<String, dynamic>;

    final taskData = DtoEditTask.fromJson(data);
    final task = Task(
      id: taskData.task.id,
      isCompleted: taskData.task.isCompleted == '0' ? false : true,
      title: taskData.task.title,
      dueDate: taskData.task.dueDate,
      comments: taskData.task.comments,
      description: taskData.task.description,
      tags: taskData.task.tags,
      token: taskData.task.token,
      createdAt: taskData.task.createdAt,
      updatedAt: taskData.task.updatedAt,
    );
    return task;
  }

  @override
  Future<List<Task>> getTaskId(String token, int taskId) async {
    final Map<String, dynamic> params = {'token': token};
    final response = await getTaskIdApi.getTaskId(taskId, params,);
    final data = response.data as List<dynamic>;

    final tasks = data.map((task) {
      final taskData = DtoGetTaskId.fromJson(task as Map<String, dynamic>);
      return Task(
        id: taskData.id,
      isCompleted: taskData.isCompleted == 0 ? false : true,
      title: taskData.title,
      dueDate: taskData.dueDate,
      comments: taskData.comments,
      description: taskData.description,
      tags: taskData.tags,
      token: taskData.token,
      createdAt: taskData.createdAt,
      updatedAt: taskData.updatedAt,
      );
    }).toList();
    return tasks;
  }

  @override
  Future<List<TaskSimple>> getTasks(String token) async {
    final Map<String, dynamic> params = {'token': token};
    final response = await getTasksApi.getTasks(params);
    final data = response.data as List<dynamic>;

    final tasks = data.map((task) {
      final taskData = Tasks.fromJson(task as Map<String, dynamic>);
      return TaskSimple(
        id: taskData.id,
        title: taskData.title,
        isCompleted: taskData.isCompleted == 0 ? false : true,
        dueDate: taskData.dueDate,
      );
    }).toList();
    return tasks;
  }
}

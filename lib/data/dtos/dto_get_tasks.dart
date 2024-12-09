import 'package:json_annotation/json_annotation.dart';

part 'dto_get_tasks.g.dart';

@JsonSerializable()
class DtoGetTasks {
  @JsonKey(name: 'tasks')
  final List<Tasks> tasks;

  DtoGetTasks({
    required this.tasks,
  });

  factory DtoGetTasks.fromJson(List<dynamic> json) => DtoGetTasks(
        tasks: json.map((e) => Tasks.fromJson(e as Map<String, dynamic>)).toList(),
      );

  Map<String, dynamic> toJson() => {
        'tasks': tasks.map((task) => task.toJson()).toList(),
      };
}

@JsonSerializable()
class Tasks {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'title')
  final String title;

  @JsonKey(name: 'is_completed')
  final int isCompleted;

  @JsonKey(name: 'due_date')
  final String? dueDate;

  Tasks({
    required this.id,
    required this.title,
    required this.isCompleted,
    this.dueDate,
  });

  factory Tasks.fromJson(Map<String, dynamic> json) => _$TasksFromJson(json);

  Map<String, dynamic> toJson() => _$TasksToJson(this);
}

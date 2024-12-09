import 'package:json_annotation/json_annotation.dart';

part 'dto_add_task.g.dart';

@JsonSerializable()
class DtoAddTask {
  @JsonKey(name: 'detail')
  final String detail;

  @JsonKey(name: 'task')
  final NewTask task;

  DtoAddTask({
    required this.detail,
    required this.task,
  });

  factory DtoAddTask.fromJson(Map<String, dynamic> json) =>
      _$DtoAddTaskFromJson(json);

  Map<String, dynamic> toJson() => _$DtoAddTaskToJson(this);
}

@JsonSerializable()
class NewTask {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'title')
  final String title;

  @JsonKey(name: 'is_completed')
  final String isCompleted;

  @JsonKey(name: 'due_date')
  final String? dueDate;

  @JsonKey(name: 'comments')
  final String? comments;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'tags')
  final String? tags;

  @JsonKey(name: 'token')
  final String token;

  @JsonKey(name: 'created_at')
  final String createdAt;

  @JsonKey(name: 'updated_at')
  final String updatedAt;

  NewTask({
    required this.id,
    required this.title,
    required this.isCompleted,
    this.dueDate,
    this.comments,
    this.description,
    this.tags,
    required this.token,
    required this.createdAt,
    required this.updatedAt,
  });

  factory NewTask.fromJson(Map<String, dynamic> json) => _$NewTaskFromJson(json);

  Map<String, dynamic> toJson() => _$NewTaskToJson(this);
}

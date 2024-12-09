import 'package:json_annotation/json_annotation.dart';

part 'dto_edit_task.g.dart';

@JsonSerializable()
class DtoEditTask {
  @JsonKey(name: 'detail')
  final String detail;

  @JsonKey(name: 'task')
  final EditedTask task;

  DtoEditTask({
    required this.detail,
    required this.task,
  });

  factory DtoEditTask.fromJson(Map<String, dynamic> json) =>
      _$DtoEditTaskFromJson(json);

  Map<String, dynamic> toJson() => _$DtoEditTaskToJson(this);
}

@JsonSerializable()
class EditedTask {
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

  EditedTask({
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

  factory EditedTask.fromJson(Map<String, dynamic> json) =>
      _$EditedTaskFromJson(json);

  Map<String, dynamic> toJson() => _$EditedTaskToJson(this);
}

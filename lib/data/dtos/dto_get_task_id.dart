import 'package:json_annotation/json_annotation.dart';

part 'dto_get_task_id.g.dart';

@JsonSerializable()
class DtoGetTaskId {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'title')
  final String title;

  @JsonKey(name: 'is_completed')
  final int isCompleted;

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

  DtoGetTaskId({
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

  factory DtoGetTaskId.fromJson(Map<String, dynamic> json) =>
      _$DtoGetTaskIdFromJson(json);

  Map<String, dynamic> toJson() => _$DtoGetTaskIdToJson(this);
}

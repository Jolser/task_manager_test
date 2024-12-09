// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dto_edit_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DtoEditTask _$DtoEditTaskFromJson(Map<String, dynamic> json) => DtoEditTask(
      detail: json['detail'] as String,
      task: EditedTask.fromJson(json['task'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DtoEditTaskToJson(DtoEditTask instance) =>
    <String, dynamic>{
      'detail': instance.detail,
      'task': instance.task,
    };

EditedTask _$EditedTaskFromJson(Map<String, dynamic> json) => EditedTask(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      isCompleted: json['is_completed'] as String,
      dueDate: json['due_date'] as String?,
      comments: json['comments'] as String?,
      description: json['description'] as String?,
      tags: json['tags'] as String?,
      token: json['token'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$EditedTaskToJson(EditedTask instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'is_completed': instance.isCompleted,
      'due_date': instance.dueDate,
      'comments': instance.comments,
      'description': instance.description,
      'tags': instance.tags,
      'token': instance.token,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

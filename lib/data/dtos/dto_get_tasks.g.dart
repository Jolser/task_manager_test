// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dto_get_tasks.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DtoGetTasks _$DtoGetTasksFromJson(Map<String, dynamic> json) => DtoGetTasks(
      tasks: (json['tasks'] as List<dynamic>)
          .map((e) => Tasks.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DtoGetTasksToJson(DtoGetTasks instance) =>
    <String, dynamic>{
      'tasks': instance.tasks,
    };

Tasks _$TasksFromJson(Map<String, dynamic> json) => Tasks(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      isCompleted: (json['is_completed'] as num).toInt(),
      dueDate: json['due_date'] as String?,
    );

Map<String, dynamic> _$TasksToJson(Tasks instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'is_completed': instance.isCompleted,
      'due_date': instance.dueDate,
    };

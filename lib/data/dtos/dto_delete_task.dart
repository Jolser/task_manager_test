import 'package:json_annotation/json_annotation.dart';

part 'dto_delete_task.g.dart';

@JsonSerializable()
class DtoDeleteTask {
  @JsonKey(name: 'detail')
  final String detail;

  DtoDeleteTask({
    required this.detail,
  });

  factory DtoDeleteTask.fromJson(Map<String, dynamic> json) =>
      _$DtoDeleteTaskFromJson(json);

  Map<String, dynamic> toJson() => _$DtoDeleteTaskToJson(this);
}

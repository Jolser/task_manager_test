class TaskRequestModel {
  final String token;
  final String title;
  final bool isCompleted;
  final String? dueDate;
  final String? comments;
  final String? description;
  final String? tags;

  TaskRequestModel({
    required this.token,
    required this.title,
    required this.isCompleted,
    this.dueDate,
    this.comments,
    this.description,
    this.tags,
  });

  Map<String, dynamic> toMap() {
    // Crea un mapa base
    final map = {
      'token': token,
      'title': title,
      'is_completed': isCompleted ? '1' : '0',
    };

    // Añade valores opcionales si no son nulos ni vacíos
    if (dueDate != null && dueDate!.isNotEmpty) {
      map['due_date'] = dueDate!;
    }
    if (comments != null && comments!.isNotEmpty) {
      map['comments'] = comments!;
    }
    if (description != null && description!.isNotEmpty) {
      map['description'] = description!;
    }
    if (tags != null && tags!.isNotEmpty) {
      map['tags'] = tags!;
    }

    return map;
  }
}

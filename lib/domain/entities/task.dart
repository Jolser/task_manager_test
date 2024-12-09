class Task {
  Task({
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

  int id;
  String title;
  bool isCompleted;
  String? dueDate;
  String? comments;
  String? description;
  String? tags;
  String token;
  String createdAt;
  String updatedAt;
}



class TaskSimple {
  TaskSimple({
    required this.id,
    required this.title,
    required this.isCompleted,
    this.dueDate,
  });

  final int id;
  final String title;
  final bool isCompleted;
  final String? dueDate;
}

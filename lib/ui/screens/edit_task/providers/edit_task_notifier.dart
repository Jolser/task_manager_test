import 'package:flutter/material.dart';
import 'package:tast_managger/domain/entities/task.dart';
import 'package:tast_managger/ui/screens/edit_task/providers/edit_task_provider.dart';

class EditTaskNotifier extends ChangeNotifier {
  final EditTaskProvider _tasksProvider = EditTaskProvider();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController dueDateController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController commentsController = TextEditingController();
  final TextEditingController tagsController = TextEditingController();

  bool _isCompleted = false;
  bool get isCompleted => _isCompleted;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool _validateForm = false;
  bool get validateForm => _validateForm;

  void toggleCompleted(bool? value) {
    _isCompleted = value ?? false;
    checkForm();
    notifyListeners();
  }

  void checkForm() {
    _validateForm = titleController.text.isNotEmpty;
    notifyListeners();
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      dueDateController.text = "${pickedDate.toLocal()}".split(' ')[0];
      checkForm();
    }
  }

  Future<void> editTask(
    int taskId,
    String title,
    bool isCompleted,
    String? dueDate,
    String? description,
    String? comments,
    String? tags,
  ) async {
    _isLoading = true;
    notifyListeners();

    try {
      await _tasksProvider.editTask(
        taskId,
        title,
        isCompleted,
        dueDate == '' ? null : dueDate,
        description == '' ? null : description,
        comments == '' ? null : comments,
        tags == '' ? null : tags,
      );
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void actualInfoTask(Task task) {
    titleController.text = task.title;
    if (task.dueDate != null) {
      dueDateController.text = task.dueDate!;
    }
    if (task.comments != null) {
      commentsController.text = task.comments!;
    }
    if (task.tags != null) {
      tagsController.text = task.tags!;
    }
    if (task.description != null) {
      descriptionController.text = task.description!;
    }
    _isCompleted = task.isCompleted;
    checkForm();
    notifyListeners();
  }

  @override
  void dispose() {
    titleController.dispose();
    dueDateController.dispose();
    descriptionController.dispose();
    commentsController.dispose();
    tagsController.dispose();
    super.dispose();
  }
}

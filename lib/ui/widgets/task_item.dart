import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:tast_managger/domain/entities/task_simple.dart';
import 'package:tast_managger/ui/screens/home/providers/home_notifier.dart';
import 'package:tast_managger/ui/widgets/alert_dialog_widget.dart';

class ToDoItem extends StatelessWidget {
  final HomeNotifier homeNotifier;
  final TaskSimple task;
  final String title;
  final bool isCompleted;
  final void Function()? onTap;

  const ToDoItem({
    Key? key,
    required this.title,
    required this.isCompleted,
    required this.onTap,
    required this.task,
    required this.homeNotifier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return FadeInRight(
      child: Card(
        elevation: 5,
        color: theme.colorScheme.secondaryContainer,
        child: ListTile(
          onTap: onTap,
          title: Text(title),
          subtitle: isCompleted
              ? const Text('Completada')
              : const Text('No completada'),
          leading: const Icon(Icons.task_outlined),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialogWidget(
                  notifier: homeNotifier,
                  task: task,
                  cancelar: () => Navigator.pop(context),
                  aceptar: () async {
                    if (context.mounted) {
                      Navigator.pop(context);
                    }
                    await homeNotifier.deleteTask(task.id);
                    
                    await homeNotifier.loadTasks();
                    
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

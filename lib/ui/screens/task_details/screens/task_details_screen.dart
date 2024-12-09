import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tast_managger/ui/screens/edit_task/screens/edit_task_screen.dart';
import 'package:tast_managger/ui/screens/task_details/providers/task_details_notifier.dart';
import 'package:tast_managger/ui/widgets/custom_appbar.dart';
import 'package:tast_managger/ui/widgets/custom_floating_action_button.dart';

class TaskDetailsScreen extends StatelessWidget {
  final int taskId;

  const TaskDetailsScreen({Key? key, required this.taskId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ChangeNotifierProvider<TaskDetailsNotifier>(
      create: (_) => TaskDetailsNotifier()..loadTaskDetails(taskId),
      child: Consumer<TaskDetailsNotifier>(
        builder: (context, notifier, _) {
          return Scaffold(
            appBar: CustomAppBar(
              title: 'Detalles de la tarea',
              textStyle: theme.textTheme.titleMedium
                  ?.copyWith(color: theme.colorScheme.background),
              leadingIcon: Icons.arrow_back,
              backgroundColor: theme.colorScheme.primary,
              action: true,
            ),
            floatingActionButton: CustomFloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditTaskScreen(task: notifier.task!),
                  ),
                ).then((value) => notifier.loadTaskDetails(taskId));
              },
              backgroundColor: theme.colorScheme.inversePrimary,
              icon: Icons.edit,
            ),
            body: notifier.isLoading
                ? const Center(child: CircularProgressIndicator())
                : _buildBody(context, notifier),
          );
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context, TaskDetailsNotifier notifier) {
    final theme = Theme.of(context);

    final task = notifier.task!;
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16.0),
          color: theme.colorScheme.primary,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task.title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
        const SizedBox(height: 30),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            children: [
              _buildDetailItem(
                context,
                icon: task.isCompleted ? Icons.check : Icons.close_sharp,
                title: 'Estado de la tarea',
                value: task.isCompleted ? 'Tarea completada' : 'Tarea incompleta',
                color: task.isCompleted ? theme.colorScheme.primary : theme.colorScheme.error
              ),
              _buildDetailItem(
                context,
                icon: Icons.calendar_today_sharp,
                title: 'Fecha de vencimiento',
                value: task.dueDate ?? 'Sin fecha',
              ),
              _buildDetailItem(
                context,
                icon: Icons.flag,
                title: 'Comentarios',
                value: task.comments ??
                    'No hay comentarios para esta tarea',
              ),
              _buildDetailItem(
                context,
                icon: Icons.label,
                title: 'Etiquetas',
                value: task.tags ?? 'Sin etiquetas',
              ),
              _buildDetailItem(
                context,
                icon: Icons.account_tree,
                title: 'Descripción',
                value: task.description ??
                    'Esta tarea no tiene descripción.',
              ),
              _buildDetailItem(
                context,
                icon: Icons.edit_calendar_sharp,
                title: 'Ultima fecha de modiciación',
                value: task.updatedAt,
              ),
              _buildDetailItem(
                context,
                icon: Icons.calendar_month_sharp,
                title: 'Fecha de cración',
                value: task.createdAt,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDetailItem(BuildContext context,
      {Color? color, required IconData icon, required String title, required String value}) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Row(
          children: [
            Icon(icon, color: color ?? theme.colorScheme.primary),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
        const Divider(
          height: 20,
          thickness: 1.2,
        ),
      ],
    );
  }
}

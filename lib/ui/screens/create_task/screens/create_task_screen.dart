import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tast_managger/ui/screens/create_task/providers/create_task_notifier.dart';
import 'package:tast_managger/ui/widgets/common_text_field.dart';
import 'package:tast_managger/ui/widgets/custom_appbar.dart';

class CreateTaskScreen extends StatelessWidget {
  const CreateTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ChangeNotifierProvider<CreatetaskNotifier>(
      create: (_) => CreatetaskNotifier(),
      child: Consumer<CreatetaskNotifier>(
        builder: (context, notifier, _) {
          return Scaffold(
            backgroundColor: theme.colorScheme.onInverseSurface,
            appBar: CustomAppBar(
              title: 'Nueva tarea',
              textStyle: theme.textTheme.titleMedium?.copyWith(color: theme.colorScheme.background),
              leadingIcon: Icons.arrow_back,
              backgroundColor: theme.colorScheme.primary,
            ),
            persistentFooterButtons: [
              _buildButton(context, theme, notifier),
            ],
            body: _body(theme, notifier, context),
          );
        },
      ),
    );
  }

  Widget _body(
      ThemeData theme, CreatetaskNotifier notifier, BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonTextField(
              labelText: 'Título',
              keyboardType: TextInputType.text,
              controller: notifier.titleController,
              onChanged: (_) => notifier.checkForm(),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Checkbox(
                  value: notifier.isCompleted,
                  onChanged: notifier.toggleCompleted,
                ),
                Text(
                  "¿Completada?",
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
            const SizedBox(height: 20),
            CommonTextField(
              labelText: 'Fecha de terminación',
              keyboardType: TextInputType.datetime,
              controller: notifier.dueDateController,
              suffixIcon: Icon(
                Icons.calendar_today_outlined,
                color: theme.colorScheme.onSurfaceVariant,
              ),
              onTap: () => notifier.selectDate(context),
            ),
            const SizedBox(height: 20),
            CommonTextField(
              labelText: 'Descripción',
              keyboardType: TextInputType.multiline,
              controller: notifier.descriptionController,
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            CommonTextField(
              labelText: 'Comentarios',
              keyboardType: TextInputType.multiline,
              controller: notifier.commentsController,
              maxLines: 2,
            ),
            const SizedBox(height: 20),
            CommonTextField(
              labelText: 'Tags (separados por comas)',
              keyboardType: TextInputType.text,
              controller: notifier.tagsController,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, ThemeData theme,
      CreatetaskNotifier notifier) {
    return ElevatedButton(
      onPressed: !notifier.validateForm || notifier.isLoading
          ? null
          : () async {
              await notifier.editTask(
                notifier.titleController.text,
                notifier.isCompleted,
                notifier.dueDateController.text,
                notifier.descriptionController.text,
                notifier.commentsController.text,
                notifier.tagsController.text,
              );

              if (context.mounted && notifier.errorMessage == null) {
                Navigator.pop(context);
              } else if (notifier.errorMessage != null && context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      notifier.errorMessage ??
                          'Hubo un error al guardar la tarea.',
                    ),
                  ),
                );
              }
            },
      style: ElevatedButton.styleFrom(
        backgroundColor: notifier.validateForm && !notifier.isLoading
            ? theme.colorScheme.primary
            : theme.colorScheme.onSurface.withOpacity(0.12),
        foregroundColor: theme.colorScheme.onPrimary,
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        textStyle: theme.textTheme.labelLarge,
      ),
      child: notifier.isLoading
          ? const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )
          : Text(
              'Guardar tarea',
              style: theme.textTheme.labelLarge!.copyWith(
                color: notifier.validateForm && !notifier.isLoading
                    ? theme.colorScheme.onPrimary
                    : theme.colorScheme.onSurface.withOpacity(0.5),
              ),
            ),
    );
  }
}

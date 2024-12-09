import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tast_managger/ui/screens/create_task/screens/create_task_screen.dart';
import 'package:tast_managger/ui/screens/home/providers/home_notifier.dart';
import 'package:tast_managger/ui/screens/task_details/screens/task_details_screen.dart';
import 'package:tast_managger/ui/widgets/custom_appbar.dart';
import 'package:tast_managger/ui/widgets/custom_floating_action_button.dart';
import 'package:tast_managger/ui/widgets/task_item.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ChangeNotifierProvider<HomeNotifier>(
      create: (_) => HomeNotifier()..loadTasks(),
      child: Consumer<HomeNotifier>(
        builder: (context, notifier, _) {
          return Scaffold(
            appBar: CustomAppBar(
              title: 'Lista de tareas',
              textStyle: theme.textTheme.titleLarge,
              leadingIcon: Icons.person_2,
              iconColor: theme.colorScheme.onSurface,
            ),
            body: _body(notifier, context, theme),
            floatingActionButton: CustomFloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CreateTaskScreen(),
                  ),
                ).then((value) => notifier.loadTasks());
              },
              backgroundColor: theme.colorScheme.inversePrimary,
              icon: Icons.add,
            ),
          );
        },
      ),
    );
  }

  Widget _body(HomeNotifier homeNotifier, BuildContext context, ThemeData theme) {
    final size = MediaQuery.of(context).size;
    return homeNotifier.isLoading
        ? const Center(child: CircularProgressIndicator())
        : homeNotifier.tasks.isEmpty
            ? _emptyState(context, theme)
            : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.03,
                      vertical: size.height * 0.01),
                  child: Column(
                    children: [
                      _welcomeMessage(theme),
                      const SizedBox(height: 20),
                      _taskList(homeNotifier, context),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              );
  }

  Widget _emptyState(BuildContext context, ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: theme.colorScheme.outlineVariant,
        ),
        child: Text(
          'No tienes tareas actualmente. Por favor selecciona el botón + para añadir una nueva tarea a tu lista.',
          style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onSurface),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _taskList(HomeNotifier homeNotifier, BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: homeNotifier.tasks.length,
      itemBuilder: (context, index) {
        final task = homeNotifier.tasks[index];
        Future.delayed(Duration(milliseconds: index * 200));
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: AnimatedOpacity(
            opacity: 1.0,
            duration: const Duration(milliseconds: 500),
            child: ToDoItem(
              homeNotifier: homeNotifier,
              task: task,
              title: task.title,
              isCompleted: task.isCompleted,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        TaskDetailsScreen(taskId: task.id),
                  ),
                ).then((value) => homeNotifier.loadTasks());
              },
            ),
          ),
        );
      },
    );
  }

  Widget _welcomeMessage(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        color: theme.primaryColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '¡Bienvenido de nuevo!',
            style: theme.textTheme.titleMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Aquí tienes tu lista de tareas pendientes. ¿Qué quieres hacer hoy?',
            style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.background),
          ),
        ],
      ),
    );
  }
}

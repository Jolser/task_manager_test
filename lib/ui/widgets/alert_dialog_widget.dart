import 'package:flutter/material.dart';
import 'package:tast_managger/domain/entities/task_simple.dart';
import 'package:tast_managger/ui/screens/home/providers/home_notifier.dart';

class AlertDialogWidget extends StatelessWidget {
  final HomeNotifier notifier;
  final TaskSimple task;
  final VoidCallback cancelar;
  final VoidCallback aceptar;
  const AlertDialogWidget(
      {super.key,
      required this.task,
      required this.cancelar,
      required this.aceptar, required this.notifier});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Row(
        children: [
          Icon(Icons.warning),
          SizedBox(
            width: 20,
          ),
          Expanded(child: Text('¿Deseas eliminar la tarea?')),
        ],
      ),
      content: const Text(
          'Si eliminas esta tarea no podrás recuperarla y la información se perderá'),
      actions: [
        TextButton(onPressed: cancelar, child: const Text('Cancelar')),
        FilledButton(onPressed: aceptar, child: const Text('Aceptar')),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:poke_task_pro/features/todo/domain/entities/task.dart';
import 'package:poke_task_pro/features/todo/domain/entities/task_status.dart';
import 'package:poke_task_pro/features/todo/presentation/controllers/todo_controller.dart';
import 'package:poke_task_pro/features/todo/presentation/widgets/TaskCard.dart';

class TrelloColumn extends StatelessWidget {
  final TaskStatus status;
  final TodoController controller;

  const TrelloColumn(
      {super.key, required this.status, required this.controller});

  @override
  Widget build(BuildContext context) {
    // Para as colunas aceitarem a tarefa
    // DragTarget: A coluna de destino detecta que um objeto do tipo Task entrou na sua área.
    return DragTarget<Task>(
      // onAccept: Ao soltar, o DragTarget captura os dados da tarefa e chama controller.updateTaskStatus.
      onAcceptWithDetails: (task) {
        // Lógica de mudança de status ao soltar,
        //A coluna fica "vigiando" se alguma Task vai cair nela.
        controller.updateTaskStatus(task as Task, status);
      },
      builder: (context, candidateData, rejectData) {
        final tasks = controller.getTaskBtStatus(status);
        return Container(
          width: 300,
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Color(status.colorValue).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8)),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(status.label,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) => TaskCard(task: tasks[index]),
              ),
            ),
          ]),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:poke_task_pro/features/todo/domain/entities/task.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    // LongPressDraggable:Detecta o toque longo e inicia o rastreio da posição do mouse/dedo.
    return LongPressDraggable<Task>(
      data: task,
      feedback: Material(
        // O que aparece quando arrasta
        // O card só sai do lugar se o usuário segurar por um tempo (igual no Trello mobile).
        child: Container(
          width: 280,
          padding: const EdgeInsets.all(16),
          color: Colors.white,
          child: Text(task.title),
        ),
      ),
      // o card fica "transparente" na coluna de origem enquanto você o arrasta (graças ao childWhenDragging).
      childWhenDragging: Opacity(opacity: 0, child: _cardBody()),
      child: _cardBody(),
    );
  }

  Widget _cardBody() {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ListTile(title: Text(task.title)),
    );
  }
}

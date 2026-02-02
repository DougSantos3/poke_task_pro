import 'package:flutter/material.dart';
import 'package:poke_task_pro/features/todo/domain/entities/task_status.dart';
import 'package:poke_task_pro/features/todo/presentation/controllers/todo_controller.dart';
import 'package:poke_task_pro/features/todo/presentation/widgets/TrelloColumn.dart';

class BoardPage extends StatelessWidget {
  final TodoController controller;

  const BoardPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Poké-Task Trello'),
          backgroundColor: Colors.blueGrey[900]),
      // O ValueListenableBuilder faz a tela "escutar" a controller
      body: ValueListenableBuilder(
        valueListenable: controller,
        builder: (context, task, child) {
          return Container(
            color: Colors.blueGrey[50],
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TrelloColumn(
                      status: TaskStatus.backlog, controller: controller),
                  TrelloColumn(status: TaskStatus.todo, controller: controller),
                  TrelloColumn(
                      status: TaskStatus.doing, controller: controller),
                  TrelloColumn(status: TaskStatus.done, controller: controller),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Aqui chamaremos o formulario de nova Task.
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:poke_task_pro/features/todo/data/datasources/pokemon_remote_datasource.dart';
import 'package:poke_task_pro/features/todo/data/repositories/todo_repository_impl.dart';
import 'package:poke_task_pro/features/todo/domain/entities/task.dart';
import 'package:poke_task_pro/features/todo/domain/entities/task_status.dart';
import 'package:poke_task_pro/features/todo/domain/usecases/add_task.dart';
import 'package:poke_task_pro/features/todo/presentation/controllers/todo_controller.dart';
import 'package:poke_task_pro/features/todo/presentation/pages/board_page.dart';

void main() {
  // 1. Instanciamos as dependencias (Manualmente por enquanto)
  // Nota: O repository e usecase aqui são necessários para a Controller
  final mockRepo = TodoRepositoryImpl(
      remoteDataSource: PokemonRemoteDataSourceImpl(client: http.Client()));
  final addTaskUseCase = AddTask(mockRepo);

  final controller = TodoController(addTaskUseCase);

  // 2. Criamos dados ficticios para testar o Trello
  final initialTasks = [
    Task(
        id: '1',
        title: 'Capturar um Pikachu',
        description: 'Ir até a floresta de Viridian',
        status: TaskStatus.backlog,
        boardName: 'Poké-Trello'),
    Task(
        id: '2',
        title: 'Treinar o Charmander',
        description: 'Subir 5 níveis na Rota 1',
        status: TaskStatus.todo,
        boardName: 'Poké-Trello'),
    Task(
        id: '3',
        title: 'Batalha de Ginásio',
        description: 'Vencer o Brock em Pewter City',
        status: TaskStatus.doing,
        boardName: 'Poké-Trello'),
  ];

  // 3. Adicionamos a controller
  controller.value = initialTasks;

  runApp(MaterialApp(home: BoardPage(controller: controller)));
}

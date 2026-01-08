

import 'package:poke_task_pro/features/todo/data/datasources/pokemon_remote_datasource.dart';
import 'package:poke_task_pro/features/todo/domain/entities/task.dart';
import 'package:poke_task_pro/features/todo/domain/repositories/todo_repository.dart';

// Une o DataSource à lógica do Domínio.
class TodoRepositoryImpl implements  TodoRepository {
  final PokemonRemoteDataSource remoteDataSource;

  TodoRepositoryImpl({required this.remoteDataSource});

  @override
  Future<void> addTask(Task task) async {
    // Aqui você implementaria a lógica de salvar na sua API Java futura
    // Por enquanto, podemos simular um print
    print('Adding task: ${task.title} with Pokémon id ${task.pokemon?.name}');
  }

}
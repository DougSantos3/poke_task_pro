import 'package:poke_task_pro/features/todo/domain/entities/task.dart';
import 'package:poke_task_pro/features/todo/domain/repositories/todo_repository.dart';

// Contém a lógica de "como" uma tarefa deve ser criada.
class AddTask {
  final TodoRepository repository;

  AddTask(this.repository);

  // O método 'call' permite chamar a classe como se fosse uma função: addTask()
  Future<void> call(Task task) async {
    // Aqui poderiamos ter uma regra de negócio:
    // Não pode adicionar tarefa sem titulo
    if (task.title.isEmpty) {
      throw Exception('O título não pode ser vazio');
    }

    return await repository.addTask(task);
  }

  /* Na Clean Architecture, usamos a Injeção de Dependência. Isso significa que,
   em vez de o AddTask criar o seu próprio repositório, alguém "de fora" 
   entrega o repositório pronto para ele. */
}

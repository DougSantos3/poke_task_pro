import 'package:flutter/material.dart';
import 'package:poke_task_pro/features/todo/domain/entities/task.dart';
import 'package:poke_task_pro/features/todo/domain/entities/task_status.dart';
import 'package:poke_task_pro/features/todo/domain/usecases/add_task.dart';

/* Controller (ou Store) é quem gerencia o Estado. 

Ela não sabe nada de banco de dados ou APIs; ela apenas pede ao Use Case para 
realizar a ação e avisa a tela: "Ei, os dados mudaram, pode se atualizar!".

É essa classe. Ela é o cérebro da tela. Ela recebe o clique do botão, chama o 
AddTask (Use Case) e guarda o resultado. 

Usando ValueNotifier para gerenciar o estado da lista de tarefas sem depender 
de frameworks complexos.
*/
class TodoController extends ValueNotifier<List<Task>> {
  final AddTask addTaskUseCase;

  // Start the empty list
  TodoController(this.addTaskUseCase) : super([]);

  // Function to add a new task
  Future<void> createNewTask(Task task) async {
    try {
      await addTaskUseCase(task);
      // Update the state(list) adding the new task
      value = [...value, task];
    } catch (e) {
      debugPrint('Erro as adicionar task: $e');
    }
  }

  /* Helper for filter to ask for collums of Trello

     Estado: É o value (a lista de List<Task>). Sempre que esse valor muda, 
     qualquer Widget que esteja "escutando" essa controller vai se redesenhar 
     automaticamente. */
  List<Task> getTaskBtStatus(TaskStatus status) {
    return value.where((task) => task.status == status).toList();
  }
}

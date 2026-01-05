

import 'package:poke_task_pro/features/todo/domain/entities/task.dart';

abstract class TodoRepository {
  // The contract sad: Who implements, should can save the task
  Future<void> addTask(Task task);
}
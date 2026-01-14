import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poke_task_pro/features/todo/domain/entities/task.dart';
import 'package:poke_task_pro/features/todo/domain/entities/task_status.dart';
import 'package:poke_task_pro/features/todo/presentation/controllers/todo_controller.dart';
import 'package:poke_task_pro/features/todo/domain/usecases/add_task.dart';

class MockAddTask extends Mock implements AddTask {}

class FakeTask extends Fake implements Task {}

void main() {
  setUpAll(() {
    registerFallbackValue(FakeTask());
  });

  test('Deve adicionar uma nova task à lista quando o usecase for bem sucedido',
      () async {
    final mockUseCase = MockAddTask();
    final controller = TodoController(mockUseCase);
    final tTask = Task(
        id: '1',
        title: 'Test Task',
        description: 'teste',
        status: TaskStatus.todo,
        boardName: 'teste');

    when(() => mockUseCase(any())).thenAnswer((_) async => {});

    await controller.createNewTask(tTask);

    expect(controller.value.length, 1);
    expect(controller.value.contains(tTask), true);
  });
}

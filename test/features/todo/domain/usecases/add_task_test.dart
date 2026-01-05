import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poke_task_pro/features/todo/domain/entities/task.dart';
import 'package:poke_task_pro/features/todo/domain/entities/task_status.dart';
import 'package:poke_task_pro/features/todo/domain/repositories/todo_repository.dart';
import 'package:poke_task_pro/features/todo/domain/usecases/add_task.dart';

class MockTodoRepository extends Mock implements TodoRepository {}

void main() {
  late AddTask usecase;
  late MockTodoRepository mockRepository;

  setUp(() {
    mockRepository = MockTodoRepository();
    usecase = AddTask(mockRepository);
  });

  final tTask = Task(
    id: '1',
    title: 'Estudar Clean Arch',
    description: 'Aprender Use Cases',
    status: TaskStatus.todo,
    boardName: 'Estudos',
  );

  test('Should call repository for add to task', () async {
    // Arrange (Organize): When the repository to call, return success
    when(() => mockRepository.addTask(tTask)).thenAnswer((_) async => {});

    // Act (Agir)
    await usecase(tTask);

    // Assert (Verificar): The repository is really call with a task right?
    verify(() => mockRepository.addTask(tTask)).called(1);
    verifyNoMoreInteractions(mockRepository);
  });
}

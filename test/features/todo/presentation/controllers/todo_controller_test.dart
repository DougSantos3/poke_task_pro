

class MockAddTask implements AddTask {}

void main() {
  test('Deve adicionar uma nova task à lista quando o usecase for bem sucedido', () async {
    final mockUseCase = MockAddTask();
    final controller = TodoController(mockUseCase);
    final tTask = Task(/* dados da task */);

    when(() => mockUseCase(any())).thenAnswer((_) async => {});

    await controller.createNewTask(tTask);

    expect(controller.value.length, 1);
    expect(controller.value.contains(tTask), true);
  })
}
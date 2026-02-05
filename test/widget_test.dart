import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:poke_task_pro/features/todo/data/datasources/pokemon_remote_datasource.dart';
import 'package:poke_task_pro/features/todo/data/repositories/todo_repository_impl.dart';
import 'package:poke_task_pro/features/todo/domain/usecases/add_task.dart';
import 'package:poke_task_pro/features/todo/presentation/controllers/todo_controller.dart';
import 'package:poke_task_pro/features/todo/presentation/pages/board_page.dart';

void main() {
  testWidgets('BoardPage smoke test', (WidgetTester tester) async {
    // 1. Initialize dependencies
    final mockRepo = TodoRepositoryImpl(
        remoteDataSource: PokemonRemoteDataSourceImpl(client: http.Client()));
    final addTaskUseCase = AddTask(mockRepo);
    final controller = TodoController(addTaskUseCase);

    // 2. Build BoardPage
    await tester
        .pumpWidget(MaterialApp(home: BoardPage(controller: controller)));

    // 3. Verify that the title appears
    expect(find.text('Poké-Task Trello'), findsOneWidget);
  });
}

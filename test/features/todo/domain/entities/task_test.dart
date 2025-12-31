import 'package:flutter_test/flutter_test.dart';
import 'package:poke_task_pro/features/todo/domain/entities/task_status.dart';

void main() {
  group('TaskStatus Enum', () {
    test('Do not should move task to Done if task was Backlog', () {
      const status = TaskStatus.backlog;
      expect(status.canMoveToDone(), isFalse);
    });

    test('Should move to Done if was Doing', () {
      const status = TaskStatus.doing;
      expect(status.canMoveToDone(), isTrue);
    });
  });
}

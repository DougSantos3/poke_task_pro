import 'package:flutter_test/flutter_test.dart';
import 'package:poke_task_pro/features/todo/domain/entities/pokemon.dart';

void main() {
  group('Pokemon Entity', () {
    test('Two pokemon with the same data should be considered equal(equatable)',
        () {
      final p1 = Pokemon(
          id: 1,
          name: 'Bulbasaur',
          types: const ['Grass'],
          evolutionLevel: 16,
          weaknesses: const ['Fire'],
          imageUrl: '');
      final p2 = Pokemon(
          id: 1,
          name: 'Bulbasaur',
          types: const ['Grass'],
          evolutionLevel: 16,
          weaknesses: const ['Fire'],
          imageUrl: '');

      expect(p1, equals(p2));
    });
  });
}

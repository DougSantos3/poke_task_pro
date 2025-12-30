import 'package:flutter_test/flutter_test.dart';
import 'pokemon.dart';

void main() {
  test('Should is possible to create stance Pokemon and all fields', () {
    // Arrange (Organizar)
    const pokemon = Pokemon(
      id: 1,
      name: 'Bulbasaur',
      types: ['Grass', 'Poison'],
      evolutionLevel: 16,
      weaknesses: ['Fire', 'Ice'],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png',
    );
    // Assert (Verificar)
    expect(pokemon.name, 'Bulbasaur');
    expect(pokemon.types.contains('Grass'), true);
    expect(pokemon.evolutionLevel, 16);
  });

  test('Two pokemon with the same data should be considered equal(equatable)', () {
    const p1 = Pokemon(id: 1, name: 'Pikachu', types: ['Eletric'], evolutionLevel: 0, weakenessses: [], imageUrl: '');
    const p2 = Pokemon(id: 1, name: 'Pikachu', types: ['Eletric'], evolutionLevel: 0, weakenesses: [], imageUrl: '');

    expect(p1, equals(p2))
  })
}

import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:poke_task_pro/features/todo/data/models/pokemon_model.dart';
import 'package:poke_task_pro/features/todo/domain/entities/pokemon.dart';
import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tPokemonModel = PokemonModel(
    id: 1,
    name: 'bulbasaur',
    types: const ['grass'],
    evolutionLevel: 0,
    weaknesses: const [],
    imageUrl: 'url_da_imagem',
  );

  test("Deve ser uma subclasse da entidade Pokemon", () {
    expect(tPokemonModel, isA<Pokemon>());
  });

  /*Este teste verifica se o seu fromJSON está mapeando os campos 
  corretamente.*/
  test("Deve retornar um modelo válido a partir de um JSON", () {
    // Arrange
    final Map<String, dynamic> jsonMap =
        json.decode(fixture('pokemon_fixture.json'));
    // Act
    final result = PokemonModel.fromJson(jsonMap);
    // Assert
    expect(result, tPokemonModel);
  });
}

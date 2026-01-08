import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;
import 'package:poke_task_pro/features/todo/data/datasources/pokemon_remote_datasource.dart';
import 'dart:io';

class MockHttpClient extends Mock implements http.Client {}

String fixture(String name) => File('test/fixtures/$name').readAsStringSync();

void main() {
  late PokemonRemoteDataSourceImpl dataSource;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = PokemonRemoteDataSourceImpl(client: mockHttpClient);
    registerFallbackValue(Uri());
  });

  test('Deve realizar uma chamada Get na Url correta com o Id do pokemon',
      () async {
    // Arrange
    when(() => mockHttpClient.get(any())).thenAnswer(
      (_) async => http.Response(fixture('pokemon_fixture.json'), 200),
    );
    // Act
    await dataSource.getPokemon(1);
    // Assert
    verify(() =>
        mockHttpClient.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/1')));
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;
import 'package:poke_task_pro/features/todo/data/datasources/pokemon_remote_datasource.dart';
import 'package:poke_task_pro/features/todo/data/models/pokemon_model.dart';
import '../../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late PokemonRemoteDataSourceImpl dataSource;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = PokemonRemoteDataSourceImpl(client: mockHttpClient);
    registerFallbackValue(Uri());
  });

  /*Aqui testamos se o DataSource chama a URL correta e se ele lança uma 
  exceção caso a internet falhe (Erro 404 ou 500) */
  group('getPokemon', () {
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

    test('Deve retornar PokemonModel quando a reposta for 200(sucesso)',
        () async {
      // Arrange
      when(() => mockHttpClient.get(any())).thenAnswer(
        (_) async => http.Response(fixture('pokemon_fixture.json'), 200),
      );
      // Act
      final result = await dataSource.getPokemon(1);
      // Assert
      expect(result, isA<PokemonModel>());
    });

    test('Deve lançar uma Exception quando a resposta for 404 (Erro)', () {
      // Arrange
      when(() => mockHttpClient.get(any()))
          .thenAnswer((_) async => http.Response('Algo deu errado', 404));

      // Act
      final call = dataSource.getPokemon;
      // Assert
      expect(() => call(1), throwsException);
    });
  });
}

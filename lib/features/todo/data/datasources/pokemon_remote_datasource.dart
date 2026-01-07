import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:poke_task_pro/features/todo/data/models/pokemon_model.dart';

abstract class PokemonRemoteDataSource {
  Future<PokemonModel> getPokemon(int id);
}

class PokemonDataSourceImpl implements PokemonRemoteDataSource {
  final http.Client client;

  PokemonDataSourceImpl({required this.client});

  @override
  Future<PokemonModel> getPokemon(int id) async {
    // TODO: implement getPokemon
    final response = await client.get(
      Uri.parse('https://pokeapi.co/api/v2/pokemon/$id'),
    );

    if (response.statusCode == 200) {
      return PokemonModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error fetching Pokémon data');
    }
  }
}

import 'package:poke_task_pro/features/todo/domain/entities/pokemon.dart';

class PokemonModel extends Pokemon {
  PokemonModel({
    required super.id,
    required super.name,
    required super.types,
    required super.evolutionLevel,
    required super.weaknesses,
    required super.imageUrl,
  });

  // Transforma o Json da api no nosso objeto
  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      id: json['id'],
      name: json['name'],
      //Exemplo de como tratar listas vindas do json
      types: List<String>.from(json['types'].map((x) => x['type']['name'])),
      evolutionLevel: json['evolutionLevel'] ?? 0,
      weaknesses: [], // Algumas APIs exigem chamadas extras para fraquezas
      imageUrl: json['sprites']['front_default'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'types': types,
      'evolutionLevel': evolutionLevel,
      'imageUrl': imageUrl,
    };
  }
}

import 'package:equatable/equatable.dart';

class Pokemon extends Equatable {
  final int id;
  final String name;
  final List<String> types;
  final int evolutionLevel;
  final List<String> weaknesses;
  final String imageUrl;

  Pokemon({
    required this.id,
    required this.name,
    required this.types,
    required this.evolutionLevel,
    required this.weaknesses,
    required this.imageUrl,
  });

  /*Ei, não olhe para a memória. Compare apenas esses campos aqui".
  Por que usar: Se os dados do Pokémon não mudaram, o Flutter não precisa 
  redesenhar a tela (ganho de performance). Nos Testes Unitários, isso permite 
  que você verifique se o resultado esperado é igual ao obtido.*/
  @override
  List<Object?> get props => [
    id,
    name,
    types,
    evolutionLevel,
    weaknesses,
    imageUrl,
  ];
}

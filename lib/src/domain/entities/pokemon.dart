import 'package:equatable/equatable.dart';

class Pokemon extends Equatable {
  final int id;
  final String name;
  final List<String> types;
  final int evolutionLevel;
  final List<String> weakenesses;
  final String imageUrl;

  Pokemon({
    required this.id,
    required this.name,
    required this.types,
    required this.evolutionLevel,
    required this.weakenesses,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [id, name, types, evolutionLevel, weakenesses, imageUrl];
}

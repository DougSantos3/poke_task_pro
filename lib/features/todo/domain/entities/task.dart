import 'package:equatable/equatable.dart';
import 'task_status.dart';
import 'pokemon.dart';

class Task extends Equatable {
  final String id;
  final String title;
  final String description;
  final TaskStatus status;
  final String boardName;
  final Pokemon? pokemon;

  const Task({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.boardName,
    this.pokemon,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    status,
    boardName,
    pokemon,
  ];
}

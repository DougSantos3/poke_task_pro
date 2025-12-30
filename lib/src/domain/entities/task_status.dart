enum TaskStatus {
  backlog('Backlog', 0xFF9E9E9E),
  todo('To do', 0xFF2196F3),
  doing('Doing', 0xFFFFC107),
  done('Done', 0xFF4CAF50);

  // Campos dentro do enum
  final String label;
  final int colorValue;

  // Constructor
  const TaskStatus(this.label, this.colorValue);

  // Exemplo de lógica de negócio: Posso mover para "Done" direto do "Backlog"?
  bool canMoveToDone() => this != TaskStatus.backlog;

}


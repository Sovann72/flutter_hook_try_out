class TodoModel {
  final String id;
  final String title;
  final String description;
  final DateTime createdAt;
  final DateTime deadline;

  TodoModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.createdAt,
      required this.deadline});
}

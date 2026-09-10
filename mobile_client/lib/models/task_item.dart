class TaskItem {
  final String id;
  final String title;
  final String status;

  TaskItem({required this.id, required this.title, required this.status});

    factory TaskItem.fromJson(Map<String, dynamic> json) {
        return TaskItem(
        id: json['id'] as String,
        title: json['title'] as String,
        status: json['status'] as String,
        );
    }
}
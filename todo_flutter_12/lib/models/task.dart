class Task {
  int? id;
  int projectId;
  String title;
  String description;
  String dueDate;
  String priority;
  String status;

  Task({
    this.id,
    required this.projectId,
    required this.title,
    required this.description,
    required this.dueDate,
    required this.priority,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'projectId': projectId,
      'title': title,
      'description': description,
      'dueDate': dueDate,
      'priority': priority,
      'status': status,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      projectId: map['projectId'],
      title: map['title'],
      description: map['description'],
      dueDate: map['dueDate'],
      priority: map['priority'],
      status: map['status'],
    );
  }
}

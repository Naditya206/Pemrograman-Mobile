class Task {
  final String description;
  final bool complete;

  const Task({this.description = '', this.complete = false});
}

class Plan {
  final String name;
  final List<Task> tasks;

  const Plan({required this.name, this.tasks = const []});

  String get completenessMessage {
    if (tasks.isEmpty) return '0 out of 0 tasks';
    final completeCount = tasks.where((task) => task.complete).length;
    return '$completeCount out of ${tasks.length} tasks';
  }
}

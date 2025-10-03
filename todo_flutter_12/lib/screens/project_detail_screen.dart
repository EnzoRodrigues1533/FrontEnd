import 'package:flutter/material.dart';
import '../db/db_helper.dart';
import '../models/project.dart';
import '../models/task.dart';
import 'add_task_screen.dart';

class ProjectDetailScreen extends StatefulWidget {
  final Project project;
  const ProjectDetailScreen({super.key, required this.project});

  @override
  State<ProjectDetailScreen> createState() => _ProjectDetailScreenState();
}

class _ProjectDetailScreenState extends State<ProjectDetailScreen> {
  final DBHelper _dbHelper = DBHelper();
  List<Task> tasks = [];

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    final data = await _dbHelper.getTasks(widget.project.id!);
    setState(() => tasks = data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.project.name)),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return Card(
            child: ListTile(
              title: Text(task.title),
              subtitle: Text("${task.description}\nVence: ${task.dueDate}\nPrioridade: ${task.priority}\nStatus: ${task.status}"),
              isThreeLine: true,
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () async {
                  await _dbHelper.deleteTask(task.id!);
                  _loadTasks();
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AddTaskScreen(projectId: widget.project.id!),
            ),
          );
          _loadTasks();
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../db/db_helper.dart';
import '../models/project.dart';
import 'project_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DBHelper _dbHelper = DBHelper();
  List<Project> projects = [];

  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadProjects();
  }

  Future<void> _loadProjects() async {
    final data = await _dbHelper.getProjects();
    setState(() => projects = data);
  }

  void _addProject() async {
    if (_controller.text.isEmpty) return;
    await _dbHelper.insertProject(Project(name: _controller.text));
    _controller.clear();
    _loadProjects();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Minhas Listas")),
      body: ListView.builder(
        itemCount: projects.length,
        itemBuilder: (context, index) {
          final project = projects[index];
          return ListTile(
            title: Text(project.name),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () async {
                await _dbHelper.deleteProject(project.id!);
                _loadProjects();
              },
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProjectDetailScreen(project: project),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text("Nova Lista"),
              content: TextField(controller: _controller, decoration: const InputDecoration(hintText: "Nome da lista")),
              actions: [
                TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancelar")),
                ElevatedButton(onPressed: () { _addProject(); Navigator.pop(context); }, child: const Text("Salvar")),
              ],
            ),
          );
        },
      ),
    );
  }
}

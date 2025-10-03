import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../db/db_helper.dart';
import '../models/task.dart';

class AddTaskScreen extends StatefulWidget {
  final int projectId;
  const AddTaskScreen({super.key, required this.projectId});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  final DBHelper _dbHelper = DBHelper();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  DateTime? _dueDate;
  String _priority = "Média";
  String _status = "Pendente";

  Future<void> _saveTask() async {
    if (_formKey.currentState!.validate()) {
      final task = Task(
        projectId: widget.projectId,
        title: _titleController.text,
        description: _descController.text,
        dueDate: DateFormat('dd/MM/yyyy').format(_dueDate ?? DateTime.now()),
        priority: _priority,
        status: _status,
      );
      await _dbHelper.insertTask(task);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Nova Tarefa")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: "Título"),
                validator: (v) => v!.isEmpty ? "Informe um título" : null,
              ),
              TextFormField(
                controller: _descController,
                decoration: const InputDecoration(labelText: "Descrição"),
              ),
              const SizedBox(height: 12),
              ListTile(
                title: Text(_dueDate == null ? "Selecionar data" : "Vencimento: ${DateFormat('dd/MM/yyyy').format(_dueDate!)}"),
                trailing: const Icon(Icons.calendar_today),
                onTap: () async {
                  DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2100),
                  );
                  if (picked != null) setState(() => _dueDate = picked);
                },
              ),
              DropdownButtonFormField(
                value: _priority,
                items: ["Baixa", "Média", "Alta"].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                onChanged: (v) => setState(() => _priority = v!),
                decoration: const InputDecoration(labelText: "Prioridade"),
              ),
              DropdownButtonFormField(
                value: _status,
                items: ["Pendente", "Em andamento", "Concluída"].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                onChanged: (v) => setState(() => _status = v!),
                decoration: const InputDecoration(labelText: "Status"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveTask,
                child: const Text("Salvar Tarefa"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

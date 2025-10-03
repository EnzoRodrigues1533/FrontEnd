import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/project.dart';
import '../models/task.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;
  DBHelper._internal();

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    String path = join(dbPath, "todo_app.db");

    return await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE projects(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT
        )
      ''');

      await db.execute('''
        CREATE TABLE tasks(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          projectId INTEGER,
          title TEXT,
          description TEXT,
          dueDate TEXT,
          priority TEXT,
          status TEXT,
          FOREIGN KEY(projectId) REFERENCES projects(id) ON DELETE CASCADE
        )
      ''');
    });
  }

  Future<int> insertProject(Project project) async {
    var database = await db;
    return await database.insert("projects", project.toMap());
  }

  Future<List<Project>> getProjects() async {
    var database = await db;
    var res = await database.query("projects");
    return res.map((e) => Project.fromMap(e)).toList();
  }

  Future<int> deleteProject(int id) async {
    var database = await db;
    return await database.delete("projects", where: "id = ?", whereArgs: [id]);
  }

  Future<int> insertTask(Task task) async {
    var database = await db;
    return await database.insert("tasks", task.toMap());
  }

  Future<List<Task>> getTasks(int projectId) async {
    var database = await db;
    var res = await database.query("tasks", where: "projectId = ?", whereArgs: [projectId]);
    return res.map((e) => Task.fromMap(e)).toList();
  }

  Future<int> updateTask(Task task) async {
    var database = await db;
    return await database.update("tasks", task.toMap(), where: "id = ?", whereArgs: [task.id]);
  }

  Future<int> deleteTask(int id) async {
    var database = await db;
    return await database.delete("tasks", where: "id = ?", whereArgs: [id]);
  }
}

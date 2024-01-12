
import '../models/CustomMarker.dart';
import 'database_provider.dart';


class DatabaseController{
  final dbClient = DatabaseProvider.dbProvider;

  Future<int> createMarkers(CustomMarker? todo) async {
    final db = await dbClient.db;
    int result = await db.insert("timerTable", todo!.toJSON());
    return result;
  }

  Future<List<CustomMarker>> getAllMarkers({List<String>? columns}) async {
    final db = await dbClient.db;
    var result = await db.query("timerTable",columns: columns);
    List<CustomMarker> todos = result.isNotEmpty ? result.map((item) => CustomMarker.fromJSON(item)).toList() : [];
    return todos;
  }

  Future<int> updateTODO(CustomMarker? todo) async {
    final db = await dbClient.db;
    var result = await db.update("timerTable", todo!.toJSON(),where: "id = ?", whereArgs: [todo.id]);
    return result;
  }

  Future<int> deleteTodo(int id) async {
    final db = await dbClient.db;
    var result = await db.delete("timerTable", where: 'id = ?', whereArgs: [id]);
    return result;
  }
}

import '../Utils/database_controller.dart';
import '../models/CustomMarker.dart';

class Repository {
  final DatabaseController dbController = DatabaseController();

  Future<List<CustomMarker>> getAllMarkers() => dbController.getAllMarkers();

  Future<int> insertMarkers(CustomMarker? todo) => dbController.createMarkers(todo);

  Future updateTodo(CustomMarker? todo) => dbController.updateTODO(todo);

  Future deleteMarkers(int id) => dbController.deleteTodo(id);
}

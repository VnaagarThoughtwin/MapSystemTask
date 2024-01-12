import 'package:flutter/material.dart';
import 'package:system_task_on_map/models/CustomMarker.dart';

import '../repository/repository.dart';

class MakeMarker extends ChangeNotifier {
  final Repository repository = Repository();

  final List<CustomMarker> _markers = [];

  List<CustomMarker> get markers => _markers;

  Future<void> getMarkers() async {
    List<CustomMarker> todos = await repository.getAllMarkers();
    _markers.addAll(todos);
    notifyListeners();
  }

  void addMarker(CustomMarker marker) {
    _markers.add(marker);
    repository.insertMarkers(marker);
    notifyListeners();
  }

  void removeMarker(int markerId) {
    _markers.removeWhere((marker) => marker.id == markerId);
    repository.deleteMarkers(markerId);
    notifyListeners();
  }
}

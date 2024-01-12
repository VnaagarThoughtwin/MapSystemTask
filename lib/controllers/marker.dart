import 'package:flutter/material.dart';
import 'package:system_task_on_map/models/CustomMarker.dart';

class MakeMarker extends ChangeNotifier {
  final List<CustomMarker> _markers = [];

  List<CustomMarker> get markers => _markers;






  void addMarker(CustomMarker marker) {
    _markers.add(marker);
    notifyListeners();
  }

  void removeMarker(CustomMarker marker) {
    _markers.remove(marker);
    notifyListeners();
  }
}

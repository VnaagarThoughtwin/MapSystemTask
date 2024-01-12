import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomMarker {
  int id;
  LatLng position;
  String label;

  CustomMarker({required this.position, required this.label, required this.id});
}

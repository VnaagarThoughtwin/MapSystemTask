import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomMarker {
  int? id;
  String? label;
  double? latitude;
  double? longitude;

  CustomMarker({this.label, this.id, this.latitude, this.longitude});

  factory CustomMarker.fromJSON(Map<String, dynamic> json) {
    return CustomMarker(
      id: json['id'],
      label: json['label'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      
    );
  }

  Map<String, dynamic> toJSON() {
    return {
      'id': id,
      'label': label,
      'longitude': longitude,
      'latitude': latitude,
      
    };
  }
}

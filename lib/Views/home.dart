import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:system_task_on_map/controllers/marker.dart';
import 'package:system_task_on_map/models/CustomMarker.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<MakeMarker>(
        builder: (BuildContext context, MakeMarker value, Widget? child) {
          return GoogleMap(
            mapType: MapType.hybrid,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            markers: value.markers.map((marker) {
              return Marker(
                markerId: MarkerId(marker.position.toString()),
                position: marker.position,
                infoWindow: InfoWindow(
                  title: marker.label,
                  snippet: "Tap on it to remove",
                  onTap: () => Provider.of<MakeMarker>(context, listen: false)
                      .removeMarker(marker.id),
                ),
              );
            }).toSet(),
            onTap: (argument) {
              return Provider.of<MakeMarker>(context, listen: false).addMarker(
                  CustomMarker(
                      position: argument,
                      label:
                          "Lat: ${argument.latitude}, Long : ${argument.longitude}",
                      id: UniqueKey().hashCode));
            },
          );
        },
      ),
    );
  }
}

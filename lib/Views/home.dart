import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:system_task_on_map/controllers/marker.dart';

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
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        // markers: ,
        onTap: (argument) {
          
          // print(argument.latitude);
          // print(argument.longitude);
          context
              .read<MakeMarker>()
              .storeMaker(argument.latitude, argument.longitude);
        },
      ),
    );
  }
}

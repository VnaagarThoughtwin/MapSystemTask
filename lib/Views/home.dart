import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:system_task_on_map/controllers/marker.dart';
import 'package:system_task_on_map/models/CustomMarker.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  void initState() {
    Provider.of<MakeMarker>(context, listen: false).getMarkers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<MakeMarker>(
        builder: (BuildContext context, MakeMarker value, Widget? child) {
          print(value.markers.length);

          return GoogleMap(
            mapType: MapType.hybrid,
            initialCameraPosition: HomeView._kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            markers: value.markers.map((marker) {
              var latLong =
                  LatLng(marker.latitude ?? 0.0, marker.longitude ?? 0.0);

              return Marker(
                markerId: MarkerId(latLong.toString()),
                position: latLong,
                infoWindow: InfoWindow(
                  title: marker.label,
                  snippet: "Tap on it to remove",
                  onTap: () {
                    Provider.of<MakeMarker>(context, listen: false)
                        .removeMarker(marker.id ?? 0);
                  },
                ),
              );
            }).toSet(),
            onTap: (argument) {
              return Provider.of<MakeMarker>(context, listen: false)
                  .addMarker(CustomMarker(
                    id: UniqueKey().hashCode,
                latitude: argument.latitude,
                longitude: argument.longitude,
                label:
                    "Lat: ${argument.latitude}, Long : ${argument.longitude}",
              ));
            },
          );
        },
      ),
    );
  }
}

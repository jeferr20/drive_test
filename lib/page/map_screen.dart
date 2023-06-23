import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  static const CameraPosition _defaulLocation = CameraPosition(
    target: LatLng(-8.117900, -79.025100),
    zoom: 16,
  );

  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _addMarker();
  }

  void _addMarker() {
    setState(() {
      _markers.add(Marker(
          markerId: const MarkerId('Centro'),
          position: _defaulLocation.target,
          icon: BitmapDescriptor.defaultMarker,
          infoWindow: const InfoWindow(
            title: 'Gerencia Regional de Transportes y Comunicaciones ',
            snippet: 'Horario: 8:15 AM - 4:30 PM',
          )));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GoogleMap(
      markers: _markers,
      mapType: MapType.normal,
      initialCameraPosition: _defaulLocation,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    ));
  }
}

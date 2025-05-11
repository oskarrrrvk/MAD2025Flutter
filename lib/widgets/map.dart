import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

List<LatLng> route = [
  LatLng(40.39749, -3.65534), // Entrada principal en Calle Benjamín Palencia
  LatLng(40.398415, -3.655314), // Mirador principal
  LatLng(40.3980, -3.6545), // Cerro 1
  LatLng(40.3975, -3.6540), // Cerro 2
  LatLng(40.3970, -3.6545), // Cerro 3
  LatLng(40.3965, -3.6550), // Cerro 4
  LatLng(40.3960, -3.6555), // Cerro 5
  LatLng(40.3965, -3.6560), // Cerro 6
  LatLng(40.3970, -3.6565), // Cerro 7
  LatLng(40.39749, -3.65534), // Regreso a la entrada principal
];


Widget createMap(){
  return FlutterMap(options: MapOptions(
      initialCenter: LatLng(40.397656, -3.654857),
      initialZoom: 16.0
  ), children: [
    TileLayer(
    urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
    subdomains: const ['a', 'b', 'c'],
    userAgentPackageName: 'com.example.mad2025',
    ),
    PolylineLayer(
      polylines: [
        Polyline(
          points: route,
          color: Colors.blue,
          strokeWidth: 4.0,
        ),
      ],
    ),
  ],
  );
}
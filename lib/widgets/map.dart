import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

Widget createMap(){
  return FlutterMap(options: MapOptions(
      initialCenter: LatLng(40.38923590951672, -3.627749768768932),
      initialZoom: 16.0
  ), children: [
    TileLayer(
    urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
    subdomains: const ['a', 'b', 'c'],
    userAgentPackageName: 'com.example.mad2025',
    )
  ],
  );
}
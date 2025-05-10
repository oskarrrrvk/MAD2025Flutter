import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

import 'package:mad2025/widgets/coordinates.dart';

Future<Widget> createMap() async {
  Position position = await determineCenterMap();
  return FlutterMap(options: MapOptions(
      initialCenter: LatLng(position.altitude, position.longitude),
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
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:mad2025/widgets/GPS.dart';

Widget createMap() {
  bool pressed = false;
  void toggleRute (){
    pressed = !pressed;
    if (pressed) {
      trackroute();
    } else {
      saveRoute();
    }
  }


  return FutureBuilder<LatLng>(
    future: readCoordinate(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      } else if (snapshot.hasError) {
        return Center(child: Text('Error: ${snapshot.error}'));
      } else {
        final center = snapshot.data!;
        return FlutterMap(
          options: MapOptions(
            initialCenter: center,
            initialZoom: 16.0,
          ),
          children: [
            TileLayer(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: const ['a', 'b', 'c'],
              userAgentPackageName: 'com.example.mad2025',
            ),
            ElevatedButton(
              onPressed: toggleRute,
              child: Text("Tracking"),
            ),
            PolylineLayer(
              polylines: [
                Polyline(
                  points: route, // asegúrate de que esto devuelva List<LatLng>
                  color: Colors.blue,
                  strokeWidth: 4.0,
                ),
              ],
            ),
          ],
        );
      }
    },
  );
}

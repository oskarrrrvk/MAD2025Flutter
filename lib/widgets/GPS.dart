import 'dart:io';
import 'dart:async';


import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

import 'package:path_provider/path_provider.dart';

List<LatLng> route = [];

Future<LatLng> readCoordinate() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Verificar si el GPS está habilitado
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('El servicio de ubicación está deshabilitado.');
  }

  // Verificar permisos
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Permiso de ubicación denegado.');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error('Permisos denegados permanentemente.');
  }

  // Obtener la posición
  Position position = await Geolocator.getCurrentPosition();
  return LatLng(position.latitude, position.longitude);
}

void trackroute(){
  route = [
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
}

Future<void> saveRoute() async {
  final directory = await getApplicationDocumentsDirectory();
  final file = File('${directory.path}/flutter/gps_coordinates.csv');
  print(directory.path);
  String content = route
      .map((coord) => '${coord.latitude},${coord.longitude}')
      .join(';');
  route.clear();
  await file.writeAsString('$content\n', mode: FileMode.append);
}
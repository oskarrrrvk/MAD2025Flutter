import 'package:geolocator/geolocator.dart';

Future<Position> determineCenterMap() async {
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
  return await Geolocator.getCurrentPosition();
}
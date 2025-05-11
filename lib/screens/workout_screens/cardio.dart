import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mad2025/widgets/map.dart';
import 'package:mad2025/widgets/coordinates.dart';

class RunningPage extends StatefulWidget {
  @override
  _RunningPage createState()=>_RunningPage();
}

class _RunningPage extends State<RunningPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('RUNNING')),
      body: createMap(),
    );
  }
}
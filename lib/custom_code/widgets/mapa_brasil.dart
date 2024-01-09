// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:countries_world_map/countries_world_map.dart';

class MapaBrasil extends StatefulWidget {
  const MapaBrasil({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _MapaBrasilState createState() => _MapaBrasilState();
}

class _MapaBrasilState extends State<MapaBrasil> {
  @override
  Widget build(BuildContext context) {
    return SimpleMap(
      instructions: SMapBrazil.instructions,
      defaultColor: Colors.indigo,
    );
  }
}

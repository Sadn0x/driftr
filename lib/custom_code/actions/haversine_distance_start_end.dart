// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/backend/schema/structs/index.dart';

import 'dart:math';

Future<double> haversineDistanceStartEnd() async {
  double _toRadians(double degrees) {
    return degrees * pi / 180;
  }

  // haversineDistance action that calculates distance between 2 points
  const double earthRadius = 6371.0; // in km

  double dLat = _toRadians(FFAppState().end.coordinates!.latitude -
      FFAppState().start.coordinates!.latitude);
  double dLon = _toRadians(FFAppState().end.coordinates!.longitude -
      FFAppState().start.coordinates!.longitude);

  double a = pow(sin(dLat / 2), 2) +
      cos(_toRadians(FFAppState().start.coordinates!.latitude)) *
          cos(_toRadians(FFAppState().end.coordinates!.latitude)) *
          pow(sin(dLon / 2), 2);

  double c = 2 * atan2(sqrt(a), sqrt(1 - a));

  double distance = earthRadius * c;
  print("Distance ${distance}");
  return distance;
}

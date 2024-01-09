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

Future<double> haversineTotalDistance() async {
  List<LatLng> points = FFAppState().points;

  if (points.length < 2) {
    return 0.0; // If there's less than two points, the distance is 0
  }

  double totalDistance = 0.0;

  for (int i = 0; i < points.length - 1; i++) {
    LatLng startPoint = points[i];
    LatLng endPoint = points[i + 1];
    totalDistance += haversineDistance(startPoint.latitude, endPoint.latitude,
        startPoint.longitude, endPoint.longitude);
  }
  print("total Distance ${totalDistance}");
  return totalDistance;
}

double haversineDistance(double lat1, double lon1, double lat2, double lon2) {
  double _toRadians(double degrees) {
    return degrees * pi / 180;
  }

  const double earthRadius = 6371.0; // in km

  double dLat = _toRadians(lat2 - lat1);
  double dLon = _toRadians(lon2 - lon1);

  double a = pow(sin(dLat / 2), 2) +
      cos(_toRadians(lat1)) * cos(_toRadians(lat2)) * pow(sin(dLon / 2), 2);

  double c = 2 * atan2(sqrt(a), sqrt(1 - a));

  return earthRadius * c; // returns distance in km
}

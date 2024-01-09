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

import 'dart:math' as math;
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart' as gm;

class DistanceCalculator {
  static double haversine(
    double lat1,
    double lon1,
    double lat2,
    double lon2,
  ) {
    /// MODIFY CODE ONLY BELOW THIS LINE

    // hamersine formula for calculating distance between 2 points
    double toRadians(double degrees) {
      return degrees * math.pi / 180;
    }

    const R = 6371e3; // metres
    final phi1 = toRadians(lat1);
    final phi2 = toRadians(lat2);
    final deltaPhi = toRadians(lat2 - lat1);
    final deltaLambda = toRadians(lon2 - lon1);

    final a = math.sin(deltaPhi / 2) * math.sin(deltaPhi / 2) +
        math.cos(phi1) *
            math.cos(phi2) *
            math.sin(deltaLambda / 2) *
            math.sin(deltaLambda / 2);
    final c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));

    final d = R * c;

    return d;

    /// MODIFY CODE ONLY ABOVE THIS LINE
  }
}

class CustomMarkerWidget extends StatefulWidget {
  const CustomMarkerWidget({
    super.key,
    this.width,
    this.height,
    required this.defaultImageUrl,
    required this.rebuildPage,
    required this.distanceColor,
    required this.distanceLineWidth,
    required this.pathColor,
    required this.pathWidth,
    required this.userLocation,
  });

  final double? width;
  final double? height;
  final String defaultImageUrl;
  final Future<dynamic> Function() rebuildPage;
  final Color distanceColor;
  final int distanceLineWidth;
  final Color pathColor;
  final int pathWidth;
  final LatLng userLocation;

  @override
  _CustomMarkerWidgetState createState() => _CustomMarkerWidgetState();
}

class _CustomMarkerWidgetState extends State<CustomMarkerWidget> {
  late gm.BitmapDescriptor icon1;
  late Future<Set<gm.Marker>> future;
  Set<gm.Marker> markers = {};
  late Future<bool> areMarkersLoaded;
  final Completer<gm.GoogleMapController> _controller =
      Completer<gm.GoogleMapController>();
  Set<gm.Polyline> polylines = {};
  gm.BitmapDescriptor? endIcon;
  gm.BitmapDescriptor? startIcon;

  @override
  initState() {
    areMarkersLoaded = startRoute();
    super.initState();
  }

  int i = 0;

  Set<gm.Polyline> addPoint() {
    i++;
    List<LatLng> points = FFAppState().points;
    if (points.isEmpty) {
    } else if (points.length == 1 && FFAppState().end.coordinates == null) {
      gm.LatLng startLatLng = gm.LatLng(
          FFAppState().start.coordinates!.latitude,
          FFAppState().start.coordinates!.longitude);
      gm.LatLng firstPoint = gm.LatLng(points[0].latitude, points[0].longitude);
      polylines.add(gm.Polyline(
        polylineId: gm.PolylineId('line$i'),
        points: [startLatLng, firstPoint],
        color: widget.pathColor,
        width: widget.pathWidth,
      ));
    } else {
      gm.LatLng lastPoint = polylines.last.points.last;
      gm.LatLng nextPoint =
          gm.LatLng(points.last.latitude, points.last.longitude);
      polylines.add(gm.Polyline(
        polylineId: gm.PolylineId('line$i'),
        points: [lastPoint, nextPoint],
        color: widget.pathColor,
        width: widget.pathWidth,
      ));
    }

    if (markers.length > 1) {
      int index = points.length - 1;
      gm.LatLng point =
          gm.LatLng(points[index].latitude, points[index].longitude);
      polylines.add(gm.Polyline(
          polylineId: const gm.PolylineId("ww"),
          points: [
            point,
            gm.LatLng(FFAppState().end.coordinates!.latitude,
                FFAppState().end.coordinates!.longitude)
          ],
          color: widget.pathColor,
          width: widget.pathWidth));
      polylines.add(gm.Polyline(
        polylineId: const gm.PolylineId('route'),
        points: [
          gm.LatLng(FFAppState().start.coordinates!.latitude,
              FFAppState().start.coordinates!.longitude),
          gm.LatLng(FFAppState().end.coordinates!.latitude,
              FFAppState().end.coordinates!.longitude)
        ],
        color: widget.distanceColor,
        width: widget.distanceLineWidth,
      ));
    }

    return polylines;
  }
  //Made by Blupry.com
  //Blupry.com No-code marketplace, custom template and support!

  Future<bool> startRoute() async {
    List<gm.Marker> listMarkers = [];
    final http.Response response =
        await http.get(Uri.parse(FFAppState().start.imageUrl));
    final http.Response responseEnd =
        await http.get(Uri.parse(FFAppState().end.imageUrl));

    final icon = gm.BitmapDescriptor.fromBytes(response.bodyBytes,
        size: const Size(24, 24));
    startIcon = icon;
    final iconEnd = gm.BitmapDescriptor.fromBytes(responseEnd.bodyBytes,
        size: const Size(24, 24));
    endIcon = iconEnd;
    final marker = gm.Marker(
      markerId: gm.MarkerId(FFAppState().start.coordinates.toString()),
      position: gm.LatLng(FFAppState().start.coordinates!.latitude,
          FFAppState().start.coordinates!.longitude),
      icon: icon,
      onTap: () {
        FFAppState().tapped = LatLng(FFAppState().start.coordinates!.latitude,
            FFAppState().start.coordinates!.longitude);
        widget.rebuildPage();
      },
    );

    listMarkers.add(marker);
    markers = listMarkers.toSet();
    return true;
  }
  //Made by Blupry.com
  //Blupry.com No-code marketplace, custom template and support!

  Set<gm.Marker> createMarkers() {
    if (markers.isEmpty) {
      final marker = gm.Marker(
        markerId: gm.MarkerId(FFAppState().start.coordinates.toString()),
        position: gm.LatLng(FFAppState().start.coordinates!.latitude,
            FFAppState().start.coordinates!.longitude),
        icon: startIcon!,
        onTap: () {
          FFAppState().tapped = LatLng(FFAppState().start.coordinates!.latitude,
              FFAppState().start.coordinates!.longitude);
          widget.rebuildPage();
        },
      );

      markers.add(marker);
    }

    if (FFAppState().end.coordinates != null && markers.length == 1) {
      final marker = gm.Marker(
        markerId: gm.MarkerId(FFAppState().end.coordinates.toString()),
        position: gm.LatLng(FFAppState().end.coordinates!.latitude,
            FFAppState().end.coordinates!.longitude),
        icon: endIcon!,
        onTap: () {
          FFAppState().tapped = LatLng(FFAppState().end.coordinates!.latitude,
              FFAppState().end.coordinates!.longitude);
          widget.rebuildPage();
        },
      );
      markers.add(marker);
    }
    return markers;
  }

  //Made by Blupry.com
  //Blupry.com No-code marketplace, custom template and support!
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: areMarkersLoaded,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return gm.GoogleMap(
            onMapCreated: (gm.GoogleMapController controller) {
              _controller.complete(controller);
            },
            initialCameraPosition: gm.CameraPosition(
                target: gm.LatLng(widget.userLocation.latitude,
                    widget.userLocation.longitude),
                zoom: 8),
            markers: createMarkers(),
            polylines: addPoint(),
          );
        } else {
          return gm.GoogleMap(
            onMapCreated: (gm.GoogleMapController controller) {
              _controller.complete(controller);
            },
            initialCameraPosition: gm.CameraPosition(
              target: gm.LatLng(
                  widget.userLocation.latitude, widget.userLocation.longitude),
              zoom: 8,
            ),
            markers: const {},
            polylines: const {},
          );
        }
      },
    );
  }
}

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

import 'dart:async';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latlong2;
import 'package:dio/dio.dart';

class NominatimMapWidget extends StatefulWidget {
  final double width;
  final double height;
  final String estado;
  final String cidade;
  final Color mapColor;
  final Color borderColor;
  final String fixedPathCoordinates;
  final Color polylineFixedColor;
  final Color polylineVariableColor;
  final String backgroundImageUrl;
  final String userImageUrl;

  NominatimMapWidget({
    Key? key,
    required this.width,
    required this.height,
    required this.estado,
    required this.cidade,
    this.mapColor = Colors.blue,
    this.borderColor = Colors.blue,
    required this.fixedPathCoordinates,
    this.polylineFixedColor = Colors.red,
    this.polylineVariableColor = Colors.green,
    required this.backgroundImageUrl,
    required this.userImageUrl,
  }) : super(key: key);

  @override
  _NominatimMapWidgetState createState() => _NominatimMapWidgetState();
}

class _NominatimMapWidgetState extends State<NominatimMapWidget> {
  late final MapController _mapController;
  List<Polygon> _polygons = [];
  List<Polyline> _polylines = [];
  latlong2.LatLng? _center;
  late Marker _userMarker;
  List<latlong2.LatLng> _travelPath = [];
  final double _fixedMarkerSize = 30.0;
  final double _userMarkerSize = 60.0;
  final double _userIconSize = 20.0;

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
    _loadPolygonData(widget.estado, widget.cidade);
    _addFixedPolyline();
    _userMarker = _createCustomMarker(latlong2.LatLng(-3.71722, -38.5433));
    _simulateTravel();
  }

  Future<void> _loadPolygonData(String estado, String cidade) async {
    try {
      final response = await Dio().get(
        'https://nominatim.openstreetmap.org/search?q=$estado,$cidade&format=json&polygon=1&polygon_geojson=1',
      );
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        _addPolygon(data);
        _center = _getPolygonCenter(_polygons.first.points);
        _mapController.move(_center!, 10.5);
      }
    } catch (e) {
      print('Erro ao carregar dados do polígono: $e');
    }
  }

  latlong2.LatLng _getPolygonCenter(List<latlong2.LatLng> points) {
    double averageLat = 0.0;
    double averageLng = 0.0;
    for (var point in points) {
      averageLat += point.latitude;
      averageLng += point.longitude;
    }
    averageLat /= points.length;
    averageLng /= points.length;
    return latlong2.LatLng(averageLat, averageLng);
  }

  void _addPolygon(List<dynamic> data) {
    var polygonCoordinates = data.map((item) {
      List<latlong2.LatLng> coords = [];
      for (var coord in item['geojson']['coordinates'][0]) {
        coords.add(latlong2.LatLng(coord[1], coord[0]));
      }
      return coords;
    }).toList();

    setState(() {
      _polygons = polygonCoordinates.map((coords) {
        return Polygon(
          points: coords,
          color: widget.mapColor.withOpacity(0.3),
          borderColor: widget.borderColor,
          borderStrokeWidth: 2,
        );
      }).toList();
    });
  }

  void _addFixedPolyline() {
    var coordinates = widget.fixedPathCoordinates.split(';').map((e) {
      var latLng = e.split(',').map((str) => double.parse(str)).toList();
      return latlong2.LatLng(latLng[0], latLng[1]);
    }).toList();
    if (coordinates.length == 2) {
      _polylines.add(
        Polyline(
          points: coordinates,
          strokeWidth: 2.0,
          color: widget.polylineFixedColor,
        ),
      );
    }
  }

  List<Marker> _createFixedMarkers() {
    var coordinates = widget.fixedPathCoordinates.split(';').map((e) {
      var latLng = e.split(',').map((str) => double.parse(str)).toList();
      return latlong2.LatLng(latLng[0], latLng[1]);
    }).toList();

    return List.generate(coordinates.length, (index) {
      return Marker(
        width: _fixedMarkerSize,
        height: _fixedMarkerSize,
        point: coordinates[index],
        builder: (ctx) => Icon(
          Icons.location_on,
          size: _fixedMarkerSize,
          color: index == 0 ? Colors.green : Colors.red,
        ),
      );
    });
  }

  Marker _createCustomMarker(latlong2.LatLng position) {
    return Marker(
      width: _userMarkerSize,
      height: _userMarkerSize,
      point: position,
      builder: (ctx) => Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            bottom: 10,
            child: Image(
              image: NetworkImage(widget.backgroundImageUrl),
              width: _userMarkerSize,
              height: _userMarkerSize,
            ),
          ),
          Positioned(
            top: 10,
            child: CircleAvatar(
              backgroundImage: NetworkImage(widget.userImageUrl),
              radius: _userIconSize / 2,
            ),
          ),
        ],
      ),
    );
  }

  void _simulateTravel() {
    var travelPoints = [
      latlong2.LatLng(-3.71722, -38.5433),
      latlong2.LatLng(-3.7841476, -38.5710395),
      latlong2.LatLng(-3.7799904, -38.5807712),
      latlong2.LatLng(-3.7769203, -38.5922215),
      latlong2.LatLng(-3.7559054, -38.5464241),
      latlong2.LatLng(-3.7486146, -38.5575622),
      latlong2.LatLng(-3.7349265, -38.5493475),
      latlong2.LatLng(-3.7329874, -38.5313035),
      latlong2.LatLng(-3.7229382, -38.5161917),
      latlong2.LatLng(-3.7415534, -38.4841944),
      latlong2.LatLng(-3.8121382, -38.4853613),
      latlong2.LatLng(-3.8389737, -38.5430909),
    ];
    int index = 0;
    Timer.periodic(Duration(seconds: 10), (Timer timer) {
      if (index < travelPoints.length) {
        setState(() {
          _travelPath.add(travelPoints[index]);
          _polylines.add(
            Polyline(
              points: _travelPath,
              strokeWidth: 2.0,
              color: widget.polylineVariableColor,
            ),
          );
          _userMarker = _createCustomMarker(travelPoints[index]);
        });
        index++;
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var fixedMarkers = _createFixedMarkers();
    return Container(
      width: widget.width,
      height: widget.height,
      child: FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          center: _center ?? latlong2.LatLng(0, 0),
          zoom: 10.5,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'],
          ),
          PolygonLayerOptions(polygons: _polygons),
          PolylineLayerOptions(polylines: _polylines),
          MarkerLayerOptions(markers: fixedMarkers + [_userMarker]),
        ],
      ),
    );
  }
}

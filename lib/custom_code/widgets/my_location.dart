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

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:location/location.dart';

class MyLocation extends StatefulWidget {
  const MyLocation({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  State<MyLocation> createState() => _MyLocationState();
}

class _MyLocationState extends State<MyLocation> {
  Location location = Location();
  LocationData? _currentPosition;
  double latitudeAtual = 0;
  double longitudeAtual = 0;
  double altitudeAtual = 0;
  double solo = 0;
  String texto = '';

  @override
  void initState() {
    getLoc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 320,
        height: 205,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(24, 20, 24, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(6, 0, 0, 0),
                child: Text(
                  'In progress',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Poppins',
                        fontSize: 21,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.location_on,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 24,
                    ),
                    Text(
                      'Location',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8, 8, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'KM 1',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                    ),
                    SizedBox(
                      height: 11,
                      child: VerticalDivider(
                        thickness: 1,
                        color: FlutterFlowTheme.of(context).tertiary,
                      ),
                    ),
                    Text(
                      'KM 2',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                    ),
                    SizedBox(
                      height: 11,
                      child: VerticalDivider(
                        thickness: 1,
                        color: FlutterFlowTheme.of(context).tertiary,
                      ),
                    ),
                    Text(
                      'H 7:30',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                    ),
                    SizedBox(
                      height: 11,
                      child: VerticalDivider(
                        thickness: 1,
                        color: FlutterFlowTheme.of(context).tertiary,
                      ),
                    ),
                    Text(
                      'ALT ${altitudeAtual.toStringAsFixed(2)}',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8, 17, 0, 0),
                child: Text(
                  'Record holder data',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8, 8, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'KM 1',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                    ),
                    SizedBox(
                      height: 11,
                      child: VerticalDivider(
                        thickness: 1,
                        color: FlutterFlowTheme.of(context).tertiary,
                      ),
                    ),
                    Text(
                      'KM 2',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                    ),
                    SizedBox(
                      height: 11,
                      child: VerticalDivider(
                        thickness: 1,
                        color: FlutterFlowTheme.of(context).tertiary,
                      ),
                    ),
                    Text(
                      'H 7:30',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                    ),
                    SizedBox(
                      height: 11,
                      child: VerticalDivider(
                        thickness: 1,
                        color: FlutterFlowTheme.of(context).tertiary,
                      ),
                    ),
                    Text(
                      'ALT ${altitudeAtual.toStringAsFixed(2)}',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getLoc() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    location.changeSettings(accuracy: LocationAccuracy.high);
    location.getLocation().then(
      (location) {
        _currentPosition = location;
      },
    );
    location.onLocationChanged.listen(
      (newLoc) {
        _currentPosition = newLoc;
        latitudeAtual = _currentPosition!.latitude!;
        longitudeAtual = _currentPosition!.longitude!;
        altitudeAtual = _currentPosition!.altitude!;
        setState(() {});
        if (altitudeAtual > solo + 15) {
          texto = 'Você está voando';
        } else {
          texto = 'Você está no chão';
        }
      },
    );
  }
}

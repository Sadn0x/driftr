import '/components/card_info_pilot_new/card_info_pilot_new_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'card_mapa_piloto_widget.dart' show CardMapaPilotoWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CardMapaPilotoModel extends FlutterFlowModel<CardMapaPilotoWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Model for cardInfoPilotNew component.
  late CardInfoPilotNewModel cardInfoPilotNewModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    cardInfoPilotNewModel = createModel(context, () => CardInfoPilotNewModel());
  }

  void dispose() {
    cardInfoPilotNewModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

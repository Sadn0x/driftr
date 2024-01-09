import '/backend/backend.dart';
import '/components/card_info_pilot_new/card_info_pilot_new_widget.dart';
import '/components/card_rercodista_campeao/card_rercodista_campeao_widget.dart';
import '/components/lista_vazia/lista_vazia_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'informacoes_tentativa_piloto_widget.dart'
    show InformacoesTentativaPilotoWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InformacoesTentativaPilotoModel
    extends FlutterFlowModel<InformacoesTentativaPilotoWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
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
    unfocusNode.dispose();
    cardInfoPilotNewModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

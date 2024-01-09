import '/backend/backend.dart';
import '/components/card_info_pilot_sem_live/card_info_pilot_sem_live_widget.dart';
import '/components/card_rercodista_campeao/card_rercodista_campeao_widget.dart';
import '/components/lista_vazia/lista_vazia_widget.dart';
import '/components/navbar_start_fight/navbar_start_fight_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'regiao_escolhida_para_voar_widget.dart'
    show RegiaoEscolhidaParaVoarWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegiaoEscolhidaParaVoarModel
    extends FlutterFlowModel<RegiaoEscolhidaParaVoarWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Model for navbarStartFight component.
  late NavbarStartFightModel navbarStartFightModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    navbarStartFightModel = createModel(context, () => NavbarStartFightModel());
  }

  void dispose() {
    unfocusNode.dispose();
    navbarStartFightModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

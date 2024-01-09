import '/backend/backend.dart';
import '/components/card_info_profile/card_info_profile_widget.dart';
import '/components/card_live_region/card_live_region_widget.dart';
import '/components/card_region/card_region_widget.dart';
import '/components/lista_vazia/lista_vazia_widget.dart';
import '/components/navbar/navbar_widget.dart';
import '/components/navbar_info_dados/navbar_info_dados_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'perfil_piloto_widget.dart' show PerfilPilotoWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PerfilPilotoModel extends FlutterFlowModel<PerfilPilotoWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for cardInfoProfile component.
  late CardInfoProfileModel cardInfoProfileModel;
  // Model for navbarInfoDados component.
  late NavbarInfoDadosModel navbarInfoDadosModel;
  // Model for cardLiveRegion component.
  late CardLiveRegionModel cardLiveRegionModel;
  // Model for navbar component.
  late NavbarModel navbarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    cardInfoProfileModel = createModel(context, () => CardInfoProfileModel());
    navbarInfoDadosModel = createModel(context, () => NavbarInfoDadosModel());
    cardLiveRegionModel = createModel(context, () => CardLiveRegionModel());
    navbarModel = createModel(context, () => NavbarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    cardInfoProfileModel.dispose();
    navbarInfoDadosModel.dispose();
    cardLiveRegionModel.dispose();
    navbarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

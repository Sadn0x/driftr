import '/components/navbar/navbar_widget.dart';
import '/components/popup_progress_copy/popup_progress_copy_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'voando_tempo_real_mapa_widget.dart' show VoandoTempoRealMapaWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VoandoTempoRealMapaModel
    extends FlutterFlowModel<VoandoTempoRealMapaWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for popupProgressCopy component.
  late PopupProgressCopyModel popupProgressCopyModel;
  // Model for navbar component.
  late NavbarModel navbarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    popupProgressCopyModel =
        createModel(context, () => PopupProgressCopyModel());
    navbarModel = createModel(context, () => NavbarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    popupProgressCopyModel.dispose();
    navbarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

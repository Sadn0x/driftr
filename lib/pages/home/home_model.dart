import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/card_tentativa_home/card_tentativa_home_widget.dart';
import '/components/lista_vazia/lista_vazia_widget.dart';
import '/components/navbar/navbar_widget.dart';
import '/components/navbar_info_dados/navbar_info_dados_widget.dart';
import '/components/popup_filters_map_copy/popup_filters_map_copy_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  Local state fields for this page.

  String? filtro;

  ///  State fields for stateful widgets in this page.

  // Model for navbarInfoDados component.
  late NavbarInfoDadosModel navbarInfoDadosModel;
  // Stores action output result for [Bottom Sheet - popupFiltersMapCopy] action in Container widget.
  String? filtros;
  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, VooRecord>? listViewPagingController;
  Query? listViewPagingQuery;
  List<StreamSubscription?> listViewStreamSubscriptions = [];

  // Model for navbar component.
  late NavbarModel navbarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    navbarInfoDadosModel = createModel(context, () => NavbarInfoDadosModel());
    navbarModel = createModel(context, () => NavbarModel());
  }

  void dispose() {
    navbarInfoDadosModel.dispose();
    listViewStreamSubscriptions.forEach((s) => s?.cancel());
    listViewPagingController?.dispose();

    navbarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  PagingController<DocumentSnapshot?, VooRecord> setListViewController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController ??= _createListViewController(query, parent);
    if (listViewPagingQuery != query) {
      listViewPagingQuery = query;
      listViewPagingController?.refresh();
    }
    return listViewPagingController!;
  }

  PagingController<DocumentSnapshot?, VooRecord> _createListViewController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, VooRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryVooRecordPage(
          queryBuilder: (_) => listViewPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions,
          controller: controller,
          pageSize: 15,
          isStream: true,
        ),
      );
  }
}

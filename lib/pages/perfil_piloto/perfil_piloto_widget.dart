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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'perfil_piloto_model.dart';
export 'perfil_piloto_model.dart';

class PerfilPilotoWidget extends StatefulWidget {
  const PerfilPilotoWidget({
    Key? key,
    required this.user,
  }) : super(key: key);

  final DocumentReference? user;

  @override
  _PerfilPilotoWidgetState createState() => _PerfilPilotoWidgetState();
}

class _PerfilPilotoWidgetState extends State<PerfilPilotoWidget> {
  late PerfilPilotoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PerfilPilotoModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().selectedScreenMenu = '1';
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Profile',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                child: SingleChildScrollView(
                  primary: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: wrapWithModel(
                          model: _model.cardInfoProfileModel,
                          updateCallback: () => setState(() {}),
                          child: CardInfoProfileWidget(
                            user: widget.user!,
                          ),
                        ),
                      ),
                      wrapWithModel(
                        model: _model.navbarInfoDadosModel,
                        updateCallback: () => setState(() {}),
                        child: NavbarInfoDadosWidget(
                          user: widget.user!,
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Text(
                              'Live:',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          Stack(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/background.png',
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 135.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: wrapWithModel(
                                  model: _model.cardLiveRegionModel,
                                  updateCallback: () => setState(() {}),
                                  child: CardLiveRegionWidget(),
                                ),
                              ),
                            ],
                          ),
                        ].divide(SizedBox(height: 14.0)),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Text(
                          'Driftr Fligths',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                      StreamBuilder<List<VooRecord>>(
                        stream: queryVooRecord(
                          queryBuilder: (vooRecord) => vooRecord.where(
                            'piloto',
                            isEqualTo: widget.user,
                          ),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<VooRecord> listViewVooRecordList =
                              snapshot.data!;
                          if (listViewVooRecordList.isEmpty) {
                            return ListaVaziaWidget();
                          }
                          return ListView.separated(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewVooRecordList.length,
                            separatorBuilder: (_, __) => SizedBox(height: 10.0),
                            itemBuilder: (context, listViewIndex) {
                              final listViewVooRecord =
                                  listViewVooRecordList[listViewIndex];
                              return Stack(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/background.png',
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 135.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: CardRegionWidget(
                                      key: Key(
                                          'Key1hb_${listViewIndex}_of_${listViewVooRecordList.length}'),
                                      voo: listViewVooRecord,
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ]
                        .divide(SizedBox(height: 14.0))
                        .addToEnd(SizedBox(height: 85.0)),
                  ),
                ),
              ),
            ),
            wrapWithModel(
              model: _model.navbarModel,
              updateCallback: () => setState(() {}),
              child: NavbarWidget(),
            ),
          ],
        ),
      ),
    );
  }
}

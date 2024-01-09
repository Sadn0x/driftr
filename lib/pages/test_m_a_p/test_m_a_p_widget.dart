import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'test_m_a_p_model.dart';
export 'test_m_a_p_model.dart';

class TestMAPWidget extends StatefulWidget {
  const TestMAPWidget({
    Key? key,
    this.areaName,
    this.cityName,
  }) : super(key: key);

  final String? areaName;
  final String? cityName;

  @override
  _TestMAPWidgetState createState() => _TestMAPWidgetState();
}

class _TestMAPWidgetState extends State<TestMAPWidget> {
  late TestMAPModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestMAPModel());

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
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            AuthUserStreamWidget(
              builder: (context) => Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 1.0,
                child: custom_widgets.NominatimMapWidget(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  estado: 'Ceará',
                  cidade: 'Fortaleza',
                  mapColor: Color(0x5E249689),
                  borderColor: FlutterFlowTheme.of(context).success,
                  fixedPathCoordinates:
                      '-3.71722,-38.5433;-3.8389737,-38.5430909',
                  polylineFixedColor: FlutterFlowTheme.of(context).warning,
                  polylineVariableColor: FlutterFlowTheme.of(context).error,
                  backgroundImageUrl:
                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/driftr-4r967e/assets/3pwmkzy6cgmi/voandoballondriftr.png',
                  userImageUrl: currentUserPhoto,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

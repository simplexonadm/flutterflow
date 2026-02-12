import '/components/header_widget.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/index.dart';
import 'sincronizacao_widget.dart' show SincronizacaoWidget;
import 'package:flutter/material.dart';

class SincronizacaoModel extends FlutterFlowModel<SincronizacaoWidget> {
  ///  State fields for stateful widgets in this page.

  InstantTimer? instantTimer;
  // Model for header component.
  late HeaderModel headerModel;
  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    instantTimer?.cancel();
    headerModel.dispose();
    navBarModel.dispose();
  }
}

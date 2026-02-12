import '/components/header_widget.dart';
import '/components/nav_bar_widget.dart';
import '/components/titulo_pagina_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'local_producao_widget.dart' show LocalProducaoWidget;
import 'package:flutter/material.dart';

class LocalProducaoModel extends FlutterFlowModel<LocalProducaoWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for header component.
  late HeaderModel headerModel;
  // Model for tituloPagina component.
  late TituloPaginaModel tituloPaginaModel;
  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    tituloPaginaModel = createModel(context, () => TituloPaginaModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    tituloPaginaModel.dispose();
    navBarModel.dispose();
  }
}

import '/components/empty_state_widget.dart';
import '/components/header_widget.dart';
import '/components/nav_bar_widget.dart';
import '/components/titulo_pagina_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'sub_modulos_widget.dart' show SubModulosWidget;
import 'package:flutter/material.dart';

class SubModulosModel extends FlutterFlowModel<SubModulosWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for header component.
  late HeaderModel headerModel;
  // Model for tituloPagina component.
  late TituloPaginaModel tituloPaginaModel;
  // Model for emptyState component.
  late EmptyStateModel emptyStateModel;
  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    tituloPaginaModel = createModel(context, () => TituloPaginaModel());
    emptyStateModel = createModel(context, () => EmptyStateModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    tituloPaginaModel.dispose();
    emptyStateModel.dispose();
    navBarModel.dispose();
  }
}

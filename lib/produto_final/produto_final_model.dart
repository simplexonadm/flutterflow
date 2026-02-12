import '/components/empty_state_widget.dart';
import '/components/header_widget.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'produto_final_widget.dart' show ProdutoFinalWidget;
import 'package:flutter/material.dart';

class ProdutoFinalModel extends FlutterFlowModel<ProdutoFinalWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for header component.
  late HeaderModel headerModel;
  // Model for emptyState component.
  late EmptyStateModel emptyStateModel;
  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    emptyStateModel = createModel(context, () => EmptyStateModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    emptyStateModel.dispose();
    navBarModel.dispose();
  }
}

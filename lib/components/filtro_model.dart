import '/flutter_flow/flutter_flow_util.dart';
import 'filtro_widget.dart' show FiltroWidget;
import 'package:flutter/material.dart';

class FiltroModel extends FlutterFlowModel<FiltroWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for sb-pesquisa widget.
  FocusNode? sbPesquisaFocusNode;
  TextEditingController? sbPesquisaTextController;
  String? Function(BuildContext, String?)? sbPesquisaTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    sbPesquisaFocusNode?.dispose();
    sbPesquisaTextController?.dispose();
  }
}

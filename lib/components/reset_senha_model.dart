import '/flutter_flow/flutter_flow_util.dart';
import 'reset_senha_widget.dart' show ResetSenhaWidget;
import 'package:flutter/material.dart';

class ResetSenhaModel extends FlutterFlowModel<ResetSenhaWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();
  }
}

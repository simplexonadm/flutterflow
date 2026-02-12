import '/components/empty_state_widget.dart';
import '/components/header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'itens_inspecao_corrigido_widget.dart' show ItensInspecaoCorrigidoWidget;
import 'package:flutter/material.dart';

class ItensInspecaoCorrigidoModel
    extends FlutterFlowModel<ItensInspecaoCorrigidoWidget> {
  ///  Local state fields for this page.
  /// Serve para listar os id''s dos controlados que já foram duplicados
  List<int> ocultarNovosFormularios = [];
  void addToOcultarNovosFormularios(int item) =>
      ocultarNovosFormularios.add(item);
  void removeFromOcultarNovosFormularios(int item) =>
      ocultarNovosFormularios.remove(item);
  void removeAtIndexFromOcultarNovosFormularios(int index) =>
      ocultarNovosFormularios.removeAt(index);
  void insertAtIndexInOcultarNovosFormularios(int index, int item) =>
      ocultarNovosFormularios.insert(index, item);
  void updateOcultarNovosFormulariosAtIndex(
          int index, Function(int) updateFn) =>
      ocultarNovosFormularios[index] = updateFn(ocultarNovosFormularios[index]);

  ///  State fields for stateful widgets in this page.

  // Model for header component.
  late HeaderModel headerModel;
  // Model for buscaNaoEncontrada.
  late EmptyStateModel buscaNaoEncontradaModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    buscaNaoEncontradaModel = createModel(context, () => EmptyStateModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    buscaNaoEncontradaModel.dispose();
  }
}

import '/components/dado_relaciomais_widget.dart';
import '/components/drop_down_widget.dart';
import '/components/header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'item_formulario_widget.dart' show ItemFormularioWidget;
import 'package:flutter/material.dart';

class ItemFormularioModel extends FlutterFlowModel<ItemFormularioWidget> {
  ///  Local state fields for this page.

  DateTime? dataInspecao;

  DateTime? dataPrevista;

  bool obsoleto = false;

  bool naoConformidadeGrave = false;

  bool simNao = false;

  int? tamanhoDaFonte = 16;

  DateTime? dataAprovacao;

  DateTime? dataReinspecao;

  int tamanhoDafonteInterna = 18;

  ///  State fields for stateful widgets in this page.

  // Model for header component.
  late HeaderModel headerModel;
  // Model for dropDownResultadoInspecao.
  late DropDownModel dropDownResultadoInspecaoModel;
  // Model for dropDownAtende.
  late DropDownModel dropDownAtendeModel;
  // State field(s) for limk widget.
  FocusNode? limkFocusNode;
  TextEditingController? limkTextController;
  String? Function(BuildContext, String?)? limkTextControllerValidator;
  // State field(s) for input_descricaoProblema widget.
  FocusNode? inputDescricaoProblemaFocusNode;
  TextEditingController? inputDescricaoProblemaTextController;
  String? Function(BuildContext, String?)?
      inputDescricaoProblemaTextControllerValidator;
  // State field(s) for input_correcaoDisposicao widget.
  FocusNode? inputCorrecaoDisposicaoFocusNode;
  TextEditingController? inputCorrecaoDisposicaoTextController;
  String? Function(BuildContext, String?)?
      inputCorrecaoDisposicaoTextControllerValidator;
  // State field(s) for input_observacoes widget.
  FocusNode? inputObservacoesFocusNode;
  TextEditingController? inputObservacoesTextController;
  String? Function(BuildContext, String?)?
      inputObservacoesTextControllerValidator;
  // Model for dropDownResultadoReinspcao.
  late DropDownModel dropDownResultadoReinspcaoModel;
  DateTime? datePicked1;
  // Model for dropDownResponsavel.
  late DropDownModel dropDownResponsavelModel;
  // Model for dropDownConprovacoes.
  late DropDownModel dropDownConprovacoesModel;
  // Model for dropDowncondPagamento.
  late DropDownModel dropDowncondPagamentoModel;
  // Model for dropDownmetodoavalicao.
  late DropDownModel dropDownmetodoavalicaoModel;
  // Model for dropDownNps.
  late DropDownModel dropDownNpsModel;
  // Model for dropDownOrigem.
  late DropDownModel dropDownOrigemModel;
  // Model for dropDownPeriodicidade.
  late DropDownModel dropDownPeriodicidadeModel;
  // Model for dadoRelaciomais component.
  late DadoRelaciomaisModel dadoRelaciomaisModel1;
  // Model for dropDownPreparoSobrevivencia.
  late DropDownModel dropDownPreparoSobrevivenciaModel;
  // Model for dropDownStatus.
  late DropDownModel dropDownStatusModel;
  // State field(s) for quantmm widget.
  FocusNode? quantmmFocusNode;
  TextEditingController? quantmmTextController;
  String? Function(BuildContext, String?)? quantmmTextControllerValidator;
  // State field(s) for revisao widget.
  FocusNode? revisaoFocusNode;
  TextEditingController? revisaoTextController;
  String? Function(BuildContext, String?)? revisaoTextControllerValidator;
  DateTime? datePicked2;
  // Model for dadoRelaciomais component.
  late DadoRelaciomaisModel dadoRelaciomaisModel2;
  DateTime? datePicked3;
  DateTime? datePicked4;
  // Model for dadoRelaciomais component.
  late DadoRelaciomaisModel dadoRelaciomaisModel3;
  // Model for dropDownRequisitoRequerido.
  late DropDownModel dropDownRequisitoRequeridoModel;
  // Model for dropDownTagsCor.
  late DropDownModel dropDownTagsCorModel;
  // Model for dropDownPartes.
  late DropDownModel dropDownPartesModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    dropDownResultadoInspecaoModel =
        createModel(context, () => DropDownModel());
    dropDownAtendeModel = createModel(context, () => DropDownModel());
    dropDownResultadoReinspcaoModel =
        createModel(context, () => DropDownModel());
    dropDownResponsavelModel = createModel(context, () => DropDownModel());
    dropDownConprovacoesModel = createModel(context, () => DropDownModel());
    dropDowncondPagamentoModel = createModel(context, () => DropDownModel());
    dropDownmetodoavalicaoModel = createModel(context, () => DropDownModel());
    dropDownNpsModel = createModel(context, () => DropDownModel());
    dropDownOrigemModel = createModel(context, () => DropDownModel());
    dropDownPeriodicidadeModel = createModel(context, () => DropDownModel());
    dadoRelaciomaisModel1 = createModel(context, () => DadoRelaciomaisModel());
    dropDownPreparoSobrevivenciaModel =
        createModel(context, () => DropDownModel());
    dropDownStatusModel = createModel(context, () => DropDownModel());
    dadoRelaciomaisModel2 = createModel(context, () => DadoRelaciomaisModel());
    dadoRelaciomaisModel3 = createModel(context, () => DadoRelaciomaisModel());
    dropDownRequisitoRequeridoModel =
        createModel(context, () => DropDownModel());
    dropDownTagsCorModel = createModel(context, () => DropDownModel());
    dropDownPartesModel = createModel(context, () => DropDownModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    dropDownResultadoInspecaoModel.dispose();
    dropDownAtendeModel.dispose();
    limkFocusNode?.dispose();
    limkTextController?.dispose();

    inputDescricaoProblemaFocusNode?.dispose();
    inputDescricaoProblemaTextController?.dispose();

    inputCorrecaoDisposicaoFocusNode?.dispose();
    inputCorrecaoDisposicaoTextController?.dispose();

    inputObservacoesFocusNode?.dispose();
    inputObservacoesTextController?.dispose();

    dropDownResultadoReinspcaoModel.dispose();
    dropDownResponsavelModel.dispose();
    dropDownConprovacoesModel.dispose();
    dropDowncondPagamentoModel.dispose();
    dropDownmetodoavalicaoModel.dispose();
    dropDownNpsModel.dispose();
    dropDownOrigemModel.dispose();
    dropDownPeriodicidadeModel.dispose();
    dadoRelaciomaisModel1.dispose();
    dropDownPreparoSobrevivenciaModel.dispose();
    dropDownStatusModel.dispose();
    quantmmFocusNode?.dispose();
    quantmmTextController?.dispose();

    revisaoFocusNode?.dispose();
    revisaoTextController?.dispose();

    dadoRelaciomaisModel2.dispose();
    dadoRelaciomaisModel3.dispose();
    dropDownRequisitoRequeridoModel.dispose();
    dropDownTagsCorModel.dispose();
    dropDownPartesModel.dispose();
  }
}

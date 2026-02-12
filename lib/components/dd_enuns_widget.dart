import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dd_enuns_model.dart';
export 'dd_enuns_model.dart';

class DdEnunsWidget extends StatefulWidget {
  const DdEnunsWidget({
    super.key,
    required this.lisTxt,
    String? titulo,
    required this.tipoEnum,
    required this.txtConteudo,
  }) : this.titulo = titulo ?? 'Conformidade';

  final List<String>? lisTxt;
  final String titulo;
  final EnItemFormulario? tipoEnum;
  final String? txtConteudo;

  @override
  State<DdEnunsWidget> createState() => _DdEnunsWidgetState();
}

class _DdEnunsWidgetState extends State<DdEnunsWidget> {
  late DdEnunsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DdEnunsModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        constraints: BoxConstraints(
          maxHeight: MediaQuery.sizeOf(context).height * 0.5,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).fundoImput,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0),
          ),
          border: Border.all(
            color: FlutterFlowTheme.of(context).bordas,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                      child: Text(
                        widget.titulo,
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              font: GoogleFonts.montserrat(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .fontStyle,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                  ),
                  FlutterFlowIconButton(
                    borderColor: FlutterFlowTheme.of(context).primaryBackground,
                    borderRadius: 30.0,
                    borderWidth: 2.0,
                    buttonSize: 44.0,
                    icon: Icon(
                      Icons.close_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              Divider(
                height: 24.0,
                thickness: 2.0,
                color: FlutterFlowTheme.of(context).bordas,
              ),
              Expanded(
                child: SingleChildScrollView(
                  primary: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Builder(
                          builder: (context) {
                            final conteudo = widget.lisTxt!.toList();

                            return SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(conteudo.length,
                                    (conteudoIndex) {
                                  final conteudoItem = conteudo[conteudoIndex];
                                  return Expanded(
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (widget.tipoEnum ==
                                            EnItemFormulario.en_tagsCor) {
                                          // AppState - en_aprovacao
                                          FFAppState()
                                              .updateDtEnItemFormularioStruct(
                                            (e) => e..enTagsCor = conteudoItem,
                                          );
                                          FFAppState().update(() {});
                                        } else if (widget.tipoEnum ==
                                            EnItemFormulario.en_atende) {
                                          // AppState - en_aprovacao
                                          FFAppState()
                                              .updateDtEnItemFormularioStruct(
                                            (e) => e..enAtende = conteudoItem,
                                          );
                                          FFAppState().update(() {});
                                        } else if (widget.tipoEnum ==
                                            EnItemFormulario.en_nps) {
                                          // AppState - en_aprovacao
                                          FFAppState()
                                              .updateDtEnItemFormularioStruct(
                                            (e) => e..enNps = conteudoItem,
                                          );
                                          FFAppState().update(() {});
                                        } else if (widget.tipoEnum ==
                                            EnItemFormulario.en_origem) {
                                          // AppState - en_aprovacao
                                          FFAppState()
                                              .updateDtEnItemFormularioStruct(
                                            (e) => e..enOrigem = conteudoItem,
                                          );
                                          FFAppState().update(() {});
                                        } else if (widget.tipoEnum ==
                                            EnItemFormulario.en_partes) {
                                          // AppState - en_aprovacao
                                          FFAppState()
                                              .updateDtEnItemFormularioStruct(
                                            (e) => e..enPartes = conteudoItem,
                                          );
                                          FFAppState().update(() {});
                                        } else if (widget.tipoEnum ==
                                            EnItemFormulario.en_status) {
                                          // AppState - en_aprovacao
                                          FFAppState()
                                              .updateDtEnItemFormularioStruct(
                                            (e) => e..enStatus = conteudoItem,
                                          );
                                          FFAppState().update(() {});
                                        } else if (widget.tipoEnum ==
                                            EnItemFormulario.en_subsetor) {
                                          // AppState - en_aprovacao
                                          FFAppState()
                                              .updateDtEnItemFormularioStruct(
                                            (e) => e..enSubsetor = conteudoItem,
                                          );
                                          FFAppState().update(() {});
                                        } else if (widget.tipoEnum ==
                                            EnItemFormulario.en_aprovacao) {
                                          // AppState - en_aprovacao
                                          FFAppState()
                                              .updateDtEnItemFormularioStruct(
                                            (e) =>
                                                e..enAprovacao = conteudoItem,
                                          );
                                          FFAppState().update(() {});
                                        } else if (widget.tipoEnum ==
                                            EnItemFormulario.en_comprovacoes) {
                                          // AppState - en_aprovacao
                                          FFAppState()
                                              .updateDtEnItemFormularioStruct(
                                            (e) => e
                                              ..enComprovacoes = conteudoItem,
                                          );
                                          FFAppState().update(() {});
                                        } else if (widget.tipoEnum ==
                                            EnItemFormulario.en_responssavel) {
                                          // AppState - en_aprovacao
                                          FFAppState()
                                              .updateDtEnItemFormularioStruct(
                                            (e) =>
                                                e..enResponsavel = conteudoItem,
                                          );
                                          FFAppState().update(() {});
                                        } else if (widget.tipoEnum ==
                                            EnItemFormulario
                                                .en_resultadoInspecao) {
                                          // AppState - en_aprovacao
                                          FFAppState()
                                              .updateDtEnItemFormularioStruct(
                                            (e) => e
                                              ..enResultadoInspecao =
                                                  conteudoItem,
                                          );
                                          FFAppState().update(() {});
                                        } else if (widget.tipoEnum ==
                                            EnItemFormulario
                                                .en_preparoSobrevivencia) {
                                          // AppState - en_aprovacao
                                          FFAppState()
                                              .updateDtEnItemFormularioStruct(
                                            (e) => e
                                              ..enResponsavel = conteudoItem
                                              ..enPreparoSobrevivencia =
                                                  conteudoItem,
                                          );
                                          FFAppState().update(() {});
                                        } else if (widget.tipoEnum ==
                                            EnItemFormulario
                                                .en_requisitoRequerido) {
                                          // AppState - en_aprovacao
                                          FFAppState()
                                              .updateDtEnItemFormularioStruct(
                                            (e) => e
                                              ..enRequisitoRequerido =
                                                  conteudoItem,
                                          );
                                          FFAppState().update(() {});
                                        } else if (widget.tipoEnum ==
                                            EnItemFormulario
                                                .en_categoriaFormulario) {
                                          // AppState - en_aprovacao
                                          FFAppState()
                                              .updateDtEnItemFormularioStruct(
                                            (e) => e
                                              ..enCategoriaFormulario =
                                                  conteudoItem,
                                          );
                                          FFAppState().update(() {});
                                        } else if (widget.tipoEnum ==
                                            EnItemFormulario.en_periodicidade) {
                                          // AppState - en_aprovacao
                                          FFAppState()
                                              .updateDtEnItemFormularioStruct(
                                            (e) => e
                                              ..enPeriodicidade = conteudoItem,
                                          );
                                          FFAppState().update(() {});
                                        } else if (widget.tipoEnum ==
                                            EnItemFormulario
                                                .en_metodoAvaliacao) {
                                          // AppState - en_aprovacao
                                          FFAppState()
                                              .updateDtEnItemFormularioStruct(
                                            (e) => e
                                              ..enMetodoAvaliacao =
                                                  conteudoItem,
                                          );
                                          FFAppState().update(() {});
                                        } else if (widget.tipoEnum ==
                                            EnItemFormulario.en_condPagamento) {
                                          // AppState - en_aprovacao
                                          FFAppState()
                                              .updateDtEnItemFormularioStruct(
                                            (e) => e
                                              ..enCondPagamento = conteudoItem,
                                          );
                                          FFAppState().update(() {});
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Erro!',
                                                style: TextStyle(
                                                  color: Color(0xFFFF0303),
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  Color(0xFFF8D610),
                                            ),
                                          );
                                        }

                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color: widget
                                                        .txtConteudo ==
                                                    conteudoItem
                                                ? FlutterFlowTheme.of(context)
                                                    .primary
                                                : FlutterFlowTheme.of(context)
                                                    .primaryText,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 12.0, 12.0, 12.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  if (widget.tipoEnum ==
                                                      EnItemFormulario
                                                          .en_tagsCor) {
                                                    // AppState - en_aprovacao
                                                    FFAppState()
                                                        .updateDtEnItemFormularioStruct(
                                                      (e) => e
                                                        ..enTagsCor =
                                                            conteudoItem,
                                                    );
                                                    FFAppState().update(() {});
                                                  } else if (widget.tipoEnum ==
                                                      EnItemFormulario
                                                          .en_atende) {
                                                    // AppState - en_aprovacao
                                                    FFAppState()
                                                        .updateDtEnItemFormularioStruct(
                                                      (e) => e
                                                        ..enAtende =
                                                            conteudoItem,
                                                    );
                                                    FFAppState().update(() {});
                                                  } else if (widget.tipoEnum ==
                                                      EnItemFormulario.en_nps) {
                                                    // AppState - en_aprovacao
                                                    FFAppState()
                                                        .updateDtEnItemFormularioStruct(
                                                      (e) => e
                                                        ..enNps = conteudoItem,
                                                    );
                                                    FFAppState().update(() {});
                                                  } else if (widget.tipoEnum ==
                                                      EnItemFormulario
                                                          .en_origem) {
                                                    // AppState - en_aprovacao
                                                    FFAppState()
                                                        .updateDtEnItemFormularioStruct(
                                                      (e) => e
                                                        ..enOrigem =
                                                            conteudoItem,
                                                    );
                                                    FFAppState().update(() {});
                                                  } else if (widget.tipoEnum ==
                                                      EnItemFormulario
                                                          .en_partes) {
                                                    // AppState - en_aprovacao
                                                    FFAppState()
                                                        .updateDtEnItemFormularioStruct(
                                                      (e) => e
                                                        ..enPartes =
                                                            conteudoItem,
                                                    );
                                                    FFAppState().update(() {});
                                                  } else if (widget.tipoEnum ==
                                                      EnItemFormulario
                                                          .en_status) {
                                                    // AppState - en_aprovacao
                                                    FFAppState()
                                                        .updateDtEnItemFormularioStruct(
                                                      (e) => e
                                                        ..enStatus =
                                                            conteudoItem,
                                                    );
                                                    FFAppState().update(() {});
                                                  } else if (widget.tipoEnum ==
                                                      EnItemFormulario
                                                          .en_subsetor) {
                                                    // AppState - en_aprovacao
                                                    FFAppState()
                                                        .updateDtEnItemFormularioStruct(
                                                      (e) => e
                                                        ..enSubsetor =
                                                            conteudoItem,
                                                    );
                                                    FFAppState().update(() {});
                                                  } else if (widget.tipoEnum ==
                                                      EnItemFormulario
                                                          .en_aprovacao) {
                                                    // AppState - en_aprovacao
                                                    FFAppState()
                                                        .updateDtEnItemFormularioStruct(
                                                      (e) => e
                                                        ..enAprovacao =
                                                            conteudoItem,
                                                    );
                                                    FFAppState().update(() {});
                                                  } else if (widget.tipoEnum ==
                                                      EnItemFormulario
                                                          .en_comprovacoes) {
                                                    // AppState - en_aprovacao
                                                    FFAppState()
                                                        .updateDtEnItemFormularioStruct(
                                                      (e) => e
                                                        ..enComprovacoes =
                                                            conteudoItem,
                                                    );
                                                    FFAppState().update(() {});
                                                  } else if (widget.tipoEnum ==
                                                      EnItemFormulario
                                                          .en_responssavel) {
                                                    // AppState - en_aprovacao
                                                    FFAppState()
                                                        .updateDtEnItemFormularioStruct(
                                                      (e) => e
                                                        ..enResponsavel =
                                                            conteudoItem,
                                                    );
                                                    FFAppState().update(() {});
                                                  } else if (widget.tipoEnum ==
                                                      EnItemFormulario
                                                          .en_resultadoInspecao) {
                                                    // AppState - en_aprovacao
                                                    FFAppState()
                                                        .updateDtEnItemFormularioStruct(
                                                      (e) => e
                                                        ..enResultadoInspecao =
                                                            conteudoItem,
                                                    );
                                                    FFAppState().update(() {});
                                                  } else if (widget.tipoEnum ==
                                                      EnItemFormulario
                                                          .en_preparoSobrevivencia) {
                                                    // AppState - en_aprovacao
                                                    FFAppState()
                                                        .updateDtEnItemFormularioStruct(
                                                      (e) => e
                                                        ..enResponsavel =
                                                            conteudoItem
                                                        ..enPreparoSobrevivencia =
                                                            conteudoItem,
                                                    );
                                                    FFAppState().update(() {});
                                                  } else if (widget.tipoEnum ==
                                                      EnItemFormulario
                                                          .en_requisitoRequerido) {
                                                    // AppState - en_aprovacao
                                                    FFAppState()
                                                        .updateDtEnItemFormularioStruct(
                                                      (e) => e
                                                        ..enRequisitoRequerido =
                                                            conteudoItem,
                                                    );
                                                    FFAppState().update(() {});
                                                  } else if (widget.tipoEnum ==
                                                      EnItemFormulario
                                                          .en_categoriaFormulario) {
                                                    // AppState - en_aprovacao
                                                    FFAppState()
                                                        .updateDtEnItemFormularioStruct(
                                                      (e) => e
                                                        ..enCategoriaFormulario =
                                                            conteudoItem,
                                                    );
                                                    FFAppState().update(() {});
                                                  } else if (widget.tipoEnum ==
                                                      EnItemFormulario
                                                          .en_periodicidade) {
                                                    // AppState - en_aprovacao
                                                    FFAppState()
                                                        .updateDtEnItemFormularioStruct(
                                                      (e) => e
                                                        ..enPeriodicidade =
                                                            conteudoItem,
                                                    );
                                                    FFAppState().update(() {});
                                                  } else if (widget.tipoEnum ==
                                                      EnItemFormulario
                                                          .en_metodoAvaliacao) {
                                                    // AppState - en_aprovacao
                                                    FFAppState()
                                                        .updateDtEnItemFormularioStruct(
                                                      (e) => e
                                                        ..enAprovacao =
                                                            conteudoItem,
                                                    );
                                                    FFAppState().update(() {});
                                                  } else if (widget.tipoEnum ==
                                                      EnItemFormulario
                                                          .en_condPagamento) {
                                                    // AppState - en_aprovacao
                                                    FFAppState()
                                                        .updateDtEnItemFormularioStruct(
                                                      (e) => e
                                                        ..enCondPagamento =
                                                            conteudoItem,
                                                    );
                                                    FFAppState().update(() {});
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Erro!',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFFFF0303),
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 4000),
                                                        backgroundColor:
                                                            Color(0xFFF8D610),
                                                      ),
                                                    );
                                                  }

                                                  Navigator.pop(context);
                                                },
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    conteudoItem,
                                                    '-',
                                                  ),
                                                  textAlign: TextAlign.start,
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .montserrat(
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: widget
                                                                        .txtConteudo ==
                                                                    conteudoItem
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            fontSize: 18.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }).divide(SizedBox(height: 8.0)),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ].divide(SizedBox(height: 5.0)),
          ),
        ),
      ),
    );
  }
}

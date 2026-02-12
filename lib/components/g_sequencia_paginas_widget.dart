import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'g_sequencia_paginas_model.dart';
export 'g_sequencia_paginas_model.dart';

class GSequenciaPaginasWidget extends StatefulWidget {
  const GSequenciaPaginasWidget({
    super.key,
    this.subModuloItem,
    int? moduloDefinido,
    this.formularioDefinido,
    this.dtProdutiFinal,
  }) : this.moduloDefinido = moduloDefinido ?? 0;

  final int? subModuloItem;
  final int moduloDefinido;
  final DtFormularioStruct? formularioDefinido;
  final DtProdutoFinalStruct? dtProdutiFinal;

  @override
  State<GSequenciaPaginasWidget> createState() =>
      _GSequenciaPaginasWidgetState();
}

class _GSequenciaPaginasWidgetState extends State<GSequenciaPaginasWidget> {
  late GSequenciaPaginasModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GSequenciaPaginasModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if ((functions.extrairUrl(
                  'simplex://simplex.com${GoRouterState.of(context).uri.toString()}') ==
              'formulario') ||
          (functions.extrairUrl(
                  'simplex://simplex.com${GoRouterState.of(context).uri.toString()}') ==
              'produtoFinal')) {
        await _model.rowController?.animateTo(
          _model.rowController!.position.maxScrollExtent,
          duration: Duration(milliseconds: 100),
          curve: Curves.ease,
        );
      }
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: 44.0,
      decoration: BoxDecoration(),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        controller: _model.rowController,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pushNamed(LocalProducaoWidget.routeName);

                FFAppState().updateDtAdministrativoStruct(
                  (e) => e..paginaAnterior = EnPaginas.LocalDeProducao,
                );
                safeSetState(() {});
              },
              child: Container(
                height: 100.0,
                decoration: BoxDecoration(),
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Visibility(
                  visible: FFAppState().dtAdministrativo.paginaAtual ==
                      EnPaginas.modulo,
                  child: Text(
                    'Local de produção',
                    style: FlutterFlowTheme.of(context).labelLarge.override(
                          font: GoogleFonts.montserrat(
                            fontWeight: FlutterFlowTheme.of(context)
                                .labelLarge
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .labelLarge
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .labelLarge
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).labelLarge.fontStyle,
                        ),
                  ),
                ),
              ),
            ),
            if (FFAppState().dtAdministrativo.paginaAtual == EnPaginas.modulo)
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                child: Icon(
                  Icons.chevron_right_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 16.0,
                ),
              ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pushNamed(ModulosWidget.routeName);

                // APP - adiministrativo
                FFAppState().updateDtAdministrativoStruct(
                  (e) => e..paginaAtual = EnPaginas.modulo,
                );
                safeSetState(() {});
              },
              child: Container(
                height: 100.0,
                decoration: BoxDecoration(),
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Visibility(
                  visible: (FFAppState().dtAdministrativo.paginaAtual ==
                          EnPaginas.modulo) ||
                      (FFAppState().dtAdministrativo.paginaAtual ==
                          EnPaginas.subModulo),
                  child: Text(
                    'Módulos',
                    style: FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.montserrat(
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontStyle,
                          ),
                          color: valueOrDefault<Color>(
                            valueOrDefault<String>(
                                      functions.extrairUrl(
                                          'simplex://simplex.com${GoRouterState.of(context).uri.toString()}'),
                                      'null',
                                    ) ==
                                    'modulos'
                                ? FlutterFlowTheme.of(context).primary
                                : FlutterFlowTheme.of(context).naoAplicaveis,
                            FlutterFlowTheme.of(context).naoAplicaveis,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                  ),
                ),
              ),
            ),
            if ((FFAppState().dtAdministrativo.paginaAtual ==
                    EnPaginas.modulo) ||
                (FFAppState().dtAdministrativo.paginaAtual ==
                    EnPaginas.subModulo))
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                child: Icon(
                  Icons.chevron_right_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 16.0,
                ),
              ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.safePop();
                // APP - adiministrativo
                FFAppState().updateDtAdministrativoStruct(
                  (e) => e..paginaAtual = EnPaginas.subModulo,
                );
                safeSetState(() {});
              },
              child: Container(
                height: 100.0,
                decoration: BoxDecoration(),
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Visibility(
                  visible: (FFAppState().dtAdministrativo.paginaAtual ==
                          EnPaginas.formulario) ||
                      (FFAppState().dtAdministrativo.paginaAtual ==
                          EnPaginas.subModulo),
                  child: Text(
                    'Submódulos',
                    style: FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.montserrat(
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontStyle,
                          ),
                          color: valueOrDefault<Color>(
                            functions.extrairUrl(valueOrDefault<String>(
                                      'simplex://simplex.com${GoRouterState.of(context).uri.toString()}',
                                      'null',
                                    )) ==
                                    'submodulos'
                                ? FlutterFlowTheme.of(context).primary
                                : FlutterFlowTheme.of(context).naoAplicaveis,
                            FlutterFlowTheme.of(context).naoAplicaveis,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                  ),
                ),
              ),
            ),
            if ((FFAppState().dtAdministrativo.paginaAtual ==
                    EnPaginas.formulario) ||
                (FFAppState().dtAdministrativo.paginaAtual ==
                    EnPaginas.subModulo))
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                child: Icon(
                  Icons.chevron_right_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 16.0,
                ),
              ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.safePop();
                // APP - adiministrativo
                FFAppState().updateDtAdministrativoStruct(
                  (e) => e..paginaAtual = EnPaginas.formulario,
                );
                safeSetState(() {});
              },
              child: Container(
                height: 100.0,
                decoration: BoxDecoration(),
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Visibility(
                  visible: (FFAppState().dtAdministrativo.paginaAtual ==
                          EnPaginas.produtoFinal) ||
                      (FFAppState().dtAdministrativo.paginaAtual ==
                          EnPaginas.formulario),
                  child: Text(
                    'Formulário',
                    style: FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.montserrat(
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontStyle,
                          ),
                          color: valueOrDefault<Color>(
                            functions.extrairUrl(valueOrDefault<String>(
                                      'simplex://simplex.com${GoRouterState.of(context).uri.toString()}',
                                      'null',
                                    )) ==
                                    'formulario'
                                ? FlutterFlowTheme.of(context).primary
                                : FlutterFlowTheme.of(context).naoAplicaveis,
                            FlutterFlowTheme.of(context).naoAplicaveis,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                  ),
                ),
              ),
            ),
            if ((FFAppState().dtAdministrativo.paginaAtual ==
                    EnPaginas.produtoFinal) ||
                (FFAppState().dtAdministrativo.paginaAtual ==
                    EnPaginas.formulario))
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                child: Icon(
                  Icons.chevron_right_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 16.0,
                ),
              ),
            Container(
              height: 100.0,
              decoration: BoxDecoration(),
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Visibility(
                visible: FFAppState().dtAdministrativo.paginaAtual ==
                    EnPaginas.produtoFinal,
                child: Text(
                  'Pasta',
                  style: FlutterFlowTheme.of(context).titleSmall.override(
                        font: GoogleFonts.montserrat(
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                        color: valueOrDefault<Color>(
                          functions.extrairUrl(valueOrDefault<String>(
                                    'simplex://simplex.com${GoRouterState.of(context).uri.toString()}',
                                    'null',
                                  )) ==
                                  'produtoFinal'
                              ? FlutterFlowTheme.of(context).primary
                              : FlutterFlowTheme.of(context).naoAplicaveis,
                          FlutterFlowTheme.of(context).naoAplicaveis,
                        ),
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).titleSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import '/backend/schema/structs/index.dart';
import '/components/empty_state_widget.dart';
import '/components/header_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'itens_inspecao_corrigido_model.dart';
export 'itens_inspecao_corrigido_model.dart';

class ItensInspecaoCorrigidoWidget extends StatefulWidget {
  const ItensInspecaoCorrigidoWidget({
    super.key,
    required this.dtProdutoFinal,
    required this.dtFormulario,
    int? moduloId,
    int? subModuloId,
  })  : this.moduloId = moduloId ?? 0,
        this.subModuloId = subModuloId ?? 0;

  final DtProdutoFinalStruct? dtProdutoFinal;
  final DtFormularioStruct? dtFormulario;
  final int moduloId;
  final int subModuloId;

  static String routeName = 'itensInspecaoCorrigido';
  static String routePath = '/itensInspecaoCorrigido';

  @override
  State<ItensInspecaoCorrigidoWidget> createState() =>
      _ItensInspecaoCorrigidoWidgetState();
}

class _ItensInspecaoCorrigidoWidgetState
    extends State<ItensInspecaoCorrigidoWidget> with TickerProviderStateMixin {
  late ItensInspecaoCorrigidoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ItensInspecaoCorrigidoModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().filtro = FiltroStruct();
      FFAppState().update(() {});
    });

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(30.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              wrapWithModel(
                model: _model.headerModel,
                updateCallback: () => safeSetState(() {}),
                child: HeaderWidget(),
              ),
              Expanded(
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(12.0, 20.0, 12.0, 8.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (FFAppState().dtProdutoFinal.length == 0)
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: wrapWithModel(
                                model: _model.buscaNaoEncontradaModel,
                                updateCallback: () => safeSetState(() {}),
                                child: EmptyStateWidget(),
                              ),
                            ),
                          ),
                        Builder(
                          builder: (context) {
                            final controlado = FFAppState()
                                .dtServicoControlado
                                .where((e) => valueOrDefault<bool>(
                                      e.enControlado ==
                                          valueOrDefault<String>(
                                            () {
                                              if (widget.dtFormulario
                                                      ?.enCategoriaFormulario ==
                                                  'Material Controlado') {
                                                return 'Material';
                                              } else if (widget.dtFormulario
                                                      ?.enCategoriaFormulario ==
                                                  'Serviço Controlado') {
                                                return 'Serviço';
                                              } else {
                                                return 'Partes';
                                              }
                                            }(),
                                            'Serviço',
                                          ),
                                      true,
                                    ))
                                .toList();

                            return SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(controlado.length,
                                    (controladoIndex) {
                                  final controladoItem =
                                      controlado[controladoIndex];
                                  return Visibility(
                                    visible:
                                        FFAppState().dtProdutoFinal.length != 0,
                                    child: Container(
                                      width: double.infinity,
                                      height: 100.0,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 8.0),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .bordas,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          14.0),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  8.0,
                                                                  8.0,
                                                                  8.0),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          controladoItem
                                                              .descricao,
                                                          '-',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .montserrat(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize:
                                                                      18.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        24.0),
                                                          ),
                                                          child: Visibility(
                                                            visible: _model
                                                                    .ocultarNovosFormularios
                                                                    .where((e) =>
                                                                        e ==
                                                                        controladoItem
                                                                            .id)
                                                                    .toList()
                                                                    .length ==
                                                                0,
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                FFAppState()
                                                                    .updateLoopStruct(
                                                                  (e) => e
                                                                    ..total = FFAppState()
                                                                        .dtItemFormularioPadrao
                                                                        .where((e) =>
                                                                            (e.controladoId ==
                                                                                valueOrDefault<int>(
                                                                                  controladoItem.id,
                                                                                  0,
                                                                                )) &&
                                                                            (e.formularioId ==
                                                                                valueOrDefault<int>(
                                                                                  widget.dtFormulario?.id,
                                                                                  0,
                                                                                )))
                                                                        .toList()
                                                                        .length
                                                                    ..atual = 0,
                                                                );
                                                                safeSetState(
                                                                    () {});
                                                                _model.addToOcultarNovosFormularios(
                                                                    valueOrDefault<
                                                                        int>(
                                                                  controladoItem
                                                                      .id,
                                                                  0,
                                                                ));
                                                                safeSetState(
                                                                    () {});
                                                                while (FFAppState()
                                                                        .Loop
                                                                        .atual <
                                                                    FFAppState()
                                                                        .Loop
                                                                        .total) {
                                                                  FFAppState()
                                                                      .addToDtItemFormulario(
                                                                          DtItemFormularioStruct(
                                                                    descricaoItem:
                                                                        valueOrDefault<
                                                                            String>(
                                                                      FFAppState()
                                                                          .dtItemFormularioPadrao
                                                                          .where((e) =>
                                                                              (e.controladoId ==
                                                                                  valueOrDefault<int>(
                                                                                    controladoItem.id,
                                                                                    0,
                                                                                  )) &&
                                                                              (e.formularioId ==
                                                                                  valueOrDefault<int>(
                                                                                    widget.dtFormulario?.id,
                                                                                    0,
                                                                                  )))
                                                                          .toList()
                                                                          .elementAtOrNull(valueOrDefault<int>(
                                                                            FFAppState().Loop.atual,
                                                                            0,
                                                                          ))
                                                                          ?.descricaoItem,
                                                                      '0',
                                                                    ),
                                                                    formularioId:
                                                                        widget
                                                                            .dtFormulario
                                                                            ?.id,
                                                                    produtofinalId:
                                                                        widget
                                                                            .dtProdutoFinal
                                                                            ?.id,
                                                                    enCamposFormulario: FFAppState()
                                                                        .dtItemFormularioPadrao
                                                                        .where((e) =>
                                                                            (e.controladoId ==
                                                                                valueOrDefault<int>(
                                                                                  controladoItem.id,
                                                                                  0,
                                                                                )) &&
                                                                            (e.formularioId ==
                                                                                valueOrDefault<int>(
                                                                                  widget.dtFormulario?.id,
                                                                                  0,
                                                                                )))
                                                                        .toList()
                                                                        .elementAtOrNull(valueOrDefault<int>(
                                                                          FFAppState()
                                                                              .Loop
                                                                              .atual,
                                                                          0,
                                                                        ))
                                                                        ?.enCamposFormulario,
                                                                    empresaId:
                                                                        valueOrDefault<
                                                                            int>(
                                                                      FFAppState()
                                                                          .dtItemFormularioPadrao
                                                                          .where((e) =>
                                                                              (e.controladoId ==
                                                                                  valueOrDefault<int>(
                                                                                    controladoItem.id,
                                                                                    0,
                                                                                  )) &&
                                                                              (e.formularioId ==
                                                                                  valueOrDefault<int>(
                                                                                    widget.dtFormulario?.id,
                                                                                    0,
                                                                                  )))
                                                                          .toList()
                                                                          .elementAtOrNull(valueOrDefault<int>(
                                                                            FFAppState().Loop.atual,
                                                                            0,
                                                                          ))
                                                                          ?.empresaId,
                                                                      0,
                                                                    ),
                                                                    isCriadoApp:
                                                                        true,
                                                                    enSubsetor:
                                                                        valueOrDefault<
                                                                            String>(
                                                                      FFAppState()
                                                                          .dtItemFormularioPadrao
                                                                          .where((e) =>
                                                                              (e.controladoId == controladoItem.id) &&
                                                                              (e.formularioId ==
                                                                                  valueOrDefault<int>(
                                                                                    widget.dtFormulario?.id,
                                                                                    0,
                                                                                  )))
                                                                          .toList()
                                                                          .elementAtOrNull(valueOrDefault<int>(
                                                                            FFAppState().Loop.atual,
                                                                            0,
                                                                          ))
                                                                          ?.enSubsetor,
                                                                      '0',
                                                                    ),
                                                                    moduloId:
                                                                        widget
                                                                            .moduloId,
                                                                    submoduloId:
                                                                        widget
                                                                            .subModuloId,
                                                                    controladoId:
                                                                        controladoItem
                                                                            .id,
                                                                    localdeproducaoId:
                                                                        valueOrDefault<
                                                                            int>(
                                                                      FFAppState()
                                                                          .dtLocalProducaoAtual
                                                                          .id,
                                                                      0,
                                                                    ),
                                                                    enAprovacao:
                                                                        'Em Aberto',
                                                                  ));
                                                                  safeSetState(
                                                                      () {});
                                                                  FFAppState()
                                                                      .updateLoopStruct(
                                                                    (e) => e
                                                                      ..incrementAtual(
                                                                          1),
                                                                  );
                                                                  safeSetState(
                                                                      () {});
                                                                }
                                                              },
                                                              child: Icon(
                                                                Icons.add,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Builder(
                                                  builder: (context) {
                                                    final itensFormulario =
                                                        functions
                                                                .filtroLocalInspecao(
                                                                    FFAppState()
                                                                        .filtro
                                                                        .pesquisa,
                                                                    FFAppState()
                                                                        .dtItemFormulario
                                                                        .where((e) =>
                                                                            valueOrDefault<bool>(
                                                                              (e.controladoId ==
                                                                                      valueOrDefault<int>(
                                                                                        controladoItem.id,
                                                                                        0,
                                                                                      )) &&
                                                                                  valueOrDefault<bool>(
                                                                                    e.produtofinalId ==
                                                                                        valueOrDefault<int>(
                                                                                          widget.dtProdutoFinal?.id,
                                                                                          0,
                                                                                        ),
                                                                                    true,
                                                                                  ) &&
                                                                                  valueOrDefault<bool>(
                                                                                    e.formularioId ==
                                                                                        valueOrDefault<int>(
                                                                                          widget.dtFormulario?.id,
                                                                                          0,
                                                                                        ),
                                                                                    true,
                                                                                  ),
                                                                              true,
                                                                            ))
                                                                        .toList())
                                                                ?.toList() ??
                                                            [];

                                                    return SingleChildScrollView(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: List.generate(
                                                            itensFormulario
                                                                .length,
                                                            (itensFormularioIndex) {
                                                          final itensFormularioItem =
                                                              itensFormulario[
                                                                  itensFormularioIndex];
                                                          return Container(
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Container(
                                                                  width: double
                                                                      .infinity,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        blurRadius:
                                                                            4.0,
                                                                        color: Color(
                                                                            0x34090F13),
                                                                        offset:
                                                                            Offset(
                                                                          0.0,
                                                                          2.0,
                                                                        ),
                                                                      )
                                                                    ],
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            4.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              double.infinity,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).realizadas,
                                                                            borderRadius:
                                                                                BorderRadius.only(
                                                                              bottomLeft: Radius.circular(0.0),
                                                                              bottomRight: Radius.circular(0.0),
                                                                              topLeft: Radius.circular(12.0),
                                                                              topRight: Radius.circular(12.0),
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                EdgeInsets.all(12.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  valueOrDefault<String>(
                                                                                    '${valueOrDefault<String>(
                                                                                      itensFormularioItem.descricaoItem,
                                                                                      '-',
                                                                                    )}',
                                                                                    '-',
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                        font: GoogleFonts.readexPro(
                                                                                          fontWeight: FontWeight.normal,
                                                                                          fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                        ),
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        fontSize: 16.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.normal,
                                                                                        fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                      ),
                                                                                ),
                                                                                Text(
                                                                                  valueOrDefault<String>(
                                                                                    'Data inspeção: ${valueOrDefault<String>(
                                                                                      itensFormularioItem.dataInspecao,
                                                                                      '-',
                                                                                    )}',
                                                                                    '-',
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                        font: GoogleFonts.readexPro(
                                                                                          fontWeight: FontWeight.normal,
                                                                                          fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                        ),
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        fontSize: 16.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.normal,
                                                                                        fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding:
                                                                              EdgeInsets.all(12.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                children: [
                                                                                  Align(
                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 4.0),
                                                                                      child: FFButtonWidget(
                                                                                        onPressed: () async {
                                                                                          // Naveg - Item Formulario

                                                                                          context.pushNamed(
                                                                                            ItemFormularioWidget.routeName,
                                                                                            queryParameters: {
                                                                                              'dtItemFormulario': serializeParam(
                                                                                                itensFormularioItem,
                                                                                                ParamType.DataStruct,
                                                                                              ),
                                                                                              'dtprodutoFinal': serializeParam(
                                                                                                widget.dtProdutoFinal,
                                                                                                ParamType.DataStruct,
                                                                                              ),
                                                                                              'dtFormulario': serializeParam(
                                                                                                widget.dtFormulario,
                                                                                                ParamType.DataStruct,
                                                                                              ),
                                                                                              'dtFornecedor': serializeParam(
                                                                                                FFAppState().dtEnItemFormulario.dtFornecedor,
                                                                                                ParamType.DataStruct,
                                                                                              ),
                                                                                              'dtProblemaRecorrente': serializeParam(
                                                                                                FFAppState().dtEnItemFormulario.dtProblemaRecorrente,
                                                                                                ParamType.DataStruct,
                                                                                              ),
                                                                                            }.withoutNulls,
                                                                                            extra: <String, dynamic>{
                                                                                              '__transition_info__': TransitionInfo(
                                                                                                hasTransition: true,
                                                                                                transitionType: PageTransitionType.fade,
                                                                                                duration: Duration(milliseconds: 400),
                                                                                              ),
                                                                                            },
                                                                                          );
                                                                                        },
                                                                                        text: 'Inspecionar',
                                                                                        icon: Icon(
                                                                                          Icons.visibility_outlined,
                                                                                          size: 15.0,
                                                                                        ),
                                                                                        options: FFButtonOptions(
                                                                                          width: 150.0,
                                                                                          height: 40.0,
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                          iconColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                font: GoogleFonts.montserrat(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                ),
                                                                                                color: Colors.white,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                              ),
                                                                                          elevation: 0.0,
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ].divide(SizedBox(width: 8.0)),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ).animateOnPageLoad(
                                                                    animationsMap[
                                                                        'containerOnPageLoadAnimation']!),
                                                              ],
                                                            ),
                                                          );
                                                        }).divide(SizedBox(
                                                            height: 8.0)),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }).divide(
                                  SizedBox(height: 8.0),
                                  filterFn: (controladoIndex) {
                                    final controladoItem =
                                        controlado[controladoIndex];
                                    return FFAppState().dtProdutoFinal.length !=
                                        0;
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'nav_bar_model.dart';
export 'nav_bar_model.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({
    super.key,
    int? subModuloItem,
  }) : this.subModuloItem = subModuloItem ?? 0;

  final int subModuloItem;

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  late NavBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBarModel());
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
      height: 60.0,
      decoration: BoxDecoration(
        color: Color(0xFF1F2935),
      ),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Material(
                color: Colors.transparent,
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: Container(
                  width: double.infinity,
                  height: 60.0,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10.0,
                        color: Color(0x1A57636C),
                        offset: Offset(
                          0.0,
                          -10.0,
                        ),
                        spreadRadius: 0.1,
                      )
                    ],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: AlignmentDirectional(0.0, -0.84),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                FlutterFlowIconButton(
                  borderRadius: 30.0,
                  buttonSize: 50.0,
                  icon: Icon(
                    Icons.qr_code_scanner_sharp,
                    color: () {
                      if (functions.extrairUrl(valueOrDefault<String>(
                            'simplex://simplex.com${GoRouterState.of(context).uri.toString()}',
                            'null',
                          )) ==
                          'sincronizacao') {
                        return FlutterFlowTheme.of(context).primaryBackground;
                      } else if (FFAppState().dtLocalProducaoAtual.id == 0) {
                        return FlutterFlowTheme.of(context).secondaryText;
                      } else {
                        return FlutterFlowTheme.of(context).primaryBackground;
                      }
                    }(),
                    size: 24.0,
                  ),
                  onPressed: () async {
                    if (FFAppState().dtLocalProducaoAtual.id != 0) {
                      _model.resultadoScan =
                          await FlutterBarcodeScanner.scanBarcode(
                        '#C62828', // scanning line color
                        'Cancelar', // cancel button text
                        true, // whether to show the flash icon
                        ScanMode.QR,
                      );

                      if ((_model.resultadoScan != '-1') &&
                          (FFAppState()
                                  .dtProdutoFinal
                                  .where((e) =>
                                      e.id ==
                                      functions.extrairKeyUrl(
                                          _model.resultadoScan, 'pd_final'))
                                  .toList()
                                  .firstOrNull
                                  ?.id !=
                              null)) {
                        context.pushNamed(
                          ItensInspecaoWidget.routeName,
                          queryParameters: {
                            'dtProdutoFinal': serializeParam(
                              FFAppState()
                                  .dtProdutoFinal
                                  .where((e) =>
                                      e.id ==
                                      functions.extrairKeyUrl(
                                          _model.resultadoScan, 'pd_final'))
                                  .toList()
                                  .firstOrNull,
                              ParamType.DataStruct,
                            ),
                            'dtFormulario': serializeParam(
                              FFAppState()
                                  .dtFormulario
                                  .where((e) =>
                                      e.id ==
                                      functions.extrairKeyUrl(
                                          _model.resultadoScan, 'formulario'))
                                  .toList()
                                  .firstOrNull,
                              ParamType.DataStruct,
                            ),
                          }.withoutNulls,
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Item não encontrado!',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor: Color(0xFFF60110),
                          ),
                        );
                      }
                    } else {
                      // Snack - Não há local sincronizado!
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Não há local de produção sincronizado!',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                          ),
                          duration: Duration(milliseconds: 5000),
                          backgroundColor: FlutterFlowTheme.of(context).alerta,
                        ),
                      );
                    }

                    safeSetState(() {});
                  },
                ),
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 50.0,
                  icon: Icon(
                    Icons.sync,
                    color: () {
                      if (functions.extrairUrl(valueOrDefault<String>(
                            'simplex://simplex.com${GoRouterState.of(context).uri.toString()}',
                            'null',
                          )) ==
                          'sincronizacao') {
                        return FlutterFlowTheme.of(context).primary;
                      } else if (FFAppState().dtLocalProducaoAtual.id == 0) {
                        return FlutterFlowTheme.of(context).secondaryText;
                      } else {
                        return FlutterFlowTheme.of(context).primaryBackground;
                      }
                    }(),
                    size: 26.0,
                  ),
                  onPressed: () async {
                    if (FFAppState().dtLocalProducaoAtual.id != 0) {
                      // App - Administrativo
                      FFAppState().updateDtAdministrativoStruct(
                        (e) => e..paginaAtual = EnPaginas.sincronizacao,
                      );
                      safeSetState(() {});
                      // Naveg - Perfil

                      context.pushNamed(
                        SincronizacaoWidget.routeName,
                        queryParameters: {
                          'localDeProducao': serializeParam(
                            FFAppState().dtLocalProducaoAtual,
                            ParamType.DataStruct,
                          ),
                        }.withoutNulls,
                      );
                    } else {
                      // Snack - Não há local sincronizado!
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Não há local de produção sincronizado!',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                          ),
                          duration: Duration(milliseconds: 5000),
                          backgroundColor: FlutterFlowTheme.of(context).alerta,
                        ),
                      );
                    }
                  },
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 25.0,
                      borderWidth: 1.0,
                      buttonSize: 50.0,
                      fillColor: FlutterFlowTheme.of(context).primary,
                      icon: Icon(
                        Icons.home,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        // App - Administrativo
                        FFAppState().updateDtAdministrativoStruct(
                          (e) => e
                            ..paginaAtual = EnPaginas.LocalDeProducao
                            ..paginaAnterior =
                                FFAppState().dtAdministrativo.paginaAtual,
                        );
                        safeSetState(() {});
                        // Naveg - Perfil

                        context.pushNamed(LocalProducaoWidget.routeName);
                      },
                    ),
                  ],
                ),
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 50.0,
                  icon: Icon(
                    Icons.person,
                    color: functions.extrairUrl(valueOrDefault<String>(
                              'simplex://simplex.com${GoRouterState.of(context).uri.toString()}',
                              'null',
                            )) ==
                            'perfil'
                        ? FlutterFlowTheme.of(context).primary
                        : FlutterFlowTheme.of(context).primaryBackground,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    // App - Administrativo
                    FFAppState().updateDtAdministrativoStruct(
                      (e) => e..paginaAtual = EnPaginas.Perfil,
                    );
                    safeSetState(() {});
                    // Naveg - Perfil

                    context.pushNamed(PerfilWidget.routeName);
                  },
                ),
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 50.0,
                  icon: FaIcon(
                    FontAwesomeIcons.arrowLeft,
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    // APP - adiministrativo
                    FFAppState().updateDtAdministrativoStruct(
                      (e) => e
                        ..paginaAtual =
                            FFAppState().dtAdministrativo.paginaAnterior,
                    );
                    safeSetState(() {});
                    // Naveg - back
                    context.safePop();
                    FFAppState().updateDtAdministrativoStruct(
                      (e) => e
                        ..paginaAtual =
                            FFAppState().dtAdministrativo.paginaAnterior,
                    );
                    safeSetState(() {});
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

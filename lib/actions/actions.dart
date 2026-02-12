import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

Future logs(
  BuildContext context, {
  required String? body,
  required int? code,
  String? tarcedID,
  String? local,
  String? tipoErro,
  required bool? snack,
  String? mensagem,
  String? descricao,
  String? enPrioridade,
  String? funcionalidade,
}) async {
  ApiCallResponse? apiLog;

  // API - Log
  apiLog = await PostGroup.logCall.call(
    body: body,
    local: valueOrDefault<String>(
      local,
      '-',
    ),
    code: code,
    versaoApp: '1.0.0',
    userJsonJson: FFAppState().dtUser.toMap(),
    descricao: descricao,
    emPrioridade: enPrioridade,
    funcionalidade: funcionalidade,
    authorization: currentAuthenticationToken,
  );

  if (snack == true) {
    // Snack - Ops!
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          mensagem!,
          style: TextStyle(),
        ),
        duration: Duration(milliseconds: 4000),
        backgroundColor: FlutterFlowTheme.of(context).alerta,
      ),
    );
  } else {
    // Snack - Ops!
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Ops! Algo saiu errado, acione o time de suporte!',
          style: TextStyle(),
        ),
        duration: Duration(milliseconds: 4000),
        backgroundColor: FlutterFlowTheme.of(context).alerta,
      ),
    );
  }
}

Future debug(
  BuildContext context, {
  String? titulo,
  String? descricao,
}) async {
  if (FFAppState().dtDebug.ativo == true) {
    // Alert - degub
    await showDialog(
      context: context,
      builder: (alertDialogContext) {
        return WebViewAware(
          child: AlertDialog(
            title: Text(titulo!),
            content: Text(descricao!),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(alertDialogContext),
                child: Text('Ok'),
              ),
            ],
          ),
        );
      },
    );
  }
}

Future checkInternet(BuildContext context) async {
  bool? checkInternet;

  // Custom - checkInternet
  checkInternet = await actions.checkInternetConnection();
  // App - checkInternet
  FFAppState().updateDtAdministrativoStruct(
    (e) => e..online = checkInternet,
  );
  FFAppState().update(() {});
}

Future getDadosPrimarios(
  BuildContext context, {
  String? token,
}) async {
  ApiCallResponse? apiUser;
  ApiCallResponse? apiEmpresa;
  ApiCallResponse? apiNivelDeAcesso;
  ApiCallResponse? apiLocalDeProducao;

  // API - User
  apiUser = await GetGroup.dTUserCall.call(
    authorization: currentAuthenticationToken,
  );

  if ((apiUser.succeeded ?? true)) {
    // App - User
    FFAppState().dtUser = DtUserStruct.maybeFromMap((apiUser.jsonBody ?? ''))!;
  } else {
    // Block - Log
    unawaited(
      () async {
        await action_blocks.logs(
          context,
          body: (apiUser?.jsonBody ?? '').toString(),
          code: (apiUser?.statusCode ?? 200),
          local: 'API',
          tipoErro: '-',
          snack: false,
          descricao: 'Erro no get de user',
          enPrioridade: EnPrioridade.Alta.name,
          funcionalidade: LogFuncionalidade.getDadosPrimarios.name,
        );
      }(),
    );
    return;
  }

  // API - Empresa
  apiEmpresa = await GetGroup.dTEmpresaCall.call(
    authorization: currentAuthenticationToken,
  );

  if ((apiEmpresa.succeeded ?? true)) {
    // App - Empresa
    FFAppState().dtEmpresa =
        DtEmpresaStruct.maybeFromMap((apiEmpresa.jsonBody ?? ''))!;
  } else {
    // Block - Log
    unawaited(
      () async {
        await action_blocks.logs(
          context,
          body: (apiEmpresa?.jsonBody ?? '').toString(),
          code: (apiEmpresa?.statusCode ?? 200),
          local: 'getDadosPrimarios',
          tipoErro: 'API',
          snack: false,
          descricao: 'Erro no get da empresa',
          enPrioridade: EnPrioridade.Alta.name,
          funcionalidade: LogFuncionalidade.getDadosPrimarios.name,
        );
      }(),
    );
    return;
  }

  // API - Nível de acesso
  apiNivelDeAcesso = await GetGroup.dTNivelDeAcessoCall.call(
    authorization: currentAuthenticationToken,
  );

  if ((apiNivelDeAcesso.succeeded ?? true)) {
    // App - Nivel de acesso
    FFAppState().dtNivelDeAcesso = ((apiNivelDeAcesso.jsonBody ?? '')
            .toList()
            .map<DtNivelDeAcessoStruct?>(DtNivelDeAcessoStruct.maybeFromMap)
            .toList() as Iterable<DtNivelDeAcessoStruct?>)
        .withoutNulls
        .toList()
        .cast<DtNivelDeAcessoStruct>();
  } else {
    // Block - Log
    unawaited(
      () async {
        await action_blocks.logs(
          context,
          body: (apiNivelDeAcesso?.jsonBody ?? '').toString(),
          code: (apiNivelDeAcesso?.statusCode ?? 200),
          local: 'getDadosPrimarios',
          tipoErro: 'API',
          snack: false,
          descricao: 'Erro no get do nivel de acesso',
          enPrioridade: EnPrioridade.Alta.name,
          funcionalidade: LogFuncionalidade.getDadosPrimarios.name,
        );
      }(),
    );
    return;
  }

  // API - Local de producao
  apiLocalDeProducao = await GetGroup.dTLocalDeProducaoCall.call(
    authorization: currentAuthenticationToken,
  );

  if ((apiLocalDeProducao.succeeded ?? true)) {
    // App - Local de producao
    FFAppState().dtLocalDeProducao = ((apiLocalDeProducao.jsonBody ?? '')
            .toList()
            .map<DtLocalDeProducaoStruct?>(DtLocalDeProducaoStruct.maybeFromMap)
            .toList() as Iterable<DtLocalDeProducaoStruct?>)
        .withoutNulls
        .toList()
        .cast<DtLocalDeProducaoStruct>();
    FFAppState().update(() {});
  } else {
    // Block - Log
    unawaited(
      () async {
        await action_blocks.logs(
          context,
          body: (apiLocalDeProducao?.jsonBody ?? '').toString(),
          code: (apiLocalDeProducao?.statusCode ?? 200),
          local: 'getDadosPrimarios',
          tipoErro: 'API',
          snack: false,
          descricao: 'Erro no get do Local de producao',
          enPrioridade: EnPrioridade.Alta.name,
          funcionalidade: LogFuncionalidade.getDadosPrimarios.name,
        );
      }(),
    );
    return;
  }
}

Future getLocalDeproducao(
  BuildContext context, {
  required DtLocalDeProducaoStruct? dtLocalDeProducao,
}) async {
  ApiCallResponse? apiProdutoFinal;
  ApiCallResponse? apiFormulario;
  ApiCallResponse? apiSubmodulo;
  ApiCallResponse? apiModulo;
  ApiCallResponse? apiControleoffline;
  ApiCallResponse? apiItemFormulario;
  ApiCallResponse? apiItemFormularioPadrao;
  ApiCallResponse? apiServicoControlado;
  ApiCallResponse? apiFornecedor;
  ApiCallResponse? apiProblemaRecorrente;

  await Future.wait([
    Future(() async {
      // Api - Produto final
      apiProdutoFinal = await GetGroup.dTProdutoFinalCall.call(
        authorization: currentAuthenticationToken,
        localdeproducaoId: valueOrDefault<int>(
          dtLocalDeProducao?.id,
          0,
        ),
      );

      if ((apiProdutoFinal?.succeeded ?? true)) {
        // App -Produto final
        FFAppState().dtProdutoFinal = ((apiProdutoFinal?.jsonBody ?? '')
                .toList()
                .map<DtProdutoFinalStruct?>(DtProdutoFinalStruct.maybeFromMap)
                .toList() as Iterable<DtProdutoFinalStruct?>)
            .withoutNulls
            .toList()
            .cast<DtProdutoFinalStruct>();
        FFAppState().update(() {});
      } else {
        // Block - Log Produto final
        await action_blocks.logs(
          context,
          body: (apiProdutoFinal?.jsonBody ?? '').toString(),
          code: (apiProdutoFinal?.statusCode ?? 200),
          local: 'Block - getLocalDeProducao',
          tipoErro: 'API',
          snack: false,
          descricao: 'Erro no get de Produto final',
          enPrioridade: EnPrioridade.Alta.name,
          funcionalidade: LogFuncionalidade.getLocalDeProducao.name,
        );
        return;
      }
    }),
    Future(() async {
      // Api - Formulario
      apiFormulario = await GetGroup.dTFormularioCall.call(
        localdeproducaoId: valueOrDefault<int>(
          dtLocalDeProducao?.id,
          0,
        ),
        authorization: currentAuthenticationToken,
      );

      if ((apiFormulario?.succeeded ?? true)) {
        // App -Formulario
        FFAppState().dtFormulario = ((apiFormulario?.jsonBody ?? '')
                .toList()
                .map<DtFormularioStruct?>(DtFormularioStruct.maybeFromMap)
                .toList() as Iterable<DtFormularioStruct?>)
            .withoutNulls
            .toList()
            .cast<DtFormularioStruct>();
        FFAppState().update(() {});
      } else {
        // Block - Log Formulario
        await action_blocks.logs(
          context,
          body: (apiFormulario?.jsonBody ?? '').toString(),
          code: (apiFormulario?.statusCode ?? 200),
          local: 'Block - getLocalDeProducao',
          tipoErro: 'API',
          snack: false,
          descricao: 'Erro no get de Formularios',
          enPrioridade: EnPrioridade.Alta.name,
          funcionalidade: LogFuncionalidade.getLocalDeProducao.name,
        );
        return;
      }
    }),
    Future(() async {
      // Api - sub Modulo
      apiSubmodulo = await GetGroup.dTSubmoduloCall.call(
        authorization: currentAuthenticationToken,
        localdeproducaoId: valueOrDefault<int>(
          dtLocalDeProducao?.id,
          0,
        ),
      );

      if ((apiSubmodulo?.succeeded ?? true)) {
        // App -Submodulo
        FFAppState().dtSubmodulos = ((apiSubmodulo?.jsonBody ?? '')
                .toList()
                .map<DtSubmodulosStruct?>(DtSubmodulosStruct.maybeFromMap)
                .toList() as Iterable<DtSubmodulosStruct?>)
            .withoutNulls
            .toList()
            .cast<DtSubmodulosStruct>();
        FFAppState().update(() {});
      } else {
        // Block - Log Submodulo
        await action_blocks.logs(
          context,
          body: (apiSubmodulo?.jsonBody ?? '').toString(),
          code: (apiSubmodulo?.statusCode ?? 200),
          local: 'Block - getLocalDeProducao',
          tipoErro: 'API',
          snack: false,
          descricao: 'Erro no get de Submodulos',
          enPrioridade: EnPrioridade.Alta.name,
          funcionalidade: LogFuncionalidade.getLocalDeProducao.name,
        );
        return;
      }
    }),
    Future(() async {
      // Api - Modulo
      apiModulo = await GetGroup.dTModuloCall.call(
        authorization: currentAuthenticationToken,
        localdeproducaoId: valueOrDefault<int>(
          dtLocalDeProducao?.id,
          0,
        ),
      );

      if ((apiModulo?.succeeded ?? true)) {
        // App - Modulo
        FFAppState().dtModulo = ((apiModulo?.jsonBody ?? '')
                .toList()
                .map<DtModuloStruct?>(DtModuloStruct.maybeFromMap)
                .toList() as Iterable<DtModuloStruct?>)
            .withoutNulls
            .toList()
            .cast<DtModuloStruct>();
        FFAppState().update(() {});
      } else {
        // Block - Log Modulo
        unawaited(
          () async {
            await action_blocks.logs(
              context,
              body: (apiModulo?.jsonBody ?? '').toString(),
              code: (apiModulo?.statusCode ?? 200),
              local: 'Block - getLocalDeProducao',
              tipoErro: 'API',
              snack: false,
              descricao: 'Erro no get de modulos',
              enPrioridade: EnPrioridade.Alta.name,
              funcionalidade: LogFuncionalidade.getLocalDeProducao.name,
            );
          }(),
        );
        return;
      }
    }),
    Future(() async {
      // Api - Controle offline
      apiControleoffline = await PostGroup.aDDContoleOfflineCall.call(
        authorization: currentAuthenticationToken,
        fkLocaldeproducao: valueOrDefault<int>(
          dtLocalDeProducao?.id,
          0,
        ),
      );

      if ((apiControleoffline?.succeeded ?? true)) {
        // App - ControleOffline
        FFAppState().dtControleOffline = DtControleOfflineStruct.maybeFromMap(
            (apiControleoffline?.jsonBody ?? ''))!;
        FFAppState().update(() {});
      } else {
        // Block - Log ControleOffline
        unawaited(
          () async {
            await action_blocks.logs(
              context,
              body: valueOrDefault<String>(
                (apiControleoffline?.jsonBody ?? '').toString(),
                '0',
              ),
              code: valueOrDefault<int>(
                (apiControleoffline?.statusCode ?? 200),
                0,
              ),
              local: 'Block - getLocalDeProducao',
              tipoErro: 'API',
              snack: false,
              descricao: 'Erro no POST de ControleOffline',
              enPrioridade: EnPrioridade.Alta.name,
              funcionalidade: LogFuncionalidade.getLocalDeProducao.name,
            );
          }(),
        );
        return;
      }
    }),
    Future(() async {
      // Api - Item formulario
      apiItemFormulario = await GetGroup.dTItemFormularioCall.call(
        authorization: currentAuthenticationToken,
        localdeproducaoId: valueOrDefault<int>(
          dtLocalDeProducao?.id,
          0,
        ),
      );

      if ((apiItemFormulario?.succeeded ?? true)) {
        // App - Item formulario
        FFAppState().dtItemFormulario = ((apiItemFormulario?.jsonBody ?? '')
                .toList()
                .map<DtItemFormularioStruct?>(
                    DtItemFormularioStruct.maybeFromMap)
                .toList() as Iterable<DtItemFormularioStruct?>)
            .withoutNulls
            .toList()
            .cast<DtItemFormularioStruct>();
        FFAppState().update(() {});
      } else {
        // Block - Log Modulo
        unawaited(
          () async {
            await action_blocks.logs(
              context,
              body: (apiItemFormulario?.jsonBody ?? '').toString(),
              code: (apiItemFormulario?.statusCode ?? 200),
              local: 'Block - getLocalDeProducao',
              tipoErro: 'API',
              snack: false,
              descricao: 'Erro no get de Item Formulario',
              enPrioridade: EnPrioridade.Alta.name,
              funcionalidade: LogFuncionalidade.getLocalDeProducao.name,
            );
          }(),
        );
        return;
      }
    }),
    Future(() async {
      // Api - Item formulario PADRAO
      apiItemFormularioPadrao = await GetGroup.dTItemFormularioPADRAOCall.call(
        authorization: currentAuthenticationToken,
        localdeproducaoId: valueOrDefault<int>(
          dtLocalDeProducao?.id,
          0,
        ),
      );

      if ((apiItemFormularioPadrao?.succeeded ?? true)) {
        // App - Item formulario padrão
        FFAppState().dtItemFormularioPadrao =
            ((apiItemFormularioPadrao?.jsonBody ?? '')
                    .toList()
                    .map<DtItemFormularioStruct?>(
                        DtItemFormularioStruct.maybeFromMap)
                    .toList() as Iterable<DtItemFormularioStruct?>)
                .withoutNulls
                .toList()
                .cast<DtItemFormularioStruct>();
        FFAppState().update(() {});
      } else {
        // Block - Log Modulo
        unawaited(
          () async {
            await action_blocks.logs(
              context,
              body: valueOrDefault<String>(
                (apiItemFormularioPadrao?.jsonBody ?? '').toString(),
                '0',
              ),
              code: valueOrDefault<int>(
                (apiItemFormularioPadrao?.statusCode ?? 200),
                0,
              ),
              local: 'Block - getLocalDeProducao',
              tipoErro: 'API',
              snack: false,
              descricao: 'Erro no get de Item Formulario PADRAO',
              enPrioridade: EnPrioridade.Alta.name,
              funcionalidade: LogFuncionalidade.getLocalDeProducao.name,
            );
          }(),
        );
        return;
      }
    }),
    Future(() async {
      // Api - Serviço controlado
      apiServicoControlado = await GetGroup.dTServicoControladoCall.call(
        authorization: currentAuthenticationToken,
      );

      if ((apiServicoControlado?.succeeded ?? true)) {
        // App - Serviço controlado
        FFAppState().dtServicoControlado =
            ((apiServicoControlado?.jsonBody ?? '')
                    .toList()
                    .map<DtControladoStruct?>(DtControladoStruct.maybeFromMap)
                    .toList() as Iterable<DtControladoStruct?>)
                .withoutNulls
                .toList()
                .cast<DtControladoStruct>();
        FFAppState().update(() {});
      } else {
        // Block - Log Servico controle
        unawaited(
          () async {
            await action_blocks.logs(
              context,
              body: valueOrDefault<String>(
                (apiServicoControlado?.jsonBody ?? '').toString(),
                '-',
              ),
              code: (apiServicoControlado?.statusCode ?? 200),
              local: 'Block - getLocalDeProducao',
              tipoErro: 'API',
              snack: false,
              descricao: 'Erro no get de Serviço controlado',
              enPrioridade: EnPrioridade.Alta.name,
              funcionalidade: LogFuncionalidade.getLocalDeProducao.name,
            );
          }(),
        );
        return;
      }
    }),
    Future(() async {
      // Api - Fornecedor
      apiFornecedor = await GetGroup.dTFornecedorCall.call(
        authorization: currentAuthenticationToken,
      );

      if ((apiFornecedor?.succeeded ?? true)) {
        // App - Fornecedor
        FFAppState().dtFornecedor = ((apiFornecedor?.jsonBody ?? '')
                .toList()
                .map<DtFornecedorStruct?>(DtFornecedorStruct.maybeFromMap)
                .toList() as Iterable<DtFornecedorStruct?>)
            .withoutNulls
            .toList()
            .cast<DtFornecedorStruct>();
        FFAppState().update(() {});
      } else {
        // Block - Log Fornecedor
        unawaited(
          () async {
            await action_blocks.logs(
              context,
              body: (apiFornecedor?.jsonBody ?? '').toString(),
              code: (apiFornecedor?.statusCode ?? 200),
              local: 'Block - getLocalDeProducao',
              tipoErro: 'API',
              snack: false,
              descricao: 'Erro no get de Fornecedor',
              enPrioridade: EnPrioridade.Alta.name,
              funcionalidade: LogFuncionalidade.getLocalDeProducao.name,
            );
          }(),
        );
        return;
      }
    }),
    Future(() async {
      // Api - Serviço controlado
      apiProblemaRecorrente = await GetGroup.dTProblemaRecorrenteCall.call(
        authorization: currentAuthenticationToken,
      );

      if ((apiProblemaRecorrente?.succeeded ?? true)) {
        // App - Serviço controlado
        FFAppState().dtProblemaRecorrente =
            ((apiProblemaRecorrente?.jsonBody ?? '')
                    .toList()
                    .map<DtProblemaRecorrenteStruct?>(
                        DtProblemaRecorrenteStruct.maybeFromMap)
                    .toList() as Iterable<DtProblemaRecorrenteStruct?>)
                .withoutNulls
                .toList()
                .cast<DtProblemaRecorrenteStruct>();
        FFAppState().update(() {});
      } else {
        // Block - Log Servico controle
        unawaited(
          () async {
            await action_blocks.logs(
              context,
              body: (apiProblemaRecorrente?.jsonBody ?? '').toString(),
              code: (apiProblemaRecorrente?.statusCode ?? 200),
              local: 'Block - getLocalDeProducao',
              tipoErro: 'API',
              snack: false,
              descricao: 'Erro no get de problema recorrente',
              enPrioridade: EnPrioridade.Alta.name,
              funcionalidade: LogFuncionalidade.getLocalDeProducao.name,
            );
          }(),
        );
        return;
      }
    }),
  ]);
  // App - Local de produção
  FFAppState().dtLocalProducaoAtual = dtLocalDeProducao!;
  FFAppState().dtNivelDeAcessoAtual = FFAppState()
      .dtNivelDeAcesso
      .where((e) =>
          e.localdeproducaoId ==
          valueOrDefault<int>(
            dtLocalDeProducao.id,
            0,
          ))
      .toList()
      .firstOrNull!;
  FFAppState().update(() {});
}

Future zerarLocalDeproducao(BuildContext context) async {
  // App - Clear local de produção
  FFAppState().dtModulo = [];
  FFAppState().dtSubmodulos = [];
  FFAppState().dtLocalProducaoAtual = DtLocalDeProducaoStruct();
  FFAppState().dtFormulario = [];
  FFAppState().dtProdutoFinal = [];
  FFAppState().dtItemFormulario = [];
  FFAppState().dtItemFormularioPadrao = [];
  FFAppState().update(() {});
}

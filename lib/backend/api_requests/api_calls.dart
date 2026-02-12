import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start POST Group Code

class PostGroup {
  static String getBaseUrl({
    String? authorization = '',
    String? version,
  }) {
    version ??= FFDevEnvironmentValues().DataSource;
    return 'https://xrsx-tpow-q7vu.n7d.xano.io/api:R3uEOQqP';
  }

  static Map<String, String> headers = {
    'Authorization': 'Bearer [Authorization]',
    'X-Data-Source': '[version]',
  };
  static AuthLoginCall authLoginCall = AuthLoginCall();
  static LogCall logCall = LogCall();
  static ADDContoleOfflineCall aDDContoleOfflineCall = ADDContoleOfflineCall();
  static SincronizacaoCall sincronizacaoCall = SincronizacaoCall();
  static EDITContoleOfflineCall eDITContoleOfflineCall =
      EDITContoleOfflineCall();
}

class AuthLoginCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? senha = '',
    String? authorization = '',
    String? version,
  }) async {
    version ??= FFDevEnvironmentValues().DataSource;
    final baseUrl = PostGroup.getBaseUrl(
      authorization: authorization,
      version: version,
    );

    final ffApiRequestBody = '''
{
  "email": "${email}",
  "senha": "${senha}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AuthLogin',
      apiUrl: '${baseUrl}/auth',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authorization}',
        'X-Data-Source': '${version}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? token(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$''',
      ));
}

class LogCall {
  Future<ApiCallResponse> call({
    String? body = '',
    int? code,
    String? local = '',
    String? descricao = '',
    dynamic jsonJson,
    String? emPrioridade = '',
    String? versaoApp = '',
    String? funcionalidade = '',
    dynamic empresaJsonJson,
    dynamic userJsonJson,
    String? authorization = '',
    String? version,
  }) async {
    version ??= FFDevEnvironmentValues().DataSource;
    final baseUrl = PostGroup.getBaseUrl(
      authorization: authorization,
      version: version,
    );

    final json = _serializeJson(jsonJson);
    final empresaJson = _serializeJson(empresaJsonJson);
    final userJson = _serializeJson(userJsonJson);
    final ffApiRequestBody = '''
{
  "body": "${body}",
  "code": ${code},
  "local": "${local}",
  "descricao": "${descricao}",
  "json": "${json}",
  "em_prioridade": "${emPrioridade}",
  "versao_app": "${versaoApp}",
  "user_json": "${userJson}",
  "empresa_json": "${empresaJson}",
  "funcionalidade": "${funcionalidade}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'log',
      apiUrl: '${baseUrl}/log',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authorization}',
        'X-Data-Source': '${version}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? erroID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.traceId''',
      ));
  String? erroCode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.code''',
      ));
  String? erroMensagem(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class ADDContoleOfflineCall {
  Future<ApiCallResponse> call({
    int? fkEmpresa,
    int? fkUser,
    int? fkLocaldeproducao,
    int? dataSincronizacaoInicial,
    String? authorization = '',
    String? version,
  }) async {
    version ??= FFDevEnvironmentValues().DataSource;
    final baseUrl = PostGroup.getBaseUrl(
      authorization: authorization,
      version: version,
    );

    final ffApiRequestBody = '''
{
  "fk_empresa": ${fkEmpresa},
  "fk_user": ${fkUser},
  "fk_localdeproducao": ${fkLocaldeproducao},
  "dataSincronizacaoInicial": ${dataSincronizacaoInicial}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ADD Contole offline',
      apiUrl: '${baseUrl}/controle-offline',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authorization}',
        'X-Data-Source': '${version}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? erroID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.traceId''',
      ));
  String? erroCode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.code''',
      ));
  String? erroMensagem(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  int? id(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.id''',
      ));
  int? dataSincronizacao(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.dataSincronizacaoInicial''',
      ));
  int? fkLocalDeproducao(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.fk_localdeproducao''',
      ));
  int? fkUser(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.fk_user''',
      ));
  int? fkEmpresa(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.fk_empresa''',
      ));
  dynamic json(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
}

class SincronizacaoCall {
  Future<ApiCallResponse> call({
    int? fkEmpresa,
    int? fkLocaldeproducao,
    dynamic itemFormularioJson,
    int? controleofflineId,
    String? authorization = '',
    String? version,
  }) async {
    version ??= FFDevEnvironmentValues().DataSource;
    final baseUrl = PostGroup.getBaseUrl(
      authorization: authorization,
      version: version,
    );

    final itemFormulario = _serializeJson(itemFormularioJson, true);

    return ApiManager.instance.makeApiCall(
      callName: 'Sincronizacao',
      apiUrl: '${baseUrl}/sincronizacao',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authorization}',
        'X-Data-Source': '${version}',
      },
      params: {
        'itemFormulario': itemFormulario,
        'fk_localdeproducao': fkLocaldeproducao,
        'controleoffline_id': controleofflineId,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? erroID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.traceId''',
      ));
  String? erroCode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.code''',
      ));
  String? erroMensagem(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  int? id(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.id''',
      ));
  int? dataSincronizacao(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.dataSincronizacaoInicial''',
      ));
  int? fkLocalDeproducao(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.fk_localdeproducao''',
      ));
  int? fkUser(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.fk_user''',
      ));
  int? fkEmpresa(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.fk_empresa''',
      ));
  dynamic json(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
}

class EDITContoleOfflineCall {
  Future<ApiCallResponse> call({
    int? controleofflineId,
    String? authorization = '',
    String? version,
  }) async {
    version ??= FFDevEnvironmentValues().DataSource;
    final baseUrl = PostGroup.getBaseUrl(
      authorization: authorization,
      version: version,
    );

    final ffApiRequestBody = '''
{
  "controleoffline_id": ${controleofflineId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'EDIT Contole offline',
      apiUrl: '${baseUrl}/controle-offline/finalizacao',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authorization}',
        'X-Data-Source': '${version}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End POST Group Code

/// Start GET Group Code

class GetGroup {
  static String getBaseUrl({
    String? authorization = '',
    String? version,
    int? localdeproducaoId = 0,
  }) {
    version ??= valueOrDefault<String>(
      FFDevEnvironmentValues().DataSource,
      'live',
    );
    return 'https://xrsx-tpow-q7vu.n7d.xano.io/api:R3uEOQqP';
  }

  static Map<String, String> headers = {
    'Authorization': 'Bearer [Authorization]',
    'X-Data-Source': '[version]',
  };
  static DTUserCall dTUserCall = DTUserCall();
  static DTLocalDeProducaoCall dTLocalDeProducaoCall = DTLocalDeProducaoCall();
  static DTEmpresaCall dTEmpresaCall = DTEmpresaCall();
  static DTNivelDeAcessoCall dTNivelDeAcessoCall = DTNivelDeAcessoCall();
  static DTSubmoduloCall dTSubmoduloCall = DTSubmoduloCall();
  static DTModuloCall dTModuloCall = DTModuloCall();
  static DTFormularioCall dTFormularioCall = DTFormularioCall();
  static DTProdutoFinalCall dTProdutoFinalCall = DTProdutoFinalCall();
  static DTServicoControladoCall dTServicoControladoCall =
      DTServicoControladoCall();
  static DTItemFormularioCall dTItemFormularioCall = DTItemFormularioCall();
  static DTFornecedorCall dTFornecedorCall = DTFornecedorCall();
  static DTProblemaRecorrenteCall dTProblemaRecorrenteCall =
      DTProblemaRecorrenteCall();
  static DTItemFormularioPADRAOCall dTItemFormularioPADRAOCall =
      DTItemFormularioPADRAOCall();
}

class DTUserCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
    String? version,
    int? localdeproducaoId = 0,
  }) async {
    version ??= valueOrDefault<String>(
      FFDevEnvironmentValues().DataSource,
      'live',
    );
    final baseUrl = GetGroup.getBaseUrl(
      authorization: authorization,
      version: version,
      localdeproducaoId: localdeproducaoId,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'DT User',
      apiUrl: '${baseUrl}/user',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authorization}',
        'X-Data-Source': '${version}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? id(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.id''',
      ));
  int? dataCriacao(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.created_at''',
      ));
  String? nome(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.nome''',
      ));
  String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.email''',
      ));
  int? dataUltimaModificacao(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.ultimaModificacao''',
      ));
  int? usercriadorID(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.userCriador''',
      ));
  bool? isDesativo(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.isDesativado''',
      ));
  bool? isAdm(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.isAdm''',
      ));
  int? empresaID(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.empresa_id''',
      ));
  dynamic json(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
  int? localDeProducaoID(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.localdeproducao_id''',
      ));
}

class DTLocalDeProducaoCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
    String? version,
    int? localdeproducaoId = 0,
  }) async {
    version ??= valueOrDefault<String>(
      FFDevEnvironmentValues().DataSource,
      'live',
    );
    final baseUrl = GetGroup.getBaseUrl(
      authorization: authorization,
      version: version,
      localdeproducaoId: localdeproducaoId,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'DT Local de producao',
      apiUrl: '${baseUrl}/localProducao',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authorization}',
        'X-Data-Source': '${version}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? json(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      ) as List?;
}

class DTEmpresaCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
    String? version,
    int? localdeproducaoId = 0,
  }) async {
    version ??= valueOrDefault<String>(
      FFDevEnvironmentValues().DataSource,
      'live',
    );
    final baseUrl = GetGroup.getBaseUrl(
      authorization: authorization,
      version: version,
      localdeproducaoId: localdeproducaoId,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'DT Empresa',
      apiUrl: '${baseUrl}/empresa',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authorization}',
        'X-Data-Source': '${version}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic json(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
  int? id(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.id''',
      ));
  int? dataCriacao(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.created_at''',
      ));
  int? userCriador(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.userCriador''',
      ));
  int? ultimaModificacao(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.ultimaModificacao''',
      ));
  int? userPrincipal(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.userPrincipal''',
      ));
  bool? isDesativado(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.isDesativado''',
      ));
  dynamic dtEndereco(dynamic response) => getJsonField(
        response,
        r'''$.dtEndereco''',
      );
  bool? isAcesso(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.isAcesso''',
      ));
  String? nome(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.nome''',
      ));
}

class DTNivelDeAcessoCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
    String? version,
    int? localdeproducaoId = 0,
  }) async {
    version ??= valueOrDefault<String>(
      FFDevEnvironmentValues().DataSource,
      'live',
    );
    final baseUrl = GetGroup.getBaseUrl(
      authorization: authorization,
      version: version,
      localdeproducaoId: localdeproducaoId,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'DT Nivel de acesso',
      apiUrl: '${baseUrl}/nivel-de-acesso',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authorization}',
        'X-Data-Source': '${version}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? json(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      ) as List?;
}

class DTSubmoduloCall {
  Future<ApiCallResponse> call({
    int? modulosId,
    String? authorization = '',
    String? version,
    int? localdeproducaoId = 0,
  }) async {
    version ??= valueOrDefault<String>(
      FFDevEnvironmentValues().DataSource,
      'live',
    );
    final baseUrl = GetGroup.getBaseUrl(
      authorization: authorization,
      version: version,
      localdeproducaoId: localdeproducaoId,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'DT submodulo',
      apiUrl: '${baseUrl}/subModulo',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authorization}',
        'X-Data-Source': '${version}',
      },
      params: {
        'localdeproducao_id': localdeproducaoId,
        'modulos_id': modulosId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? json(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      ) as List?;
  int? id(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].id''',
      ));
  int? dataCriacao(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].created_at''',
      ));
  int? userCriador(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].userCriador''',
      ));
  String? descricao(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].descricao''',
      ));
  int? ultimaModificacao(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].ultimaModificacao''',
      ));
  List<int>? fkEmpresa(dynamic response) => (getJsonField(
        response,
        r'''$[:].empresa_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<int>? fkLocalDeProducao(dynamic response) => (getJsonField(
        response,
        r'''$[:].localdeproducao_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<int>? fkModulos(dynamic response) => (getJsonField(
        response,
        r'''$[:].modulos_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class DTModuloCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
    String? version,
    int? localdeproducaoId = 0,
  }) async {
    version ??= valueOrDefault<String>(
      FFDevEnvironmentValues().DataSource,
      'live',
    );
    final baseUrl = GetGroup.getBaseUrl(
      authorization: authorization,
      version: version,
      localdeproducaoId: localdeproducaoId,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'DT Modulo',
      apiUrl: '${baseUrl}/modulo',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authorization}',
        'X-Data-Source': '${version}',
      },
      params: {
        'localdeproducao_id': localdeproducaoId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? json(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      ) as List?;
  int? id(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].id''',
      ));
  int? dataCriacao(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].created_at''',
      ));
  int? ultimaModificacao(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].ultimaModificacao''',
      ));
  int? userCriador(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].userCriador''',
      ));
  String? descricao(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].descricao''',
      ));
  int? fkEmpresa(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].empresa_id''',
      ));
  int? fklocalDeProducao(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].localdeproducao_id''',
      ));
}

class DTFormularioCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
    String? version,
    int? localdeproducaoId = 0,
  }) async {
    version ??= valueOrDefault<String>(
      FFDevEnvironmentValues().DataSource,
      'live',
    );
    final baseUrl = GetGroup.getBaseUrl(
      authorization: authorization,
      version: version,
      localdeproducaoId: localdeproducaoId,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'DT Formulario',
      apiUrl: '${baseUrl}/formulario',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authorization}',
        'X-Data-Source': '${version}',
      },
      params: {
        'localdeproducao_id': localdeproducaoId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? id(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].id''',
      ));
  int? fkSubModulos(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].submodulos_id''',
      ));
  int? fkEmpresa(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].empresa_id''',
      ));
  String? enCategoriaFormulario(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].en_categoriaFormulario''',
      ));
  String? descricao(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].descricao''',
      ));
  int? userCriador(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].userCriador''',
      ));
  int? ultimaModificacao(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].ultimaModificacao''',
      ));
  int? dataCriacao(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].created_at''',
      ));
  int? fkLocalDeProducao(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].localdeproducao_id''',
      ));
  List? json(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      ) as List?;
}

class DTProdutoFinalCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
    String? version,
    int? localdeproducaoId = 0,
  }) async {
    version ??= valueOrDefault<String>(
      FFDevEnvironmentValues().DataSource,
      'live',
    );
    final baseUrl = GetGroup.getBaseUrl(
      authorization: authorization,
      version: version,
      localdeproducaoId: localdeproducaoId,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'DT Produto final',
      apiUrl: '${baseUrl}/produto-final',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authorization}',
        'X-Data-Source': '${version}',
      },
      params: {
        'localdeproducao_id': localdeproducaoId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? enSubSetor(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].en_subSetor''',
      ));
  String? enLembrete(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].en_lembrete''',
      ));
  int? fkLocalDeproducao(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].localdeproducao_id''',
      ));
  int? alteradoPor(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].alteradoPor''',
      ));
  String? terminoPrevisto(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].terminoPrevisto''',
      ));
  int? horasEstimadas(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].horasEstimadas''',
      ));
  bool? isDeletado(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$[:].isDeletado''',
      ));
  int? userCriador(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].userCriador''',
      ));
  int? ultimaModificacao(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].ultimaModificacao''',
      ));
  int? dataCriacao(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].created_at''',
      ));
  int? id(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].id''',
      ));
  String? observacoes(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].observacoes''',
      ));
  String? qrCode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].qrCode''',
      ));
  int? fkEmpresa(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].empresa_id''',
      ));
  String? terminoRealizado(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].terminoRealizado''',
      ));
  String? inicioRealizado(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].inicioRealizado''',
      ));
  String? descricaoProduto(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].descricaoProduto''',
      ));
  String? inicioPrevisto(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].inicioPrevisto''',
      ));
  List? json(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      ) as List?;
}

class DTServicoControladoCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
    String? version,
    int? localdeproducaoId = 0,
  }) async {
    version ??= valueOrDefault<String>(
      FFDevEnvironmentValues().DataSource,
      'live',
    );
    final baseUrl = GetGroup.getBaseUrl(
      authorization: authorization,
      version: version,
      localdeproducaoId: localdeproducaoId,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'DT Servico controlado',
      apiUrl: '${baseUrl}/controlado',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authorization}',
        'X-Data-Source': '${version}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? enSubSetor(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].en_subsetor''',
      ));
  String? enLembrete(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].en_lembrete''',
      ));
  int? fkLocalDeproducao(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].localdeproducao_id''',
      ));
  int? alteradoPor(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].alteradoPor''',
      ));
  String? terminoPrevisto(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].terminoPrevisto''',
      ));
  int? horasEstimadas(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].horasEstimadas''',
      ));
  bool? isDeletado(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$[:].isDeletado''',
      ));
  int? userCriador(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].userCriador''',
      ));
  int? ultimaModificacao(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].ultimaModificacao''',
      ));
  int? dataCriacao(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].created_at''',
      ));
  int? id(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].id''',
      ));
  String? observacoes(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].observacoes''',
      ));
  String? qrCode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].qrCode''',
      ));
  int? fkEmpresa(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].empresa_id''',
      ));
  String? terminoRealizado(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].terminoRealizado''',
      ));
  String? inicioRealizado(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].inicioRealizado''',
      ));
  String? descricaoProduto(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].descricaoProduto''',
      ));
  String? inicioPrevisto(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].inicioPrevisto''',
      ));
  List? json(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      ) as List?;
  String? enPeriodicidade(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].en_periodicidade''',
      ));
  double? valorHora(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$[:].valorHora''',
      ));
  List? fornecedoresID(dynamic response) => getJsonField(
        response,
        r'''$[:].fornecedores_id''',
        true,
      ) as List?;
  String? descricaoConformidade(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].descricaoConformidade''',
      ));
  String? descricao(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].descricao''',
      ));
}

class DTItemFormularioCall {
  Future<ApiCallResponse> call({
    int? formularioId,
    String? authorization = '',
    String? version,
    int? localdeproducaoId = 0,
  }) async {
    version ??= valueOrDefault<String>(
      FFDevEnvironmentValues().DataSource,
      'live',
    );
    final baseUrl = GetGroup.getBaseUrl(
      authorization: authorization,
      version: version,
      localdeproducaoId: localdeproducaoId,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'DT Item formulario',
      apiUrl: '${baseUrl}/formulario/item',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authorization}',
        'X-Data-Source': '${version}',
      },
      params: {
        'localdeproducao_id': localdeproducaoId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? json(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      ) as List?;
}

class DTFornecedorCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
    String? version,
    int? localdeproducaoId = 0,
  }) async {
    version ??= valueOrDefault<String>(
      FFDevEnvironmentValues().DataSource,
      'live',
    );
    final baseUrl = GetGroup.getBaseUrl(
      authorization: authorization,
      version: version,
      localdeproducaoId: localdeproducaoId,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'DT Fornecedor',
      apiUrl: '${baseUrl}/fornecedor',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authorization}',
        'X-Data-Source': '${version}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? json(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      ) as List?;
}

class DTProblemaRecorrenteCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
    String? version,
    int? localdeproducaoId = 0,
  }) async {
    version ??= valueOrDefault<String>(
      FFDevEnvironmentValues().DataSource,
      'live',
    );
    final baseUrl = GetGroup.getBaseUrl(
      authorization: authorization,
      version: version,
      localdeproducaoId: localdeproducaoId,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'DT Problema recorrente',
      apiUrl: '${baseUrl}/problema_recorrente',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authorization}',
        'X-Data-Source': '${version}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic json(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
}

class DTItemFormularioPADRAOCall {
  Future<ApiCallResponse> call({
    int? formularioId,
    String? authorization = '',
    String? version,
    int? localdeproducaoId = 0,
  }) async {
    version ??= valueOrDefault<String>(
      FFDevEnvironmentValues().DataSource,
      'live',
    );
    final baseUrl = GetGroup.getBaseUrl(
      authorization: authorization,
      version: version,
      localdeproducaoId: localdeproducaoId,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'DT Item formulario PADRAO',
      apiUrl: '${baseUrl}/formulario/item/padrao',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authorization}',
        'X-Data-Source': '${version}',
      },
      params: {
        'localdeproducao_id': localdeproducaoId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? json(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      ) as List?;
}

/// End GET Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

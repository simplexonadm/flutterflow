// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DtProdutoFinalStruct extends BaseStruct {
  DtProdutoFinalStruct({
    int? id,
    String? cor,
    String? qrCode,
    int? createdAt,
    String? enSubSetor,
    String? enLembrete,
    int? empresaId,
    bool? isDeletado,
    int? alteradoPor,
    String? observacoes,
    int? userCriador,
    int? horasEstimadas,
    String? inicioPrevisto,
    String? inicioRealizado,
    String? terminoPrevisto,
    String? descricaoProduto,
    String? terminoRealizado,
    int? ultimaModificacao,
    int? localdeproducaoId,
    String? qrCodeUrl,
  })  : _id = id,
        _cor = cor,
        _qrCode = qrCode,
        _createdAt = createdAt,
        _enSubSetor = enSubSetor,
        _enLembrete = enLembrete,
        _empresaId = empresaId,
        _isDeletado = isDeletado,
        _alteradoPor = alteradoPor,
        _observacoes = observacoes,
        _userCriador = userCriador,
        _horasEstimadas = horasEstimadas,
        _inicioPrevisto = inicioPrevisto,
        _inicioRealizado = inicioRealizado,
        _terminoPrevisto = terminoPrevisto,
        _descricaoProduto = descricaoProduto,
        _terminoRealizado = terminoRealizado,
        _ultimaModificacao = ultimaModificacao,
        _localdeproducaoId = localdeproducaoId,
        _qrCodeUrl = qrCodeUrl;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "cor" field.
  String? _cor;
  String get cor => _cor ?? '';
  set cor(String? val) => _cor = val;

  bool hasCor() => _cor != null;

  // "qrCode" field.
  String? _qrCode;
  String get qrCode => _qrCode ?? '';
  set qrCode(String? val) => _qrCode = val;

  bool hasQrCode() => _qrCode != null;

  // "created_at" field.
  int? _createdAt;
  int get createdAt => _createdAt ?? 0;
  set createdAt(int? val) => _createdAt = val;

  void incrementCreatedAt(int amount) => createdAt = createdAt + amount;

  bool hasCreatedAt() => _createdAt != null;

  // "en_subSetor" field.
  String? _enSubSetor;
  String get enSubSetor => _enSubSetor ?? '';
  set enSubSetor(String? val) => _enSubSetor = val;

  bool hasEnSubSetor() => _enSubSetor != null;

  // "en_lembrete" field.
  String? _enLembrete;
  String get enLembrete => _enLembrete ?? '';
  set enLembrete(String? val) => _enLembrete = val;

  bool hasEnLembrete() => _enLembrete != null;

  // "empresa_id" field.
  int? _empresaId;
  int get empresaId => _empresaId ?? 0;
  set empresaId(int? val) => _empresaId = val;

  void incrementEmpresaId(int amount) => empresaId = empresaId + amount;

  bool hasEmpresaId() => _empresaId != null;

  // "isDeletado" field.
  bool? _isDeletado;
  bool get isDeletado => _isDeletado ?? false;
  set isDeletado(bool? val) => _isDeletado = val;

  bool hasIsDeletado() => _isDeletado != null;

  // "alteradoPor" field.
  int? _alteradoPor;
  int get alteradoPor => _alteradoPor ?? 0;
  set alteradoPor(int? val) => _alteradoPor = val;

  void incrementAlteradoPor(int amount) => alteradoPor = alteradoPor + amount;

  bool hasAlteradoPor() => _alteradoPor != null;

  // "observacoes" field.
  String? _observacoes;
  String get observacoes => _observacoes ?? '';
  set observacoes(String? val) => _observacoes = val;

  bool hasObservacoes() => _observacoes != null;

  // "userCriador" field.
  int? _userCriador;
  int get userCriador => _userCriador ?? 0;
  set userCriador(int? val) => _userCriador = val;

  void incrementUserCriador(int amount) => userCriador = userCriador + amount;

  bool hasUserCriador() => _userCriador != null;

  // "horasEstimadas" field.
  int? _horasEstimadas;
  int get horasEstimadas => _horasEstimadas ?? 0;
  set horasEstimadas(int? val) => _horasEstimadas = val;

  void incrementHorasEstimadas(int amount) =>
      horasEstimadas = horasEstimadas + amount;

  bool hasHorasEstimadas() => _horasEstimadas != null;

  // "inicioPrevisto" field.
  String? _inicioPrevisto;
  String get inicioPrevisto => _inicioPrevisto ?? '';
  set inicioPrevisto(String? val) => _inicioPrevisto = val;

  bool hasInicioPrevisto() => _inicioPrevisto != null;

  // "inicioRealizado" field.
  String? _inicioRealizado;
  String get inicioRealizado => _inicioRealizado ?? '';
  set inicioRealizado(String? val) => _inicioRealizado = val;

  bool hasInicioRealizado() => _inicioRealizado != null;

  // "terminoPrevisto" field.
  String? _terminoPrevisto;
  String get terminoPrevisto => _terminoPrevisto ?? '';
  set terminoPrevisto(String? val) => _terminoPrevisto = val;

  bool hasTerminoPrevisto() => _terminoPrevisto != null;

  // "descricaoProduto" field.
  String? _descricaoProduto;
  String get descricaoProduto => _descricaoProduto ?? '';
  set descricaoProduto(String? val) => _descricaoProduto = val;

  bool hasDescricaoProduto() => _descricaoProduto != null;

  // "terminoRealizado" field.
  String? _terminoRealizado;
  String get terminoRealizado => _terminoRealizado ?? '';
  set terminoRealizado(String? val) => _terminoRealizado = val;

  bool hasTerminoRealizado() => _terminoRealizado != null;

  // "ultimaModificacao" field.
  int? _ultimaModificacao;
  int get ultimaModificacao => _ultimaModificacao ?? 0;
  set ultimaModificacao(int? val) => _ultimaModificacao = val;

  void incrementUltimaModificacao(int amount) =>
      ultimaModificacao = ultimaModificacao + amount;

  bool hasUltimaModificacao() => _ultimaModificacao != null;

  // "localdeproducao_id" field.
  int? _localdeproducaoId;
  int get localdeproducaoId => _localdeproducaoId ?? 0;
  set localdeproducaoId(int? val) => _localdeproducaoId = val;

  void incrementLocaldeproducaoId(int amount) =>
      localdeproducaoId = localdeproducaoId + amount;

  bool hasLocaldeproducaoId() => _localdeproducaoId != null;

  // "qrCodeUrl" field.
  String? _qrCodeUrl;
  String get qrCodeUrl => _qrCodeUrl ?? '';
  set qrCodeUrl(String? val) => _qrCodeUrl = val;

  bool hasQrCodeUrl() => _qrCodeUrl != null;

  static DtProdutoFinalStruct fromMap(Map<String, dynamic> data) =>
      DtProdutoFinalStruct(
        id: castToType<int>(data['id']),
        cor: data['cor'] as String?,
        qrCode: data['qrCode'] as String?,
        createdAt: castToType<int>(data['created_at']),
        enSubSetor: data['en_subSetor'] as String?,
        enLembrete: data['en_lembrete'] as String?,
        empresaId: castToType<int>(data['empresa_id']),
        isDeletado: data['isDeletado'] as bool?,
        alteradoPor: castToType<int>(data['alteradoPor']),
        observacoes: data['observacoes'] as String?,
        userCriador: castToType<int>(data['userCriador']),
        horasEstimadas: castToType<int>(data['horasEstimadas']),
        inicioPrevisto: data['inicioPrevisto'] as String?,
        inicioRealizado: data['inicioRealizado'] as String?,
        terminoPrevisto: data['terminoPrevisto'] as String?,
        descricaoProduto: data['descricaoProduto'] as String?,
        terminoRealizado: data['terminoRealizado'] as String?,
        ultimaModificacao: castToType<int>(data['ultimaModificacao']),
        localdeproducaoId: castToType<int>(data['localdeproducao_id']),
        qrCodeUrl: data['qrCodeUrl'] as String?,
      );

  static DtProdutoFinalStruct? maybeFromMap(dynamic data) => data is Map
      ? DtProdutoFinalStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'cor': _cor,
        'qrCode': _qrCode,
        'created_at': _createdAt,
        'en_subSetor': _enSubSetor,
        'en_lembrete': _enLembrete,
        'empresa_id': _empresaId,
        'isDeletado': _isDeletado,
        'alteradoPor': _alteradoPor,
        'observacoes': _observacoes,
        'userCriador': _userCriador,
        'horasEstimadas': _horasEstimadas,
        'inicioPrevisto': _inicioPrevisto,
        'inicioRealizado': _inicioRealizado,
        'terminoPrevisto': _terminoPrevisto,
        'descricaoProduto': _descricaoProduto,
        'terminoRealizado': _terminoRealizado,
        'ultimaModificacao': _ultimaModificacao,
        'localdeproducao_id': _localdeproducaoId,
        'qrCodeUrl': _qrCodeUrl,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'cor': serializeParam(
          _cor,
          ParamType.String,
        ),
        'qrCode': serializeParam(
          _qrCode,
          ParamType.String,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.int,
        ),
        'en_subSetor': serializeParam(
          _enSubSetor,
          ParamType.String,
        ),
        'en_lembrete': serializeParam(
          _enLembrete,
          ParamType.String,
        ),
        'empresa_id': serializeParam(
          _empresaId,
          ParamType.int,
        ),
        'isDeletado': serializeParam(
          _isDeletado,
          ParamType.bool,
        ),
        'alteradoPor': serializeParam(
          _alteradoPor,
          ParamType.int,
        ),
        'observacoes': serializeParam(
          _observacoes,
          ParamType.String,
        ),
        'userCriador': serializeParam(
          _userCriador,
          ParamType.int,
        ),
        'horasEstimadas': serializeParam(
          _horasEstimadas,
          ParamType.int,
        ),
        'inicioPrevisto': serializeParam(
          _inicioPrevisto,
          ParamType.String,
        ),
        'inicioRealizado': serializeParam(
          _inicioRealizado,
          ParamType.String,
        ),
        'terminoPrevisto': serializeParam(
          _terminoPrevisto,
          ParamType.String,
        ),
        'descricaoProduto': serializeParam(
          _descricaoProduto,
          ParamType.String,
        ),
        'terminoRealizado': serializeParam(
          _terminoRealizado,
          ParamType.String,
        ),
        'ultimaModificacao': serializeParam(
          _ultimaModificacao,
          ParamType.int,
        ),
        'localdeproducao_id': serializeParam(
          _localdeproducaoId,
          ParamType.int,
        ),
        'qrCodeUrl': serializeParam(
          _qrCodeUrl,
          ParamType.String,
        ),
      }.withoutNulls;

  static DtProdutoFinalStruct fromSerializableMap(Map<String, dynamic> data) =>
      DtProdutoFinalStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        cor: deserializeParam(
          data['cor'],
          ParamType.String,
          false,
        ),
        qrCode: deserializeParam(
          data['qrCode'],
          ParamType.String,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.int,
          false,
        ),
        enSubSetor: deserializeParam(
          data['en_subSetor'],
          ParamType.String,
          false,
        ),
        enLembrete: deserializeParam(
          data['en_lembrete'],
          ParamType.String,
          false,
        ),
        empresaId: deserializeParam(
          data['empresa_id'],
          ParamType.int,
          false,
        ),
        isDeletado: deserializeParam(
          data['isDeletado'],
          ParamType.bool,
          false,
        ),
        alteradoPor: deserializeParam(
          data['alteradoPor'],
          ParamType.int,
          false,
        ),
        observacoes: deserializeParam(
          data['observacoes'],
          ParamType.String,
          false,
        ),
        userCriador: deserializeParam(
          data['userCriador'],
          ParamType.int,
          false,
        ),
        horasEstimadas: deserializeParam(
          data['horasEstimadas'],
          ParamType.int,
          false,
        ),
        inicioPrevisto: deserializeParam(
          data['inicioPrevisto'],
          ParamType.String,
          false,
        ),
        inicioRealizado: deserializeParam(
          data['inicioRealizado'],
          ParamType.String,
          false,
        ),
        terminoPrevisto: deserializeParam(
          data['terminoPrevisto'],
          ParamType.String,
          false,
        ),
        descricaoProduto: deserializeParam(
          data['descricaoProduto'],
          ParamType.String,
          false,
        ),
        terminoRealizado: deserializeParam(
          data['terminoRealizado'],
          ParamType.String,
          false,
        ),
        ultimaModificacao: deserializeParam(
          data['ultimaModificacao'],
          ParamType.int,
          false,
        ),
        localdeproducaoId: deserializeParam(
          data['localdeproducao_id'],
          ParamType.int,
          false,
        ),
        qrCodeUrl: deserializeParam(
          data['qrCodeUrl'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DtProdutoFinalStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DtProdutoFinalStruct &&
        id == other.id &&
        cor == other.cor &&
        qrCode == other.qrCode &&
        createdAt == other.createdAt &&
        enSubSetor == other.enSubSetor &&
        enLembrete == other.enLembrete &&
        empresaId == other.empresaId &&
        isDeletado == other.isDeletado &&
        alteradoPor == other.alteradoPor &&
        observacoes == other.observacoes &&
        userCriador == other.userCriador &&
        horasEstimadas == other.horasEstimadas &&
        inicioPrevisto == other.inicioPrevisto &&
        inicioRealizado == other.inicioRealizado &&
        terminoPrevisto == other.terminoPrevisto &&
        descricaoProduto == other.descricaoProduto &&
        terminoRealizado == other.terminoRealizado &&
        ultimaModificacao == other.ultimaModificacao &&
        localdeproducaoId == other.localdeproducaoId &&
        qrCodeUrl == other.qrCodeUrl;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        cor,
        qrCode,
        createdAt,
        enSubSetor,
        enLembrete,
        empresaId,
        isDeletado,
        alteradoPor,
        observacoes,
        userCriador,
        horasEstimadas,
        inicioPrevisto,
        inicioRealizado,
        terminoPrevisto,
        descricaoProduto,
        terminoRealizado,
        ultimaModificacao,
        localdeproducaoId,
        qrCodeUrl
      ]);
}

DtProdutoFinalStruct createDtProdutoFinalStruct({
  int? id,
  String? cor,
  String? qrCode,
  int? createdAt,
  String? enSubSetor,
  String? enLembrete,
  int? empresaId,
  bool? isDeletado,
  int? alteradoPor,
  String? observacoes,
  int? userCriador,
  int? horasEstimadas,
  String? inicioPrevisto,
  String? inicioRealizado,
  String? terminoPrevisto,
  String? descricaoProduto,
  String? terminoRealizado,
  int? ultimaModificacao,
  int? localdeproducaoId,
  String? qrCodeUrl,
}) =>
    DtProdutoFinalStruct(
      id: id,
      cor: cor,
      qrCode: qrCode,
      createdAt: createdAt,
      enSubSetor: enSubSetor,
      enLembrete: enLembrete,
      empresaId: empresaId,
      isDeletado: isDeletado,
      alteradoPor: alteradoPor,
      observacoes: observacoes,
      userCriador: userCriador,
      horasEstimadas: horasEstimadas,
      inicioPrevisto: inicioPrevisto,
      inicioRealizado: inicioRealizado,
      terminoPrevisto: terminoPrevisto,
      descricaoProduto: descricaoProduto,
      terminoRealizado: terminoRealizado,
      ultimaModificacao: ultimaModificacao,
      localdeproducaoId: localdeproducaoId,
      qrCodeUrl: qrCodeUrl,
    );

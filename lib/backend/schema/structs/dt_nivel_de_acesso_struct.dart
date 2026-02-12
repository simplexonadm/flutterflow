// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DtNivelDeAcessoStruct extends BaseStruct {
  DtNivelDeAcessoStruct({
    int? id,
    int? createdAt,
    int? ultimaCriacao,
    int? userCriador,
    bool? isCriacao,
    bool? isDeletado,
    bool? isEdicao,
    bool? isVisualizacao,
    int? empresaId,
    int? localdeproducaoId,
    int? userId,
  })  : _id = id,
        _createdAt = createdAt,
        _ultimaCriacao = ultimaCriacao,
        _userCriador = userCriador,
        _isCriacao = isCriacao,
        _isDeletado = isDeletado,
        _isEdicao = isEdicao,
        _isVisualizacao = isVisualizacao,
        _empresaId = empresaId,
        _localdeproducaoId = localdeproducaoId,
        _userId = userId;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "created_at" field.
  int? _createdAt;
  int get createdAt => _createdAt ?? 0;
  set createdAt(int? val) => _createdAt = val;

  void incrementCreatedAt(int amount) => createdAt = createdAt + amount;

  bool hasCreatedAt() => _createdAt != null;

  // "ultimaCriacao" field.
  int? _ultimaCriacao;
  int get ultimaCriacao => _ultimaCriacao ?? 0;
  set ultimaCriacao(int? val) => _ultimaCriacao = val;

  void incrementUltimaCriacao(int amount) =>
      ultimaCriacao = ultimaCriacao + amount;

  bool hasUltimaCriacao() => _ultimaCriacao != null;

  // "userCriador" field.
  int? _userCriador;
  int get userCriador => _userCriador ?? 0;
  set userCriador(int? val) => _userCriador = val;

  void incrementUserCriador(int amount) => userCriador = userCriador + amount;

  bool hasUserCriador() => _userCriador != null;

  // "isCriacao" field.
  bool? _isCriacao;
  bool get isCriacao => _isCriacao ?? false;
  set isCriacao(bool? val) => _isCriacao = val;

  bool hasIsCriacao() => _isCriacao != null;

  // "isDeletado" field.
  bool? _isDeletado;
  bool get isDeletado => _isDeletado ?? false;
  set isDeletado(bool? val) => _isDeletado = val;

  bool hasIsDeletado() => _isDeletado != null;

  // "isEdicao" field.
  bool? _isEdicao;
  bool get isEdicao => _isEdicao ?? false;
  set isEdicao(bool? val) => _isEdicao = val;

  bool hasIsEdicao() => _isEdicao != null;

  // "isVisualizacao" field.
  bool? _isVisualizacao;
  bool get isVisualizacao => _isVisualizacao ?? false;
  set isVisualizacao(bool? val) => _isVisualizacao = val;

  bool hasIsVisualizacao() => _isVisualizacao != null;

  // "empresa_id" field.
  int? _empresaId;
  int get empresaId => _empresaId ?? 0;
  set empresaId(int? val) => _empresaId = val;

  void incrementEmpresaId(int amount) => empresaId = empresaId + amount;

  bool hasEmpresaId() => _empresaId != null;

  // "localdeproducao_id" field.
  int? _localdeproducaoId;
  int get localdeproducaoId => _localdeproducaoId ?? 0;
  set localdeproducaoId(int? val) => _localdeproducaoId = val;

  void incrementLocaldeproducaoId(int amount) =>
      localdeproducaoId = localdeproducaoId + amount;

  bool hasLocaldeproducaoId() => _localdeproducaoId != null;

  // "user_id" field.
  int? _userId;
  int get userId => _userId ?? 0;
  set userId(int? val) => _userId = val;

  void incrementUserId(int amount) => userId = userId + amount;

  bool hasUserId() => _userId != null;

  static DtNivelDeAcessoStruct fromMap(Map<String, dynamic> data) =>
      DtNivelDeAcessoStruct(
        id: castToType<int>(data['id']),
        createdAt: castToType<int>(data['created_at']),
        ultimaCriacao: castToType<int>(data['ultimaCriacao']),
        userCriador: castToType<int>(data['userCriador']),
        isCriacao: data['isCriacao'] as bool?,
        isDeletado: data['isDeletado'] as bool?,
        isEdicao: data['isEdicao'] as bool?,
        isVisualizacao: data['isVisualizacao'] as bool?,
        empresaId: castToType<int>(data['empresa_id']),
        localdeproducaoId: castToType<int>(data['localdeproducao_id']),
        userId: castToType<int>(data['user_id']),
      );

  static DtNivelDeAcessoStruct? maybeFromMap(dynamic data) => data is Map
      ? DtNivelDeAcessoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'created_at': _createdAt,
        'ultimaCriacao': _ultimaCriacao,
        'userCriador': _userCriador,
        'isCriacao': _isCriacao,
        'isDeletado': _isDeletado,
        'isEdicao': _isEdicao,
        'isVisualizacao': _isVisualizacao,
        'empresa_id': _empresaId,
        'localdeproducao_id': _localdeproducaoId,
        'user_id': _userId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.int,
        ),
        'ultimaCriacao': serializeParam(
          _ultimaCriacao,
          ParamType.int,
        ),
        'userCriador': serializeParam(
          _userCriador,
          ParamType.int,
        ),
        'isCriacao': serializeParam(
          _isCriacao,
          ParamType.bool,
        ),
        'isDeletado': serializeParam(
          _isDeletado,
          ParamType.bool,
        ),
        'isEdicao': serializeParam(
          _isEdicao,
          ParamType.bool,
        ),
        'isVisualizacao': serializeParam(
          _isVisualizacao,
          ParamType.bool,
        ),
        'empresa_id': serializeParam(
          _empresaId,
          ParamType.int,
        ),
        'localdeproducao_id': serializeParam(
          _localdeproducaoId,
          ParamType.int,
        ),
        'user_id': serializeParam(
          _userId,
          ParamType.int,
        ),
      }.withoutNulls;

  static DtNivelDeAcessoStruct fromSerializableMap(Map<String, dynamic> data) =>
      DtNivelDeAcessoStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.int,
          false,
        ),
        ultimaCriacao: deserializeParam(
          data['ultimaCriacao'],
          ParamType.int,
          false,
        ),
        userCriador: deserializeParam(
          data['userCriador'],
          ParamType.int,
          false,
        ),
        isCriacao: deserializeParam(
          data['isCriacao'],
          ParamType.bool,
          false,
        ),
        isDeletado: deserializeParam(
          data['isDeletado'],
          ParamType.bool,
          false,
        ),
        isEdicao: deserializeParam(
          data['isEdicao'],
          ParamType.bool,
          false,
        ),
        isVisualizacao: deserializeParam(
          data['isVisualizacao'],
          ParamType.bool,
          false,
        ),
        empresaId: deserializeParam(
          data['empresa_id'],
          ParamType.int,
          false,
        ),
        localdeproducaoId: deserializeParam(
          data['localdeproducao_id'],
          ParamType.int,
          false,
        ),
        userId: deserializeParam(
          data['user_id'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'DtNivelDeAcessoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DtNivelDeAcessoStruct &&
        id == other.id &&
        createdAt == other.createdAt &&
        ultimaCriacao == other.ultimaCriacao &&
        userCriador == other.userCriador &&
        isCriacao == other.isCriacao &&
        isDeletado == other.isDeletado &&
        isEdicao == other.isEdicao &&
        isVisualizacao == other.isVisualizacao &&
        empresaId == other.empresaId &&
        localdeproducaoId == other.localdeproducaoId &&
        userId == other.userId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        createdAt,
        ultimaCriacao,
        userCriador,
        isCriacao,
        isDeletado,
        isEdicao,
        isVisualizacao,
        empresaId,
        localdeproducaoId,
        userId
      ]);
}

DtNivelDeAcessoStruct createDtNivelDeAcessoStruct({
  int? id,
  int? createdAt,
  int? ultimaCriacao,
  int? userCriador,
  bool? isCriacao,
  bool? isDeletado,
  bool? isEdicao,
  bool? isVisualizacao,
  int? empresaId,
  int? localdeproducaoId,
  int? userId,
}) =>
    DtNivelDeAcessoStruct(
      id: id,
      createdAt: createdAt,
      ultimaCriacao: ultimaCriacao,
      userCriador: userCriador,
      isCriacao: isCriacao,
      isDeletado: isDeletado,
      isEdicao: isEdicao,
      isVisualizacao: isVisualizacao,
      empresaId: empresaId,
      localdeproducaoId: localdeproducaoId,
      userId: userId,
    );

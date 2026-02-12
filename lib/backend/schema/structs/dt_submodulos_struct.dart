// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DtSubmodulosStruct extends BaseStruct {
  DtSubmodulosStruct({
    int? id,
    int? createdAt,
    int? ultimaModificacao,
    int? userCriador,
    String? descricao,
    int? localdeproducaoId,
    int? empresaId,
    int? modulosId,
  })  : _id = id,
        _createdAt = createdAt,
        _ultimaModificacao = ultimaModificacao,
        _userCriador = userCriador,
        _descricao = descricao,
        _localdeproducaoId = localdeproducaoId,
        _empresaId = empresaId,
        _modulosId = modulosId;

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

  // "ultimaModificacao" field.
  int? _ultimaModificacao;
  int get ultimaModificacao => _ultimaModificacao ?? 0;
  set ultimaModificacao(int? val) => _ultimaModificacao = val;

  void incrementUltimaModificacao(int amount) =>
      ultimaModificacao = ultimaModificacao + amount;

  bool hasUltimaModificacao() => _ultimaModificacao != null;

  // "userCriador" field.
  int? _userCriador;
  int get userCriador => _userCriador ?? 0;
  set userCriador(int? val) => _userCriador = val;

  void incrementUserCriador(int amount) => userCriador = userCriador + amount;

  bool hasUserCriador() => _userCriador != null;

  // "descricao" field.
  String? _descricao;
  String get descricao => _descricao ?? '';
  set descricao(String? val) => _descricao = val;

  bool hasDescricao() => _descricao != null;

  // "localdeproducao_id" field.
  int? _localdeproducaoId;
  int get localdeproducaoId => _localdeproducaoId ?? 0;
  set localdeproducaoId(int? val) => _localdeproducaoId = val;

  void incrementLocaldeproducaoId(int amount) =>
      localdeproducaoId = localdeproducaoId + amount;

  bool hasLocaldeproducaoId() => _localdeproducaoId != null;

  // "empresa_id" field.
  int? _empresaId;
  int get empresaId => _empresaId ?? 0;
  set empresaId(int? val) => _empresaId = val;

  void incrementEmpresaId(int amount) => empresaId = empresaId + amount;

  bool hasEmpresaId() => _empresaId != null;

  // "modulos_id" field.
  int? _modulosId;
  int get modulosId => _modulosId ?? 0;
  set modulosId(int? val) => _modulosId = val;

  void incrementModulosId(int amount) => modulosId = modulosId + amount;

  bool hasModulosId() => _modulosId != null;

  static DtSubmodulosStruct fromMap(Map<String, dynamic> data) =>
      DtSubmodulosStruct(
        id: castToType<int>(data['id']),
        createdAt: castToType<int>(data['created_at']),
        ultimaModificacao: castToType<int>(data['ultimaModificacao']),
        userCriador: castToType<int>(data['userCriador']),
        descricao: data['descricao'] as String?,
        localdeproducaoId: castToType<int>(data['localdeproducao_id']),
        empresaId: castToType<int>(data['empresa_id']),
        modulosId: castToType<int>(data['modulos_id']),
      );

  static DtSubmodulosStruct? maybeFromMap(dynamic data) => data is Map
      ? DtSubmodulosStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'created_at': _createdAt,
        'ultimaModificacao': _ultimaModificacao,
        'userCriador': _userCriador,
        'descricao': _descricao,
        'localdeproducao_id': _localdeproducaoId,
        'empresa_id': _empresaId,
        'modulos_id': _modulosId,
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
        'ultimaModificacao': serializeParam(
          _ultimaModificacao,
          ParamType.int,
        ),
        'userCriador': serializeParam(
          _userCriador,
          ParamType.int,
        ),
        'descricao': serializeParam(
          _descricao,
          ParamType.String,
        ),
        'localdeproducao_id': serializeParam(
          _localdeproducaoId,
          ParamType.int,
        ),
        'empresa_id': serializeParam(
          _empresaId,
          ParamType.int,
        ),
        'modulos_id': serializeParam(
          _modulosId,
          ParamType.int,
        ),
      }.withoutNulls;

  static DtSubmodulosStruct fromSerializableMap(Map<String, dynamic> data) =>
      DtSubmodulosStruct(
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
        ultimaModificacao: deserializeParam(
          data['ultimaModificacao'],
          ParamType.int,
          false,
        ),
        userCriador: deserializeParam(
          data['userCriador'],
          ParamType.int,
          false,
        ),
        descricao: deserializeParam(
          data['descricao'],
          ParamType.String,
          false,
        ),
        localdeproducaoId: deserializeParam(
          data['localdeproducao_id'],
          ParamType.int,
          false,
        ),
        empresaId: deserializeParam(
          data['empresa_id'],
          ParamType.int,
          false,
        ),
        modulosId: deserializeParam(
          data['modulos_id'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'DtSubmodulosStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DtSubmodulosStruct &&
        id == other.id &&
        createdAt == other.createdAt &&
        ultimaModificacao == other.ultimaModificacao &&
        userCriador == other.userCriador &&
        descricao == other.descricao &&
        localdeproducaoId == other.localdeproducaoId &&
        empresaId == other.empresaId &&
        modulosId == other.modulosId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        createdAt,
        ultimaModificacao,
        userCriador,
        descricao,
        localdeproducaoId,
        empresaId,
        modulosId
      ]);
}

DtSubmodulosStruct createDtSubmodulosStruct({
  int? id,
  int? createdAt,
  int? ultimaModificacao,
  int? userCriador,
  String? descricao,
  int? localdeproducaoId,
  int? empresaId,
  int? modulosId,
}) =>
    DtSubmodulosStruct(
      id: id,
      createdAt: createdAt,
      ultimaModificacao: ultimaModificacao,
      userCriador: userCriador,
      descricao: descricao,
      localdeproducaoId: localdeproducaoId,
      empresaId: empresaId,
      modulosId: modulosId,
    );

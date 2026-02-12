// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DtControleOfflineStruct extends BaseStruct {
  DtControleOfflineStruct({
    int? id,
    int? createdAt,
    int? userId,
    int? localdeproducaoId,
    int? dataSincronizacaoInicial,
    int? dataSincronizacaoFinal,
    int? empresaId,
  })  : _id = id,
        _createdAt = createdAt,
        _userId = userId,
        _localdeproducaoId = localdeproducaoId,
        _dataSincronizacaoInicial = dataSincronizacaoInicial,
        _dataSincronizacaoFinal = dataSincronizacaoFinal,
        _empresaId = empresaId;

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

  // "user_id" field.
  int? _userId;
  int get userId => _userId ?? 0;
  set userId(int? val) => _userId = val;

  void incrementUserId(int amount) => userId = userId + amount;

  bool hasUserId() => _userId != null;

  // "localdeproducao_id" field.
  int? _localdeproducaoId;
  int get localdeproducaoId => _localdeproducaoId ?? 0;
  set localdeproducaoId(int? val) => _localdeproducaoId = val;

  void incrementLocaldeproducaoId(int amount) =>
      localdeproducaoId = localdeproducaoId + amount;

  bool hasLocaldeproducaoId() => _localdeproducaoId != null;

  // "dataSincronizacaoInicial" field.
  int? _dataSincronizacaoInicial;
  int get dataSincronizacaoInicial => _dataSincronizacaoInicial ?? 0;
  set dataSincronizacaoInicial(int? val) => _dataSincronizacaoInicial = val;

  void incrementDataSincronizacaoInicial(int amount) =>
      dataSincronizacaoInicial = dataSincronizacaoInicial + amount;

  bool hasDataSincronizacaoInicial() => _dataSincronizacaoInicial != null;

  // "dataSincronizacaoFinal" field.
  int? _dataSincronizacaoFinal;
  int get dataSincronizacaoFinal => _dataSincronizacaoFinal ?? 0;
  set dataSincronizacaoFinal(int? val) => _dataSincronizacaoFinal = val;

  void incrementDataSincronizacaoFinal(int amount) =>
      dataSincronizacaoFinal = dataSincronizacaoFinal + amount;

  bool hasDataSincronizacaoFinal() => _dataSincronizacaoFinal != null;

  // "empresa_id" field.
  int? _empresaId;
  int get empresaId => _empresaId ?? 0;
  set empresaId(int? val) => _empresaId = val;

  void incrementEmpresaId(int amount) => empresaId = empresaId + amount;

  bool hasEmpresaId() => _empresaId != null;

  static DtControleOfflineStruct fromMap(Map<String, dynamic> data) =>
      DtControleOfflineStruct(
        id: castToType<int>(data['id']),
        createdAt: castToType<int>(data['created_at']),
        userId: castToType<int>(data['user_id']),
        localdeproducaoId: castToType<int>(data['localdeproducao_id']),
        dataSincronizacaoInicial:
            castToType<int>(data['dataSincronizacaoInicial']),
        dataSincronizacaoFinal: castToType<int>(data['dataSincronizacaoFinal']),
        empresaId: castToType<int>(data['empresa_id']),
      );

  static DtControleOfflineStruct? maybeFromMap(dynamic data) => data is Map
      ? DtControleOfflineStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'created_at': _createdAt,
        'user_id': _userId,
        'localdeproducao_id': _localdeproducaoId,
        'dataSincronizacaoInicial': _dataSincronizacaoInicial,
        'dataSincronizacaoFinal': _dataSincronizacaoFinal,
        'empresa_id': _empresaId,
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
        'user_id': serializeParam(
          _userId,
          ParamType.int,
        ),
        'localdeproducao_id': serializeParam(
          _localdeproducaoId,
          ParamType.int,
        ),
        'dataSincronizacaoInicial': serializeParam(
          _dataSincronizacaoInicial,
          ParamType.int,
        ),
        'dataSincronizacaoFinal': serializeParam(
          _dataSincronizacaoFinal,
          ParamType.int,
        ),
        'empresa_id': serializeParam(
          _empresaId,
          ParamType.int,
        ),
      }.withoutNulls;

  static DtControleOfflineStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      DtControleOfflineStruct(
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
        userId: deserializeParam(
          data['user_id'],
          ParamType.int,
          false,
        ),
        localdeproducaoId: deserializeParam(
          data['localdeproducao_id'],
          ParamType.int,
          false,
        ),
        dataSincronizacaoInicial: deserializeParam(
          data['dataSincronizacaoInicial'],
          ParamType.int,
          false,
        ),
        dataSincronizacaoFinal: deserializeParam(
          data['dataSincronizacaoFinal'],
          ParamType.int,
          false,
        ),
        empresaId: deserializeParam(
          data['empresa_id'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'DtControleOfflineStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DtControleOfflineStruct &&
        id == other.id &&
        createdAt == other.createdAt &&
        userId == other.userId &&
        localdeproducaoId == other.localdeproducaoId &&
        dataSincronizacaoInicial == other.dataSincronizacaoInicial &&
        dataSincronizacaoFinal == other.dataSincronizacaoFinal &&
        empresaId == other.empresaId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        createdAt,
        userId,
        localdeproducaoId,
        dataSincronizacaoInicial,
        dataSincronizacaoFinal,
        empresaId
      ]);
}

DtControleOfflineStruct createDtControleOfflineStruct({
  int? id,
  int? createdAt,
  int? userId,
  int? localdeproducaoId,
  int? dataSincronizacaoInicial,
  int? dataSincronizacaoFinal,
  int? empresaId,
}) =>
    DtControleOfflineStruct(
      id: id,
      createdAt: createdAt,
      userId: userId,
      localdeproducaoId: localdeproducaoId,
      dataSincronizacaoInicial: dataSincronizacaoInicial,
      dataSincronizacaoFinal: dataSincronizacaoFinal,
      empresaId: empresaId,
    );

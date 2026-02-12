// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DtProblemaRecorrenteStruct extends BaseStruct {
  DtProblemaRecorrenteStruct({
    int? id,
    int? createdAt,
    int? ultimaModificacao,
    bool? isDelete,
    String? descricao,
    int? empresaId,
  })  : _id = id,
        _createdAt = createdAt,
        _ultimaModificacao = ultimaModificacao,
        _isDelete = isDelete,
        _descricao = descricao,
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

  // "ultimaModificacao" field.
  int? _ultimaModificacao;
  int get ultimaModificacao => _ultimaModificacao ?? 0;
  set ultimaModificacao(int? val) => _ultimaModificacao = val;

  void incrementUltimaModificacao(int amount) =>
      ultimaModificacao = ultimaModificacao + amount;

  bool hasUltimaModificacao() => _ultimaModificacao != null;

  // "isDelete" field.
  bool? _isDelete;
  bool get isDelete => _isDelete ?? false;
  set isDelete(bool? val) => _isDelete = val;

  bool hasIsDelete() => _isDelete != null;

  // "descricao" field.
  String? _descricao;
  String get descricao => _descricao ?? '';
  set descricao(String? val) => _descricao = val;

  bool hasDescricao() => _descricao != null;

  // "empresa_id" field.
  int? _empresaId;
  int get empresaId => _empresaId ?? 0;
  set empresaId(int? val) => _empresaId = val;

  void incrementEmpresaId(int amount) => empresaId = empresaId + amount;

  bool hasEmpresaId() => _empresaId != null;

  static DtProblemaRecorrenteStruct fromMap(Map<String, dynamic> data) =>
      DtProblemaRecorrenteStruct(
        id: castToType<int>(data['id']),
        createdAt: castToType<int>(data['created_at']),
        ultimaModificacao: castToType<int>(data['ultimaModificacao']),
        isDelete: data['isDelete'] as bool?,
        descricao: data['descricao'] as String?,
        empresaId: castToType<int>(data['empresa_id']),
      );

  static DtProblemaRecorrenteStruct? maybeFromMap(dynamic data) => data is Map
      ? DtProblemaRecorrenteStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'created_at': _createdAt,
        'ultimaModificacao': _ultimaModificacao,
        'isDelete': _isDelete,
        'descricao': _descricao,
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
        'ultimaModificacao': serializeParam(
          _ultimaModificacao,
          ParamType.int,
        ),
        'isDelete': serializeParam(
          _isDelete,
          ParamType.bool,
        ),
        'descricao': serializeParam(
          _descricao,
          ParamType.String,
        ),
        'empresa_id': serializeParam(
          _empresaId,
          ParamType.int,
        ),
      }.withoutNulls;

  static DtProblemaRecorrenteStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      DtProblemaRecorrenteStruct(
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
        isDelete: deserializeParam(
          data['isDelete'],
          ParamType.bool,
          false,
        ),
        descricao: deserializeParam(
          data['descricao'],
          ParamType.String,
          false,
        ),
        empresaId: deserializeParam(
          data['empresa_id'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'DtProblemaRecorrenteStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DtProblemaRecorrenteStruct &&
        id == other.id &&
        createdAt == other.createdAt &&
        ultimaModificacao == other.ultimaModificacao &&
        isDelete == other.isDelete &&
        descricao == other.descricao &&
        empresaId == other.empresaId;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, createdAt, ultimaModificacao, isDelete, descricao, empresaId]);
}

DtProblemaRecorrenteStruct createDtProblemaRecorrenteStruct({
  int? id,
  int? createdAt,
  int? ultimaModificacao,
  bool? isDelete,
  String? descricao,
  int? empresaId,
}) =>
    DtProblemaRecorrenteStruct(
      id: id,
      createdAt: createdAt,
      ultimaModificacao: ultimaModificacao,
      isDelete: isDelete,
      descricao: descricao,
      empresaId: empresaId,
    );

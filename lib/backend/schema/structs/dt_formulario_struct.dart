// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DtFormularioStruct extends BaseStruct {
  DtFormularioStruct({
    int? id,
    int? createdAt,
    int? ultimaModificacao,
    int? userCriador,
    String? descricao,
    String? enCategoriaFormulario,
    int? empresaId,
    int? submodulosId,
    int? localdeproducaoId,
  })  : _id = id,
        _createdAt = createdAt,
        _ultimaModificacao = ultimaModificacao,
        _userCriador = userCriador,
        _descricao = descricao,
        _enCategoriaFormulario = enCategoriaFormulario,
        _empresaId = empresaId,
        _submodulosId = submodulosId,
        _localdeproducaoId = localdeproducaoId;

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

  // "en_categoriaFormulario" field.
  String? _enCategoriaFormulario;
  String get enCategoriaFormulario => _enCategoriaFormulario ?? '';
  set enCategoriaFormulario(String? val) => _enCategoriaFormulario = val;

  bool hasEnCategoriaFormulario() => _enCategoriaFormulario != null;

  // "empresa_id" field.
  int? _empresaId;
  int get empresaId => _empresaId ?? 0;
  set empresaId(int? val) => _empresaId = val;

  void incrementEmpresaId(int amount) => empresaId = empresaId + amount;

  bool hasEmpresaId() => _empresaId != null;

  // "submodulos_id" field.
  int? _submodulosId;
  int get submodulosId => _submodulosId ?? 0;
  set submodulosId(int? val) => _submodulosId = val;

  void incrementSubmodulosId(int amount) =>
      submodulosId = submodulosId + amount;

  bool hasSubmodulosId() => _submodulosId != null;

  // "localdeproducao_id" field.
  int? _localdeproducaoId;
  int get localdeproducaoId => _localdeproducaoId ?? 0;
  set localdeproducaoId(int? val) => _localdeproducaoId = val;

  void incrementLocaldeproducaoId(int amount) =>
      localdeproducaoId = localdeproducaoId + amount;

  bool hasLocaldeproducaoId() => _localdeproducaoId != null;

  static DtFormularioStruct fromMap(Map<String, dynamic> data) =>
      DtFormularioStruct(
        id: castToType<int>(data['id']),
        createdAt: castToType<int>(data['created_at']),
        ultimaModificacao: castToType<int>(data['ultimaModificacao']),
        userCriador: castToType<int>(data['userCriador']),
        descricao: data['descricao'] as String?,
        enCategoriaFormulario: data['en_categoriaFormulario'] as String?,
        empresaId: castToType<int>(data['empresa_id']),
        submodulosId: castToType<int>(data['submodulos_id']),
        localdeproducaoId: castToType<int>(data['localdeproducao_id']),
      );

  static DtFormularioStruct? maybeFromMap(dynamic data) => data is Map
      ? DtFormularioStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'created_at': _createdAt,
        'ultimaModificacao': _ultimaModificacao,
        'userCriador': _userCriador,
        'descricao': _descricao,
        'en_categoriaFormulario': _enCategoriaFormulario,
        'empresa_id': _empresaId,
        'submodulos_id': _submodulosId,
        'localdeproducao_id': _localdeproducaoId,
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
        'en_categoriaFormulario': serializeParam(
          _enCategoriaFormulario,
          ParamType.String,
        ),
        'empresa_id': serializeParam(
          _empresaId,
          ParamType.int,
        ),
        'submodulos_id': serializeParam(
          _submodulosId,
          ParamType.int,
        ),
        'localdeproducao_id': serializeParam(
          _localdeproducaoId,
          ParamType.int,
        ),
      }.withoutNulls;

  static DtFormularioStruct fromSerializableMap(Map<String, dynamic> data) =>
      DtFormularioStruct(
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
        enCategoriaFormulario: deserializeParam(
          data['en_categoriaFormulario'],
          ParamType.String,
          false,
        ),
        empresaId: deserializeParam(
          data['empresa_id'],
          ParamType.int,
          false,
        ),
        submodulosId: deserializeParam(
          data['submodulos_id'],
          ParamType.int,
          false,
        ),
        localdeproducaoId: deserializeParam(
          data['localdeproducao_id'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'DtFormularioStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DtFormularioStruct &&
        id == other.id &&
        createdAt == other.createdAt &&
        ultimaModificacao == other.ultimaModificacao &&
        userCriador == other.userCriador &&
        descricao == other.descricao &&
        enCategoriaFormulario == other.enCategoriaFormulario &&
        empresaId == other.empresaId &&
        submodulosId == other.submodulosId &&
        localdeproducaoId == other.localdeproducaoId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        createdAt,
        ultimaModificacao,
        userCriador,
        descricao,
        enCategoriaFormulario,
        empresaId,
        submodulosId,
        localdeproducaoId
      ]);
}

DtFormularioStruct createDtFormularioStruct({
  int? id,
  int? createdAt,
  int? ultimaModificacao,
  int? userCriador,
  String? descricao,
  String? enCategoriaFormulario,
  int? empresaId,
  int? submodulosId,
  int? localdeproducaoId,
}) =>
    DtFormularioStruct(
      id: id,
      createdAt: createdAt,
      ultimaModificacao: ultimaModificacao,
      userCriador: userCriador,
      descricao: descricao,
      enCategoriaFormulario: enCategoriaFormulario,
      empresaId: empresaId,
      submodulosId: submodulosId,
      localdeproducaoId: localdeproducaoId,
    );

// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DtControladoStruct extends BaseStruct {
  DtControladoStruct({
    int? id,
    int? createdAt,
    int? ultimaModificacao,
    int? userCriador,
    bool? isDeletado,
    String? descricaoConformidade,
    String? descricao,
    int? empresaId,
    String? enPeriodicidade,
    String? enSubsetor,
    List<int>? fornecedoresId,
    double? valorHora,
    String? enControlado,
  })  : _id = id,
        _createdAt = createdAt,
        _ultimaModificacao = ultimaModificacao,
        _userCriador = userCriador,
        _isDeletado = isDeletado,
        _descricaoConformidade = descricaoConformidade,
        _descricao = descricao,
        _empresaId = empresaId,
        _enPeriodicidade = enPeriodicidade,
        _enSubsetor = enSubsetor,
        _fornecedoresId = fornecedoresId,
        _valorHora = valorHora,
        _enControlado = enControlado;

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

  // "isDeletado" field.
  bool? _isDeletado;
  bool get isDeletado => _isDeletado ?? false;
  set isDeletado(bool? val) => _isDeletado = val;

  bool hasIsDeletado() => _isDeletado != null;

  // "descricaoConformidade" field.
  String? _descricaoConformidade;
  String get descricaoConformidade => _descricaoConformidade ?? '';
  set descricaoConformidade(String? val) => _descricaoConformidade = val;

  bool hasDescricaoConformidade() => _descricaoConformidade != null;

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

  // "en_periodicidade" field.
  String? _enPeriodicidade;
  String get enPeriodicidade => _enPeriodicidade ?? '';
  set enPeriodicidade(String? val) => _enPeriodicidade = val;

  bool hasEnPeriodicidade() => _enPeriodicidade != null;

  // "en_subsetor" field.
  String? _enSubsetor;
  String get enSubsetor => _enSubsetor ?? '';
  set enSubsetor(String? val) => _enSubsetor = val;

  bool hasEnSubsetor() => _enSubsetor != null;

  // "fornecedores_id" field.
  List<int>? _fornecedoresId;
  List<int> get fornecedoresId => _fornecedoresId ?? const [];
  set fornecedoresId(List<int>? val) => _fornecedoresId = val;

  void updateFornecedoresId(Function(List<int>) updateFn) {
    updateFn(_fornecedoresId ??= []);
  }

  bool hasFornecedoresId() => _fornecedoresId != null;

  // "valorHora" field.
  double? _valorHora;
  double get valorHora => _valorHora ?? 0.0;
  set valorHora(double? val) => _valorHora = val;

  void incrementValorHora(double amount) => valorHora = valorHora + amount;

  bool hasValorHora() => _valorHora != null;

  // "en_controlado" field.
  String? _enControlado;
  String get enControlado => _enControlado ?? '';
  set enControlado(String? val) => _enControlado = val;

  bool hasEnControlado() => _enControlado != null;

  static DtControladoStruct fromMap(Map<String, dynamic> data) =>
      DtControladoStruct(
        id: castToType<int>(data['id']),
        createdAt: castToType<int>(data['created_at']),
        ultimaModificacao: castToType<int>(data['ultimaModificacao']),
        userCriador: castToType<int>(data['userCriador']),
        isDeletado: data['isDeletado'] as bool?,
        descricaoConformidade: data['descricaoConformidade'] as String?,
        descricao: data['descricao'] as String?,
        empresaId: castToType<int>(data['empresa_id']),
        enPeriodicidade: data['en_periodicidade'] as String?,
        enSubsetor: data['en_subsetor'] as String?,
        fornecedoresId: getDataList(data['fornecedores_id']),
        valorHora: castToType<double>(data['valorHora']),
        enControlado: data['en_controlado'] as String?,
      );

  static DtControladoStruct? maybeFromMap(dynamic data) => data is Map
      ? DtControladoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'created_at': _createdAt,
        'ultimaModificacao': _ultimaModificacao,
        'userCriador': _userCriador,
        'isDeletado': _isDeletado,
        'descricaoConformidade': _descricaoConformidade,
        'descricao': _descricao,
        'empresa_id': _empresaId,
        'en_periodicidade': _enPeriodicidade,
        'en_subsetor': _enSubsetor,
        'fornecedores_id': _fornecedoresId,
        'valorHora': _valorHora,
        'en_controlado': _enControlado,
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
        'isDeletado': serializeParam(
          _isDeletado,
          ParamType.bool,
        ),
        'descricaoConformidade': serializeParam(
          _descricaoConformidade,
          ParamType.String,
        ),
        'descricao': serializeParam(
          _descricao,
          ParamType.String,
        ),
        'empresa_id': serializeParam(
          _empresaId,
          ParamType.int,
        ),
        'en_periodicidade': serializeParam(
          _enPeriodicidade,
          ParamType.String,
        ),
        'en_subsetor': serializeParam(
          _enSubsetor,
          ParamType.String,
        ),
        'fornecedores_id': serializeParam(
          _fornecedoresId,
          ParamType.int,
          isList: true,
        ),
        'valorHora': serializeParam(
          _valorHora,
          ParamType.double,
        ),
        'en_controlado': serializeParam(
          _enControlado,
          ParamType.String,
        ),
      }.withoutNulls;

  static DtControladoStruct fromSerializableMap(Map<String, dynamic> data) =>
      DtControladoStruct(
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
        isDeletado: deserializeParam(
          data['isDeletado'],
          ParamType.bool,
          false,
        ),
        descricaoConformidade: deserializeParam(
          data['descricaoConformidade'],
          ParamType.String,
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
        enPeriodicidade: deserializeParam(
          data['en_periodicidade'],
          ParamType.String,
          false,
        ),
        enSubsetor: deserializeParam(
          data['en_subsetor'],
          ParamType.String,
          false,
        ),
        fornecedoresId: deserializeParam<int>(
          data['fornecedores_id'],
          ParamType.int,
          true,
        ),
        valorHora: deserializeParam(
          data['valorHora'],
          ParamType.double,
          false,
        ),
        enControlado: deserializeParam(
          data['en_controlado'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DtControladoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DtControladoStruct &&
        id == other.id &&
        createdAt == other.createdAt &&
        ultimaModificacao == other.ultimaModificacao &&
        userCriador == other.userCriador &&
        isDeletado == other.isDeletado &&
        descricaoConformidade == other.descricaoConformidade &&
        descricao == other.descricao &&
        empresaId == other.empresaId &&
        enPeriodicidade == other.enPeriodicidade &&
        enSubsetor == other.enSubsetor &&
        listEquality.equals(fornecedoresId, other.fornecedoresId) &&
        valorHora == other.valorHora &&
        enControlado == other.enControlado;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        createdAt,
        ultimaModificacao,
        userCriador,
        isDeletado,
        descricaoConformidade,
        descricao,
        empresaId,
        enPeriodicidade,
        enSubsetor,
        fornecedoresId,
        valorHora,
        enControlado
      ]);
}

DtControladoStruct createDtControladoStruct({
  int? id,
  int? createdAt,
  int? ultimaModificacao,
  int? userCriador,
  bool? isDeletado,
  String? descricaoConformidade,
  String? descricao,
  int? empresaId,
  String? enPeriodicidade,
  String? enSubsetor,
  double? valorHora,
  String? enControlado,
}) =>
    DtControladoStruct(
      id: id,
      createdAt: createdAt,
      ultimaModificacao: ultimaModificacao,
      userCriador: userCriador,
      isDeletado: isDeletado,
      descricaoConformidade: descricaoConformidade,
      descricao: descricao,
      empresaId: empresaId,
      enPeriodicidade: enPeriodicidade,
      enSubsetor: enSubsetor,
      valorHora: valorHora,
      enControlado: enControlado,
    );

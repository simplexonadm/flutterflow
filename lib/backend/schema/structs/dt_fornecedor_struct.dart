// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DtFornecedorStruct extends BaseStruct {
  DtFornecedorStruct({
    int? id,
    int? createdAt,
    int? ultimaModificacao,
    int? userCriador,
    String? descricao,
    int? empresaId,
    String? enCategoria,
    String? contato,
    bool? isDeletado,
    String? email,
    String? inscricaoEstadual,
    List<int>? controladoId,
    List<double>? demerito,
  })  : _id = id,
        _createdAt = createdAt,
        _ultimaModificacao = ultimaModificacao,
        _userCriador = userCriador,
        _descricao = descricao,
        _empresaId = empresaId,
        _enCategoria = enCategoria,
        _contato = contato,
        _isDeletado = isDeletado,
        _email = email,
        _inscricaoEstadual = inscricaoEstadual,
        _controladoId = controladoId,
        _demerito = demerito;

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

  // "empresa_id" field.
  int? _empresaId;
  int get empresaId => _empresaId ?? 0;
  set empresaId(int? val) => _empresaId = val;

  void incrementEmpresaId(int amount) => empresaId = empresaId + amount;

  bool hasEmpresaId() => _empresaId != null;

  // "en_categoria" field.
  String? _enCategoria;
  String get enCategoria => _enCategoria ?? '';
  set enCategoria(String? val) => _enCategoria = val;

  bool hasEnCategoria() => _enCategoria != null;

  // "contato" field.
  String? _contato;
  String get contato => _contato ?? '';
  set contato(String? val) => _contato = val;

  bool hasContato() => _contato != null;

  // "isDeletado" field.
  bool? _isDeletado;
  bool get isDeletado => _isDeletado ?? false;
  set isDeletado(bool? val) => _isDeletado = val;

  bool hasIsDeletado() => _isDeletado != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "inscricao_estadual" field.
  String? _inscricaoEstadual;
  String get inscricaoEstadual => _inscricaoEstadual ?? '';
  set inscricaoEstadual(String? val) => _inscricaoEstadual = val;

  bool hasInscricaoEstadual() => _inscricaoEstadual != null;

  // "controlado_id" field.
  List<int>? _controladoId;
  List<int> get controladoId => _controladoId ?? const [];
  set controladoId(List<int>? val) => _controladoId = val;

  void updateControladoId(Function(List<int>) updateFn) {
    updateFn(_controladoId ??= []);
  }

  bool hasControladoId() => _controladoId != null;

  // "demerito" field.
  List<double>? _demerito;
  List<double> get demerito => _demerito ?? const [];
  set demerito(List<double>? val) => _demerito = val;

  void updateDemerito(Function(List<double>) updateFn) {
    updateFn(_demerito ??= []);
  }

  bool hasDemerito() => _demerito != null;

  static DtFornecedorStruct fromMap(Map<String, dynamic> data) =>
      DtFornecedorStruct(
        id: castToType<int>(data['id']),
        createdAt: castToType<int>(data['created_at']),
        ultimaModificacao: castToType<int>(data['ultimaModificacao']),
        userCriador: castToType<int>(data['userCriador']),
        descricao: data['descricao'] as String?,
        empresaId: castToType<int>(data['empresa_id']),
        enCategoria: data['en_categoria'] as String?,
        contato: data['contato'] as String?,
        isDeletado: data['isDeletado'] as bool?,
        email: data['email'] as String?,
        inscricaoEstadual: data['inscricao_estadual'] as String?,
        controladoId: getDataList(data['controlado_id']),
        demerito: getDataList(data['demerito']),
      );

  static DtFornecedorStruct? maybeFromMap(dynamic data) => data is Map
      ? DtFornecedorStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'created_at': _createdAt,
        'ultimaModificacao': _ultimaModificacao,
        'userCriador': _userCriador,
        'descricao': _descricao,
        'empresa_id': _empresaId,
        'en_categoria': _enCategoria,
        'contato': _contato,
        'isDeletado': _isDeletado,
        'email': _email,
        'inscricao_estadual': _inscricaoEstadual,
        'controlado_id': _controladoId,
        'demerito': _demerito,
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
        'empresa_id': serializeParam(
          _empresaId,
          ParamType.int,
        ),
        'en_categoria': serializeParam(
          _enCategoria,
          ParamType.String,
        ),
        'contato': serializeParam(
          _contato,
          ParamType.String,
        ),
        'isDeletado': serializeParam(
          _isDeletado,
          ParamType.bool,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'inscricao_estadual': serializeParam(
          _inscricaoEstadual,
          ParamType.String,
        ),
        'controlado_id': serializeParam(
          _controladoId,
          ParamType.int,
          isList: true,
        ),
        'demerito': serializeParam(
          _demerito,
          ParamType.double,
          isList: true,
        ),
      }.withoutNulls;

  static DtFornecedorStruct fromSerializableMap(Map<String, dynamic> data) =>
      DtFornecedorStruct(
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
        empresaId: deserializeParam(
          data['empresa_id'],
          ParamType.int,
          false,
        ),
        enCategoria: deserializeParam(
          data['en_categoria'],
          ParamType.String,
          false,
        ),
        contato: deserializeParam(
          data['contato'],
          ParamType.String,
          false,
        ),
        isDeletado: deserializeParam(
          data['isDeletado'],
          ParamType.bool,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        inscricaoEstadual: deserializeParam(
          data['inscricao_estadual'],
          ParamType.String,
          false,
        ),
        controladoId: deserializeParam<int>(
          data['controlado_id'],
          ParamType.int,
          true,
        ),
        demerito: deserializeParam<double>(
          data['demerito'],
          ParamType.double,
          true,
        ),
      );

  @override
  String toString() => 'DtFornecedorStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DtFornecedorStruct &&
        id == other.id &&
        createdAt == other.createdAt &&
        ultimaModificacao == other.ultimaModificacao &&
        userCriador == other.userCriador &&
        descricao == other.descricao &&
        empresaId == other.empresaId &&
        enCategoria == other.enCategoria &&
        contato == other.contato &&
        isDeletado == other.isDeletado &&
        email == other.email &&
        inscricaoEstadual == other.inscricaoEstadual &&
        listEquality.equals(controladoId, other.controladoId) &&
        listEquality.equals(demerito, other.demerito);
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        createdAt,
        ultimaModificacao,
        userCriador,
        descricao,
        empresaId,
        enCategoria,
        contato,
        isDeletado,
        email,
        inscricaoEstadual,
        controladoId,
        demerito
      ]);
}

DtFornecedorStruct createDtFornecedorStruct({
  int? id,
  int? createdAt,
  int? ultimaModificacao,
  int? userCriador,
  String? descricao,
  int? empresaId,
  String? enCategoria,
  String? contato,
  bool? isDeletado,
  String? email,
  String? inscricaoEstadual,
}) =>
    DtFornecedorStruct(
      id: id,
      createdAt: createdAt,
      ultimaModificacao: ultimaModificacao,
      userCriador: userCriador,
      descricao: descricao,
      empresaId: empresaId,
      enCategoria: enCategoria,
      contato: contato,
      isDeletado: isDeletado,
      email: email,
      inscricaoEstadual: inscricaoEstadual,
    );

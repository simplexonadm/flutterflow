// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DtLocalDeProducaoStruct extends BaseStruct {
  DtLocalDeProducaoStruct({
    int? id,
    int? createdAt,
    int? ultimaCriacao,
    int? userCriador,
    double? demeritoMaximo,
    double? rendimento,
    double? tolerancia,
    double? cargaDisponivel,
    String? cei,
    String? cnpj,
    String? nome,
    String? logo,
    int? empresaId,
    bool? isSincronizado,
  })  : _id = id,
        _createdAt = createdAt,
        _ultimaCriacao = ultimaCriacao,
        _userCriador = userCriador,
        _demeritoMaximo = demeritoMaximo,
        _rendimento = rendimento,
        _tolerancia = tolerancia,
        _cargaDisponivel = cargaDisponivel,
        _cei = cei,
        _cnpj = cnpj,
        _nome = nome,
        _logo = logo,
        _empresaId = empresaId,
        _isSincronizado = isSincronizado;

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

  // "demeritoMaximo" field.
  double? _demeritoMaximo;
  double get demeritoMaximo => _demeritoMaximo ?? 0.0;
  set demeritoMaximo(double? val) => _demeritoMaximo = val;

  void incrementDemeritoMaximo(double amount) =>
      demeritoMaximo = demeritoMaximo + amount;

  bool hasDemeritoMaximo() => _demeritoMaximo != null;

  // "rendimento" field.
  double? _rendimento;
  double get rendimento => _rendimento ?? 0.0;
  set rendimento(double? val) => _rendimento = val;

  void incrementRendimento(double amount) => rendimento = rendimento + amount;

  bool hasRendimento() => _rendimento != null;

  // "tolerancia" field.
  double? _tolerancia;
  double get tolerancia => _tolerancia ?? 0.0;
  set tolerancia(double? val) => _tolerancia = val;

  void incrementTolerancia(double amount) => tolerancia = tolerancia + amount;

  bool hasTolerancia() => _tolerancia != null;

  // "cargaDisponivel" field.
  double? _cargaDisponivel;
  double get cargaDisponivel => _cargaDisponivel ?? 0.0;
  set cargaDisponivel(double? val) => _cargaDisponivel = val;

  void incrementCargaDisponivel(double amount) =>
      cargaDisponivel = cargaDisponivel + amount;

  bool hasCargaDisponivel() => _cargaDisponivel != null;

  // "cei" field.
  String? _cei;
  String get cei => _cei ?? '';
  set cei(String? val) => _cei = val;

  bool hasCei() => _cei != null;

  // "cnpj" field.
  String? _cnpj;
  String get cnpj => _cnpj ?? '';
  set cnpj(String? val) => _cnpj = val;

  bool hasCnpj() => _cnpj != null;

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  set nome(String? val) => _nome = val;

  bool hasNome() => _nome != null;

  // "logo" field.
  String? _logo;
  String get logo => _logo ?? '';
  set logo(String? val) => _logo = val;

  bool hasLogo() => _logo != null;

  // "empresa_id" field.
  int? _empresaId;
  int get empresaId => _empresaId ?? 0;
  set empresaId(int? val) => _empresaId = val;

  void incrementEmpresaId(int amount) => empresaId = empresaId + amount;

  bool hasEmpresaId() => _empresaId != null;

  // "isSincronizado" field.
  bool? _isSincronizado;
  bool get isSincronizado => _isSincronizado ?? false;
  set isSincronizado(bool? val) => _isSincronizado = val;

  bool hasIsSincronizado() => _isSincronizado != null;

  static DtLocalDeProducaoStruct fromMap(Map<String, dynamic> data) =>
      DtLocalDeProducaoStruct(
        id: castToType<int>(data['id']),
        createdAt: castToType<int>(data['created_at']),
        ultimaCriacao: castToType<int>(data['ultimaCriacao']),
        userCriador: castToType<int>(data['userCriador']),
        demeritoMaximo: castToType<double>(data['demeritoMaximo']),
        rendimento: castToType<double>(data['rendimento']),
        tolerancia: castToType<double>(data['tolerancia']),
        cargaDisponivel: castToType<double>(data['cargaDisponivel']),
        cei: data['cei'] as String?,
        cnpj: data['cnpj'] as String?,
        nome: data['nome'] as String?,
        logo: data['logo'] as String?,
        empresaId: castToType<int>(data['empresa_id']),
        isSincronizado: data['isSincronizado'] as bool?,
      );

  static DtLocalDeProducaoStruct? maybeFromMap(dynamic data) => data is Map
      ? DtLocalDeProducaoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'created_at': _createdAt,
        'ultimaCriacao': _ultimaCriacao,
        'userCriador': _userCriador,
        'demeritoMaximo': _demeritoMaximo,
        'rendimento': _rendimento,
        'tolerancia': _tolerancia,
        'cargaDisponivel': _cargaDisponivel,
        'cei': _cei,
        'cnpj': _cnpj,
        'nome': _nome,
        'logo': _logo,
        'empresa_id': _empresaId,
        'isSincronizado': _isSincronizado,
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
        'demeritoMaximo': serializeParam(
          _demeritoMaximo,
          ParamType.double,
        ),
        'rendimento': serializeParam(
          _rendimento,
          ParamType.double,
        ),
        'tolerancia': serializeParam(
          _tolerancia,
          ParamType.double,
        ),
        'cargaDisponivel': serializeParam(
          _cargaDisponivel,
          ParamType.double,
        ),
        'cei': serializeParam(
          _cei,
          ParamType.String,
        ),
        'cnpj': serializeParam(
          _cnpj,
          ParamType.String,
        ),
        'nome': serializeParam(
          _nome,
          ParamType.String,
        ),
        'logo': serializeParam(
          _logo,
          ParamType.String,
        ),
        'empresa_id': serializeParam(
          _empresaId,
          ParamType.int,
        ),
        'isSincronizado': serializeParam(
          _isSincronizado,
          ParamType.bool,
        ),
      }.withoutNulls;

  static DtLocalDeProducaoStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      DtLocalDeProducaoStruct(
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
        demeritoMaximo: deserializeParam(
          data['demeritoMaximo'],
          ParamType.double,
          false,
        ),
        rendimento: deserializeParam(
          data['rendimento'],
          ParamType.double,
          false,
        ),
        tolerancia: deserializeParam(
          data['tolerancia'],
          ParamType.double,
          false,
        ),
        cargaDisponivel: deserializeParam(
          data['cargaDisponivel'],
          ParamType.double,
          false,
        ),
        cei: deserializeParam(
          data['cei'],
          ParamType.String,
          false,
        ),
        cnpj: deserializeParam(
          data['cnpj'],
          ParamType.String,
          false,
        ),
        nome: deserializeParam(
          data['nome'],
          ParamType.String,
          false,
        ),
        logo: deserializeParam(
          data['logo'],
          ParamType.String,
          false,
        ),
        empresaId: deserializeParam(
          data['empresa_id'],
          ParamType.int,
          false,
        ),
        isSincronizado: deserializeParam(
          data['isSincronizado'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'DtLocalDeProducaoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DtLocalDeProducaoStruct &&
        id == other.id &&
        createdAt == other.createdAt &&
        ultimaCriacao == other.ultimaCriacao &&
        userCriador == other.userCriador &&
        demeritoMaximo == other.demeritoMaximo &&
        rendimento == other.rendimento &&
        tolerancia == other.tolerancia &&
        cargaDisponivel == other.cargaDisponivel &&
        cei == other.cei &&
        cnpj == other.cnpj &&
        nome == other.nome &&
        logo == other.logo &&
        empresaId == other.empresaId &&
        isSincronizado == other.isSincronizado;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        createdAt,
        ultimaCriacao,
        userCriador,
        demeritoMaximo,
        rendimento,
        tolerancia,
        cargaDisponivel,
        cei,
        cnpj,
        nome,
        logo,
        empresaId,
        isSincronizado
      ]);
}

DtLocalDeProducaoStruct createDtLocalDeProducaoStruct({
  int? id,
  int? createdAt,
  int? ultimaCriacao,
  int? userCriador,
  double? demeritoMaximo,
  double? rendimento,
  double? tolerancia,
  double? cargaDisponivel,
  String? cei,
  String? cnpj,
  String? nome,
  String? logo,
  int? empresaId,
  bool? isSincronizado,
}) =>
    DtLocalDeProducaoStruct(
      id: id,
      createdAt: createdAt,
      ultimaCriacao: ultimaCriacao,
      userCriador: userCriador,
      demeritoMaximo: demeritoMaximo,
      rendimento: rendimento,
      tolerancia: tolerancia,
      cargaDisponivel: cargaDisponivel,
      cei: cei,
      cnpj: cnpj,
      nome: nome,
      logo: logo,
      empresaId: empresaId,
      isSincronizado: isSincronizado,
    );

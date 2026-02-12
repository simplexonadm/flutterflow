// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DtEmpresaStruct extends BaseStruct {
  DtEmpresaStruct({
    int? id,
    int? createdAt,
    int? userCriador,
    int? ultimaModificacao,
    String? nome,
    int? userPrincipal,
    String? logo,
    String? cnpj,
    String? inscricaoEstadual,
    bool? isDesativado,
    String? contato,
    DtEnderecoStruct? dtEndereco,
  })  : _id = id,
        _createdAt = createdAt,
        _userCriador = userCriador,
        _ultimaModificacao = ultimaModificacao,
        _nome = nome,
        _userPrincipal = userPrincipal,
        _logo = logo,
        _cnpj = cnpj,
        _inscricaoEstadual = inscricaoEstadual,
        _isDesativado = isDesativado,
        _contato = contato,
        _dtEndereco = dtEndereco;

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

  // "userCriador" field.
  int? _userCriador;
  int get userCriador => _userCriador ?? 0;
  set userCriador(int? val) => _userCriador = val;

  void incrementUserCriador(int amount) => userCriador = userCriador + amount;

  bool hasUserCriador() => _userCriador != null;

  // "ultimaModificacao" field.
  int? _ultimaModificacao;
  int get ultimaModificacao => _ultimaModificacao ?? 0;
  set ultimaModificacao(int? val) => _ultimaModificacao = val;

  void incrementUltimaModificacao(int amount) =>
      ultimaModificacao = ultimaModificacao + amount;

  bool hasUltimaModificacao() => _ultimaModificacao != null;

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  set nome(String? val) => _nome = val;

  bool hasNome() => _nome != null;

  // "userPrincipal" field.
  int? _userPrincipal;
  int get userPrincipal => _userPrincipal ?? 0;
  set userPrincipal(int? val) => _userPrincipal = val;

  void incrementUserPrincipal(int amount) =>
      userPrincipal = userPrincipal + amount;

  bool hasUserPrincipal() => _userPrincipal != null;

  // "logo" field.
  String? _logo;
  String get logo => _logo ?? '';
  set logo(String? val) => _logo = val;

  bool hasLogo() => _logo != null;

  // "cnpj" field.
  String? _cnpj;
  String get cnpj => _cnpj ?? '';
  set cnpj(String? val) => _cnpj = val;

  bool hasCnpj() => _cnpj != null;

  // "inscricaoEstadual" field.
  String? _inscricaoEstadual;
  String get inscricaoEstadual => _inscricaoEstadual ?? '';
  set inscricaoEstadual(String? val) => _inscricaoEstadual = val;

  bool hasInscricaoEstadual() => _inscricaoEstadual != null;

  // "isDesativado" field.
  bool? _isDesativado;
  bool get isDesativado => _isDesativado ?? false;
  set isDesativado(bool? val) => _isDesativado = val;

  bool hasIsDesativado() => _isDesativado != null;

  // "contato" field.
  String? _contato;
  String get contato => _contato ?? '';
  set contato(String? val) => _contato = val;

  bool hasContato() => _contato != null;

  // "dtEndereco" field.
  DtEnderecoStruct? _dtEndereco;
  DtEnderecoStruct get dtEndereco => _dtEndereco ?? DtEnderecoStruct();
  set dtEndereco(DtEnderecoStruct? val) => _dtEndereco = val;

  void updateDtEndereco(Function(DtEnderecoStruct) updateFn) {
    updateFn(_dtEndereco ??= DtEnderecoStruct());
  }

  bool hasDtEndereco() => _dtEndereco != null;

  static DtEmpresaStruct fromMap(Map<String, dynamic> data) => DtEmpresaStruct(
        id: castToType<int>(data['id']),
        createdAt: castToType<int>(data['created_at']),
        userCriador: castToType<int>(data['userCriador']),
        ultimaModificacao: castToType<int>(data['ultimaModificacao']),
        nome: data['nome'] as String?,
        userPrincipal: castToType<int>(data['userPrincipal']),
        logo: data['logo'] as String?,
        cnpj: data['cnpj'] as String?,
        inscricaoEstadual: data['inscricaoEstadual'] as String?,
        isDesativado: data['isDesativado'] as bool?,
        contato: data['contato'] as String?,
        dtEndereco: data['dtEndereco'] is DtEnderecoStruct
            ? data['dtEndereco']
            : DtEnderecoStruct.maybeFromMap(data['dtEndereco']),
      );

  static DtEmpresaStruct? maybeFromMap(dynamic data) => data is Map
      ? DtEmpresaStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'created_at': _createdAt,
        'userCriador': _userCriador,
        'ultimaModificacao': _ultimaModificacao,
        'nome': _nome,
        'userPrincipal': _userPrincipal,
        'logo': _logo,
        'cnpj': _cnpj,
        'inscricaoEstadual': _inscricaoEstadual,
        'isDesativado': _isDesativado,
        'contato': _contato,
        'dtEndereco': _dtEndereco?.toMap(),
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
        'userCriador': serializeParam(
          _userCriador,
          ParamType.int,
        ),
        'ultimaModificacao': serializeParam(
          _ultimaModificacao,
          ParamType.int,
        ),
        'nome': serializeParam(
          _nome,
          ParamType.String,
        ),
        'userPrincipal': serializeParam(
          _userPrincipal,
          ParamType.int,
        ),
        'logo': serializeParam(
          _logo,
          ParamType.String,
        ),
        'cnpj': serializeParam(
          _cnpj,
          ParamType.String,
        ),
        'inscricaoEstadual': serializeParam(
          _inscricaoEstadual,
          ParamType.String,
        ),
        'isDesativado': serializeParam(
          _isDesativado,
          ParamType.bool,
        ),
        'contato': serializeParam(
          _contato,
          ParamType.String,
        ),
        'dtEndereco': serializeParam(
          _dtEndereco,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static DtEmpresaStruct fromSerializableMap(Map<String, dynamic> data) =>
      DtEmpresaStruct(
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
        userCriador: deserializeParam(
          data['userCriador'],
          ParamType.int,
          false,
        ),
        ultimaModificacao: deserializeParam(
          data['ultimaModificacao'],
          ParamType.int,
          false,
        ),
        nome: deserializeParam(
          data['nome'],
          ParamType.String,
          false,
        ),
        userPrincipal: deserializeParam(
          data['userPrincipal'],
          ParamType.int,
          false,
        ),
        logo: deserializeParam(
          data['logo'],
          ParamType.String,
          false,
        ),
        cnpj: deserializeParam(
          data['cnpj'],
          ParamType.String,
          false,
        ),
        inscricaoEstadual: deserializeParam(
          data['inscricaoEstadual'],
          ParamType.String,
          false,
        ),
        isDesativado: deserializeParam(
          data['isDesativado'],
          ParamType.bool,
          false,
        ),
        contato: deserializeParam(
          data['contato'],
          ParamType.String,
          false,
        ),
        dtEndereco: deserializeStructParam(
          data['dtEndereco'],
          ParamType.DataStruct,
          false,
          structBuilder: DtEnderecoStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'DtEmpresaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DtEmpresaStruct &&
        id == other.id &&
        createdAt == other.createdAt &&
        userCriador == other.userCriador &&
        ultimaModificacao == other.ultimaModificacao &&
        nome == other.nome &&
        userPrincipal == other.userPrincipal &&
        logo == other.logo &&
        cnpj == other.cnpj &&
        inscricaoEstadual == other.inscricaoEstadual &&
        isDesativado == other.isDesativado &&
        contato == other.contato &&
        dtEndereco == other.dtEndereco;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        createdAt,
        userCriador,
        ultimaModificacao,
        nome,
        userPrincipal,
        logo,
        cnpj,
        inscricaoEstadual,
        isDesativado,
        contato,
        dtEndereco
      ]);
}

DtEmpresaStruct createDtEmpresaStruct({
  int? id,
  int? createdAt,
  int? userCriador,
  int? ultimaModificacao,
  String? nome,
  int? userPrincipal,
  String? logo,
  String? cnpj,
  String? inscricaoEstadual,
  bool? isDesativado,
  String? contato,
  DtEnderecoStruct? dtEndereco,
}) =>
    DtEmpresaStruct(
      id: id,
      createdAt: createdAt,
      userCriador: userCriador,
      ultimaModificacao: ultimaModificacao,
      nome: nome,
      userPrincipal: userPrincipal,
      logo: logo,
      cnpj: cnpj,
      inscricaoEstadual: inscricaoEstadual,
      isDesativado: isDesativado,
      contato: contato,
      dtEndereco: dtEndereco ?? DtEnderecoStruct(),
    );

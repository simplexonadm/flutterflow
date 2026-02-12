// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DtUserStruct extends BaseStruct {
  DtUserStruct({
    String? nome,
    String? email,
    String? fotoPerfil,
    String? sobrenome,
    String? enTipoUsuario,
    int? id,
    bool? isDesativado,
    bool? isAdm,
  })  : _nome = nome,
        _email = email,
        _fotoPerfil = fotoPerfil,
        _sobrenome = sobrenome,
        _enTipoUsuario = enTipoUsuario,
        _id = id,
        _isDesativado = isDesativado,
        _isAdm = isAdm;

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  set nome(String? val) => _nome = val;

  bool hasNome() => _nome != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "fotoPerfil" field.
  String? _fotoPerfil;
  String get fotoPerfil => _fotoPerfil ?? '';
  set fotoPerfil(String? val) => _fotoPerfil = val;

  bool hasFotoPerfil() => _fotoPerfil != null;

  // "sobrenome" field.
  String? _sobrenome;
  String get sobrenome => _sobrenome ?? '';
  set sobrenome(String? val) => _sobrenome = val;

  bool hasSobrenome() => _sobrenome != null;

  // "en_tipoUsuario" field.
  String? _enTipoUsuario;
  String get enTipoUsuario => _enTipoUsuario ?? '';
  set enTipoUsuario(String? val) => _enTipoUsuario = val;

  bool hasEnTipoUsuario() => _enTipoUsuario != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "isDesativado" field.
  bool? _isDesativado;
  bool get isDesativado => _isDesativado ?? false;
  set isDesativado(bool? val) => _isDesativado = val;

  bool hasIsDesativado() => _isDesativado != null;

  // "isAdm" field.
  bool? _isAdm;
  bool get isAdm => _isAdm ?? false;
  set isAdm(bool? val) => _isAdm = val;

  bool hasIsAdm() => _isAdm != null;

  static DtUserStruct fromMap(Map<String, dynamic> data) => DtUserStruct(
        nome: data['nome'] as String?,
        email: data['email'] as String?,
        fotoPerfil: data['fotoPerfil'] as String?,
        sobrenome: data['sobrenome'] as String?,
        enTipoUsuario: data['en_tipoUsuario'] as String?,
        id: castToType<int>(data['id']),
        isDesativado: data['isDesativado'] as bool?,
        isAdm: data['isAdm'] as bool?,
      );

  static DtUserStruct? maybeFromMap(dynamic data) =>
      data is Map ? DtUserStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'nome': _nome,
        'email': _email,
        'fotoPerfil': _fotoPerfil,
        'sobrenome': _sobrenome,
        'en_tipoUsuario': _enTipoUsuario,
        'id': _id,
        'isDesativado': _isDesativado,
        'isAdm': _isAdm,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'nome': serializeParam(
          _nome,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'fotoPerfil': serializeParam(
          _fotoPerfil,
          ParamType.String,
        ),
        'sobrenome': serializeParam(
          _sobrenome,
          ParamType.String,
        ),
        'en_tipoUsuario': serializeParam(
          _enTipoUsuario,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'isDesativado': serializeParam(
          _isDesativado,
          ParamType.bool,
        ),
        'isAdm': serializeParam(
          _isAdm,
          ParamType.bool,
        ),
      }.withoutNulls;

  static DtUserStruct fromSerializableMap(Map<String, dynamic> data) =>
      DtUserStruct(
        nome: deserializeParam(
          data['nome'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        fotoPerfil: deserializeParam(
          data['fotoPerfil'],
          ParamType.String,
          false,
        ),
        sobrenome: deserializeParam(
          data['sobrenome'],
          ParamType.String,
          false,
        ),
        enTipoUsuario: deserializeParam(
          data['en_tipoUsuario'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        isDesativado: deserializeParam(
          data['isDesativado'],
          ParamType.bool,
          false,
        ),
        isAdm: deserializeParam(
          data['isAdm'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'DtUserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DtUserStruct &&
        nome == other.nome &&
        email == other.email &&
        fotoPerfil == other.fotoPerfil &&
        sobrenome == other.sobrenome &&
        enTipoUsuario == other.enTipoUsuario &&
        id == other.id &&
        isDesativado == other.isDesativado &&
        isAdm == other.isAdm;
  }

  @override
  int get hashCode => const ListEquality().hash([
        nome,
        email,
        fotoPerfil,
        sobrenome,
        enTipoUsuario,
        id,
        isDesativado,
        isAdm
      ]);
}

DtUserStruct createDtUserStruct({
  String? nome,
  String? email,
  String? fotoPerfil,
  String? sobrenome,
  String? enTipoUsuario,
  int? id,
  bool? isDesativado,
  bool? isAdm,
}) =>
    DtUserStruct(
      nome: nome,
      email: email,
      fotoPerfil: fotoPerfil,
      sobrenome: sobrenome,
      enTipoUsuario: enTipoUsuario,
      id: id,
      isDesativado: isDesativado,
      isAdm: isAdm,
    );

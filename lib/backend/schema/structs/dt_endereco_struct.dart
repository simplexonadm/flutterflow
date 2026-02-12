// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DtEnderecoStruct extends BaseStruct {
  DtEnderecoStruct({
    String? endereco,
    String? cep,
    String? numero,
  })  : _endereco = endereco,
        _cep = cep,
        _numero = numero;

  // "endereco" field.
  String? _endereco;
  String get endereco => _endereco ?? '';
  set endereco(String? val) => _endereco = val;

  bool hasEndereco() => _endereco != null;

  // "cep" field.
  String? _cep;
  String get cep => _cep ?? '';
  set cep(String? val) => _cep = val;

  bool hasCep() => _cep != null;

  // "numero" field.
  String? _numero;
  String get numero => _numero ?? '';
  set numero(String? val) => _numero = val;

  bool hasNumero() => _numero != null;

  static DtEnderecoStruct fromMap(Map<String, dynamic> data) =>
      DtEnderecoStruct(
        endereco: data['endereco'] as String?,
        cep: data['cep'] as String?,
        numero: data['numero'] as String?,
      );

  static DtEnderecoStruct? maybeFromMap(dynamic data) => data is Map
      ? DtEnderecoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'endereco': _endereco,
        'cep': _cep,
        'numero': _numero,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'endereco': serializeParam(
          _endereco,
          ParamType.String,
        ),
        'cep': serializeParam(
          _cep,
          ParamType.String,
        ),
        'numero': serializeParam(
          _numero,
          ParamType.String,
        ),
      }.withoutNulls;

  static DtEnderecoStruct fromSerializableMap(Map<String, dynamic> data) =>
      DtEnderecoStruct(
        endereco: deserializeParam(
          data['endereco'],
          ParamType.String,
          false,
        ),
        cep: deserializeParam(
          data['cep'],
          ParamType.String,
          false,
        ),
        numero: deserializeParam(
          data['numero'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DtEnderecoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DtEnderecoStruct &&
        endereco == other.endereco &&
        cep == other.cep &&
        numero == other.numero;
  }

  @override
  int get hashCode => const ListEquality().hash([endereco, cep, numero]);
}

DtEnderecoStruct createDtEnderecoStruct({
  String? endereco,
  String? cep,
  String? numero,
}) =>
    DtEnderecoStruct(
      endereco: endereco,
      cep: cep,
      numero: numero,
    );

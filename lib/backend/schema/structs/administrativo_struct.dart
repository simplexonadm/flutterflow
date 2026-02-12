// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdministrativoStruct extends BaseStruct {
  AdministrativoStruct({
    EnPaginas? paginaAnterior,
    EnPaginas? paginaAtual,
    bool? online,
  })  : _paginaAnterior = paginaAnterior,
        _paginaAtual = paginaAtual,
        _online = online;

  // "paginaAnterior" field.
  EnPaginas? _paginaAnterior;
  EnPaginas get paginaAnterior => _paginaAnterior ?? EnPaginas.LocalDeProducao;
  set paginaAnterior(EnPaginas? val) => _paginaAnterior = val;

  bool hasPaginaAnterior() => _paginaAnterior != null;

  // "paginaAtual" field.
  EnPaginas? _paginaAtual;
  EnPaginas get paginaAtual => _paginaAtual ?? EnPaginas.LocalDeProducao;
  set paginaAtual(EnPaginas? val) => _paginaAtual = val;

  bool hasPaginaAtual() => _paginaAtual != null;

  // "online" field.
  bool? _online;
  bool get online => _online ?? true;
  set online(bool? val) => _online = val;

  bool hasOnline() => _online != null;

  static AdministrativoStruct fromMap(Map<String, dynamic> data) =>
      AdministrativoStruct(
        paginaAnterior: data['paginaAnterior'] is EnPaginas
            ? data['paginaAnterior']
            : deserializeEnum<EnPaginas>(data['paginaAnterior']),
        paginaAtual: data['paginaAtual'] is EnPaginas
            ? data['paginaAtual']
            : deserializeEnum<EnPaginas>(data['paginaAtual']),
        online: data['online'] as bool?,
      );

  static AdministrativoStruct? maybeFromMap(dynamic data) => data is Map
      ? AdministrativoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'paginaAnterior': _paginaAnterior?.serialize(),
        'paginaAtual': _paginaAtual?.serialize(),
        'online': _online,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'paginaAnterior': serializeParam(
          _paginaAnterior,
          ParamType.Enum,
        ),
        'paginaAtual': serializeParam(
          _paginaAtual,
          ParamType.Enum,
        ),
        'online': serializeParam(
          _online,
          ParamType.bool,
        ),
      }.withoutNulls;

  static AdministrativoStruct fromSerializableMap(Map<String, dynamic> data) =>
      AdministrativoStruct(
        paginaAnterior: deserializeParam<EnPaginas>(
          data['paginaAnterior'],
          ParamType.Enum,
          false,
        ),
        paginaAtual: deserializeParam<EnPaginas>(
          data['paginaAtual'],
          ParamType.Enum,
          false,
        ),
        online: deserializeParam(
          data['online'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'AdministrativoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AdministrativoStruct &&
        paginaAnterior == other.paginaAnterior &&
        paginaAtual == other.paginaAtual &&
        online == other.online;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([paginaAnterior, paginaAtual, online]);
}

AdministrativoStruct createAdministrativoStruct({
  EnPaginas? paginaAnterior,
  EnPaginas? paginaAtual,
  bool? online,
}) =>
    AdministrativoStruct(
      paginaAnterior: paginaAnterior,
      paginaAtual: paginaAtual,
      online: online,
    );

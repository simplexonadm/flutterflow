// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FiltroStruct extends BaseStruct {
  FiltroStruct({
    String? pesquisa,
  }) : _pesquisa = pesquisa;

  // "pesquisa" field.
  String? _pesquisa;
  String get pesquisa => _pesquisa ?? '';
  set pesquisa(String? val) => _pesquisa = val;

  bool hasPesquisa() => _pesquisa != null;

  static FiltroStruct fromMap(Map<String, dynamic> data) => FiltroStruct(
        pesquisa: data['pesquisa'] as String?,
      );

  static FiltroStruct? maybeFromMap(dynamic data) =>
      data is Map ? FiltroStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'pesquisa': _pesquisa,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'pesquisa': serializeParam(
          _pesquisa,
          ParamType.String,
        ),
      }.withoutNulls;

  static FiltroStruct fromSerializableMap(Map<String, dynamic> data) =>
      FiltroStruct(
        pesquisa: deserializeParam(
          data['pesquisa'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'FiltroStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FiltroStruct && pesquisa == other.pesquisa;
  }

  @override
  int get hashCode => const ListEquality().hash([pesquisa]);
}

FiltroStruct createFiltroStruct({
  String? pesquisa,
}) =>
    FiltroStruct(
      pesquisa: pesquisa,
    );

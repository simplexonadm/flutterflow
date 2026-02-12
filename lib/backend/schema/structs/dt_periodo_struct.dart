// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DtPeriodoStruct extends BaseStruct {
  DtPeriodoStruct({
    List<String>? descricao,
  }) : _descricao = descricao;

  // "descricao" field.
  List<String>? _descricao;
  List<String> get descricao => _descricao ?? const [];
  set descricao(List<String>? val) => _descricao = val;

  void updateDescricao(Function(List<String>) updateFn) {
    updateFn(_descricao ??= []);
  }

  bool hasDescricao() => _descricao != null;

  static DtPeriodoStruct fromMap(Map<String, dynamic> data) => DtPeriodoStruct(
        descricao: getDataList(data['descricao']),
      );

  static DtPeriodoStruct? maybeFromMap(dynamic data) => data is Map
      ? DtPeriodoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'descricao': _descricao,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'descricao': serializeParam(
          _descricao,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static DtPeriodoStruct fromSerializableMap(Map<String, dynamic> data) =>
      DtPeriodoStruct(
        descricao: deserializeParam<String>(
          data['descricao'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'DtPeriodoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DtPeriodoStruct &&
        listEquality.equals(descricao, other.descricao);
  }

  @override
  int get hashCode => const ListEquality().hash([descricao]);
}

DtPeriodoStruct createDtPeriodoStruct() => DtPeriodoStruct();

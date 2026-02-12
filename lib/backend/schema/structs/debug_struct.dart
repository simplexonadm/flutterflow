// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DebugStruct extends BaseStruct {
  DebugStruct({
    bool? ativo,
  }) : _ativo = ativo;

  // "ativo" field.
  bool? _ativo;
  bool get ativo => _ativo ?? true;
  set ativo(bool? val) => _ativo = val;

  bool hasAtivo() => _ativo != null;

  static DebugStruct fromMap(Map<String, dynamic> data) => DebugStruct(
        ativo: data['ativo'] as bool?,
      );

  static DebugStruct? maybeFromMap(dynamic data) =>
      data is Map ? DebugStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'ativo': _ativo,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ativo': serializeParam(
          _ativo,
          ParamType.bool,
        ),
      }.withoutNulls;

  static DebugStruct fromSerializableMap(Map<String, dynamic> data) =>
      DebugStruct(
        ativo: deserializeParam(
          data['ativo'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'DebugStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DebugStruct && ativo == other.ativo;
  }

  @override
  int get hashCode => const ListEquality().hash([ativo]);
}

DebugStruct createDebugStruct({
  bool? ativo,
}) =>
    DebugStruct(
      ativo: ativo,
    );

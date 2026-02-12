// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DtloopStruct extends BaseStruct {
  DtloopStruct({
    int? atual,
    int? total,
  })  : _atual = atual,
        _total = total;

  // "atual" field.
  int? _atual;
  int get atual => _atual ?? 0;
  set atual(int? val) => _atual = val;

  void incrementAtual(int amount) => atual = atual + amount;

  bool hasAtual() => _atual != null;

  // "total" field.
  int? _total;
  int get total => _total ?? 0;
  set total(int? val) => _total = val;

  void incrementTotal(int amount) => total = total + amount;

  bool hasTotal() => _total != null;

  static DtloopStruct fromMap(Map<String, dynamic> data) => DtloopStruct(
        atual: castToType<int>(data['atual']),
        total: castToType<int>(data['total']),
      );

  static DtloopStruct? maybeFromMap(dynamic data) =>
      data is Map ? DtloopStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'atual': _atual,
        'total': _total,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'atual': serializeParam(
          _atual,
          ParamType.int,
        ),
        'total': serializeParam(
          _total,
          ParamType.int,
        ),
      }.withoutNulls;

  static DtloopStruct fromSerializableMap(Map<String, dynamic> data) =>
      DtloopStruct(
        atual: deserializeParam(
          data['atual'],
          ParamType.int,
          false,
        ),
        total: deserializeParam(
          data['total'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'DtloopStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DtloopStruct &&
        atual == other.atual &&
        total == other.total;
  }

  @override
  int get hashCode => const ListEquality().hash([atual, total]);
}

DtloopStruct createDtloopStruct({
  int? atual,
  int? total,
}) =>
    DtloopStruct(
      atual: atual,
      total: total,
    );

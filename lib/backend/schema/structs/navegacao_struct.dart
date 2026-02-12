// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NavegacaoStruct extends BaseStruct {
  NavegacaoStruct({
    int? fkModulo,
    int? fkSubModulo,
    int? fkFormulario,
  })  : _fkModulo = fkModulo,
        _fkSubModulo = fkSubModulo,
        _fkFormulario = fkFormulario;

  // "fk_modulo" field.
  int? _fkModulo;
  int get fkModulo => _fkModulo ?? 0;
  set fkModulo(int? val) => _fkModulo = val;

  void incrementFkModulo(int amount) => fkModulo = fkModulo + amount;

  bool hasFkModulo() => _fkModulo != null;

  // "fk_subModulo" field.
  int? _fkSubModulo;
  int get fkSubModulo => _fkSubModulo ?? 0;
  set fkSubModulo(int? val) => _fkSubModulo = val;

  void incrementFkSubModulo(int amount) => fkSubModulo = fkSubModulo + amount;

  bool hasFkSubModulo() => _fkSubModulo != null;

  // "fk_formulario" field.
  int? _fkFormulario;
  int get fkFormulario => _fkFormulario ?? 0;
  set fkFormulario(int? val) => _fkFormulario = val;

  void incrementFkFormulario(int amount) =>
      fkFormulario = fkFormulario + amount;

  bool hasFkFormulario() => _fkFormulario != null;

  static NavegacaoStruct fromMap(Map<String, dynamic> data) => NavegacaoStruct(
        fkModulo: castToType<int>(data['fk_modulo']),
        fkSubModulo: castToType<int>(data['fk_subModulo']),
        fkFormulario: castToType<int>(data['fk_formulario']),
      );

  static NavegacaoStruct? maybeFromMap(dynamic data) => data is Map
      ? NavegacaoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'fk_modulo': _fkModulo,
        'fk_subModulo': _fkSubModulo,
        'fk_formulario': _fkFormulario,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'fk_modulo': serializeParam(
          _fkModulo,
          ParamType.int,
        ),
        'fk_subModulo': serializeParam(
          _fkSubModulo,
          ParamType.int,
        ),
        'fk_formulario': serializeParam(
          _fkFormulario,
          ParamType.int,
        ),
      }.withoutNulls;

  static NavegacaoStruct fromSerializableMap(Map<String, dynamic> data) =>
      NavegacaoStruct(
        fkModulo: deserializeParam(
          data['fk_modulo'],
          ParamType.int,
          false,
        ),
        fkSubModulo: deserializeParam(
          data['fk_subModulo'],
          ParamType.int,
          false,
        ),
        fkFormulario: deserializeParam(
          data['fk_formulario'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'NavegacaoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NavegacaoStruct &&
        fkModulo == other.fkModulo &&
        fkSubModulo == other.fkSubModulo &&
        fkFormulario == other.fkFormulario;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([fkModulo, fkSubModulo, fkFormulario]);
}

NavegacaoStruct createNavegacaoStruct({
  int? fkModulo,
  int? fkSubModulo,
  int? fkFormulario,
}) =>
    NavegacaoStruct(
      fkModulo: fkModulo,
      fkSubModulo: fkSubModulo,
      fkFormulario: fkFormulario,
    );

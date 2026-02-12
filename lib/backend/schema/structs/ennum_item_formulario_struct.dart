// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EnnumItemFormularioStruct extends BaseStruct {
  EnnumItemFormularioStruct({
    String? enAprovacao,
    List<String>? enCamposFormulario,
    String? enAtende,
    String? enComprovacoes,
    String? enCondPagamento,
    String? enMetodoAvaliacao,
    String? enOrigem,
    String? enPartes,
    String? enPeriodicidade,
    List<String>? enPeriodo,
    String? enPreparoSobrevivencia,
    String? enResponsavel,
    String? enStatus,
    String? enSubsetor,
    String? enRequisitoRequerido,
    String? enResultadoInspecao,
    String? enTagsCor,
    String? enNps,
    String? enCategoriaFormulario,
    String? tipoEnnum,
    DtFornecedorStruct? dtFornecedor,
    DtProblemaRecorrenteStruct? dtProblemaRecorrente,
    List<String>? resultadoReinspecao,
  })  : _enAprovacao = enAprovacao,
        _enCamposFormulario = enCamposFormulario,
        _enAtende = enAtende,
        _enComprovacoes = enComprovacoes,
        _enCondPagamento = enCondPagamento,
        _enMetodoAvaliacao = enMetodoAvaliacao,
        _enOrigem = enOrigem,
        _enPartes = enPartes,
        _enPeriodicidade = enPeriodicidade,
        _enPeriodo = enPeriodo,
        _enPreparoSobrevivencia = enPreparoSobrevivencia,
        _enResponsavel = enResponsavel,
        _enStatus = enStatus,
        _enSubsetor = enSubsetor,
        _enRequisitoRequerido = enRequisitoRequerido,
        _enResultadoInspecao = enResultadoInspecao,
        _enTagsCor = enTagsCor,
        _enNps = enNps,
        _enCategoriaFormulario = enCategoriaFormulario,
        _tipoEnnum = tipoEnnum,
        _dtFornecedor = dtFornecedor,
        _dtProblemaRecorrente = dtProblemaRecorrente,
        _resultadoReinspecao = resultadoReinspecao;

  // "en_aprovacao" field.
  String? _enAprovacao;
  String get enAprovacao => _enAprovacao ?? '';
  set enAprovacao(String? val) => _enAprovacao = val;

  bool hasEnAprovacao() => _enAprovacao != null;

  // "en_camposFormulario" field.
  List<String>? _enCamposFormulario;
  List<String> get enCamposFormulario => _enCamposFormulario ?? const [];
  set enCamposFormulario(List<String>? val) => _enCamposFormulario = val;

  void updateEnCamposFormulario(Function(List<String>) updateFn) {
    updateFn(_enCamposFormulario ??= []);
  }

  bool hasEnCamposFormulario() => _enCamposFormulario != null;

  // "en_atende" field.
  String? _enAtende;
  String get enAtende => _enAtende ?? '';
  set enAtende(String? val) => _enAtende = val;

  bool hasEnAtende() => _enAtende != null;

  // "en_comprovacoes" field.
  String? _enComprovacoes;
  String get enComprovacoes => _enComprovacoes ?? '';
  set enComprovacoes(String? val) => _enComprovacoes = val;

  bool hasEnComprovacoes() => _enComprovacoes != null;

  // "en_condPagamento" field.
  String? _enCondPagamento;
  String get enCondPagamento => _enCondPagamento ?? '';
  set enCondPagamento(String? val) => _enCondPagamento = val;

  bool hasEnCondPagamento() => _enCondPagamento != null;

  // "en_metodoAvaliacao" field.
  String? _enMetodoAvaliacao;
  String get enMetodoAvaliacao => _enMetodoAvaliacao ?? '';
  set enMetodoAvaliacao(String? val) => _enMetodoAvaliacao = val;

  bool hasEnMetodoAvaliacao() => _enMetodoAvaliacao != null;

  // "en_origem" field.
  String? _enOrigem;
  String get enOrigem => _enOrigem ?? '';
  set enOrigem(String? val) => _enOrigem = val;

  bool hasEnOrigem() => _enOrigem != null;

  // "en_partes" field.
  String? _enPartes;
  String get enPartes => _enPartes ?? '';
  set enPartes(String? val) => _enPartes = val;

  bool hasEnPartes() => _enPartes != null;

  // "en_periodicidade" field.
  String? _enPeriodicidade;
  String get enPeriodicidade => _enPeriodicidade ?? '';
  set enPeriodicidade(String? val) => _enPeriodicidade = val;

  bool hasEnPeriodicidade() => _enPeriodicidade != null;

  // "en_periodo" field.
  List<String>? _enPeriodo;
  List<String> get enPeriodo => _enPeriodo ?? const [];
  set enPeriodo(List<String>? val) => _enPeriodo = val;

  void updateEnPeriodo(Function(List<String>) updateFn) {
    updateFn(_enPeriodo ??= []);
  }

  bool hasEnPeriodo() => _enPeriodo != null;

  // "en_preparoSobrevivencia" field.
  String? _enPreparoSobrevivencia;
  String get enPreparoSobrevivencia => _enPreparoSobrevivencia ?? '';
  set enPreparoSobrevivencia(String? val) => _enPreparoSobrevivencia = val;

  bool hasEnPreparoSobrevivencia() => _enPreparoSobrevivencia != null;

  // "en_responsavel" field.
  String? _enResponsavel;
  String get enResponsavel => _enResponsavel ?? '';
  set enResponsavel(String? val) => _enResponsavel = val;

  bool hasEnResponsavel() => _enResponsavel != null;

  // "en_status" field.
  String? _enStatus;
  String get enStatus => _enStatus ?? '';
  set enStatus(String? val) => _enStatus = val;

  bool hasEnStatus() => _enStatus != null;

  // "en_subsetor" field.
  String? _enSubsetor;
  String get enSubsetor => _enSubsetor ?? '';
  set enSubsetor(String? val) => _enSubsetor = val;

  bool hasEnSubsetor() => _enSubsetor != null;

  // "en_requisitoRequerido" field.
  String? _enRequisitoRequerido;
  String get enRequisitoRequerido => _enRequisitoRequerido ?? '';
  set enRequisitoRequerido(String? val) => _enRequisitoRequerido = val;

  bool hasEnRequisitoRequerido() => _enRequisitoRequerido != null;

  // "en_resultadoInspecao" field.
  String? _enResultadoInspecao;
  String get enResultadoInspecao => _enResultadoInspecao ?? '';
  set enResultadoInspecao(String? val) => _enResultadoInspecao = val;

  bool hasEnResultadoInspecao() => _enResultadoInspecao != null;

  // "en_tagsCor" field.
  String? _enTagsCor;
  String get enTagsCor => _enTagsCor ?? '';
  set enTagsCor(String? val) => _enTagsCor = val;

  bool hasEnTagsCor() => _enTagsCor != null;

  // "en_nps" field.
  String? _enNps;
  String get enNps => _enNps ?? '';
  set enNps(String? val) => _enNps = val;

  bool hasEnNps() => _enNps != null;

  // "en_categoriaFormulario" field.
  String? _enCategoriaFormulario;
  String get enCategoriaFormulario => _enCategoriaFormulario ?? '';
  set enCategoriaFormulario(String? val) => _enCategoriaFormulario = val;

  bool hasEnCategoriaFormulario() => _enCategoriaFormulario != null;

  // "tipoEnnum" field.
  String? _tipoEnnum;
  String get tipoEnnum => _tipoEnnum ?? '';
  set tipoEnnum(String? val) => _tipoEnnum = val;

  bool hasTipoEnnum() => _tipoEnnum != null;

  // "DtFornecedor" field.
  DtFornecedorStruct? _dtFornecedor;
  DtFornecedorStruct get dtFornecedor => _dtFornecedor ?? DtFornecedorStruct();
  set dtFornecedor(DtFornecedorStruct? val) => _dtFornecedor = val;

  void updateDtFornecedor(Function(DtFornecedorStruct) updateFn) {
    updateFn(_dtFornecedor ??= DtFornecedorStruct());
  }

  bool hasDtFornecedor() => _dtFornecedor != null;

  // "dtProblemaRecorrente" field.
  DtProblemaRecorrenteStruct? _dtProblemaRecorrente;
  DtProblemaRecorrenteStruct get dtProblemaRecorrente =>
      _dtProblemaRecorrente ?? DtProblemaRecorrenteStruct();
  set dtProblemaRecorrente(DtProblemaRecorrenteStruct? val) =>
      _dtProblemaRecorrente = val;

  void updateDtProblemaRecorrente(
      Function(DtProblemaRecorrenteStruct) updateFn) {
    updateFn(_dtProblemaRecorrente ??= DtProblemaRecorrenteStruct());
  }

  bool hasDtProblemaRecorrente() => _dtProblemaRecorrente != null;

  // "resultadoReinspecao" field.
  List<String>? _resultadoReinspecao;
  List<String> get resultadoReinspecao => _resultadoReinspecao ?? const [];
  set resultadoReinspecao(List<String>? val) => _resultadoReinspecao = val;

  void updateResultadoReinspecao(Function(List<String>) updateFn) {
    updateFn(_resultadoReinspecao ??= []);
  }

  bool hasResultadoReinspecao() => _resultadoReinspecao != null;

  static EnnumItemFormularioStruct fromMap(Map<String, dynamic> data) =>
      EnnumItemFormularioStruct(
        enAprovacao: data['en_aprovacao'] as String?,
        enCamposFormulario: getDataList(data['en_camposFormulario']),
        enAtende: data['en_atende'] as String?,
        enComprovacoes: data['en_comprovacoes'] as String?,
        enCondPagamento: data['en_condPagamento'] as String?,
        enMetodoAvaliacao: data['en_metodoAvaliacao'] as String?,
        enOrigem: data['en_origem'] as String?,
        enPartes: data['en_partes'] as String?,
        enPeriodicidade: data['en_periodicidade'] as String?,
        enPeriodo: getDataList(data['en_periodo']),
        enPreparoSobrevivencia: data['en_preparoSobrevivencia'] as String?,
        enResponsavel: data['en_responsavel'] as String?,
        enStatus: data['en_status'] as String?,
        enSubsetor: data['en_subsetor'] as String?,
        enRequisitoRequerido: data['en_requisitoRequerido'] as String?,
        enResultadoInspecao: data['en_resultadoInspecao'] as String?,
        enTagsCor: data['en_tagsCor'] as String?,
        enNps: data['en_nps'] as String?,
        enCategoriaFormulario: data['en_categoriaFormulario'] as String?,
        tipoEnnum: data['tipoEnnum'] as String?,
        dtFornecedor: data['DtFornecedor'] is DtFornecedorStruct
            ? data['DtFornecedor']
            : DtFornecedorStruct.maybeFromMap(data['DtFornecedor']),
        dtProblemaRecorrente:
            data['dtProblemaRecorrente'] is DtProblemaRecorrenteStruct
                ? data['dtProblemaRecorrente']
                : DtProblemaRecorrenteStruct.maybeFromMap(
                    data['dtProblemaRecorrente']),
        resultadoReinspecao: getDataList(data['resultadoReinspecao']),
      );

  static EnnumItemFormularioStruct? maybeFromMap(dynamic data) => data is Map
      ? EnnumItemFormularioStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'en_aprovacao': _enAprovacao,
        'en_camposFormulario': _enCamposFormulario,
        'en_atende': _enAtende,
        'en_comprovacoes': _enComprovacoes,
        'en_condPagamento': _enCondPagamento,
        'en_metodoAvaliacao': _enMetodoAvaliacao,
        'en_origem': _enOrigem,
        'en_partes': _enPartes,
        'en_periodicidade': _enPeriodicidade,
        'en_periodo': _enPeriodo,
        'en_preparoSobrevivencia': _enPreparoSobrevivencia,
        'en_responsavel': _enResponsavel,
        'en_status': _enStatus,
        'en_subsetor': _enSubsetor,
        'en_requisitoRequerido': _enRequisitoRequerido,
        'en_resultadoInspecao': _enResultadoInspecao,
        'en_tagsCor': _enTagsCor,
        'en_nps': _enNps,
        'en_categoriaFormulario': _enCategoriaFormulario,
        'tipoEnnum': _tipoEnnum,
        'DtFornecedor': _dtFornecedor?.toMap(),
        'dtProblemaRecorrente': _dtProblemaRecorrente?.toMap(),
        'resultadoReinspecao': _resultadoReinspecao,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'en_aprovacao': serializeParam(
          _enAprovacao,
          ParamType.String,
        ),
        'en_camposFormulario': serializeParam(
          _enCamposFormulario,
          ParamType.String,
          isList: true,
        ),
        'en_atende': serializeParam(
          _enAtende,
          ParamType.String,
        ),
        'en_comprovacoes': serializeParam(
          _enComprovacoes,
          ParamType.String,
        ),
        'en_condPagamento': serializeParam(
          _enCondPagamento,
          ParamType.String,
        ),
        'en_metodoAvaliacao': serializeParam(
          _enMetodoAvaliacao,
          ParamType.String,
        ),
        'en_origem': serializeParam(
          _enOrigem,
          ParamType.String,
        ),
        'en_partes': serializeParam(
          _enPartes,
          ParamType.String,
        ),
        'en_periodicidade': serializeParam(
          _enPeriodicidade,
          ParamType.String,
        ),
        'en_periodo': serializeParam(
          _enPeriodo,
          ParamType.String,
          isList: true,
        ),
        'en_preparoSobrevivencia': serializeParam(
          _enPreparoSobrevivencia,
          ParamType.String,
        ),
        'en_responsavel': serializeParam(
          _enResponsavel,
          ParamType.String,
        ),
        'en_status': serializeParam(
          _enStatus,
          ParamType.String,
        ),
        'en_subsetor': serializeParam(
          _enSubsetor,
          ParamType.String,
        ),
        'en_requisitoRequerido': serializeParam(
          _enRequisitoRequerido,
          ParamType.String,
        ),
        'en_resultadoInspecao': serializeParam(
          _enResultadoInspecao,
          ParamType.String,
        ),
        'en_tagsCor': serializeParam(
          _enTagsCor,
          ParamType.String,
        ),
        'en_nps': serializeParam(
          _enNps,
          ParamType.String,
        ),
        'en_categoriaFormulario': serializeParam(
          _enCategoriaFormulario,
          ParamType.String,
        ),
        'tipoEnnum': serializeParam(
          _tipoEnnum,
          ParamType.String,
        ),
        'DtFornecedor': serializeParam(
          _dtFornecedor,
          ParamType.DataStruct,
        ),
        'dtProblemaRecorrente': serializeParam(
          _dtProblemaRecorrente,
          ParamType.DataStruct,
        ),
        'resultadoReinspecao': serializeParam(
          _resultadoReinspecao,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static EnnumItemFormularioStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      EnnumItemFormularioStruct(
        enAprovacao: deserializeParam(
          data['en_aprovacao'],
          ParamType.String,
          false,
        ),
        enCamposFormulario: deserializeParam<String>(
          data['en_camposFormulario'],
          ParamType.String,
          true,
        ),
        enAtende: deserializeParam(
          data['en_atende'],
          ParamType.String,
          false,
        ),
        enComprovacoes: deserializeParam(
          data['en_comprovacoes'],
          ParamType.String,
          false,
        ),
        enCondPagamento: deserializeParam(
          data['en_condPagamento'],
          ParamType.String,
          false,
        ),
        enMetodoAvaliacao: deserializeParam(
          data['en_metodoAvaliacao'],
          ParamType.String,
          false,
        ),
        enOrigem: deserializeParam(
          data['en_origem'],
          ParamType.String,
          false,
        ),
        enPartes: deserializeParam(
          data['en_partes'],
          ParamType.String,
          false,
        ),
        enPeriodicidade: deserializeParam(
          data['en_periodicidade'],
          ParamType.String,
          false,
        ),
        enPeriodo: deserializeParam<String>(
          data['en_periodo'],
          ParamType.String,
          true,
        ),
        enPreparoSobrevivencia: deserializeParam(
          data['en_preparoSobrevivencia'],
          ParamType.String,
          false,
        ),
        enResponsavel: deserializeParam(
          data['en_responsavel'],
          ParamType.String,
          false,
        ),
        enStatus: deserializeParam(
          data['en_status'],
          ParamType.String,
          false,
        ),
        enSubsetor: deserializeParam(
          data['en_subsetor'],
          ParamType.String,
          false,
        ),
        enRequisitoRequerido: deserializeParam(
          data['en_requisitoRequerido'],
          ParamType.String,
          false,
        ),
        enResultadoInspecao: deserializeParam(
          data['en_resultadoInspecao'],
          ParamType.String,
          false,
        ),
        enTagsCor: deserializeParam(
          data['en_tagsCor'],
          ParamType.String,
          false,
        ),
        enNps: deserializeParam(
          data['en_nps'],
          ParamType.String,
          false,
        ),
        enCategoriaFormulario: deserializeParam(
          data['en_categoriaFormulario'],
          ParamType.String,
          false,
        ),
        tipoEnnum: deserializeParam(
          data['tipoEnnum'],
          ParamType.String,
          false,
        ),
        dtFornecedor: deserializeStructParam(
          data['DtFornecedor'],
          ParamType.DataStruct,
          false,
          structBuilder: DtFornecedorStruct.fromSerializableMap,
        ),
        dtProblemaRecorrente: deserializeStructParam(
          data['dtProblemaRecorrente'],
          ParamType.DataStruct,
          false,
          structBuilder: DtProblemaRecorrenteStruct.fromSerializableMap,
        ),
        resultadoReinspecao: deserializeParam<String>(
          data['resultadoReinspecao'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'EnnumItemFormularioStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is EnnumItemFormularioStruct &&
        enAprovacao == other.enAprovacao &&
        listEquality.equals(enCamposFormulario, other.enCamposFormulario) &&
        enAtende == other.enAtende &&
        enComprovacoes == other.enComprovacoes &&
        enCondPagamento == other.enCondPagamento &&
        enMetodoAvaliacao == other.enMetodoAvaliacao &&
        enOrigem == other.enOrigem &&
        enPartes == other.enPartes &&
        enPeriodicidade == other.enPeriodicidade &&
        listEquality.equals(enPeriodo, other.enPeriodo) &&
        enPreparoSobrevivencia == other.enPreparoSobrevivencia &&
        enResponsavel == other.enResponsavel &&
        enStatus == other.enStatus &&
        enSubsetor == other.enSubsetor &&
        enRequisitoRequerido == other.enRequisitoRequerido &&
        enResultadoInspecao == other.enResultadoInspecao &&
        enTagsCor == other.enTagsCor &&
        enNps == other.enNps &&
        enCategoriaFormulario == other.enCategoriaFormulario &&
        tipoEnnum == other.tipoEnnum &&
        dtFornecedor == other.dtFornecedor &&
        dtProblemaRecorrente == other.dtProblemaRecorrente &&
        listEquality.equals(resultadoReinspecao, other.resultadoReinspecao);
  }

  @override
  int get hashCode => const ListEquality().hash([
        enAprovacao,
        enCamposFormulario,
        enAtende,
        enComprovacoes,
        enCondPagamento,
        enMetodoAvaliacao,
        enOrigem,
        enPartes,
        enPeriodicidade,
        enPeriodo,
        enPreparoSobrevivencia,
        enResponsavel,
        enStatus,
        enSubsetor,
        enRequisitoRequerido,
        enResultadoInspecao,
        enTagsCor,
        enNps,
        enCategoriaFormulario,
        tipoEnnum,
        dtFornecedor,
        dtProblemaRecorrente,
        resultadoReinspecao
      ]);
}

EnnumItemFormularioStruct createEnnumItemFormularioStruct({
  String? enAprovacao,
  String? enAtende,
  String? enComprovacoes,
  String? enCondPagamento,
  String? enMetodoAvaliacao,
  String? enOrigem,
  String? enPartes,
  String? enPeriodicidade,
  String? enPreparoSobrevivencia,
  String? enResponsavel,
  String? enStatus,
  String? enSubsetor,
  String? enRequisitoRequerido,
  String? enResultadoInspecao,
  String? enTagsCor,
  String? enNps,
  String? enCategoriaFormulario,
  String? tipoEnnum,
  DtFornecedorStruct? dtFornecedor,
  DtProblemaRecorrenteStruct? dtProblemaRecorrente,
}) =>
    EnnumItemFormularioStruct(
      enAprovacao: enAprovacao,
      enAtende: enAtende,
      enComprovacoes: enComprovacoes,
      enCondPagamento: enCondPagamento,
      enMetodoAvaliacao: enMetodoAvaliacao,
      enOrigem: enOrigem,
      enPartes: enPartes,
      enPeriodicidade: enPeriodicidade,
      enPreparoSobrevivencia: enPreparoSobrevivencia,
      enResponsavel: enResponsavel,
      enStatus: enStatus,
      enSubsetor: enSubsetor,
      enRequisitoRequerido: enRequisitoRequerido,
      enResultadoInspecao: enResultadoInspecao,
      enTagsCor: enTagsCor,
      enNps: enNps,
      enCategoriaFormulario: enCategoriaFormulario,
      tipoEnnum: tipoEnnum,
      dtFornecedor: dtFornecedor ?? DtFornecedorStruct(),
      dtProblemaRecorrente:
          dtProblemaRecorrente ?? DtProblemaRecorrenteStruct(),
    );

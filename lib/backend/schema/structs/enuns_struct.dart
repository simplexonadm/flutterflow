// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EnunsStruct extends BaseStruct {
  EnunsStruct({
    List<String>? enInspecao,
    List<String>? enAprovacao,
    String? simNao,
    String? texto,
    List<String>? enCamposFormulario,
    String? enCategoriaFormulario,
    List<String>? enComprovacoes,
    List<String>? enTagsCor,
    List<String>? enAtende,
    List<String>? enCondPagamento,
    List<String>? enMetodoAvaliacao,
    List<String>? enOrigem,
    List<String>? enPartes,
    List<String>? enPeriodicidade,
    List<String>? enPeriodo,
    List<String>? enPreparoSobrevivencia,
    List<String>? enStatus,
    List<String>? enSubsetor,
    List<String>? enRequisitoRequerido,
    List<String>? enResultadoInspecao,
    List<String>? enResultadoReinspecao,
    List<String>? enNps,
    List<String>? enResponsavel,
    List<DtFornecedorStruct>? dtFornecedor,
    List<DtProblemaRecorrenteStruct>? dtProblemaRecorrente,
  })  : _enInspecao = enInspecao,
        _enAprovacao = enAprovacao,
        _simNao = simNao,
        _texto = texto,
        _enCamposFormulario = enCamposFormulario,
        _enCategoriaFormulario = enCategoriaFormulario,
        _enComprovacoes = enComprovacoes,
        _enTagsCor = enTagsCor,
        _enAtende = enAtende,
        _enCondPagamento = enCondPagamento,
        _enMetodoAvaliacao = enMetodoAvaliacao,
        _enOrigem = enOrigem,
        _enPartes = enPartes,
        _enPeriodicidade = enPeriodicidade,
        _enPeriodo = enPeriodo,
        _enPreparoSobrevivencia = enPreparoSobrevivencia,
        _enStatus = enStatus,
        _enSubsetor = enSubsetor,
        _enRequisitoRequerido = enRequisitoRequerido,
        _enResultadoInspecao = enResultadoInspecao,
        _enResultadoReinspecao = enResultadoReinspecao,
        _enNps = enNps,
        _enResponsavel = enResponsavel,
        _dtFornecedor = dtFornecedor,
        _dtProblemaRecorrente = dtProblemaRecorrente;

  // "en_inspecao" field.
  List<String>? _enInspecao;
  List<String> get enInspecao => _enInspecao ?? const [];
  set enInspecao(List<String>? val) => _enInspecao = val;

  void updateEnInspecao(Function(List<String>) updateFn) {
    updateFn(_enInspecao ??= []);
  }

  bool hasEnInspecao() => _enInspecao != null;

  // "en_aprovacao" field.
  List<String>? _enAprovacao;
  List<String> get enAprovacao => _enAprovacao ?? const [];
  set enAprovacao(List<String>? val) => _enAprovacao = val;

  void updateEnAprovacao(Function(List<String>) updateFn) {
    updateFn(_enAprovacao ??= []);
  }

  bool hasEnAprovacao() => _enAprovacao != null;

  // "simNao" field.
  String? _simNao;
  String get simNao => _simNao ?? 'Sim/Não';
  set simNao(String? val) => _simNao = val;

  bool hasSimNao() => _simNao != null;

  // "texto" field.
  String? _texto;
  String get texto => _texto ?? 'Texto';
  set texto(String? val) => _texto = val;

  bool hasTexto() => _texto != null;

  // "en_camposFormulario" field.
  List<String>? _enCamposFormulario;
  List<String> get enCamposFormulario => _enCamposFormulario ?? const [];
  set enCamposFormulario(List<String>? val) => _enCamposFormulario = val;

  void updateEnCamposFormulario(Function(List<String>) updateFn) {
    updateFn(_enCamposFormulario ??= []);
  }

  bool hasEnCamposFormulario() => _enCamposFormulario != null;

  // "en_categoriaFormulario" field.
  String? _enCategoriaFormulario;
  String get enCategoriaFormulario => _enCategoriaFormulario ?? '';
  set enCategoriaFormulario(String? val) => _enCategoriaFormulario = val;

  bool hasEnCategoriaFormulario() => _enCategoriaFormulario != null;

  // "en_comprovacoes" field.
  List<String>? _enComprovacoes;
  List<String> get enComprovacoes => _enComprovacoes ?? const [];
  set enComprovacoes(List<String>? val) => _enComprovacoes = val;

  void updateEnComprovacoes(Function(List<String>) updateFn) {
    updateFn(_enComprovacoes ??= []);
  }

  bool hasEnComprovacoes() => _enComprovacoes != null;

  // "en_tagsCor" field.
  List<String>? _enTagsCor;
  List<String> get enTagsCor => _enTagsCor ?? const [];
  set enTagsCor(List<String>? val) => _enTagsCor = val;

  void updateEnTagsCor(Function(List<String>) updateFn) {
    updateFn(_enTagsCor ??= []);
  }

  bool hasEnTagsCor() => _enTagsCor != null;

  // "en_atende" field.
  List<String>? _enAtende;
  List<String> get enAtende => _enAtende ?? const [];
  set enAtende(List<String>? val) => _enAtende = val;

  void updateEnAtende(Function(List<String>) updateFn) {
    updateFn(_enAtende ??= []);
  }

  bool hasEnAtende() => _enAtende != null;

  // "en_condPagamento" field.
  List<String>? _enCondPagamento;
  List<String> get enCondPagamento => _enCondPagamento ?? const [];
  set enCondPagamento(List<String>? val) => _enCondPagamento = val;

  void updateEnCondPagamento(Function(List<String>) updateFn) {
    updateFn(_enCondPagamento ??= []);
  }

  bool hasEnCondPagamento() => _enCondPagamento != null;

  // "en_metodoAvaliacao" field.
  List<String>? _enMetodoAvaliacao;
  List<String> get enMetodoAvaliacao => _enMetodoAvaliacao ?? const [];
  set enMetodoAvaliacao(List<String>? val) => _enMetodoAvaliacao = val;

  void updateEnMetodoAvaliacao(Function(List<String>) updateFn) {
    updateFn(_enMetodoAvaliacao ??= []);
  }

  bool hasEnMetodoAvaliacao() => _enMetodoAvaliacao != null;

  // "en_origem" field.
  List<String>? _enOrigem;
  List<String> get enOrigem => _enOrigem ?? const [];
  set enOrigem(List<String>? val) => _enOrigem = val;

  void updateEnOrigem(Function(List<String>) updateFn) {
    updateFn(_enOrigem ??= []);
  }

  bool hasEnOrigem() => _enOrigem != null;

  // "en_partes" field.
  List<String>? _enPartes;
  List<String> get enPartes => _enPartes ?? const [];
  set enPartes(List<String>? val) => _enPartes = val;

  void updateEnPartes(Function(List<String>) updateFn) {
    updateFn(_enPartes ??= []);
  }

  bool hasEnPartes() => _enPartes != null;

  // "en_periodicidade" field.
  List<String>? _enPeriodicidade;
  List<String> get enPeriodicidade => _enPeriodicidade ?? const [];
  set enPeriodicidade(List<String>? val) => _enPeriodicidade = val;

  void updateEnPeriodicidade(Function(List<String>) updateFn) {
    updateFn(_enPeriodicidade ??= []);
  }

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
  List<String>? _enPreparoSobrevivencia;
  List<String> get enPreparoSobrevivencia =>
      _enPreparoSobrevivencia ?? const [];
  set enPreparoSobrevivencia(List<String>? val) =>
      _enPreparoSobrevivencia = val;

  void updateEnPreparoSobrevivencia(Function(List<String>) updateFn) {
    updateFn(_enPreparoSobrevivencia ??= []);
  }

  bool hasEnPreparoSobrevivencia() => _enPreparoSobrevivencia != null;

  // "en_status" field.
  List<String>? _enStatus;
  List<String> get enStatus => _enStatus ?? const [];
  set enStatus(List<String>? val) => _enStatus = val;

  void updateEnStatus(Function(List<String>) updateFn) {
    updateFn(_enStatus ??= []);
  }

  bool hasEnStatus() => _enStatus != null;

  // "en_subsetor" field.
  List<String>? _enSubsetor;
  List<String> get enSubsetor => _enSubsetor ?? const [];
  set enSubsetor(List<String>? val) => _enSubsetor = val;

  void updateEnSubsetor(Function(List<String>) updateFn) {
    updateFn(_enSubsetor ??= []);
  }

  bool hasEnSubsetor() => _enSubsetor != null;

  // "en_requisitoRequerido" field.
  List<String>? _enRequisitoRequerido;
  List<String> get enRequisitoRequerido => _enRequisitoRequerido ?? const [];
  set enRequisitoRequerido(List<String>? val) => _enRequisitoRequerido = val;

  void updateEnRequisitoRequerido(Function(List<String>) updateFn) {
    updateFn(_enRequisitoRequerido ??= []);
  }

  bool hasEnRequisitoRequerido() => _enRequisitoRequerido != null;

  // "en-resultadoInspecao" field.
  List<String>? _enResultadoInspecao;
  List<String> get enResultadoInspecao => _enResultadoInspecao ?? const [];
  set enResultadoInspecao(List<String>? val) => _enResultadoInspecao = val;

  void updateEnResultadoInspecao(Function(List<String>) updateFn) {
    updateFn(_enResultadoInspecao ??= []);
  }

  bool hasEnResultadoInspecao() => _enResultadoInspecao != null;

  // "en_resultadoReinspecao" field.
  List<String>? _enResultadoReinspecao;
  List<String> get enResultadoReinspecao => _enResultadoReinspecao ?? const [];
  set enResultadoReinspecao(List<String>? val) => _enResultadoReinspecao = val;

  void updateEnResultadoReinspecao(Function(List<String>) updateFn) {
    updateFn(_enResultadoReinspecao ??= []);
  }

  bool hasEnResultadoReinspecao() => _enResultadoReinspecao != null;

  // "en_nps" field.
  List<String>? _enNps;
  List<String> get enNps => _enNps ?? const [];
  set enNps(List<String>? val) => _enNps = val;

  void updateEnNps(Function(List<String>) updateFn) {
    updateFn(_enNps ??= []);
  }

  bool hasEnNps() => _enNps != null;

  // "en_Responsavel" field.
  List<String>? _enResponsavel;
  List<String> get enResponsavel => _enResponsavel ?? const [];
  set enResponsavel(List<String>? val) => _enResponsavel = val;

  void updateEnResponsavel(Function(List<String>) updateFn) {
    updateFn(_enResponsavel ??= []);
  }

  bool hasEnResponsavel() => _enResponsavel != null;

  // "dtFornecedor" field.
  List<DtFornecedorStruct>? _dtFornecedor;
  List<DtFornecedorStruct> get dtFornecedor => _dtFornecedor ?? const [];
  set dtFornecedor(List<DtFornecedorStruct>? val) => _dtFornecedor = val;

  void updateDtFornecedor(Function(List<DtFornecedorStruct>) updateFn) {
    updateFn(_dtFornecedor ??= []);
  }

  bool hasDtFornecedor() => _dtFornecedor != null;

  // "dtProblemaRecorrente" field.
  List<DtProblemaRecorrenteStruct>? _dtProblemaRecorrente;
  List<DtProblemaRecorrenteStruct> get dtProblemaRecorrente =>
      _dtProblemaRecorrente ?? const [];
  set dtProblemaRecorrente(List<DtProblemaRecorrenteStruct>? val) =>
      _dtProblemaRecorrente = val;

  void updateDtProblemaRecorrente(
      Function(List<DtProblemaRecorrenteStruct>) updateFn) {
    updateFn(_dtProblemaRecorrente ??= []);
  }

  bool hasDtProblemaRecorrente() => _dtProblemaRecorrente != null;

  static EnunsStruct fromMap(Map<String, dynamic> data) => EnunsStruct(
        enInspecao: getDataList(data['en_inspecao']),
        enAprovacao: getDataList(data['en_aprovacao']),
        simNao: data['simNao'] as String?,
        texto: data['texto'] as String?,
        enCamposFormulario: getDataList(data['en_camposFormulario']),
        enCategoriaFormulario: data['en_categoriaFormulario'] as String?,
        enComprovacoes: getDataList(data['en_comprovacoes']),
        enTagsCor: getDataList(data['en_tagsCor']),
        enAtende: getDataList(data['en_atende']),
        enCondPagamento: getDataList(data['en_condPagamento']),
        enMetodoAvaliacao: getDataList(data['en_metodoAvaliacao']),
        enOrigem: getDataList(data['en_origem']),
        enPartes: getDataList(data['en_partes']),
        enPeriodicidade: getDataList(data['en_periodicidade']),
        enPeriodo: getDataList(data['en_periodo']),
        enPreparoSobrevivencia: getDataList(data['en_preparoSobrevivencia']),
        enStatus: getDataList(data['en_status']),
        enSubsetor: getDataList(data['en_subsetor']),
        enRequisitoRequerido: getDataList(data['en_requisitoRequerido']),
        enResultadoInspecao: getDataList(data['en-resultadoInspecao']),
        enResultadoReinspecao: getDataList(data['en_resultadoReinspecao']),
        enNps: getDataList(data['en_nps']),
        enResponsavel: getDataList(data['en_Responsavel']),
        dtFornecedor: getStructList(
          data['dtFornecedor'],
          DtFornecedorStruct.fromMap,
        ),
        dtProblemaRecorrente: getStructList(
          data['dtProblemaRecorrente'],
          DtProblemaRecorrenteStruct.fromMap,
        ),
      );

  static EnunsStruct? maybeFromMap(dynamic data) =>
      data is Map ? EnunsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'en_inspecao': _enInspecao,
        'en_aprovacao': _enAprovacao,
        'simNao': _simNao,
        'texto': _texto,
        'en_camposFormulario': _enCamposFormulario,
        'en_categoriaFormulario': _enCategoriaFormulario,
        'en_comprovacoes': _enComprovacoes,
        'en_tagsCor': _enTagsCor,
        'en_atende': _enAtende,
        'en_condPagamento': _enCondPagamento,
        'en_metodoAvaliacao': _enMetodoAvaliacao,
        'en_origem': _enOrigem,
        'en_partes': _enPartes,
        'en_periodicidade': _enPeriodicidade,
        'en_periodo': _enPeriodo,
        'en_preparoSobrevivencia': _enPreparoSobrevivencia,
        'en_status': _enStatus,
        'en_subsetor': _enSubsetor,
        'en_requisitoRequerido': _enRequisitoRequerido,
        'en-resultadoInspecao': _enResultadoInspecao,
        'en_resultadoReinspecao': _enResultadoReinspecao,
        'en_nps': _enNps,
        'en_Responsavel': _enResponsavel,
        'dtFornecedor': _dtFornecedor?.map((e) => e.toMap()).toList(),
        'dtProblemaRecorrente':
            _dtProblemaRecorrente?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'en_inspecao': serializeParam(
          _enInspecao,
          ParamType.String,
          isList: true,
        ),
        'en_aprovacao': serializeParam(
          _enAprovacao,
          ParamType.String,
          isList: true,
        ),
        'simNao': serializeParam(
          _simNao,
          ParamType.String,
        ),
        'texto': serializeParam(
          _texto,
          ParamType.String,
        ),
        'en_camposFormulario': serializeParam(
          _enCamposFormulario,
          ParamType.String,
          isList: true,
        ),
        'en_categoriaFormulario': serializeParam(
          _enCategoriaFormulario,
          ParamType.String,
        ),
        'en_comprovacoes': serializeParam(
          _enComprovacoes,
          ParamType.String,
          isList: true,
        ),
        'en_tagsCor': serializeParam(
          _enTagsCor,
          ParamType.String,
          isList: true,
        ),
        'en_atende': serializeParam(
          _enAtende,
          ParamType.String,
          isList: true,
        ),
        'en_condPagamento': serializeParam(
          _enCondPagamento,
          ParamType.String,
          isList: true,
        ),
        'en_metodoAvaliacao': serializeParam(
          _enMetodoAvaliacao,
          ParamType.String,
          isList: true,
        ),
        'en_origem': serializeParam(
          _enOrigem,
          ParamType.String,
          isList: true,
        ),
        'en_partes': serializeParam(
          _enPartes,
          ParamType.String,
          isList: true,
        ),
        'en_periodicidade': serializeParam(
          _enPeriodicidade,
          ParamType.String,
          isList: true,
        ),
        'en_periodo': serializeParam(
          _enPeriodo,
          ParamType.String,
          isList: true,
        ),
        'en_preparoSobrevivencia': serializeParam(
          _enPreparoSobrevivencia,
          ParamType.String,
          isList: true,
        ),
        'en_status': serializeParam(
          _enStatus,
          ParamType.String,
          isList: true,
        ),
        'en_subsetor': serializeParam(
          _enSubsetor,
          ParamType.String,
          isList: true,
        ),
        'en_requisitoRequerido': serializeParam(
          _enRequisitoRequerido,
          ParamType.String,
          isList: true,
        ),
        'en-resultadoInspecao': serializeParam(
          _enResultadoInspecao,
          ParamType.String,
          isList: true,
        ),
        'en_resultadoReinspecao': serializeParam(
          _enResultadoReinspecao,
          ParamType.String,
          isList: true,
        ),
        'en_nps': serializeParam(
          _enNps,
          ParamType.String,
          isList: true,
        ),
        'en_Responsavel': serializeParam(
          _enResponsavel,
          ParamType.String,
          isList: true,
        ),
        'dtFornecedor': serializeParam(
          _dtFornecedor,
          ParamType.DataStruct,
          isList: true,
        ),
        'dtProblemaRecorrente': serializeParam(
          _dtProblemaRecorrente,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static EnunsStruct fromSerializableMap(Map<String, dynamic> data) =>
      EnunsStruct(
        enInspecao: deserializeParam<String>(
          data['en_inspecao'],
          ParamType.String,
          true,
        ),
        enAprovacao: deserializeParam<String>(
          data['en_aprovacao'],
          ParamType.String,
          true,
        ),
        simNao: deserializeParam(
          data['simNao'],
          ParamType.String,
          false,
        ),
        texto: deserializeParam(
          data['texto'],
          ParamType.String,
          false,
        ),
        enCamposFormulario: deserializeParam<String>(
          data['en_camposFormulario'],
          ParamType.String,
          true,
        ),
        enCategoriaFormulario: deserializeParam(
          data['en_categoriaFormulario'],
          ParamType.String,
          false,
        ),
        enComprovacoes: deserializeParam<String>(
          data['en_comprovacoes'],
          ParamType.String,
          true,
        ),
        enTagsCor: deserializeParam<String>(
          data['en_tagsCor'],
          ParamType.String,
          true,
        ),
        enAtende: deserializeParam<String>(
          data['en_atende'],
          ParamType.String,
          true,
        ),
        enCondPagamento: deserializeParam<String>(
          data['en_condPagamento'],
          ParamType.String,
          true,
        ),
        enMetodoAvaliacao: deserializeParam<String>(
          data['en_metodoAvaliacao'],
          ParamType.String,
          true,
        ),
        enOrigem: deserializeParam<String>(
          data['en_origem'],
          ParamType.String,
          true,
        ),
        enPartes: deserializeParam<String>(
          data['en_partes'],
          ParamType.String,
          true,
        ),
        enPeriodicidade: deserializeParam<String>(
          data['en_periodicidade'],
          ParamType.String,
          true,
        ),
        enPeriodo: deserializeParam<String>(
          data['en_periodo'],
          ParamType.String,
          true,
        ),
        enPreparoSobrevivencia: deserializeParam<String>(
          data['en_preparoSobrevivencia'],
          ParamType.String,
          true,
        ),
        enStatus: deserializeParam<String>(
          data['en_status'],
          ParamType.String,
          true,
        ),
        enSubsetor: deserializeParam<String>(
          data['en_subsetor'],
          ParamType.String,
          true,
        ),
        enRequisitoRequerido: deserializeParam<String>(
          data['en_requisitoRequerido'],
          ParamType.String,
          true,
        ),
        enResultadoInspecao: deserializeParam<String>(
          data['en-resultadoInspecao'],
          ParamType.String,
          true,
        ),
        enResultadoReinspecao: deserializeParam<String>(
          data['en_resultadoReinspecao'],
          ParamType.String,
          true,
        ),
        enNps: deserializeParam<String>(
          data['en_nps'],
          ParamType.String,
          true,
        ),
        enResponsavel: deserializeParam<String>(
          data['en_Responsavel'],
          ParamType.String,
          true,
        ),
        dtFornecedor: deserializeStructParam<DtFornecedorStruct>(
          data['dtFornecedor'],
          ParamType.DataStruct,
          true,
          structBuilder: DtFornecedorStruct.fromSerializableMap,
        ),
        dtProblemaRecorrente:
            deserializeStructParam<DtProblemaRecorrenteStruct>(
          data['dtProblemaRecorrente'],
          ParamType.DataStruct,
          true,
          structBuilder: DtProblemaRecorrenteStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'EnunsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is EnunsStruct &&
        listEquality.equals(enInspecao, other.enInspecao) &&
        listEquality.equals(enAprovacao, other.enAprovacao) &&
        simNao == other.simNao &&
        texto == other.texto &&
        listEquality.equals(enCamposFormulario, other.enCamposFormulario) &&
        enCategoriaFormulario == other.enCategoriaFormulario &&
        listEquality.equals(enComprovacoes, other.enComprovacoes) &&
        listEquality.equals(enTagsCor, other.enTagsCor) &&
        listEquality.equals(enAtende, other.enAtende) &&
        listEquality.equals(enCondPagamento, other.enCondPagamento) &&
        listEquality.equals(enMetodoAvaliacao, other.enMetodoAvaliacao) &&
        listEquality.equals(enOrigem, other.enOrigem) &&
        listEquality.equals(enPartes, other.enPartes) &&
        listEquality.equals(enPeriodicidade, other.enPeriodicidade) &&
        listEquality.equals(enPeriodo, other.enPeriodo) &&
        listEquality.equals(
            enPreparoSobrevivencia, other.enPreparoSobrevivencia) &&
        listEquality.equals(enStatus, other.enStatus) &&
        listEquality.equals(enSubsetor, other.enSubsetor) &&
        listEquality.equals(enRequisitoRequerido, other.enRequisitoRequerido) &&
        listEquality.equals(enResultadoInspecao, other.enResultadoInspecao) &&
        listEquality.equals(
            enResultadoReinspecao, other.enResultadoReinspecao) &&
        listEquality.equals(enNps, other.enNps) &&
        listEquality.equals(enResponsavel, other.enResponsavel) &&
        listEquality.equals(dtFornecedor, other.dtFornecedor) &&
        listEquality.equals(dtProblemaRecorrente, other.dtProblemaRecorrente);
  }

  @override
  int get hashCode => const ListEquality().hash([
        enInspecao,
        enAprovacao,
        simNao,
        texto,
        enCamposFormulario,
        enCategoriaFormulario,
        enComprovacoes,
        enTagsCor,
        enAtende,
        enCondPagamento,
        enMetodoAvaliacao,
        enOrigem,
        enPartes,
        enPeriodicidade,
        enPeriodo,
        enPreparoSobrevivencia,
        enStatus,
        enSubsetor,
        enRequisitoRequerido,
        enResultadoInspecao,
        enResultadoReinspecao,
        enNps,
        enResponsavel,
        dtFornecedor,
        dtProblemaRecorrente
      ]);
}

EnunsStruct createEnunsStruct({
  String? simNao,
  String? texto,
  String? enCategoriaFormulario,
}) =>
    EnunsStruct(
      simNao: simNao,
      texto: texto,
      enCategoriaFormulario: enCategoriaFormulario,
    );

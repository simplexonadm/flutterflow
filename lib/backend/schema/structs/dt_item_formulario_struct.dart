// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DtItemFormularioStruct extends BaseStruct {
  DtItemFormularioStruct({
    int? id,
    int? createdAt,
    int? userCriador,
    String? correcaoDisposicao,
    String? dataAprovacao,
    String? dataInspecao,
    String? dataPrevista,
    String? dataReinspecao,
    bool? isDeletado,
    String? descricaoItem,
    String? link,
    String? descricaoProblema,
    bool? isPadrao,
    String? enAprovacao,
    int? aprovadoPor,
    String? arquivo,
    List<String>? enCamposFormulario,
    List<String>? listImagens,
    int? empresaId,
    int? formularioId,
    int? moduloId,
    int? submoduloId,
    int? fornecedorId,
    int? localdeproducaoId,
    int? produtofinalId,
    int? controladoId,
    bool? isNaoConformidadeGrave,
    bool? isObsoleto,
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
    String? qrCode,
    int? quantMm,
    String? enRequisitoRequerido,
    bool? isResultadoInsp,
    String? resultadoInspTexto,
    String? enResultadoInspecao,
    List<String>? enResultadoReinspecao,
    String? revisao,
    String? enTagsCor,
    bool? isEditadoApp,
    bool? isCriadoApp,
    String? enNps,
    int? ultimaModificacao,
    String? observacao,
    int? problemarecorrenteId,
  })  : _id = id,
        _createdAt = createdAt,
        _userCriador = userCriador,
        _correcaoDisposicao = correcaoDisposicao,
        _dataAprovacao = dataAprovacao,
        _dataInspecao = dataInspecao,
        _dataPrevista = dataPrevista,
        _dataReinspecao = dataReinspecao,
        _isDeletado = isDeletado,
        _descricaoItem = descricaoItem,
        _link = link,
        _descricaoProblema = descricaoProblema,
        _isPadrao = isPadrao,
        _enAprovacao = enAprovacao,
        _aprovadoPor = aprovadoPor,
        _arquivo = arquivo,
        _enCamposFormulario = enCamposFormulario,
        _listImagens = listImagens,
        _empresaId = empresaId,
        _formularioId = formularioId,
        _moduloId = moduloId,
        _submoduloId = submoduloId,
        _fornecedorId = fornecedorId,
        _localdeproducaoId = localdeproducaoId,
        _produtofinalId = produtofinalId,
        _controladoId = controladoId,
        _isNaoConformidadeGrave = isNaoConformidadeGrave,
        _isObsoleto = isObsoleto,
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
        _qrCode = qrCode,
        _quantMm = quantMm,
        _enRequisitoRequerido = enRequisitoRequerido,
        _isResultadoInsp = isResultadoInsp,
        _resultadoInspTexto = resultadoInspTexto,
        _enResultadoInspecao = enResultadoInspecao,
        _enResultadoReinspecao = enResultadoReinspecao,
        _revisao = revisao,
        _enTagsCor = enTagsCor,
        _isEditadoApp = isEditadoApp,
        _isCriadoApp = isCriadoApp,
        _enNps = enNps,
        _ultimaModificacao = ultimaModificacao,
        _observacao = observacao,
        _problemarecorrenteId = problemarecorrenteId;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "created_at" field.
  int? _createdAt;
  int get createdAt => _createdAt ?? 0;
  set createdAt(int? val) => _createdAt = val;

  void incrementCreatedAt(int amount) => createdAt = createdAt + amount;

  bool hasCreatedAt() => _createdAt != null;

  // "userCriador" field.
  int? _userCriador;
  int get userCriador => _userCriador ?? 0;
  set userCriador(int? val) => _userCriador = val;

  void incrementUserCriador(int amount) => userCriador = userCriador + amount;

  bool hasUserCriador() => _userCriador != null;

  // "correcaoDisposicao" field.
  String? _correcaoDisposicao;
  String get correcaoDisposicao => _correcaoDisposicao ?? '';
  set correcaoDisposicao(String? val) => _correcaoDisposicao = val;

  bool hasCorrecaoDisposicao() => _correcaoDisposicao != null;

  // "dataAprovacao" field.
  String? _dataAprovacao;
  String get dataAprovacao => _dataAprovacao ?? '';
  set dataAprovacao(String? val) => _dataAprovacao = val;

  bool hasDataAprovacao() => _dataAprovacao != null;

  // "dataInspecao" field.
  String? _dataInspecao;
  String get dataInspecao => _dataInspecao ?? '';
  set dataInspecao(String? val) => _dataInspecao = val;

  bool hasDataInspecao() => _dataInspecao != null;

  // "dataPrevista" field.
  String? _dataPrevista;
  String get dataPrevista => _dataPrevista ?? '';
  set dataPrevista(String? val) => _dataPrevista = val;

  bool hasDataPrevista() => _dataPrevista != null;

  // "dataReinspecao" field.
  String? _dataReinspecao;
  String get dataReinspecao => _dataReinspecao ?? '';
  set dataReinspecao(String? val) => _dataReinspecao = val;

  bool hasDataReinspecao() => _dataReinspecao != null;

  // "isDeletado" field.
  bool? _isDeletado;
  bool get isDeletado => _isDeletado ?? false;
  set isDeletado(bool? val) => _isDeletado = val;

  bool hasIsDeletado() => _isDeletado != null;

  // "descricaoItem" field.
  String? _descricaoItem;
  String get descricaoItem => _descricaoItem ?? '';
  set descricaoItem(String? val) => _descricaoItem = val;

  bool hasDescricaoItem() => _descricaoItem != null;

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  set link(String? val) => _link = val;

  bool hasLink() => _link != null;

  // "descricaoProblema" field.
  String? _descricaoProblema;
  String get descricaoProblema => _descricaoProblema ?? '';
  set descricaoProblema(String? val) => _descricaoProblema = val;

  bool hasDescricaoProblema() => _descricaoProblema != null;

  // "isPadrao" field.
  bool? _isPadrao;
  bool get isPadrao => _isPadrao ?? false;
  set isPadrao(bool? val) => _isPadrao = val;

  bool hasIsPadrao() => _isPadrao != null;

  // "en_aprovacao" field.
  String? _enAprovacao;
  String get enAprovacao => _enAprovacao ?? '';
  set enAprovacao(String? val) => _enAprovacao = val;

  bool hasEnAprovacao() => _enAprovacao != null;

  // "AprovadoPor" field.
  int? _aprovadoPor;
  int get aprovadoPor => _aprovadoPor ?? 0;
  set aprovadoPor(int? val) => _aprovadoPor = val;

  void incrementAprovadoPor(int amount) => aprovadoPor = aprovadoPor + amount;

  bool hasAprovadoPor() => _aprovadoPor != null;

  // "arquivo" field.
  String? _arquivo;
  String get arquivo => _arquivo ?? '';
  set arquivo(String? val) => _arquivo = val;

  bool hasArquivo() => _arquivo != null;

  // "en_camposFormulario" field.
  List<String>? _enCamposFormulario;
  List<String> get enCamposFormulario => _enCamposFormulario ?? const [];
  set enCamposFormulario(List<String>? val) => _enCamposFormulario = val;

  void updateEnCamposFormulario(Function(List<String>) updateFn) {
    updateFn(_enCamposFormulario ??= []);
  }

  bool hasEnCamposFormulario() => _enCamposFormulario != null;

  // "listImagens" field.
  List<String>? _listImagens;
  List<String> get listImagens => _listImagens ?? const [];
  set listImagens(List<String>? val) => _listImagens = val;

  void updateListImagens(Function(List<String>) updateFn) {
    updateFn(_listImagens ??= []);
  }

  bool hasListImagens() => _listImagens != null;

  // "empresa_id" field.
  int? _empresaId;
  int get empresaId => _empresaId ?? 0;
  set empresaId(int? val) => _empresaId = val;

  void incrementEmpresaId(int amount) => empresaId = empresaId + amount;

  bool hasEmpresaId() => _empresaId != null;

  // "formulario_id" field.
  int? _formularioId;
  int get formularioId => _formularioId ?? 0;
  set formularioId(int? val) => _formularioId = val;

  void incrementFormularioId(int amount) =>
      formularioId = formularioId + amount;

  bool hasFormularioId() => _formularioId != null;

  // "modulo_id" field.
  int? _moduloId;
  int get moduloId => _moduloId ?? 0;
  set moduloId(int? val) => _moduloId = val;

  void incrementModuloId(int amount) => moduloId = moduloId + amount;

  bool hasModuloId() => _moduloId != null;

  // "submodulo_id" field.
  int? _submoduloId;
  int get submoduloId => _submoduloId ?? 0;
  set submoduloId(int? val) => _submoduloId = val;

  void incrementSubmoduloId(int amount) => submoduloId = submoduloId + amount;

  bool hasSubmoduloId() => _submoduloId != null;

  // "fornecedor_id" field.
  int? _fornecedorId;
  int get fornecedorId => _fornecedorId ?? 0;
  set fornecedorId(int? val) => _fornecedorId = val;

  void incrementFornecedorId(int amount) =>
      fornecedorId = fornecedorId + amount;

  bool hasFornecedorId() => _fornecedorId != null;

  // "localdeproducao_id" field.
  int? _localdeproducaoId;
  int get localdeproducaoId => _localdeproducaoId ?? 0;
  set localdeproducaoId(int? val) => _localdeproducaoId = val;

  void incrementLocaldeproducaoId(int amount) =>
      localdeproducaoId = localdeproducaoId + amount;

  bool hasLocaldeproducaoId() => _localdeproducaoId != null;

  // "produtofinal_id" field.
  int? _produtofinalId;
  int get produtofinalId => _produtofinalId ?? 0;
  set produtofinalId(int? val) => _produtofinalId = val;

  void incrementProdutofinalId(int amount) =>
      produtofinalId = produtofinalId + amount;

  bool hasProdutofinalId() => _produtofinalId != null;

  // "controlado_id" field.
  int? _controladoId;
  int get controladoId => _controladoId ?? 0;
  set controladoId(int? val) => _controladoId = val;

  void incrementControladoId(int amount) =>
      controladoId = controladoId + amount;

  bool hasControladoId() => _controladoId != null;

  // "isNaoConformidadeGrave" field.
  bool? _isNaoConformidadeGrave;
  bool get isNaoConformidadeGrave => _isNaoConformidadeGrave ?? false;
  set isNaoConformidadeGrave(bool? val) => _isNaoConformidadeGrave = val;

  bool hasIsNaoConformidadeGrave() => _isNaoConformidadeGrave != null;

  // "isObsoleto" field.
  bool? _isObsoleto;
  bool get isObsoleto => _isObsoleto ?? false;
  set isObsoleto(bool? val) => _isObsoleto = val;

  bool hasIsObsoleto() => _isObsoleto != null;

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

  // "qr_code" field.
  String? _qrCode;
  String get qrCode => _qrCode ?? '';
  set qrCode(String? val) => _qrCode = val;

  bool hasQrCode() => _qrCode != null;

  // "quantMm" field.
  int? _quantMm;
  int get quantMm => _quantMm ?? 0;
  set quantMm(int? val) => _quantMm = val;

  void incrementQuantMm(int amount) => quantMm = quantMm + amount;

  bool hasQuantMm() => _quantMm != null;

  // "en_requisitoRequerido" field.
  String? _enRequisitoRequerido;
  String get enRequisitoRequerido => _enRequisitoRequerido ?? '';
  set enRequisitoRequerido(String? val) => _enRequisitoRequerido = val;

  bool hasEnRequisitoRequerido() => _enRequisitoRequerido != null;

  // "isResultadoInsp" field.
  bool? _isResultadoInsp;
  bool get isResultadoInsp => _isResultadoInsp ?? false;
  set isResultadoInsp(bool? val) => _isResultadoInsp = val;

  bool hasIsResultadoInsp() => _isResultadoInsp != null;

  // "resultadoInspTexto" field.
  String? _resultadoInspTexto;
  String get resultadoInspTexto => _resultadoInspTexto ?? '';
  set resultadoInspTexto(String? val) => _resultadoInspTexto = val;

  bool hasResultadoInspTexto() => _resultadoInspTexto != null;

  // "en_resultadoInspecao" field.
  String? _enResultadoInspecao;
  String get enResultadoInspecao => _enResultadoInspecao ?? '';
  set enResultadoInspecao(String? val) => _enResultadoInspecao = val;

  bool hasEnResultadoInspecao() => _enResultadoInspecao != null;

  // "en_resultadoReinspecao" field.
  List<String>? _enResultadoReinspecao;
  List<String> get enResultadoReinspecao => _enResultadoReinspecao ?? const [];
  set enResultadoReinspecao(List<String>? val) => _enResultadoReinspecao = val;

  void updateEnResultadoReinspecao(Function(List<String>) updateFn) {
    updateFn(_enResultadoReinspecao ??= []);
  }

  bool hasEnResultadoReinspecao() => _enResultadoReinspecao != null;

  // "revisao" field.
  String? _revisao;
  String get revisao => _revisao ?? '';
  set revisao(String? val) => _revisao = val;

  bool hasRevisao() => _revisao != null;

  // "en_tagsCor" field.
  String? _enTagsCor;
  String get enTagsCor => _enTagsCor ?? '';
  set enTagsCor(String? val) => _enTagsCor = val;

  bool hasEnTagsCor() => _enTagsCor != null;

  // "isEditadoApp" field.
  bool? _isEditadoApp;
  bool get isEditadoApp => _isEditadoApp ?? false;
  set isEditadoApp(bool? val) => _isEditadoApp = val;

  bool hasIsEditadoApp() => _isEditadoApp != null;

  // "isCriadoApp" field.
  bool? _isCriadoApp;
  bool get isCriadoApp => _isCriadoApp ?? false;
  set isCriadoApp(bool? val) => _isCriadoApp = val;

  bool hasIsCriadoApp() => _isCriadoApp != null;

  // "en_nps" field.
  String? _enNps;
  String get enNps => _enNps ?? '';
  set enNps(String? val) => _enNps = val;

  bool hasEnNps() => _enNps != null;

  // "ultimaModificacao" field.
  int? _ultimaModificacao;
  int get ultimaModificacao => _ultimaModificacao ?? 0;
  set ultimaModificacao(int? val) => _ultimaModificacao = val;

  void incrementUltimaModificacao(int amount) =>
      ultimaModificacao = ultimaModificacao + amount;

  bool hasUltimaModificacao() => _ultimaModificacao != null;

  // "observacao" field.
  String? _observacao;
  String get observacao => _observacao ?? '';
  set observacao(String? val) => _observacao = val;

  bool hasObservacao() => _observacao != null;

  // "problemarecorrente_id" field.
  int? _problemarecorrenteId;
  int get problemarecorrenteId => _problemarecorrenteId ?? 0;
  set problemarecorrenteId(int? val) => _problemarecorrenteId = val;

  void incrementProblemarecorrenteId(int amount) =>
      problemarecorrenteId = problemarecorrenteId + amount;

  bool hasProblemarecorrenteId() => _problemarecorrenteId != null;

  static DtItemFormularioStruct fromMap(Map<String, dynamic> data) =>
      DtItemFormularioStruct(
        id: castToType<int>(data['id']),
        createdAt: castToType<int>(data['created_at']),
        userCriador: castToType<int>(data['userCriador']),
        correcaoDisposicao: data['correcaoDisposicao'] as String?,
        dataAprovacao: data['dataAprovacao'] as String?,
        dataInspecao: data['dataInspecao'] as String?,
        dataPrevista: data['dataPrevista'] as String?,
        dataReinspecao: data['dataReinspecao'] as String?,
        isDeletado: data['isDeletado'] as bool?,
        descricaoItem: data['descricaoItem'] as String?,
        link: data['link'] as String?,
        descricaoProblema: data['descricaoProblema'] as String?,
        isPadrao: data['isPadrao'] as bool?,
        enAprovacao: data['en_aprovacao'] as String?,
        aprovadoPor: castToType<int>(data['AprovadoPor']),
        arquivo: data['arquivo'] as String?,
        enCamposFormulario: getDataList(data['en_camposFormulario']),
        listImagens: getDataList(data['listImagens']),
        empresaId: castToType<int>(data['empresa_id']),
        formularioId: castToType<int>(data['formulario_id']),
        moduloId: castToType<int>(data['modulo_id']),
        submoduloId: castToType<int>(data['submodulo_id']),
        fornecedorId: castToType<int>(data['fornecedor_id']),
        localdeproducaoId: castToType<int>(data['localdeproducao_id']),
        produtofinalId: castToType<int>(data['produtofinal_id']),
        controladoId: castToType<int>(data['controlado_id']),
        isNaoConformidadeGrave: data['isNaoConformidadeGrave'] as bool?,
        isObsoleto: data['isObsoleto'] as bool?,
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
        qrCode: data['qr_code'] as String?,
        quantMm: castToType<int>(data['quantMm']),
        enRequisitoRequerido: data['en_requisitoRequerido'] as String?,
        isResultadoInsp: data['isResultadoInsp'] as bool?,
        resultadoInspTexto: data['resultadoInspTexto'] as String?,
        enResultadoInspecao: data['en_resultadoInspecao'] as String?,
        enResultadoReinspecao: getDataList(data['en_resultadoReinspecao']),
        revisao: data['revisao'] as String?,
        enTagsCor: data['en_tagsCor'] as String?,
        isEditadoApp: data['isEditadoApp'] as bool?,
        isCriadoApp: data['isCriadoApp'] as bool?,
        enNps: data['en_nps'] as String?,
        ultimaModificacao: castToType<int>(data['ultimaModificacao']),
        observacao: data['observacao'] as String?,
        problemarecorrenteId: castToType<int>(data['problemarecorrente_id']),
      );

  static DtItemFormularioStruct? maybeFromMap(dynamic data) => data is Map
      ? DtItemFormularioStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'created_at': _createdAt,
        'userCriador': _userCriador,
        'correcaoDisposicao': _correcaoDisposicao,
        'dataAprovacao': _dataAprovacao,
        'dataInspecao': _dataInspecao,
        'dataPrevista': _dataPrevista,
        'dataReinspecao': _dataReinspecao,
        'isDeletado': _isDeletado,
        'descricaoItem': _descricaoItem,
        'link': _link,
        'descricaoProblema': _descricaoProblema,
        'isPadrao': _isPadrao,
        'en_aprovacao': _enAprovacao,
        'AprovadoPor': _aprovadoPor,
        'arquivo': _arquivo,
        'en_camposFormulario': _enCamposFormulario,
        'listImagens': _listImagens,
        'empresa_id': _empresaId,
        'formulario_id': _formularioId,
        'modulo_id': _moduloId,
        'submodulo_id': _submoduloId,
        'fornecedor_id': _fornecedorId,
        'localdeproducao_id': _localdeproducaoId,
        'produtofinal_id': _produtofinalId,
        'controlado_id': _controladoId,
        'isNaoConformidadeGrave': _isNaoConformidadeGrave,
        'isObsoleto': _isObsoleto,
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
        'qr_code': _qrCode,
        'quantMm': _quantMm,
        'en_requisitoRequerido': _enRequisitoRequerido,
        'isResultadoInsp': _isResultadoInsp,
        'resultadoInspTexto': _resultadoInspTexto,
        'en_resultadoInspecao': _enResultadoInspecao,
        'en_resultadoReinspecao': _enResultadoReinspecao,
        'revisao': _revisao,
        'en_tagsCor': _enTagsCor,
        'isEditadoApp': _isEditadoApp,
        'isCriadoApp': _isCriadoApp,
        'en_nps': _enNps,
        'ultimaModificacao': _ultimaModificacao,
        'observacao': _observacao,
        'problemarecorrente_id': _problemarecorrenteId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.int,
        ),
        'userCriador': serializeParam(
          _userCriador,
          ParamType.int,
        ),
        'correcaoDisposicao': serializeParam(
          _correcaoDisposicao,
          ParamType.String,
        ),
        'dataAprovacao': serializeParam(
          _dataAprovacao,
          ParamType.String,
        ),
        'dataInspecao': serializeParam(
          _dataInspecao,
          ParamType.String,
        ),
        'dataPrevista': serializeParam(
          _dataPrevista,
          ParamType.String,
        ),
        'dataReinspecao': serializeParam(
          _dataReinspecao,
          ParamType.String,
        ),
        'isDeletado': serializeParam(
          _isDeletado,
          ParamType.bool,
        ),
        'descricaoItem': serializeParam(
          _descricaoItem,
          ParamType.String,
        ),
        'link': serializeParam(
          _link,
          ParamType.String,
        ),
        'descricaoProblema': serializeParam(
          _descricaoProblema,
          ParamType.String,
        ),
        'isPadrao': serializeParam(
          _isPadrao,
          ParamType.bool,
        ),
        'en_aprovacao': serializeParam(
          _enAprovacao,
          ParamType.String,
        ),
        'AprovadoPor': serializeParam(
          _aprovadoPor,
          ParamType.int,
        ),
        'arquivo': serializeParam(
          _arquivo,
          ParamType.String,
        ),
        'en_camposFormulario': serializeParam(
          _enCamposFormulario,
          ParamType.String,
          isList: true,
        ),
        'listImagens': serializeParam(
          _listImagens,
          ParamType.String,
          isList: true,
        ),
        'empresa_id': serializeParam(
          _empresaId,
          ParamType.int,
        ),
        'formulario_id': serializeParam(
          _formularioId,
          ParamType.int,
        ),
        'modulo_id': serializeParam(
          _moduloId,
          ParamType.int,
        ),
        'submodulo_id': serializeParam(
          _submoduloId,
          ParamType.int,
        ),
        'fornecedor_id': serializeParam(
          _fornecedorId,
          ParamType.int,
        ),
        'localdeproducao_id': serializeParam(
          _localdeproducaoId,
          ParamType.int,
        ),
        'produtofinal_id': serializeParam(
          _produtofinalId,
          ParamType.int,
        ),
        'controlado_id': serializeParam(
          _controladoId,
          ParamType.int,
        ),
        'isNaoConformidadeGrave': serializeParam(
          _isNaoConformidadeGrave,
          ParamType.bool,
        ),
        'isObsoleto': serializeParam(
          _isObsoleto,
          ParamType.bool,
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
        'qr_code': serializeParam(
          _qrCode,
          ParamType.String,
        ),
        'quantMm': serializeParam(
          _quantMm,
          ParamType.int,
        ),
        'en_requisitoRequerido': serializeParam(
          _enRequisitoRequerido,
          ParamType.String,
        ),
        'isResultadoInsp': serializeParam(
          _isResultadoInsp,
          ParamType.bool,
        ),
        'resultadoInspTexto': serializeParam(
          _resultadoInspTexto,
          ParamType.String,
        ),
        'en_resultadoInspecao': serializeParam(
          _enResultadoInspecao,
          ParamType.String,
        ),
        'en_resultadoReinspecao': serializeParam(
          _enResultadoReinspecao,
          ParamType.String,
          isList: true,
        ),
        'revisao': serializeParam(
          _revisao,
          ParamType.String,
        ),
        'en_tagsCor': serializeParam(
          _enTagsCor,
          ParamType.String,
        ),
        'isEditadoApp': serializeParam(
          _isEditadoApp,
          ParamType.bool,
        ),
        'isCriadoApp': serializeParam(
          _isCriadoApp,
          ParamType.bool,
        ),
        'en_nps': serializeParam(
          _enNps,
          ParamType.String,
        ),
        'ultimaModificacao': serializeParam(
          _ultimaModificacao,
          ParamType.int,
        ),
        'observacao': serializeParam(
          _observacao,
          ParamType.String,
        ),
        'problemarecorrente_id': serializeParam(
          _problemarecorrenteId,
          ParamType.int,
        ),
      }.withoutNulls;

  static DtItemFormularioStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      DtItemFormularioStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.int,
          false,
        ),
        userCriador: deserializeParam(
          data['userCriador'],
          ParamType.int,
          false,
        ),
        correcaoDisposicao: deserializeParam(
          data['correcaoDisposicao'],
          ParamType.String,
          false,
        ),
        dataAprovacao: deserializeParam(
          data['dataAprovacao'],
          ParamType.String,
          false,
        ),
        dataInspecao: deserializeParam(
          data['dataInspecao'],
          ParamType.String,
          false,
        ),
        dataPrevista: deserializeParam(
          data['dataPrevista'],
          ParamType.String,
          false,
        ),
        dataReinspecao: deserializeParam(
          data['dataReinspecao'],
          ParamType.String,
          false,
        ),
        isDeletado: deserializeParam(
          data['isDeletado'],
          ParamType.bool,
          false,
        ),
        descricaoItem: deserializeParam(
          data['descricaoItem'],
          ParamType.String,
          false,
        ),
        link: deserializeParam(
          data['link'],
          ParamType.String,
          false,
        ),
        descricaoProblema: deserializeParam(
          data['descricaoProblema'],
          ParamType.String,
          false,
        ),
        isPadrao: deserializeParam(
          data['isPadrao'],
          ParamType.bool,
          false,
        ),
        enAprovacao: deserializeParam(
          data['en_aprovacao'],
          ParamType.String,
          false,
        ),
        aprovadoPor: deserializeParam(
          data['AprovadoPor'],
          ParamType.int,
          false,
        ),
        arquivo: deserializeParam(
          data['arquivo'],
          ParamType.String,
          false,
        ),
        enCamposFormulario: deserializeParam<String>(
          data['en_camposFormulario'],
          ParamType.String,
          true,
        ),
        listImagens: deserializeParam<String>(
          data['listImagens'],
          ParamType.String,
          true,
        ),
        empresaId: deserializeParam(
          data['empresa_id'],
          ParamType.int,
          false,
        ),
        formularioId: deserializeParam(
          data['formulario_id'],
          ParamType.int,
          false,
        ),
        moduloId: deserializeParam(
          data['modulo_id'],
          ParamType.int,
          false,
        ),
        submoduloId: deserializeParam(
          data['submodulo_id'],
          ParamType.int,
          false,
        ),
        fornecedorId: deserializeParam(
          data['fornecedor_id'],
          ParamType.int,
          false,
        ),
        localdeproducaoId: deserializeParam(
          data['localdeproducao_id'],
          ParamType.int,
          false,
        ),
        produtofinalId: deserializeParam(
          data['produtofinal_id'],
          ParamType.int,
          false,
        ),
        controladoId: deserializeParam(
          data['controlado_id'],
          ParamType.int,
          false,
        ),
        isNaoConformidadeGrave: deserializeParam(
          data['isNaoConformidadeGrave'],
          ParamType.bool,
          false,
        ),
        isObsoleto: deserializeParam(
          data['isObsoleto'],
          ParamType.bool,
          false,
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
        qrCode: deserializeParam(
          data['qr_code'],
          ParamType.String,
          false,
        ),
        quantMm: deserializeParam(
          data['quantMm'],
          ParamType.int,
          false,
        ),
        enRequisitoRequerido: deserializeParam(
          data['en_requisitoRequerido'],
          ParamType.String,
          false,
        ),
        isResultadoInsp: deserializeParam(
          data['isResultadoInsp'],
          ParamType.bool,
          false,
        ),
        resultadoInspTexto: deserializeParam(
          data['resultadoInspTexto'],
          ParamType.String,
          false,
        ),
        enResultadoInspecao: deserializeParam(
          data['en_resultadoInspecao'],
          ParamType.String,
          false,
        ),
        enResultadoReinspecao: deserializeParam<String>(
          data['en_resultadoReinspecao'],
          ParamType.String,
          true,
        ),
        revisao: deserializeParam(
          data['revisao'],
          ParamType.String,
          false,
        ),
        enTagsCor: deserializeParam(
          data['en_tagsCor'],
          ParamType.String,
          false,
        ),
        isEditadoApp: deserializeParam(
          data['isEditadoApp'],
          ParamType.bool,
          false,
        ),
        isCriadoApp: deserializeParam(
          data['isCriadoApp'],
          ParamType.bool,
          false,
        ),
        enNps: deserializeParam(
          data['en_nps'],
          ParamType.String,
          false,
        ),
        ultimaModificacao: deserializeParam(
          data['ultimaModificacao'],
          ParamType.int,
          false,
        ),
        observacao: deserializeParam(
          data['observacao'],
          ParamType.String,
          false,
        ),
        problemarecorrenteId: deserializeParam(
          data['problemarecorrente_id'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'DtItemFormularioStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DtItemFormularioStruct &&
        id == other.id &&
        createdAt == other.createdAt &&
        userCriador == other.userCriador &&
        correcaoDisposicao == other.correcaoDisposicao &&
        dataAprovacao == other.dataAprovacao &&
        dataInspecao == other.dataInspecao &&
        dataPrevista == other.dataPrevista &&
        dataReinspecao == other.dataReinspecao &&
        isDeletado == other.isDeletado &&
        descricaoItem == other.descricaoItem &&
        link == other.link &&
        descricaoProblema == other.descricaoProblema &&
        isPadrao == other.isPadrao &&
        enAprovacao == other.enAprovacao &&
        aprovadoPor == other.aprovadoPor &&
        arquivo == other.arquivo &&
        listEquality.equals(enCamposFormulario, other.enCamposFormulario) &&
        listEquality.equals(listImagens, other.listImagens) &&
        empresaId == other.empresaId &&
        formularioId == other.formularioId &&
        moduloId == other.moduloId &&
        submoduloId == other.submoduloId &&
        fornecedorId == other.fornecedorId &&
        localdeproducaoId == other.localdeproducaoId &&
        produtofinalId == other.produtofinalId &&
        controladoId == other.controladoId &&
        isNaoConformidadeGrave == other.isNaoConformidadeGrave &&
        isObsoleto == other.isObsoleto &&
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
        qrCode == other.qrCode &&
        quantMm == other.quantMm &&
        enRequisitoRequerido == other.enRequisitoRequerido &&
        isResultadoInsp == other.isResultadoInsp &&
        resultadoInspTexto == other.resultadoInspTexto &&
        enResultadoInspecao == other.enResultadoInspecao &&
        listEquality.equals(
            enResultadoReinspecao, other.enResultadoReinspecao) &&
        revisao == other.revisao &&
        enTagsCor == other.enTagsCor &&
        isEditadoApp == other.isEditadoApp &&
        isCriadoApp == other.isCriadoApp &&
        enNps == other.enNps &&
        ultimaModificacao == other.ultimaModificacao &&
        observacao == other.observacao &&
        problemarecorrenteId == other.problemarecorrenteId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        createdAt,
        userCriador,
        correcaoDisposicao,
        dataAprovacao,
        dataInspecao,
        dataPrevista,
        dataReinspecao,
        isDeletado,
        descricaoItem,
        link,
        descricaoProblema,
        isPadrao,
        enAprovacao,
        aprovadoPor,
        arquivo,
        enCamposFormulario,
        listImagens,
        empresaId,
        formularioId,
        moduloId,
        submoduloId,
        fornecedorId,
        localdeproducaoId,
        produtofinalId,
        controladoId,
        isNaoConformidadeGrave,
        isObsoleto,
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
        qrCode,
        quantMm,
        enRequisitoRequerido,
        isResultadoInsp,
        resultadoInspTexto,
        enResultadoInspecao,
        enResultadoReinspecao,
        revisao,
        enTagsCor,
        isEditadoApp,
        isCriadoApp,
        enNps,
        ultimaModificacao,
        observacao,
        problemarecorrenteId
      ]);
}

DtItemFormularioStruct createDtItemFormularioStruct({
  int? id,
  int? createdAt,
  int? userCriador,
  String? correcaoDisposicao,
  String? dataAprovacao,
  String? dataInspecao,
  String? dataPrevista,
  String? dataReinspecao,
  bool? isDeletado,
  String? descricaoItem,
  String? link,
  String? descricaoProblema,
  bool? isPadrao,
  String? enAprovacao,
  int? aprovadoPor,
  String? arquivo,
  int? empresaId,
  int? formularioId,
  int? moduloId,
  int? submoduloId,
  int? fornecedorId,
  int? localdeproducaoId,
  int? produtofinalId,
  int? controladoId,
  bool? isNaoConformidadeGrave,
  bool? isObsoleto,
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
  String? qrCode,
  int? quantMm,
  String? enRequisitoRequerido,
  bool? isResultadoInsp,
  String? resultadoInspTexto,
  String? enResultadoInspecao,
  String? revisao,
  String? enTagsCor,
  bool? isEditadoApp,
  bool? isCriadoApp,
  String? enNps,
  int? ultimaModificacao,
  String? observacao,
  int? problemarecorrenteId,
}) =>
    DtItemFormularioStruct(
      id: id,
      createdAt: createdAt,
      userCriador: userCriador,
      correcaoDisposicao: correcaoDisposicao,
      dataAprovacao: dataAprovacao,
      dataInspecao: dataInspecao,
      dataPrevista: dataPrevista,
      dataReinspecao: dataReinspecao,
      isDeletado: isDeletado,
      descricaoItem: descricaoItem,
      link: link,
      descricaoProblema: descricaoProblema,
      isPadrao: isPadrao,
      enAprovacao: enAprovacao,
      aprovadoPor: aprovadoPor,
      arquivo: arquivo,
      empresaId: empresaId,
      formularioId: formularioId,
      moduloId: moduloId,
      submoduloId: submoduloId,
      fornecedorId: fornecedorId,
      localdeproducaoId: localdeproducaoId,
      produtofinalId: produtofinalId,
      controladoId: controladoId,
      isNaoConformidadeGrave: isNaoConformidadeGrave,
      isObsoleto: isObsoleto,
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
      qrCode: qrCode,
      quantMm: quantMm,
      enRequisitoRequerido: enRequisitoRequerido,
      isResultadoInsp: isResultadoInsp,
      resultadoInspTexto: resultadoInspTexto,
      enResultadoInspecao: enResultadoInspecao,
      revisao: revisao,
      enTagsCor: enTagsCor,
      isEditadoApp: isEditadoApp,
      isCriadoApp: isCriadoApp,
      enNps: enNps,
      ultimaModificacao: ultimaModificacao,
      observacao: observacao,
      problemarecorrenteId: problemarecorrenteId,
    );

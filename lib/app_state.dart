import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      if (prefs.containsKey('ff_dtAdministrativo')) {
        try {
          final serializedData = prefs.getString('ff_dtAdministrativo') ?? '{}';
          _dtAdministrativo = AdministrativoStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      if (prefs.containsKey('ff_dtUser')) {
        try {
          final serializedData = prefs.getString('ff_dtUser') ?? '{}';
          _dtUser =
              DtUserStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      if (prefs.containsKey('ff_dtDebug')) {
        try {
          final serializedData = prefs.getString('ff_dtDebug') ?? '{}';
          _dtDebug =
              DebugStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      if (prefs.containsKey('ff_filtro')) {
        try {
          final serializedData = prefs.getString('ff_filtro') ?? '{}';
          _filtro =
              FiltroStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      if (prefs.containsKey('ff_dtEmpresa')) {
        try {
          final serializedData = prefs.getString('ff_dtEmpresa') ?? '{}';
          _dtEmpresa =
              DtEmpresaStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _dtLocalDeProducao = prefs
              .getStringList('ff_dtLocalDeProducao')
              ?.map((x) {
                try {
                  return DtLocalDeProducaoStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _dtLocalDeProducao;
    });
    _safeInit(() {
      _dtNivelDeAcesso = prefs
              .getStringList('ff_dtNivelDeAcesso')
              ?.map((x) {
                try {
                  return DtNivelDeAcessoStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _dtNivelDeAcesso;
    });
    _safeInit(() {
      _dtModulo = prefs
              .getStringList('ff_dtModulo')
              ?.map((x) {
                try {
                  return DtModuloStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _dtModulo;
    });
    _safeInit(() {
      _dtSubmodulos = prefs
              .getStringList('ff_dtSubmodulos')
              ?.map((x) {
                try {
                  return DtSubmodulosStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _dtSubmodulos;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_dtLocalProducaoAtual')) {
        try {
          final serializedData =
              prefs.getString('ff_dtLocalProducaoAtual') ?? '{}';
          _dtLocalProducaoAtual = DtLocalDeProducaoStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      if (prefs.containsKey('ff_navegacao')) {
        try {
          final serializedData = prefs.getString('ff_navegacao') ?? '{}';
          _navegacao =
              NavegacaoStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _dtFormulario = prefs
              .getStringList('ff_dtFormulario')
              ?.map((x) {
                try {
                  return DtFormularioStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _dtFormulario;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_dtControleOffline')) {
        try {
          final serializedData =
              prefs.getString('ff_dtControleOffline') ?? '{}';
          _dtControleOffline = DtControleOfflineStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _dtProdutoFinal = prefs
              .getStringList('ff_dtProdutoFinal')
              ?.map((x) {
                try {
                  return DtProdutoFinalStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _dtProdutoFinal;
    });
    _safeInit(() {
      _dtItemFormulario = prefs
              .getStringList('ff_dtItemFormulario')
              ?.map((x) {
                try {
                  return DtItemFormularioStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _dtItemFormulario;
    });
    _safeInit(() {
      _dtItemFormularioPadrao = prefs
              .getStringList('ff_dtItemFormularioPadrao')
              ?.map((x) {
                try {
                  return DtItemFormularioStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _dtItemFormularioPadrao;
    });
    _safeInit(() {
      _dtServicoControlado = prefs
              .getStringList('ff_dtServicoControlado')
              ?.map((x) {
                try {
                  return DtControladoStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _dtServicoControlado;
    });
    _safeInit(() {
      _dtFornecedor = prefs
              .getStringList('ff_dtFornecedor')
              ?.map((x) {
                try {
                  return DtFornecedorStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _dtFornecedor;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_enunsPadrao')) {
        try {
          final serializedData = prefs.getString('ff_enunsPadrao') ?? '{}';
          _enunsPadrao =
              EnunsStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _dtProblemaRecorrente = prefs
              .getStringList('ff_dtProblemaRecorrente')
              ?.map((x) {
                try {
                  return DtProblemaRecorrenteStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _dtProblemaRecorrente;
    });
    _safeInit(() {
      _enConformidade = prefs.getString('ff_enConformidade') ?? _enConformidade;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_dtNivelDeAcessoAtual')) {
        try {
          final serializedData =
              prefs.getString('ff_dtNivelDeAcessoAtual') ?? '{}';
          _dtNivelDeAcessoAtual = DtNivelDeAcessoStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _dtDataAprovacap =
          prefs.getString('ff_dtDataAprovacap') ?? _dtDataAprovacap;
    });
    _safeInit(() {
      _dtDataPrevista = prefs.getString('ff_dtDataPrevista') ?? _dtDataPrevista;
    });
    _safeInit(() {
      _DtDataInspecao = prefs.getString('ff_DtDataInspecao') ?? _DtDataInspecao;
    });
    _safeInit(() {
      _idFormulario = prefs.getString('ff_idFormulario') ?? _idFormulario;
    });
    _safeInit(() {
      _enItemFormulario = prefs.containsKey('ff_enItemFormulario')
          ? deserializeEnum<EnItemFormulario>(
              prefs.getString('ff_enItemFormulario'))
          : _enItemFormulario;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_dtEnItemFormulario')) {
        try {
          final serializedData =
              prefs.getString('ff_dtEnItemFormulario') ?? '{}';
          _dtEnItemFormulario = EnnumItemFormularioStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _descricaoFornecedor =
          prefs.getString('ff_descricaoFornecedor') ?? _descricaoFornecedor;
    });
    _safeInit(() {
      _descricaoProblemaRecorrente =
          prefs.getString('ff_descricaoProblemaRecorrente') ??
              _descricaoProblemaRecorrente;
    });
    _safeInit(() {
      _dtPeriodo = prefs
              .getStringList('ff_dtPeriodo')
              ?.map((x) {
                try {
                  return DtPeriodoStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _dtPeriodo;
    });
    _safeInit(() {
      _periodoDescricao =
          prefs.getStringList('ff_periodoDescricao') ?? _periodoDescricao;
    });
    _safeInit(() {
      _resultadoReinspecaoDescricao =
          prefs.getStringList('ff_resultadoReinspecaoDescricao') ??
              _resultadoReinspecaoDescricao;
    });
    _safeInit(() {
      _resultadoReinpecaoCor =
          prefs.getString('ff_resultadoReinpecaoCor') ?? _resultadoReinpecaoCor;
    });
    _safeInit(() {
      _dtProblemaRecorrente1 = prefs
              .getStringList('ff_dtProblemaRecorrente1')
              ?.map((x) {
                try {
                  return DtProblemaRecorrenteStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _dtProblemaRecorrente1;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  AdministrativoStruct _dtAdministrativo =
      AdministrativoStruct.fromSerializableMap(
          jsonDecode('{\"paginaAtual\":\"\"}'));
  AdministrativoStruct get dtAdministrativo => _dtAdministrativo;
  set dtAdministrativo(AdministrativoStruct value) {
    _dtAdministrativo = value;
    prefs.setString('ff_dtAdministrativo', value.serialize());
  }

  void updateDtAdministrativoStruct(Function(AdministrativoStruct) updateFn) {
    updateFn(_dtAdministrativo);
    prefs.setString('ff_dtAdministrativo', _dtAdministrativo.serialize());
  }

  DtUserStruct _dtUser = DtUserStruct();
  DtUserStruct get dtUser => _dtUser;
  set dtUser(DtUserStruct value) {
    _dtUser = value;
    prefs.setString('ff_dtUser', value.serialize());
  }

  void updateDtUserStruct(Function(DtUserStruct) updateFn) {
    updateFn(_dtUser);
    prefs.setString('ff_dtUser', _dtUser.serialize());
  }

  DebugStruct _dtDebug =
      DebugStruct.fromSerializableMap(jsonDecode('{\"ativo\":\"true\"}'));
  DebugStruct get dtDebug => _dtDebug;
  set dtDebug(DebugStruct value) {
    _dtDebug = value;
    prefs.setString('ff_dtDebug', value.serialize());
  }

  void updateDtDebugStruct(Function(DebugStruct) updateFn) {
    updateFn(_dtDebug);
    prefs.setString('ff_dtDebug', _dtDebug.serialize());
  }

  FiltroStruct _filtro = FiltroStruct();
  FiltroStruct get filtro => _filtro;
  set filtro(FiltroStruct value) {
    _filtro = value;
    prefs.setString('ff_filtro', value.serialize());
  }

  void updateFiltroStruct(Function(FiltroStruct) updateFn) {
    updateFn(_filtro);
    prefs.setString('ff_filtro', _filtro.serialize());
  }

  DtEmpresaStruct _dtEmpresa = DtEmpresaStruct();
  DtEmpresaStruct get dtEmpresa => _dtEmpresa;
  set dtEmpresa(DtEmpresaStruct value) {
    _dtEmpresa = value;
    prefs.setString('ff_dtEmpresa', value.serialize());
  }

  void updateDtEmpresaStruct(Function(DtEmpresaStruct) updateFn) {
    updateFn(_dtEmpresa);
    prefs.setString('ff_dtEmpresa', _dtEmpresa.serialize());
  }

  List<DtLocalDeProducaoStruct> _dtLocalDeProducao = [];
  List<DtLocalDeProducaoStruct> get dtLocalDeProducao => _dtLocalDeProducao;
  set dtLocalDeProducao(List<DtLocalDeProducaoStruct> value) {
    _dtLocalDeProducao = value;
    prefs.setStringList(
        'ff_dtLocalDeProducao', value.map((x) => x.serialize()).toList());
  }

  void addToDtLocalDeProducao(DtLocalDeProducaoStruct value) {
    dtLocalDeProducao.add(value);
    prefs.setStringList('ff_dtLocalDeProducao',
        _dtLocalDeProducao.map((x) => x.serialize()).toList());
  }

  void removeFromDtLocalDeProducao(DtLocalDeProducaoStruct value) {
    dtLocalDeProducao.remove(value);
    prefs.setStringList('ff_dtLocalDeProducao',
        _dtLocalDeProducao.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromDtLocalDeProducao(int index) {
    dtLocalDeProducao.removeAt(index);
    prefs.setStringList('ff_dtLocalDeProducao',
        _dtLocalDeProducao.map((x) => x.serialize()).toList());
  }

  void updateDtLocalDeProducaoAtIndex(
    int index,
    DtLocalDeProducaoStruct Function(DtLocalDeProducaoStruct) updateFn,
  ) {
    dtLocalDeProducao[index] = updateFn(_dtLocalDeProducao[index]);
    prefs.setStringList('ff_dtLocalDeProducao',
        _dtLocalDeProducao.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInDtLocalDeProducao(
      int index, DtLocalDeProducaoStruct value) {
    dtLocalDeProducao.insert(index, value);
    prefs.setStringList('ff_dtLocalDeProducao',
        _dtLocalDeProducao.map((x) => x.serialize()).toList());
  }

  List<DtNivelDeAcessoStruct> _dtNivelDeAcesso = [];
  List<DtNivelDeAcessoStruct> get dtNivelDeAcesso => _dtNivelDeAcesso;
  set dtNivelDeAcesso(List<DtNivelDeAcessoStruct> value) {
    _dtNivelDeAcesso = value;
    prefs.setStringList(
        'ff_dtNivelDeAcesso', value.map((x) => x.serialize()).toList());
  }

  void addToDtNivelDeAcesso(DtNivelDeAcessoStruct value) {
    dtNivelDeAcesso.add(value);
    prefs.setStringList('ff_dtNivelDeAcesso',
        _dtNivelDeAcesso.map((x) => x.serialize()).toList());
  }

  void removeFromDtNivelDeAcesso(DtNivelDeAcessoStruct value) {
    dtNivelDeAcesso.remove(value);
    prefs.setStringList('ff_dtNivelDeAcesso',
        _dtNivelDeAcesso.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromDtNivelDeAcesso(int index) {
    dtNivelDeAcesso.removeAt(index);
    prefs.setStringList('ff_dtNivelDeAcesso',
        _dtNivelDeAcesso.map((x) => x.serialize()).toList());
  }

  void updateDtNivelDeAcessoAtIndex(
    int index,
    DtNivelDeAcessoStruct Function(DtNivelDeAcessoStruct) updateFn,
  ) {
    dtNivelDeAcesso[index] = updateFn(_dtNivelDeAcesso[index]);
    prefs.setStringList('ff_dtNivelDeAcesso',
        _dtNivelDeAcesso.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInDtNivelDeAcesso(int index, DtNivelDeAcessoStruct value) {
    dtNivelDeAcesso.insert(index, value);
    prefs.setStringList('ff_dtNivelDeAcesso',
        _dtNivelDeAcesso.map((x) => x.serialize()).toList());
  }

  List<DtModuloStruct> _dtModulo = [];
  List<DtModuloStruct> get dtModulo => _dtModulo;
  set dtModulo(List<DtModuloStruct> value) {
    _dtModulo = value;
    prefs.setStringList(
        'ff_dtModulo', value.map((x) => x.serialize()).toList());
  }

  void addToDtModulo(DtModuloStruct value) {
    dtModulo.add(value);
    prefs.setStringList(
        'ff_dtModulo', _dtModulo.map((x) => x.serialize()).toList());
  }

  void removeFromDtModulo(DtModuloStruct value) {
    dtModulo.remove(value);
    prefs.setStringList(
        'ff_dtModulo', _dtModulo.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromDtModulo(int index) {
    dtModulo.removeAt(index);
    prefs.setStringList(
        'ff_dtModulo', _dtModulo.map((x) => x.serialize()).toList());
  }

  void updateDtModuloAtIndex(
    int index,
    DtModuloStruct Function(DtModuloStruct) updateFn,
  ) {
    dtModulo[index] = updateFn(_dtModulo[index]);
    prefs.setStringList(
        'ff_dtModulo', _dtModulo.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInDtModulo(int index, DtModuloStruct value) {
    dtModulo.insert(index, value);
    prefs.setStringList(
        'ff_dtModulo', _dtModulo.map((x) => x.serialize()).toList());
  }

  List<DtSubmodulosStruct> _dtSubmodulos = [];
  List<DtSubmodulosStruct> get dtSubmodulos => _dtSubmodulos;
  set dtSubmodulos(List<DtSubmodulosStruct> value) {
    _dtSubmodulos = value;
    prefs.setStringList(
        'ff_dtSubmodulos', value.map((x) => x.serialize()).toList());
  }

  void addToDtSubmodulos(DtSubmodulosStruct value) {
    dtSubmodulos.add(value);
    prefs.setStringList(
        'ff_dtSubmodulos', _dtSubmodulos.map((x) => x.serialize()).toList());
  }

  void removeFromDtSubmodulos(DtSubmodulosStruct value) {
    dtSubmodulos.remove(value);
    prefs.setStringList(
        'ff_dtSubmodulos', _dtSubmodulos.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromDtSubmodulos(int index) {
    dtSubmodulos.removeAt(index);
    prefs.setStringList(
        'ff_dtSubmodulos', _dtSubmodulos.map((x) => x.serialize()).toList());
  }

  void updateDtSubmodulosAtIndex(
    int index,
    DtSubmodulosStruct Function(DtSubmodulosStruct) updateFn,
  ) {
    dtSubmodulos[index] = updateFn(_dtSubmodulos[index]);
    prefs.setStringList(
        'ff_dtSubmodulos', _dtSubmodulos.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInDtSubmodulos(int index, DtSubmodulosStruct value) {
    dtSubmodulos.insert(index, value);
    prefs.setStringList(
        'ff_dtSubmodulos', _dtSubmodulos.map((x) => x.serialize()).toList());
  }

  DtLocalDeProducaoStruct _dtLocalProducaoAtual = DtLocalDeProducaoStruct();
  DtLocalDeProducaoStruct get dtLocalProducaoAtual => _dtLocalProducaoAtual;
  set dtLocalProducaoAtual(DtLocalDeProducaoStruct value) {
    _dtLocalProducaoAtual = value;
    prefs.setString('ff_dtLocalProducaoAtual', value.serialize());
  }

  void updateDtLocalProducaoAtualStruct(
      Function(DtLocalDeProducaoStruct) updateFn) {
    updateFn(_dtLocalProducaoAtual);
    prefs.setString(
        'ff_dtLocalProducaoAtual', _dtLocalProducaoAtual.serialize());
  }

  NavegacaoStruct _navegacao = NavegacaoStruct();
  NavegacaoStruct get navegacao => _navegacao;
  set navegacao(NavegacaoStruct value) {
    _navegacao = value;
    prefs.setString('ff_navegacao', value.serialize());
  }

  void updateNavegacaoStruct(Function(NavegacaoStruct) updateFn) {
    updateFn(_navegacao);
    prefs.setString('ff_navegacao', _navegacao.serialize());
  }

  List<DtFormularioStruct> _dtFormulario = [];
  List<DtFormularioStruct> get dtFormulario => _dtFormulario;
  set dtFormulario(List<DtFormularioStruct> value) {
    _dtFormulario = value;
    prefs.setStringList(
        'ff_dtFormulario', value.map((x) => x.serialize()).toList());
  }

  void addToDtFormulario(DtFormularioStruct value) {
    dtFormulario.add(value);
    prefs.setStringList(
        'ff_dtFormulario', _dtFormulario.map((x) => x.serialize()).toList());
  }

  void removeFromDtFormulario(DtFormularioStruct value) {
    dtFormulario.remove(value);
    prefs.setStringList(
        'ff_dtFormulario', _dtFormulario.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromDtFormulario(int index) {
    dtFormulario.removeAt(index);
    prefs.setStringList(
        'ff_dtFormulario', _dtFormulario.map((x) => x.serialize()).toList());
  }

  void updateDtFormularioAtIndex(
    int index,
    DtFormularioStruct Function(DtFormularioStruct) updateFn,
  ) {
    dtFormulario[index] = updateFn(_dtFormulario[index]);
    prefs.setStringList(
        'ff_dtFormulario', _dtFormulario.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInDtFormulario(int index, DtFormularioStruct value) {
    dtFormulario.insert(index, value);
    prefs.setStringList(
        'ff_dtFormulario', _dtFormulario.map((x) => x.serialize()).toList());
  }

  DtControleOfflineStruct _dtControleOffline = DtControleOfflineStruct();
  DtControleOfflineStruct get dtControleOffline => _dtControleOffline;
  set dtControleOffline(DtControleOfflineStruct value) {
    _dtControleOffline = value;
    prefs.setString('ff_dtControleOffline', value.serialize());
  }

  void updateDtControleOfflineStruct(
      Function(DtControleOfflineStruct) updateFn) {
    updateFn(_dtControleOffline);
    prefs.setString('ff_dtControleOffline', _dtControleOffline.serialize());
  }

  List<DtProdutoFinalStruct> _dtProdutoFinal = [];
  List<DtProdutoFinalStruct> get dtProdutoFinal => _dtProdutoFinal;
  set dtProdutoFinal(List<DtProdutoFinalStruct> value) {
    _dtProdutoFinal = value;
    prefs.setStringList(
        'ff_dtProdutoFinal', value.map((x) => x.serialize()).toList());
  }

  void addToDtProdutoFinal(DtProdutoFinalStruct value) {
    dtProdutoFinal.add(value);
    prefs.setStringList('ff_dtProdutoFinal',
        _dtProdutoFinal.map((x) => x.serialize()).toList());
  }

  void removeFromDtProdutoFinal(DtProdutoFinalStruct value) {
    dtProdutoFinal.remove(value);
    prefs.setStringList('ff_dtProdutoFinal',
        _dtProdutoFinal.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromDtProdutoFinal(int index) {
    dtProdutoFinal.removeAt(index);
    prefs.setStringList('ff_dtProdutoFinal',
        _dtProdutoFinal.map((x) => x.serialize()).toList());
  }

  void updateDtProdutoFinalAtIndex(
    int index,
    DtProdutoFinalStruct Function(DtProdutoFinalStruct) updateFn,
  ) {
    dtProdutoFinal[index] = updateFn(_dtProdutoFinal[index]);
    prefs.setStringList('ff_dtProdutoFinal',
        _dtProdutoFinal.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInDtProdutoFinal(int index, DtProdutoFinalStruct value) {
    dtProdutoFinal.insert(index, value);
    prefs.setStringList('ff_dtProdutoFinal',
        _dtProdutoFinal.map((x) => x.serialize()).toList());
  }

  String _base64Imagem = '';
  String get base64Imagem => _base64Imagem;
  set base64Imagem(String value) {
    _base64Imagem = value;
  }

  List<DtItemFormularioStruct> _dtItemFormulario = [];
  List<DtItemFormularioStruct> get dtItemFormulario => _dtItemFormulario;
  set dtItemFormulario(List<DtItemFormularioStruct> value) {
    _dtItemFormulario = value;
    prefs.setStringList(
        'ff_dtItemFormulario', value.map((x) => x.serialize()).toList());
  }

  void addToDtItemFormulario(DtItemFormularioStruct value) {
    dtItemFormulario.add(value);
    prefs.setStringList('ff_dtItemFormulario',
        _dtItemFormulario.map((x) => x.serialize()).toList());
  }

  void removeFromDtItemFormulario(DtItemFormularioStruct value) {
    dtItemFormulario.remove(value);
    prefs.setStringList('ff_dtItemFormulario',
        _dtItemFormulario.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromDtItemFormulario(int index) {
    dtItemFormulario.removeAt(index);
    prefs.setStringList('ff_dtItemFormulario',
        _dtItemFormulario.map((x) => x.serialize()).toList());
  }

  void updateDtItemFormularioAtIndex(
    int index,
    DtItemFormularioStruct Function(DtItemFormularioStruct) updateFn,
  ) {
    dtItemFormulario[index] = updateFn(_dtItemFormulario[index]);
    prefs.setStringList('ff_dtItemFormulario',
        _dtItemFormulario.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInDtItemFormulario(
      int index, DtItemFormularioStruct value) {
    dtItemFormulario.insert(index, value);
    prefs.setStringList('ff_dtItemFormulario',
        _dtItemFormulario.map((x) => x.serialize()).toList());
  }

  List<DtItemFormularioStruct> _dtItemFormularioPadrao = [
    DtItemFormularioStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"0\",\"created_at\":\"0\",\"userCriador\":\"0\",\"correcaoDisposicao\":\"Hello World\",\"dataAprovacao\":\"Hello World\",\"dataInspecao\":\"Hello World\",\"dataPrevista\":\"Hello World\",\"dataReinspecao\":\"Hello World\",\"isDeletado\":\"false\",\"descricaoItem\":\"Hello World\",\"link\":\"Hello World\",\"descricaoProblema\":\"Hello World\",\"isPadrao\":\"false\",\"en_aprovacao\":\"Hello World\",\"AprovadoPor\":\"0\",\"arquivo\":\"Hello World\",\"en_camposFormulario\":\"[\\\"Hello World\\\"]\",\"listImagens\":\"[\\\"Hello World\\\"]\",\"empresa_id\":\"0\",\"formulario_id\":\"0\",\"modulo_id\":\"0\",\"submodulo_id\":\"0\",\"fornecedor_id\":\"0\",\"localdeproducao_id\":\"0\",\"produtofinal_id\":\"0\",\"controlado_id\":\"0\",\"isNaoConformidadeGrave\":\"false\",\"isObsoleto\":\"false\",\"en_atende\":\"Hello World\",\"en_comprovacoes\":\"Hello World\",\"en_condPagamento\":\"Hello World\",\"en_metodoAvaliacao\":\"Hello World\",\"en_origem\":\"Hello World\",\"en_partes\":\"Hello World\",\"en_periodicidade\":\"Hello World\",\"en_periodo\":\"[\\\"Hello World\\\"]\",\"en_preparoSobrevivencia\":\"Hello World\",\"en_responsavel\":\"Hello World\",\"en_status\":\"Hello World\",\"en_subsetor\":\"Hello World\",\"qr_code\":\"Hello World\",\"quantMm\":\"0\",\"en_requisitoRequerido\":\"Hello World\",\"isResultadoInsp\":\"false\",\"resultadoInspTexto\":\"Hello World\",\"en_resultadoInspecao\":\"Hello World\",\"en_resultadoReinspecao\":\"[\\\"Hello World\\\"]\",\"revisao\":\"Hello World\",\"en_tagsCor\":\"Hello World\",\"isEditadoApp\":\"false\",\"isCriadoApp\":\"false\",\"en_nps\":\"Hello World\",\"ultimaModificacao\":\"0\"}'))
  ];
  List<DtItemFormularioStruct> get dtItemFormularioPadrao =>
      _dtItemFormularioPadrao;
  set dtItemFormularioPadrao(List<DtItemFormularioStruct> value) {
    _dtItemFormularioPadrao = value;
    prefs.setStringList(
        'ff_dtItemFormularioPadrao', value.map((x) => x.serialize()).toList());
  }

  void addToDtItemFormularioPadrao(DtItemFormularioStruct value) {
    dtItemFormularioPadrao.add(value);
    prefs.setStringList('ff_dtItemFormularioPadrao',
        _dtItemFormularioPadrao.map((x) => x.serialize()).toList());
  }

  void removeFromDtItemFormularioPadrao(DtItemFormularioStruct value) {
    dtItemFormularioPadrao.remove(value);
    prefs.setStringList('ff_dtItemFormularioPadrao',
        _dtItemFormularioPadrao.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromDtItemFormularioPadrao(int index) {
    dtItemFormularioPadrao.removeAt(index);
    prefs.setStringList('ff_dtItemFormularioPadrao',
        _dtItemFormularioPadrao.map((x) => x.serialize()).toList());
  }

  void updateDtItemFormularioPadraoAtIndex(
    int index,
    DtItemFormularioStruct Function(DtItemFormularioStruct) updateFn,
  ) {
    dtItemFormularioPadrao[index] = updateFn(_dtItemFormularioPadrao[index]);
    prefs.setStringList('ff_dtItemFormularioPadrao',
        _dtItemFormularioPadrao.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInDtItemFormularioPadrao(
      int index, DtItemFormularioStruct value) {
    dtItemFormularioPadrao.insert(index, value);
    prefs.setStringList('ff_dtItemFormularioPadrao',
        _dtItemFormularioPadrao.map((x) => x.serialize()).toList());
  }

  List<DtControladoStruct> _dtServicoControlado = [];
  List<DtControladoStruct> get dtServicoControlado => _dtServicoControlado;
  set dtServicoControlado(List<DtControladoStruct> value) {
    _dtServicoControlado = value;
    prefs.setStringList(
        'ff_dtServicoControlado', value.map((x) => x.serialize()).toList());
  }

  void addToDtServicoControlado(DtControladoStruct value) {
    dtServicoControlado.add(value);
    prefs.setStringList('ff_dtServicoControlado',
        _dtServicoControlado.map((x) => x.serialize()).toList());
  }

  void removeFromDtServicoControlado(DtControladoStruct value) {
    dtServicoControlado.remove(value);
    prefs.setStringList('ff_dtServicoControlado',
        _dtServicoControlado.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromDtServicoControlado(int index) {
    dtServicoControlado.removeAt(index);
    prefs.setStringList('ff_dtServicoControlado',
        _dtServicoControlado.map((x) => x.serialize()).toList());
  }

  void updateDtServicoControladoAtIndex(
    int index,
    DtControladoStruct Function(DtControladoStruct) updateFn,
  ) {
    dtServicoControlado[index] = updateFn(_dtServicoControlado[index]);
    prefs.setStringList('ff_dtServicoControlado',
        _dtServicoControlado.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInDtServicoControlado(int index, DtControladoStruct value) {
    dtServicoControlado.insert(index, value);
    prefs.setStringList('ff_dtServicoControlado',
        _dtServicoControlado.map((x) => x.serialize()).toList());
  }

  List<DtFornecedorStruct> _dtFornecedor = [];
  List<DtFornecedorStruct> get dtFornecedor => _dtFornecedor;
  set dtFornecedor(List<DtFornecedorStruct> value) {
    _dtFornecedor = value;
    prefs.setStringList(
        'ff_dtFornecedor', value.map((x) => x.serialize()).toList());
  }

  void addToDtFornecedor(DtFornecedorStruct value) {
    dtFornecedor.add(value);
    prefs.setStringList(
        'ff_dtFornecedor', _dtFornecedor.map((x) => x.serialize()).toList());
  }

  void removeFromDtFornecedor(DtFornecedorStruct value) {
    dtFornecedor.remove(value);
    prefs.setStringList(
        'ff_dtFornecedor', _dtFornecedor.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromDtFornecedor(int index) {
    dtFornecedor.removeAt(index);
    prefs.setStringList(
        'ff_dtFornecedor', _dtFornecedor.map((x) => x.serialize()).toList());
  }

  void updateDtFornecedorAtIndex(
    int index,
    DtFornecedorStruct Function(DtFornecedorStruct) updateFn,
  ) {
    dtFornecedor[index] = updateFn(_dtFornecedor[index]);
    prefs.setStringList(
        'ff_dtFornecedor', _dtFornecedor.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInDtFornecedor(int index, DtFornecedorStruct value) {
    dtFornecedor.insert(index, value);
    prefs.setStringList(
        'ff_dtFornecedor', _dtFornecedor.map((x) => x.serialize()).toList());
  }

  EnunsStruct _enunsPadrao = EnunsStruct.fromSerializableMap(jsonDecode(
      '{\"en_inspecao\":\"[\\\"Conforme\\\",\\\"Não Conforme\\\",\\\"Em Aberto\\\"]\",\"en_aprovacao\":\"[\\\"Aprovado\\\",\\\"Aprovado, após segunda vistoria\\\",\\\"Em aberto\\\",\\\"Não aplicável\\\",\\\"Reprovado\\\"]\",\"simNao\":\"Sim/Não\",\"texto\":\"Texto\",\"en_camposFormulario\":\"[\\\"Texto\\\",\\\"Sim/Não\\\",\\\"Link\\\",\\\"Atende\\\",\\\"Comprovações\\\",\\\"Condições de Pagamento\\\",\\\"Método Avaliação\\\",\\\"NPS\\\",\\\"Origem\\\",\\\"Periodicidade\\\",\\\"Período\\\",\\\"Preparando Sobrevivência\\\",\\\"Requisito Requerido\\\",\\\"Responsáveis\\\",\\\"Status\\\",\\\"Etiquetas de Cor\\\",\\\"Quantidade em Milímetro\\\",\\\"Revisão\\\",\\\"Obsoleto\\\",\\\"Arquivo\\\",\\\"Kanban\\\",\\\"Partes\\\",\\\"C, NC, NA, RC, RNC\\\"]\",\"en_categoriaFormulario\":\"partes\",\"en_comprovacoes\":\"[\\\"C1 - Laudo sistêmico\\\",\\\"C2 - Laudo fornecedor\\\",\\\"C3 - Relatório de inspeção\\\",\\\"C4 - Declaração de projeto\\\",\\\"C5 - Especificação técnica\\\",\\\"C6 - Solução descrita em projeto\\\"]\",\"en_tagsCor\":\"[\\\"1.1 Azul\\\",\\\"1.2 Azul Claro\\\",\\\"2.1 Preto\\\",\\\"2.2 Cinza\\\",\\\"3.1 Marrom\\\",\\\"3.2 Marrom Claro\\\",\\\"4.1 Rosa\\\",\\\"4.2 Rosa Claro\\\"]\",\"en_atende\":\"[\\\"Sim\\\",\\\"Não\\\",\\\"Não Aplicável\\\"]\",\"en_condPagamento\":\"[\\\"À vista\\\",\\\"28 dias\\\",\\\"30 dias\\\",\\\"60 dias\\\",\\\"90 dias\\\",\\\"120 dias\\\",\\\"180 dias\\\",\\\"30 60\\\",\\\"30 60 90\\\",\\\"30 60 90 120\\\",\\\"30 60 90 120 180\\\"]\",\"en_metodoAvaliacao\":\"[\\\"A1 - Ensaio\\\",\\\"A2 - Inspeção\\\",\\\"A3 - Simulação\\\",\\\"A4 - Análise de projeto\\\"]\",\"en_origem\":\"[\\\"Auditório externo\\\",\\\"Recibo\\\",\\\"Armazenamento\\\",\\\"Reclamação do cliente\\\",\\\"Processo interno\\\"]\",\"en_partes\":\"[\\\"PARTE 1: Requisitos Gerais\\\",\\\"PARTE 2: Requisitos para os sistemas estruturais\\\",\\\"PARTE 3: Requisitos para os sistemas de pisos\\\",\\\"PARTE 4: Requisitos para os sistemas de superfícies verticais internas e externas - SVVIE\\\",\\\"PARTE 5: Requisitos para os sistemas de coberturas\\\",\\\"PARTE 6: Requisitos para os sistemas hidrossanitários\\\"]\",\"en_periodicidade\":\"[\\\"Diário\\\",\\\"Semanal\\\",\\\"Quinzenal\\\",\\\"Mensal\\\",\\\"Anual\\\"]\",\"en_periodo\":\"[\\\"Manhã (6h às 12h)\\\",\\\"Tarde (12h às 18h)\\\",\\\"Noite (18h às 00h)\\\",\\\"Madrugada (00h às 06h)\\\"]\",\"en_preparoSobrevivencia\":\"[\\\"Concordo Totalmente\\\",\\\"Concordo Parcialmente\\\",\\\"Neutro\\\",\\\"Discordo Parcialmente\\\",\\\"Discordo Totalmente\\\",\\\"Não Aplicável\\\"]\",\"en_status\":\"[\\\"Em Andamento\\\",\\\"Pausado\\\",\\\"Atrasado\\\",\\\"Finalizado\\\"]\",\"en_subsetor\":\"[\\\"Edificações\\\",\\\"Saneamento Básico\\\",\\\"Viárias\\\",\\\"Indústria\\\",\\\"Agronegócio\\\"]\",\"en_requisitoRequerido\":\"[\\\"Mínimo\\\",\\\"Intermediário\\\",\\\"Superior\\\"]\",\"en-resultadoInspecao\":\"[\\\"Conforme\\\",\\\"Não Conforme\\\",\\\"Não Aplicável\\\",\\\"Em Aberto\\\"]\",\"en_resultadoReinspecao\":\"[\\\"Reinspecionado Conforme\\\",\\\"Reinspeccionado Não Conforme\\\"]\",\"en_nps\":\"[\\\"1\\\",\\\"2\\\",\\\"3\\\",\\\"4\\\",\\\"5\\\"]\",\"en_Responsavel\":\"[\\\"C - Construtor\\\",\\\"PA - Projetista de Arquitetura\\\",\\\"PE - Projetista de Estrutura\\\",\\\"PI - Projetista de Instalação\\\",\\\"Pesp - Projetista Específico\\\"]\",\"dtFornecedor\":\"[]\",\"dtProblemaRecorrente\":\"[]\"}'));
  EnunsStruct get enunsPadrao => _enunsPadrao;
  set enunsPadrao(EnunsStruct value) {
    _enunsPadrao = value;
    prefs.setString('ff_enunsPadrao', value.serialize());
  }

  void updateEnunsPadraoStruct(Function(EnunsStruct) updateFn) {
    updateFn(_enunsPadrao);
    prefs.setString('ff_enunsPadrao', _enunsPadrao.serialize());
  }

  List<DtProblemaRecorrenteStruct> _dtProblemaRecorrente = [
    DtProblemaRecorrenteStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"0\",\"created_at\":\"0\",\"ultimaModificacao\":\"0\",\"isDelete\":\"false\",\"descricao\":\"infiltração\",\"empresa_id\":\"0\"}')),
    DtProblemaRecorrenteStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"0\",\"created_at\":\"0\",\"ultimaModificacao\":\"0\",\"isDelete\":\"false\",\"descricao\":\"Ferrugem\",\"empresa_id\":\"0\"}')),
    DtProblemaRecorrenteStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"0\",\"created_at\":\"0\",\"ultimaModificacao\":\"0\",\"isDelete\":\"false\",\"descricao\":\"Vazamento\",\"empresa_id\":\"0\"}'))
  ];
  List<DtProblemaRecorrenteStruct> get dtProblemaRecorrente =>
      _dtProblemaRecorrente;
  set dtProblemaRecorrente(List<DtProblemaRecorrenteStruct> value) {
    _dtProblemaRecorrente = value;
    prefs.setStringList(
        'ff_dtProblemaRecorrente', value.map((x) => x.serialize()).toList());
  }

  void addToDtProblemaRecorrente(DtProblemaRecorrenteStruct value) {
    dtProblemaRecorrente.add(value);
    prefs.setStringList('ff_dtProblemaRecorrente',
        _dtProblemaRecorrente.map((x) => x.serialize()).toList());
  }

  void removeFromDtProblemaRecorrente(DtProblemaRecorrenteStruct value) {
    dtProblemaRecorrente.remove(value);
    prefs.setStringList('ff_dtProblemaRecorrente',
        _dtProblemaRecorrente.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromDtProblemaRecorrente(int index) {
    dtProblemaRecorrente.removeAt(index);
    prefs.setStringList('ff_dtProblemaRecorrente',
        _dtProblemaRecorrente.map((x) => x.serialize()).toList());
  }

  void updateDtProblemaRecorrenteAtIndex(
    int index,
    DtProblemaRecorrenteStruct Function(DtProblemaRecorrenteStruct) updateFn,
  ) {
    dtProblemaRecorrente[index] = updateFn(_dtProblemaRecorrente[index]);
    prefs.setStringList('ff_dtProblemaRecorrente',
        _dtProblemaRecorrente.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInDtProblemaRecorrente(
      int index, DtProblemaRecorrenteStruct value) {
    dtProblemaRecorrente.insert(index, value);
    prefs.setStringList('ff_dtProblemaRecorrente',
        _dtProblemaRecorrente.map((x) => x.serialize()).toList());
  }

  String _enConformidade = '';
  String get enConformidade => _enConformidade;
  set enConformidade(String value) {
    _enConformidade = value;
    prefs.setString('ff_enConformidade', value);
  }

  DtNivelDeAcessoStruct _dtNivelDeAcessoAtual = DtNivelDeAcessoStruct();
  DtNivelDeAcessoStruct get dtNivelDeAcessoAtual => _dtNivelDeAcessoAtual;
  set dtNivelDeAcessoAtual(DtNivelDeAcessoStruct value) {
    _dtNivelDeAcessoAtual = value;
    prefs.setString('ff_dtNivelDeAcessoAtual', value.serialize());
  }

  void updateDtNivelDeAcessoAtualStruct(
      Function(DtNivelDeAcessoStruct) updateFn) {
    updateFn(_dtNivelDeAcessoAtual);
    prefs.setString(
        'ff_dtNivelDeAcessoAtual', _dtNivelDeAcessoAtual.serialize());
  }

  String _dtDataAprovacap = '';
  String get dtDataAprovacap => _dtDataAprovacap;
  set dtDataAprovacap(String value) {
    _dtDataAprovacap = value;
    prefs.setString('ff_dtDataAprovacap', value);
  }

  String _dtDataPrevista = '';
  String get dtDataPrevista => _dtDataPrevista;
  set dtDataPrevista(String value) {
    _dtDataPrevista = value;
    prefs.setString('ff_dtDataPrevista', value);
  }

  String _DtDataInspecao = '';
  String get DtDataInspecao => _DtDataInspecao;
  set DtDataInspecao(String value) {
    _DtDataInspecao = value;
    prefs.setString('ff_DtDataInspecao', value);
  }

  String _idFormulario = '';
  String get idFormulario => _idFormulario;
  set idFormulario(String value) {
    _idFormulario = value;
    prefs.setString('ff_idFormulario', value);
  }

  EnItemFormulario? _enItemFormulario = EnItemFormulario.en_aprovacao;
  EnItemFormulario? get enItemFormulario => _enItemFormulario;
  set enItemFormulario(EnItemFormulario? value) {
    _enItemFormulario = value;
    value != null
        ? prefs.setString('ff_enItemFormulario', value.serialize())
        : prefs.remove('ff_enItemFormulario');
  }

  EnnumItemFormularioStruct _dtEnItemFormulario =
      EnnumItemFormularioStruct.fromSerializableMap(jsonDecode(
          '{\"en_camposFormulario\":\"[]\",\"en_periodo\":\"[]\",\"en_resultadoReinspecao\":\"[]\",\"DtFornecedor\":\"{}\",\"dtPeriodo\":\"[\\\"{\\\\\\\"descricao\\\\\\\":\\\\\\\"[\\\\\\\\\\\\\\\"Manhã (6h às 12h)\\\\\\\\\\\\\\\",\\\\\\\\\\\\\\\"Tarde (12h às 18h)\\\\\\\\\\\\\\\",\\\\\\\\\\\\\\\"Noite (18h às 00h)\\\\\\\\\\\\\\\",\\\\\\\\\\\\\\\"Madrugada (00h às 06h)\\\\\\\\\\\\\\\"]\\\\\\\"}\\\"]\"}'));
  EnnumItemFormularioStruct get dtEnItemFormulario => _dtEnItemFormulario;
  set dtEnItemFormulario(EnnumItemFormularioStruct value) {
    _dtEnItemFormulario = value;
    prefs.setString('ff_dtEnItemFormulario', value.serialize());
  }

  void updateDtEnItemFormularioStruct(
      Function(EnnumItemFormularioStruct) updateFn) {
    updateFn(_dtEnItemFormulario);
    prefs.setString('ff_dtEnItemFormulario', _dtEnItemFormulario.serialize());
  }

  String _descricaoFornecedor = '';
  String get descricaoFornecedor => _descricaoFornecedor;
  set descricaoFornecedor(String value) {
    _descricaoFornecedor = value;
    prefs.setString('ff_descricaoFornecedor', value);
  }

  String _descricaoProblemaRecorrente = '';
  String get descricaoProblemaRecorrente => _descricaoProblemaRecorrente;
  set descricaoProblemaRecorrente(String value) {
    _descricaoProblemaRecorrente = value;
    prefs.setString('ff_descricaoProblemaRecorrente', value);
  }

  List<DtPeriodoStruct> _dtPeriodo = [
    DtPeriodoStruct.fromSerializableMap(jsonDecode(
        '{\"descricao\":\"[\\\"Hello World\\\",\\\"Hello World\\\",\\\"Hello World\\\",\\\"Hello World\\\"]\"}'))
  ];
  List<DtPeriodoStruct> get dtPeriodo => _dtPeriodo;
  set dtPeriodo(List<DtPeriodoStruct> value) {
    _dtPeriodo = value;
    prefs.setStringList(
        'ff_dtPeriodo', value.map((x) => x.serialize()).toList());
  }

  void addToDtPeriodo(DtPeriodoStruct value) {
    dtPeriodo.add(value);
    prefs.setStringList(
        'ff_dtPeriodo', _dtPeriodo.map((x) => x.serialize()).toList());
  }

  void removeFromDtPeriodo(DtPeriodoStruct value) {
    dtPeriodo.remove(value);
    prefs.setStringList(
        'ff_dtPeriodo', _dtPeriodo.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromDtPeriodo(int index) {
    dtPeriodo.removeAt(index);
    prefs.setStringList(
        'ff_dtPeriodo', _dtPeriodo.map((x) => x.serialize()).toList());
  }

  void updateDtPeriodoAtIndex(
    int index,
    DtPeriodoStruct Function(DtPeriodoStruct) updateFn,
  ) {
    dtPeriodo[index] = updateFn(_dtPeriodo[index]);
    prefs.setStringList(
        'ff_dtPeriodo', _dtPeriodo.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInDtPeriodo(int index, DtPeriodoStruct value) {
    dtPeriodo.insert(index, value);
    prefs.setStringList(
        'ff_dtPeriodo', _dtPeriodo.map((x) => x.serialize()).toList());
  }

  List<String> _periodoDescricao = [];
  List<String> get periodoDescricao => _periodoDescricao;
  set periodoDescricao(List<String> value) {
    _periodoDescricao = value;
    prefs.setStringList('ff_periodoDescricao', value);
  }

  void addToPeriodoDescricao(String value) {
    periodoDescricao.add(value);
    prefs.setStringList('ff_periodoDescricao', _periodoDescricao);
  }

  void removeFromPeriodoDescricao(String value) {
    periodoDescricao.remove(value);
    prefs.setStringList('ff_periodoDescricao', _periodoDescricao);
  }

  void removeAtIndexFromPeriodoDescricao(int index) {
    periodoDescricao.removeAt(index);
    prefs.setStringList('ff_periodoDescricao', _periodoDescricao);
  }

  void updatePeriodoDescricaoAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    periodoDescricao[index] = updateFn(_periodoDescricao[index]);
    prefs.setStringList('ff_periodoDescricao', _periodoDescricao);
  }

  void insertAtIndexInPeriodoDescricao(int index, String value) {
    periodoDescricao.insert(index, value);
    prefs.setStringList('ff_periodoDescricao', _periodoDescricao);
  }

  List<String> _resultadoReinspecaoDescricao = [];
  List<String> get resultadoReinspecaoDescricao =>
      _resultadoReinspecaoDescricao;
  set resultadoReinspecaoDescricao(List<String> value) {
    _resultadoReinspecaoDescricao = value;
    prefs.setStringList('ff_resultadoReinspecaoDescricao', value);
  }

  void addToResultadoReinspecaoDescricao(String value) {
    resultadoReinspecaoDescricao.add(value);
    prefs.setStringList(
        'ff_resultadoReinspecaoDescricao', _resultadoReinspecaoDescricao);
  }

  void removeFromResultadoReinspecaoDescricao(String value) {
    resultadoReinspecaoDescricao.remove(value);
    prefs.setStringList(
        'ff_resultadoReinspecaoDescricao', _resultadoReinspecaoDescricao);
  }

  void removeAtIndexFromResultadoReinspecaoDescricao(int index) {
    resultadoReinspecaoDescricao.removeAt(index);
    prefs.setStringList(
        'ff_resultadoReinspecaoDescricao', _resultadoReinspecaoDescricao);
  }

  void updateResultadoReinspecaoDescricaoAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    resultadoReinspecaoDescricao[index] =
        updateFn(_resultadoReinspecaoDescricao[index]);
    prefs.setStringList(
        'ff_resultadoReinspecaoDescricao', _resultadoReinspecaoDescricao);
  }

  void insertAtIndexInResultadoReinspecaoDescricao(int index, String value) {
    resultadoReinspecaoDescricao.insert(index, value);
    prefs.setStringList(
        'ff_resultadoReinspecaoDescricao', _resultadoReinspecaoDescricao);
  }

  String _resultadoReinpecaoCor = '';
  String get resultadoReinpecaoCor => _resultadoReinpecaoCor;
  set resultadoReinpecaoCor(String value) {
    _resultadoReinpecaoCor = value;
    prefs.setString('ff_resultadoReinpecaoCor', value);
  }

  List<DtProblemaRecorrenteStruct> _dtProblemaRecorrente1 = [];
  List<DtProblemaRecorrenteStruct> get dtProblemaRecorrente1 =>
      _dtProblemaRecorrente1;
  set dtProblemaRecorrente1(List<DtProblemaRecorrenteStruct> value) {
    _dtProblemaRecorrente1 = value;
    prefs.setStringList(
        'ff_dtProblemaRecorrente1', value.map((x) => x.serialize()).toList());
  }

  void addToDtProblemaRecorrente1(DtProblemaRecorrenteStruct value) {
    dtProblemaRecorrente1.add(value);
    prefs.setStringList('ff_dtProblemaRecorrente1',
        _dtProblemaRecorrente1.map((x) => x.serialize()).toList());
  }

  void removeFromDtProblemaRecorrente1(DtProblemaRecorrenteStruct value) {
    dtProblemaRecorrente1.remove(value);
    prefs.setStringList('ff_dtProblemaRecorrente1',
        _dtProblemaRecorrente1.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromDtProblemaRecorrente1(int index) {
    dtProblemaRecorrente1.removeAt(index);
    prefs.setStringList('ff_dtProblemaRecorrente1',
        _dtProblemaRecorrente1.map((x) => x.serialize()).toList());
  }

  void updateDtProblemaRecorrente1AtIndex(
    int index,
    DtProblemaRecorrenteStruct Function(DtProblemaRecorrenteStruct) updateFn,
  ) {
    dtProblemaRecorrente1[index] = updateFn(_dtProblemaRecorrente1[index]);
    prefs.setStringList('ff_dtProblemaRecorrente1',
        _dtProblemaRecorrente1.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInDtProblemaRecorrente1(
      int index, DtProblemaRecorrenteStruct value) {
    dtProblemaRecorrente1.insert(index, value);
    prefs.setStringList('ff_dtProblemaRecorrente1',
        _dtProblemaRecorrente1.map((x) => x.serialize()).toList());
  }

  String _contador = '-1';
  String get contador => _contador;
  set contador(String value) {
    _contador = value;
  }

  DtloopStruct _Loop = DtloopStruct.fromSerializableMap(jsonDecode('{}'));
  DtloopStruct get Loop => _Loop;
  set Loop(DtloopStruct value) {
    _Loop = value;
  }

  void updateLoopStruct(Function(DtloopStruct) updateFn) {
    updateFn(_Loop);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

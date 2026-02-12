import 'package:collection/collection.dart';

enum LogFuncionalidade {
  sincronizacao,
  api,
  envioDeDados,
  getDadosPrimarios,
  getLocalDeProducao,
}

enum EnPrioridade {
  Alta,
  Media,
  Baixa,
}

enum EnPaginas {
  Perfil,
  LocalDeProducao,
  login,
  sincronizacao,
  modulo,
  subModulo,
  formulario,
  itemsForlumario,
  produtoFinal,
}

enum EnItemFormulario {
  en_aprovacao,
  en_tagsCor,
  en_camposFormulario,
  en_atende,
  en_comprovacoes,
  en_condPagamento,
  en_metodoAvaliacao,
  en_origem,
  en_partes,
  en_periodicidade,
  en_periodo,
  en_preparoSobrevivencia,
  en_responssavel,
  en_status,
  en_subsetor,
  en_requisitoRequerido,
  en_resultadoInspecao,
  en_resultadoReinspecao,
  en_nps,
  en_categoriaFormulario,
  dtFornecedor,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (LogFuncionalidade):
      return LogFuncionalidade.values.deserialize(value) as T?;
    case (EnPrioridade):
      return EnPrioridade.values.deserialize(value) as T?;
    case (EnPaginas):
      return EnPaginas.values.deserialize(value) as T?;
    case (EnItemFormulario):
      return EnItemFormulario.values.deserialize(value) as T?;
    default:
      return null;
  }
}

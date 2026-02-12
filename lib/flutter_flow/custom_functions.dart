import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/auth/custom_auth/auth_util.dart';

String? formataCamalCase(EnPaginas pagina) {
  // recebe 1 enum, o mesmo será um string, deve-se fazer a separação das palavras a cada letra maiuscula, use somente o conteudo
  String formattedString = pagina
      .toString()
      .split('.')
      .last
      .replaceAllMapped(RegExp(r'[A-Z]'), (match) => ' ${match.group(0)}')
      .toLowerCase()
      .trim();

  // Converte a primeira letra para maiúscula
  return formattedString[0].toUpperCase() + formattedString.substring(1);
}

DateTime? dataAtualMais1() {
  // identifica o dia atual e acrescenta maus 1
  DateTime now = DateTime.now();
  DateTime tomorrow = now.add(Duration(days: 1));
  return tomorrow;
}

double? stringToDouble(String? string) {
  try {
    return double.parse(string ?? '');
  } catch (e) {
    return null;
  }
}

List<DtItemFormularioStruct>? filtroLocalInspecao(
  String filtro,
  List<DtItemFormularioStruct> dtItemFormulario,
) {
// recebe uma string e o modulo (Contendo os itens), com base nela filtra pelo appState dtModulo cujo a descricao tenha simularidade com a string
  return dtItemFormulario
      .where(
          (m) => m.descricaoItem.toLowerCase().contains(filtro.toLowerCase()))
      .toList();
}

List<DtLocalDeProducaoStruct>? filtroLocaldeProducao(
  String filtro,
  List<DtLocalDeProducaoStruct> localDeProducao,
) {
  // recebe uma string e o modulo (Contendo os itens), com base nela filtra pelo appState dtModulo cujo a descricao tenha simularidade com a string
  return localDeProducao
      .where((m) => m.nome.toLowerCase().contains(filtro.toLowerCase()))
      .toList();
}

double? virgulaToPonto(String? numero) {
  // trocar virgual por ponto e gerar double
  if (numero == null) return null;
  return double.tryParse(numero.replaceAll(',', '.'));
}

List<DtFormularioStruct>? filtroFormulario(
  String filtro,
  List<DtFormularioStruct> formulario,
) {
  // recebe uma string e o modulo (Contendo os itens), com base nela filtra pelo appState dtModulo cujo a descricao tenha simularidade com a string
  return formulario
      .where((m) => m.descricao.toLowerCase().contains(filtro.toLowerCase()))
      .toList();
}

DateTime? timestampToData(int timestamp) {
  // Trabsforma timestamp em dataTime ex: 1743892328323 para 05/04/2025
  return DateTime.fromMillisecondsSinceEpoch(timestamp).toLocal();
}

List<DtModuloStruct>? filtroModulo(
  String filtro,
  List<DtModuloStruct> modulo,
) {
  // recebe uma string e o modulo (Contendo os itens), com base nela filtra pelo appState dtModulo cujo a descricao tenha simularidade com a string
  return modulo
      .where((m) => m.descricao.toLowerCase().contains(filtro.toLowerCase()))
      .toList();
}

String? extrairUrl(String? url) {
  //   // Extraia o conteudo da ultima / de uma url, ex: simplex.com/modulos?dtsserr, extraia apenas o modulos, caso tenha dados apos ? remova
  if (url == null) {
    return null;
  }

  final List<String> parts = url.split('/');
  final String lastPart = parts.last;

  final int index = lastPart.indexOf('?');
  final String result = index != -1 ? lastPart.substring(0, index) : lastPart;

  return result;
}

DateTime? stringToDateTime(String? dataString) {
  // recebe uma data em string e retorna como dateTime
  if (dataString == null) {
    return null;
  }

  try {
    DateTime dateTime = DateTime.parse(dataString);
    return dateTime;
  } catch (e) {
    print('Error parsing date string: $dataString');
    return null;
  }
}

List<DtSubmodulosStruct>? filtroSubModulo(
  String filtro,
  List<DtSubmodulosStruct> subModulo,
) {
  // faça um codigo que filtre uma lista
  return subModulo
      .where(
          (sub) => sub.descricao.toLowerCase().contains(filtro.toLowerCase()))
      .toList();
}

int stringToInteger(String string) {
  // converta o parametro string em inteiro e o retorne na funcao
  return int.parse(string);
}

int? extrairKeyUrl(
  String? url,
  String? key,
) {
  // crie uma código para extrair o valor de uma key na url, sendo que o valor sempre será um número e será devolvido na function.
  if (url == null || key == null) return null;

  final uri = Uri.parse(url);
  final queryParams = uri.queryParameters;

  if (queryParams.containsKey(key)) {
    final value = queryParams[key];
    return int.tryParse(value ?? '');
  }

  return null;
}

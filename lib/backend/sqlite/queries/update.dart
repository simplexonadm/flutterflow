import 'package:sqflite/sqflite.dart';

/// BEGIN CRIAR
Future performCriar(
  Database database, {
  String? nome,
}) {
  final query = '''
INSERT INTO itemFormulario (nome) VALUES ('${nome}');
''';
  return database.rawQuery(query);
}

/// END CRIAR

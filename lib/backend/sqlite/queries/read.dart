import '/backend/sqlite/queries/sqlite_row.dart';
import 'package:sqflite/sqflite.dart';

Future<List<T>> _readQuery<T>(
  Database database,
  String query,
  T Function(Map<String, dynamic>) create,
) =>
    database.rawQuery(query).then((r) => r.map((e) => create(e)).toList());

/// BEGIN GETITEMFORMULARIO
Future<List<GetItemFormularioRow>> performGetItemFormulario(
  Database database,
) {
  final query = '''
SELECT * FROM itemFormulario
''';
  return _readQuery(database, query, (d) => GetItemFormularioRow(d));
}

class GetItemFormularioRow extends SqliteRow {
  GetItemFormularioRow(Map<String, dynamic> data) : super(data);

  String get nome => data['nome'] as String;
  int get id => data['id'] as int;
}

/// END GETITEMFORMULARIO

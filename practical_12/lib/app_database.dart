import 'package:drift/drift.dart';
import 'task_dao.dart';

@DataClassName('Task')
@DataClassName('TaskCompanion')
@DriftDatabase(tables: [Tasks])
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor e) : super();

  @override
  int get schemaVersion => 1;
}

class _$AppDatabase {
}

@DataClassName('Task')
@DriftTable(tableName: 'tasks')
class Tasks extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().customConstraint('NOT NULL')();
  BoolColumn get completed => boolean().withDefault(const Constant(false))();
}

class DriftTable {
  const DriftTable({required String tableName});
}
import 'package:drift/drift.dart';

@DataClassName('Category') // Penamaan Tabel
class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nama => text().withLength(max: 128)();
  IntColumn get tipe => integer()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
}

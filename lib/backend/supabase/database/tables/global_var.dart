import '../database.dart';

class GlobalVarTable extends SupabaseTable<GlobalVarRow> {
  @override
  String get tableName => 'global_var';

  @override
  GlobalVarRow createRow(Map<String, dynamic> data) => GlobalVarRow(data);
}

class GlobalVarRow extends SupabaseDataRow {
  GlobalVarRow(super.data);

  @override
  SupabaseTable get table => GlobalVarTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime get updatedAt => getField<DateTime>('updated_at')!;
  set updatedAt(DateTime value) => setField<DateTime>('updated_at', value);

  int get currentWeek => getField<int>('current_week')!;
  set currentWeek(int value) => setField<int>('current_week', value);
}

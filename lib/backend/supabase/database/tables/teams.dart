import '../database.dart';

class TeamsTable extends SupabaseTable<TeamsRow> {
  @override
  String get tableName => 'teams';

  @override
  TeamsRow createRow(Map<String, dynamic> data) => TeamsRow(data);
}

class TeamsRow extends SupabaseDataRow {
  TeamsRow(super.data);

  @override
  SupabaseTable get table => TeamsTable();

  String get teamName => getField<String>('team_name')!;
  set teamName(String value) => setField<String>('team_name', value);

  String? get imageSrc => getField<String>('image_src');
  set imageSrc(String? value) => setField<String>('image_src', value);
}

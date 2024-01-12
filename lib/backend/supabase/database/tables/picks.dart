import '../database.dart';

class PicksTable extends SupabaseTable<PicksRow> {
  @override
  String get tableName => 'picks';

  @override
  PicksRow createRow(Map<String, dynamic> data) => PicksRow(data);
}

class PicksRow extends SupabaseDataRow {
  PicksRow(super.data);

  @override
  SupabaseTable get table => PicksTable();

  DateTime? get created => getField<DateTime>('created');
  set created(DateTime? value) => setField<DateTime>('created', value);

  String get pickId => getField<String>('pick_id')!;
  set pickId(String value) => setField<String>('pick_id', value);

  double? get resultsPoints => getField<double>('results_points');
  set resultsPoints(double? value) => setField<double>('results_points', value);

  String? get resultsText => getField<String>('results_text');
  set resultsText(String? value) => setField<String>('results_text', value);

  String? get teamSelected => getField<String>('team_selected');
  set teamSelected(String? value) => setField<String>('team_selected', value);

  DateTime? get updated => getField<DateTime>('updated');
  set updated(DateTime? value) => setField<DateTime>('updated', value);

  int? get week => getField<int>('week');
  set week(int? value) => setField<int>('week', value);

  String? get pickType => getField<String>('pick_type');
  set pickType(String? value) => setField<String>('pick_type', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get gameId => getField<String>('game_id');
  set gameId(String? value) => setField<String>('game_id', value);
}

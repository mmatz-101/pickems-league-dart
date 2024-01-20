import '../database.dart';

class PicksWithGameDetailsViewTable
    extends SupabaseTable<PicksWithGameDetailsViewRow> {
  @override
  String get tableName => 'picks_with_game_details_view';

  @override
  PicksWithGameDetailsViewRow createRow(Map<String, dynamic> data) =>
      PicksWithGameDetailsViewRow(data);
}

class PicksWithGameDetailsViewRow extends SupabaseDataRow {
  PicksWithGameDetailsViewRow(super.data);

  @override
  SupabaseTable get table => PicksWithGameDetailsViewTable();

  String? get teamSelected => getField<String>('team_selected');
  set teamSelected(String? value) => setField<String>('team_selected', value);

  String? get pickType => getField<String>('pick_type');
  set pickType(String? value) => setField<String>('pick_type', value);

  String? get gameId => getField<String>('game_id');
  set gameId(String? value) => setField<String>('game_id', value);

  String? get homeName => getField<String>('home_name');
  set homeName(String? value) => setField<String>('home_name', value);

  String? get awayName => getField<String>('away_name');
  set awayName(String? value) => setField<String>('away_name', value);

  double? get homeSpread => getField<double>('home_spread');
  set homeSpread(double? value) => setField<double>('home_spread', value);

  double? get awaySpread => getField<double>('away_spread');
  set awaySpread(double? value) => setField<double>('away_spread', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  int? get week => getField<int>('week');
  set week(int? value) => setField<int>('week', value);
}

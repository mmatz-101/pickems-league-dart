import '../database.dart';

class GamesTable extends SupabaseTable<GamesRow> {
  @override
  String get tableName => 'games';

  @override
  GamesRow createRow(Map<String, dynamic> data) => GamesRow(data);
}

class GamesRow extends SupabaseDataRow {
  GamesRow(super.data);

  @override
  SupabaseTable get table => GamesTable();

  String get awayAbbreviation => getField<String>('away_abbreviation')!;
  set awayAbbreviation(String value) =>
      setField<String>('away_abbreviation', value);

  String get awayDisplayName => getField<String>('away_display_name')!;
  set awayDisplayName(String value) =>
      setField<String>('away_display_name', value);

  String get awayName => getField<String>('away_name')!;
  set awayName(String value) => setField<String>('away_name', value);

  String get awayNickName => getField<String>('away_nick_name')!;
  set awayNickName(String value) => setField<String>('away_nick_name', value);

  double? get awayScore => getField<double>('away_score');
  set awayScore(double? value) => setField<double>('away_score', value);

  String get awayShortName => getField<String>('away_short_name')!;
  set awayShortName(String value) => setField<String>('away_short_name', value);

  double? get awaySpread => getField<double>('away_spread');
  set awaySpread(double? value) => setField<double>('away_spread', value);

  DateTime get created => getField<DateTime>('created')!;
  set created(DateTime value) => setField<DateTime>('created', value);

  DateTime get date => getField<DateTime>('date')!;
  set date(DateTime value) => setField<DateTime>('date', value);

  String get homeAbbreviation => getField<String>('home_abbreviation')!;
  set homeAbbreviation(String value) =>
      setField<String>('home_abbreviation', value);

  String get homeDisplayName => getField<String>('home_display_name')!;
  set homeDisplayName(String value) =>
      setField<String>('home_display_name', value);

  String get homeName => getField<String>('home_name')!;
  set homeName(String value) => setField<String>('home_name', value);

  String get homeNickName => getField<String>('home_nick_name')!;
  set homeNickName(String value) => setField<String>('home_nick_name', value);

  String? get homeScore => getField<String>('home_score');
  set homeScore(String? value) => setField<String>('home_score', value);

  double? get homeSpread => getField<double>('home_spread');
  set homeSpread(double? value) => setField<double>('home_spread', value);

  String get stadium => getField<String>('stadium')!;
  set stadium(String value) => setField<String>('stadium', value);

  String get status => getField<String>('status')!;
  set status(String value) => setField<String>('status', value);

  DateTime get updated => getField<DateTime>('updated')!;
  set updated(DateTime value) => setField<DateTime>('updated', value);

  int get week => getField<int>('week')!;
  set week(int value) => setField<int>('week', value);

  String get gameId => getField<String>('game_id')!;
  set gameId(String value) => setField<String>('game_id', value);

  String get league => getField<String>('league')!;
  set league(String value) => setField<String>('league', value);

  String get homeShortName => getField<String>('home_short_name')!;
  set homeShortName(String value) => setField<String>('home_short_name', value);

  String get tvStation => getField<String>('tv_station')!;
  set tvStation(String value) => setField<String>('tv_station', value);

  String get oddsharkId => getField<String>('oddshark_id')!;
  set oddsharkId(String value) => setField<String>('oddshark_id', value);
}

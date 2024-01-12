import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'small_data_table_model.dart';
export 'small_data_table_model.dart';

class SmallDataTableWidget extends StatefulWidget {
  const SmallDataTableWidget({
    super.key,
    required this.week,
    required this.pickType,
  });

  final int? week;
  final PickType? pickType;

  @override
  _SmallDataTableWidgetState createState() => _SmallDataTableWidgetState();
}

class _SmallDataTableWidgetState extends State<SmallDataTableWidget> {
  late SmallDataTableModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SmallDataTableModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: responsiveVisibility(
        context: context,
        tablet: false,
        tabletLandscape: false,
        desktop: false,
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          width: double.infinity,
          height: 346.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: FutureBuilder<List<PicksRow>>(
              future: PicksTable().queryRows(
                queryFn: (q) => q
                    .eq(
                      'week',
                      widget.week,
                    )
                    .eq(
                      'user_id',
                      currentUserUid,
                    )
                    .eq(
                      'pick_type',
                      widget.pickType?.name,
                    ),
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                    ),
                  );
                }
                List<PicksRow> dataTablePicksRowList = snapshot.data!;
                return DataTable2(
                  columns: [
                    DataColumn2(
                      label: DefaultTextStyle.merge(
                        softWrap: true,
                        child: Text(
                          'Team',
                          style: FlutterFlowTheme.of(context).labelLarge,
                        ),
                      ),
                    ),
                    DataColumn2(
                      label: DefaultTextStyle.merge(
                        softWrap: true,
                        child: Text(
                          'Spread',
                          style: FlutterFlowTheme.of(context).labelLarge,
                        ),
                      ),
                    ),
                  ],
                  rows: dataTablePicksRowList
                      .mapIndexed((dataTableIndex, dataTablePicksRow) => [
                            FutureBuilder<List<GamesRow>>(
                              future: GamesTable().querySingleRow(
                                queryFn: (q) => q.eq(
                                  'game_id',
                                  dataTablePicksRow.gameId,
                                ),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<GamesRow> textGamesRowList =
                                    snapshot.data!;
                                final textGamesRow = textGamesRowList.isNotEmpty
                                    ? textGamesRowList.first
                                    : null;
                                return Text(
                                  valueOrDefault<String>(
                                    dataTablePicksRow.teamSelected == 'HOME'
                                        ? textGamesRow?.homeName
                                        : textGamesRow?.awayName,
                                    'Error',
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                );
                              },
                            ),
                            FutureBuilder<List<GamesRow>>(
                              future: GamesTable().querySingleRow(
                                queryFn: (q) => q.eq(
                                  'game_id',
                                  dataTablePicksRow.gameId,
                                ),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<GamesRow> rowGamesRowList = snapshot.data!;
                                final rowGamesRow = rowGamesRowList.isNotEmpty
                                    ? rowGamesRowList.first
                                    : null;
                                return Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      valueOrDefault<String>(
                                        dataTablePicksRow.teamSelected == 'HOME'
                                            ? rowGamesRow?.homeSpread
                                                ?.toString()
                                            : rowGamesRow?.awaySpread
                                                ?.toString(),
                                        'Error',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                    FlutterFlowIconButton(
                                      borderColor:
                                          FlutterFlowTheme.of(context).primary,
                                      borderRadius: 5.0,
                                      borderWidth: 1.0,
                                      buttonSize: 30.0,
                                      fillColor:
                                          FlutterFlowTheme.of(context).accent1,
                                      icon: Icon(
                                        Icons.zoom_in,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 15.0,
                                      ),
                                      onPressed: () async {
                                        context.pushNamed(
                                          'GameZoomPage',
                                          queryParameters: {
                                            'gameID': serializeParam(
                                              dataTablePicksRow.gameId,
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                    ),
                                  ].divide(const SizedBox(width: 0.0)),
                                );
                              },
                            ),
                          ].map((c) => DataCell(c)).toList())
                      .map((e) => DataRow(cells: e))
                      .toList(),
                  headingRowColor: MaterialStateProperty.all(
                    FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  headingRowHeight: 56.0,
                  dataRowColor: MaterialStateProperty.all(
                    FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  dataRowHeight: 56.0,
                  border: TableBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  dividerThickness: 2.0,
                  showBottomBorder: true,
                  minWidth: 49.0,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

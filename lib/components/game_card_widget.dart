import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'game_card_model.dart';
export 'game_card_model.dart';

class GameCardWidget extends StatefulWidget {
  const GameCardWidget({
    super.key,
    required this.gameDateTime,
    this.networkProvider,
    this.homeTeamName,
    this.homeTeamSpread,
    this.awayTeamName,
    this.awayTeamSpread,
    required this.lastUpdate,
    this.teamSelected,
    this.pickID,
    required this.gameID,
    required this.week,
    required this.homeImageSrc,
    required this.awayImageSrc,
  });

  final String? gameDateTime;
  final String? networkProvider;
  final String? homeTeamName;
  final double? homeTeamSpread;
  final String? awayTeamName;
  final double? awayTeamSpread;
  final String? lastUpdate;
  final TeamSelected? teamSelected;
  final String? pickID;
  final String? gameID;
  final int? week;
  final String? homeImageSrc;
  final String? awayImageSrc;

  @override
  _GameCardWidgetState createState() => _GameCardWidgetState();
}

class _GameCardWidgetState extends State<GameCardWidget> {
  late GameCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GameCardModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {});
      if (!(widget.teamSelected == null)) {
        if (widget.teamSelected == TeamSelected.home) {
          setState(() {
            _model.homeTeamSelected = true;
          });
        } else {
          setState(() {
            _model.awayTeamSelected = true;
          });
        }
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 10.0, 20.0),
      child: Container(
        width: double.infinity,
        constraints: const BoxConstraints(
          maxWidth: 400.0,
        ),
        decoration: const BoxDecoration(),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            color: FlutterFlowTheme.of(context).secondaryBackground,
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.gameDateTime!,
                        style:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Readex Pro',
                                  fontWeight: FontWeight.normal,
                                ),
                      ),
                      Text(
                        widget.networkProvider!,
                        style: FlutterFlowTheme.of(context).labelMedium,
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 1.0,
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        if (_model.homeTeamSelected) {
                          setState(() {
                            _model.homeTeamSelected = false;
                          });
                        } else {
                          if (_model.awayTeamSelected) {
                            setState(() {
                              _model.homeTeamSelected = true;
                              _model.awayTeamSelected = false;
                            });
                          } else {
                            setState(() {
                              _model.homeTeamSelected = true;
                            });
                          }
                        }
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  '${widget.homeImageSrc}',
                                  width: 40.0,
                                  height: 40.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                '@${valueOrDefault<String>(
                                  widget.homeTeamName,
                                  'Error Loading',
                                )}',
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: _model.homeTeamSelected
                                          ? FlutterFlowTheme.of(context)
                                              .secondary
                                          : FlutterFlowTheme.of(context)
                                              .primaryText,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ].divide(const SizedBox(width: 10.0)),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                valueOrDefault<String>(
                                  widget.homeTeamSpread?.toString(),
                                  'N/A',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: _model.homeTeamSelected
                                          ? FlutterFlowTheme.of(context).success
                                          : FlutterFlowTheme.of(context)
                                              .primaryText,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        if (_model.awayTeamSelected) {
                          setState(() {
                            _model.awayTeamSelected = false;
                          });
                        } else {
                          if (_model.homeTeamSelected) {
                            setState(() {
                              _model.homeTeamSelected = false;
                              _model.awayTeamSelected = true;
                            });
                          } else {
                            setState(() {
                              _model.awayTeamSelected = true;
                            });
                          }
                        }
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  '${widget.awayImageSrc}',
                                  width: 40.0,
                                  height: 40.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                valueOrDefault<String>(
                                  widget.awayTeamName,
                                  'Error Loading',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: _model.awayTeamSelected
                                          ? FlutterFlowTheme.of(context)
                                              .secondary
                                          : FlutterFlowTheme.of(context)
                                              .primaryText,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ].divide(const SizedBox(width: 10.0)),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                valueOrDefault<String>(
                                  widget.awayTeamSpread?.toString(),
                                  'N/A',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: _model.awayTeamSelected
                                          ? FlutterFlowTheme.of(context)
                                              .secondary
                                          : FlutterFlowTheme.of(context)
                                              .primaryText,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Divider(
                  thickness: 1.0,
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Updated: ${widget.lastUpdate}',
                    textAlign: TextAlign.end,
                    style: FlutterFlowTheme.of(context).labelSmall,
                  ),
                ),
                if ((widget.pickID != null && widget.pickID != '') &&
                    (((widget.teamSelected == TeamSelected.home) &&
                            _model.homeTeamSelected) ||
                        ((widget.teamSelected == TeamSelected.away) &&
                            _model.awayTeamSelected)))
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        await PicksTable().delete(
                          matchingRows: (rows) => rows.eq(
                            'pick_id',
                            widget.pickID,
                          ),
                        );
                        _model.updatePage(() {
                          _model.homeTeamSelected = false;
                          _model.awayTeamSelected = false;
                        });
                      },
                      text: 'Remove',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).error,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily: 'Readex Pro',
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                        elevation: 3.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                if (() {
                  if ((widget.teamSelected == TeamSelected.home) &&
                      _model.homeTeamSelected) {
                    return false;
                  } else if ((widget.teamSelected == TeamSelected.away) &&
                      _model.awayTeamSelected) {
                    return false;
                  } else {
                    return true;
                  }
                }())
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 5.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FlutterFlowDropDown<String>(
                          controller: _model.dropDownValueController ??=
                              FormFieldController<String>(
                            _model.dropDownValue ??= 'NORM',
                          ),
                          options: const ['NORM', 'BINNY'],
                          onChanged: (val) =>
                              setState(() => _model.dropDownValue = val),
                          width: 150.0,
                          height: 40.0,
                          textStyle: FlutterFlowTheme.of(context).bodyMedium,
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 2.0,
                          borderColor: FlutterFlowTheme.of(context).alternate,
                          borderWidth: 2.0,
                          borderRadius: 8.0,
                          margin: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 4.0, 16.0, 4.0),
                          hidesUnderline: true,
                          isOverButton: true,
                          isSearchable: false,
                          isMultiSelect: false,
                        ),
                        FFButtonWidget(
                          onPressed: !(_model.homeTeamSelected ||
                                  _model.awayTeamSelected)
                              ? null
                              : () async {
                                  if (widget.pickID != null &&
                                      widget.pickID != '') {
                                    await PicksTable().update(
                                      data: {
                                        'team_selected': _model.homeTeamSelected
                                            ? 'HOME'
                                            : 'AWAY',
                                        'updated': supaSerialize<DateTime>(
                                            getCurrentTimestamp),
                                        'pick_type': _model.dropDownValue,
                                      },
                                      matchingRows: (rows) => rows.eq(
                                        'pick_id',
                                        widget.pickID,
                                      ),
                                    );
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Pick Updated',
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                        ),
                                        duration: const Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                  } else {
                                    await PicksTable().insert({
                                      'game_id': widget.gameID,
                                      'team_selected': _model.homeTeamSelected
                                          ? 'HOME'
                                          : 'AWAY',
                                      'week': widget.week,
                                      'user_id': currentUserUid,
                                      'pick_type': _model.dropDownValue,
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Pick  Added',
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                        ),
                                        duration: const Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                  }

                                  _model.updatePage(() {});
                                },
                          text:
                              widget.teamSelected != null ? 'Update' : 'Submit',
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                            disabledColor: const Color(0x434B39EF),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

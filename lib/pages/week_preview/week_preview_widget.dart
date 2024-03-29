import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/components/drawer_icon_widget.dart';
import '/components/drawer_widget.dart';
import '/components/game_card_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'week_preview_model.dart';
export 'week_preview_model.dart';

class WeekPreviewWidget extends StatefulWidget {
  const WeekPreviewWidget({
    super.key,
    bool? homeTeamSelected,
    bool? awayTeamSelected,
  })  : homeTeamSelected = homeTeamSelected ?? false,
        awayTeamSelected = awayTeamSelected ?? false;

  final bool homeTeamSelected;
  final bool awayTeamSelected;

  @override
  _WeekPreviewWidgetState createState() => _WeekPreviewWidgetState();
}

class _WeekPreviewWidgetState extends State<WeekPreviewWidget>
    with TickerProviderStateMixin {
  late WeekPreviewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'wrapOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'wrapOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WeekPreviewModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 1,
    )..addListener(() => setState(() {}));

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return FutureBuilder<List<GlobalVarRow>>(
      future: GlobalVarTable().querySingleRow(
        queryFn: (q) => q,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<GlobalVarRow> weekPreviewGlobalVarRowList = snapshot.data!;
        final weekPreviewGlobalVarRow = weekPreviewGlobalVarRowList.isNotEmpty
            ? weekPreviewGlobalVarRowList.first
            : null;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            drawer: SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.75,
              child: Drawer(
                elevation: 16.0,
                child: wrapWithModel(
                  model: _model.drawerModel,
                  updateCallback: () => setState(() {}),
                  child: const DrawerWidget(),
                ),
              ),
            ),
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              leading: wrapWithModel(
                model: _model.drawerIconModel,
                updateCallback: () => setState(() {}),
                child: const DrawerIconWidget(),
              ),
              title: Text(
                'Week ${weekPreviewGlobalVarRow?.currentWeek.toString()}',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Outfit',
                      color: FlutterFlowTheme.of(context).info,
                    ),
              ),
              actions: const [],
              centerTitle: false,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(),
                alignment: const AlignmentDirectional(0.0, -1.0),
                child: Container(
                  width: () {
                    if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                      return double.infinity;
                    } else if (MediaQuery.sizeOf(context).width <
                        kBreakpointMedium) {
                      return double.infinity;
                    } else if (MediaQuery.sizeOf(context).width <
                        kBreakpointLarge) {
                      return 800.0;
                    } else {
                      return 800.0;
                    }
                  }(),
                  height: double.infinity,
                  constraints: const BoxConstraints(
                    maxWidth: 900.0,
                  ),
                  decoration: const BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Insert Search Field Here',
                            style: FlutterFlowTheme.of(context).headlineMedium,
                          ),
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).height * 0.9,
                        decoration: const BoxDecoration(),
                        child: FutureBuilder<List<GamesWithUrlsRow>>(
                          future: GamesWithUrlsTable().queryRows(
                            queryFn: (q) => q.eq(
                              'week',
                              weekPreviewGlobalVarRow?.currentWeek,
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
                            List<GamesWithUrlsRow> tabBarGamesWithUrlsRowList =
                                snapshot.data!;
                            return Column(
                              children: [
                                Align(
                                  alignment: const Alignment(0.0, 0),
                                  child: TabBar(
                                    labelColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    unselectedLabelColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryText,
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .titleMedium,
                                    unselectedLabelStyle: const TextStyle(),
                                    indicatorColor:
                                        FlutterFlowTheme.of(context).primary,
                                    padding: const EdgeInsets.all(4.0),
                                    tabs: const [
                                      Tab(
                                        text: 'NFL',
                                      ),
                                      Tab(
                                        text: 'NCAA',
                                      ),
                                    ],
                                    controller: _model.tabBarController,
                                    onTap: (i) async {
                                      [() async {}, () async {}][i]();
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: TabBarView(
                                    controller: _model.tabBarController,
                                    children: [
                                      KeepAliveWidgetWrapper(
                                        builder: (context) =>
                                            SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Builder(
                                                builder: (context) {
                                                  final tabBarNFL =
                                                      tabBarGamesWithUrlsRowList
                                                          .where((e) =>
                                                              e.league == 'NFL')
                                                          .toList();
                                                  return Wrap(
                                                    spacing: 20.0,
                                                    runSpacing: 10.0,
                                                    alignment: WrapAlignment
                                                        .spaceEvenly,
                                                    crossAxisAlignment:
                                                        WrapCrossAlignment
                                                            .start,
                                                    direction: Axis.horizontal,
                                                    runAlignment:
                                                        WrapAlignment.start,
                                                    verticalDirection:
                                                        VerticalDirection.down,
                                                    clipBehavior: Clip.none,
                                                    children: List.generate(
                                                        tabBarNFL.length,
                                                        (tabBarNFLIndex) {
                                                      final tabBarNFLItem =
                                                          tabBarNFL[
                                                              tabBarNFLIndex];
                                                      return FutureBuilder<
                                                          List<PicksRow>>(
                                                        future: PicksTable()
                                                            .querySingleRow(
                                                          queryFn: (q) => q
                                                              .eq(
                                                                'game_id',
                                                                tabBarNFLItem
                                                                    .gameId,
                                                              )
                                                              .eq(
                                                                'user_id',
                                                                currentUserUid,
                                                              ),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50.0,
                                                                height: 50.0,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  valueColor:
                                                                      AlwaysStoppedAnimation<
                                                                          Color>(
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<PicksRow>
                                                              gameCardPicksRowList =
                                                              snapshot.data!;
                                                          final gameCardPicksRow =
                                                              gameCardPicksRowList
                                                                      .isNotEmpty
                                                                  ? gameCardPicksRowList
                                                                      .first
                                                                  : null;
                                                          return wrapWithModel(
                                                            model: _model
                                                                .gameCardModels1
                                                                .getModel(
                                                              '${tabBarNFLItem.homeAbbreviation}${tabBarNFLItem.awayAbbreviation}',
                                                              tabBarNFLIndex,
                                                            ),
                                                            updateCallback:
                                                                () => setState(
                                                                    () {}),
                                                            child:
                                                                GameCardWidget(
                                                              key: Key(
                                                                'Keysz5_${'${tabBarNFLItem.homeAbbreviation}${tabBarNFLItem.awayAbbreviation}'}',
                                                              ),
                                                              gameDateTime:
                                                                  dateTimeFormat(
                                                                      'M/d h:mm a',
                                                                      tabBarNFLItem
                                                                          .date!),
                                                              networkProvider:
                                                                  tabBarNFLItem
                                                                      .tvStation,
                                                              homeTeamName:
                                                                  valueOrDefault<
                                                                      String>(
                                                                tabBarNFLItem
                                                                    .homeName,
                                                                'Error Loading',
                                                              ),
                                                              homeTeamSpread:
                                                                  tabBarNFLItem
                                                                      .homeSpread,
                                                              awayTeamName:
                                                                  valueOrDefault<
                                                                      String>(
                                                                tabBarNFLItem
                                                                    .awayName,
                                                                'Error Loading',
                                                              ),
                                                              awayTeamSpread:
                                                                  tabBarNFLItem
                                                                      .awaySpread,
                                                              lastUpdate: dateTimeFormat(
                                                                  'M/d h:mm a',
                                                                  tabBarNFLItem
                                                                      .updated!),
                                                              teamSelected: () {
                                                                if (gameCardPicksRow
                                                                        ?.teamSelected ==
                                                                    'HOME') {
                                                                  return TeamSelected
                                                                      .home;
                                                                } else if (gameCardPicksRow
                                                                        ?.teamSelected ==
                                                                    'AWAY') {
                                                                  return TeamSelected
                                                                      .away;
                                                                } else {
                                                                  return null;
                                                                }
                                                              }(),
                                                              pickID:
                                                                  gameCardPicksRow
                                                                      ?.pickId,
                                                              gameID:
                                                                  tabBarNFLItem
                                                                      .gameId!,
                                                              week: weekPreviewGlobalVarRow!
                                                                  .currentWeek,
                                                              homeImageSrc:
                                                                  tabBarNFLItem
                                                                      .homeImageSrc!,
                                                              awayImageSrc:
                                                                  tabBarNFLItem
                                                                      .awayImageSrc!,
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    }),
                                                  ).animateOnPageLoad(animationsMap[
                                                      'wrapOnPageLoadAnimation1']!);
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      KeepAliveWidgetWrapper(
                                        builder: (context) =>
                                            SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Builder(
                                                builder: (context) {
                                                  final tabBarNCAA =
                                                      tabBarGamesWithUrlsRowList
                                                          .where((e) =>
                                                              e.league ==
                                                              'NCAA')
                                                          .toList();
                                                  return Wrap(
                                                    spacing: 20.0,
                                                    runSpacing: 10.0,
                                                    alignment: WrapAlignment
                                                        .spaceEvenly,
                                                    crossAxisAlignment:
                                                        WrapCrossAlignment
                                                            .start,
                                                    direction: Axis.horizontal,
                                                    runAlignment:
                                                        WrapAlignment.start,
                                                    verticalDirection:
                                                        VerticalDirection.down,
                                                    clipBehavior: Clip.none,
                                                    children: List.generate(
                                                        tabBarNCAA.length,
                                                        (tabBarNCAAIndex) {
                                                      final tabBarNCAAItem =
                                                          tabBarNCAA[
                                                              tabBarNCAAIndex];
                                                      return FutureBuilder<
                                                          List<PicksRow>>(
                                                        future: PicksTable()
                                                            .querySingleRow(
                                                          queryFn: (q) => q
                                                              .eq(
                                                                'game_id',
                                                                tabBarNCAAItem
                                                                    .gameId,
                                                              )
                                                              .eq(
                                                                'user_id',
                                                                currentUserUid,
                                                              ),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50.0,
                                                                height: 50.0,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  valueColor:
                                                                      AlwaysStoppedAnimation<
                                                                          Color>(
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<PicksRow>
                                                              gameCardPicksRowList =
                                                              snapshot.data!;
                                                          final gameCardPicksRow =
                                                              gameCardPicksRowList
                                                                      .isNotEmpty
                                                                  ? gameCardPicksRowList
                                                                      .first
                                                                  : null;
                                                          return wrapWithModel(
                                                            model: _model
                                                                .gameCardModels2
                                                                .getModel(
                                                              '${tabBarNCAAItem.homeAbbreviation}${tabBarNCAAItem.homeAbbreviation}',
                                                              tabBarNCAAIndex,
                                                            ),
                                                            updateCallback:
                                                                () => setState(
                                                                    () {}),
                                                            child:
                                                                GameCardWidget(
                                                              key: Key(
                                                                'Keybt0_${'${tabBarNCAAItem.homeAbbreviation}${tabBarNCAAItem.homeAbbreviation}'}',
                                                              ),
                                                              gameDateTime:
                                                                  dateTimeFormat(
                                                                      'M/d h:mm a',
                                                                      tabBarNCAAItem
                                                                          .date!),
                                                              networkProvider:
                                                                  tabBarNCAAItem
                                                                      .tvStation,
                                                              homeTeamName:
                                                                  valueOrDefault<
                                                                      String>(
                                                                tabBarNCAAItem
                                                                    .homeName,
                                                                'Error Loading',
                                                              ),
                                                              homeTeamSpread:
                                                                  tabBarNCAAItem
                                                                      .homeSpread,
                                                              awayTeamName:
                                                                  valueOrDefault<
                                                                      String>(
                                                                tabBarNCAAItem
                                                                    .awayName,
                                                                'Error Loading',
                                                              ),
                                                              awayTeamSpread:
                                                                  tabBarNCAAItem
                                                                      .awaySpread,
                                                              lastUpdate: dateTimeFormat(
                                                                  'M/d h:mm a',
                                                                  tabBarNCAAItem
                                                                      .updated!),
                                                              teamSelected: () {
                                                                if (gameCardPicksRow
                                                                        ?.teamSelected ==
                                                                    'HOME') {
                                                                  return TeamSelected
                                                                      .home;
                                                                } else if (gameCardPicksRow
                                                                        ?.teamSelected ==
                                                                    'AWAY') {
                                                                  return TeamSelected
                                                                      .away;
                                                                } else {
                                                                  return null;
                                                                }
                                                              }(),
                                                              pickID:
                                                                  gameCardPicksRow
                                                                      ?.pickId,
                                                              gameID:
                                                                  tabBarNCAAItem
                                                                      .gameId!,
                                                              week: weekPreviewGlobalVarRow!
                                                                  .currentWeek,
                                                              homeImageSrc:
                                                                  tabBarNCAAItem
                                                                      .homeImageSrc!,
                                                              awayImageSrc:
                                                                  tabBarNCAAItem
                                                                      .awayImageSrc!,
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    }),
                                                  ).animateOnPageLoad(animationsMap[
                                                      'wrapOnPageLoadAnimation2']!);
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

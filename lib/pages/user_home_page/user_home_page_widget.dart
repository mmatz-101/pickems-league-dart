import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/components/drawer_icon_widget.dart';
import '/components/drawer_widget.dart';
import '/components/small_data_table_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'user_home_page_model.dart';
export 'user_home_page_model.dart';

class UserHomePageWidget extends StatefulWidget {
  const UserHomePageWidget({super.key});

  @override
  _UserHomePageWidgetState createState() => _UserHomePageWidgetState();
}

class _UserHomePageWidgetState extends State<UserHomePageWidget> {
  late UserHomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserHomePageModel());

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
        List<GlobalVarRow> userHomePageGlobalVarRowList = snapshot.data!;
        final userHomePageGlobalVarRow = userHomePageGlobalVarRowList.isNotEmpty
            ? userHomePageGlobalVarRowList.first
            : null;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            drawer: SizedBox(
              width: () {
                if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                  return 350.0;
                } else if (MediaQuery.sizeOf(context).width <
                    kBreakpointMedium) {
                  return 400.0;
                } else if (MediaQuery.sizeOf(context).width <
                    kBreakpointLarge) {
                  return 400.0;
                } else {
                  return 400.0;
                }
              }(),
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
              title: FutureBuilder<List<UsersRow>>(
                future: UsersTable().querySingleRow(
                  queryFn: (q) => q.eq(
                    'id',
                    currentUserUid,
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
                  List<UsersRow> textUsersRowList = snapshot.data!;
                  final textUsersRow = textUsersRowList.isNotEmpty
                      ? textUsersRowList.first
                      : null;
                  return Text(
                    'Welcome ${textUsersRow?.firstName}',
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Outfit',
                          color: Colors.white,
                          fontSize: 22.0,
                        ),
                  );
                },
              ),
              actions: const [],
              centerTitle: false,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Picks',
                                style:
                                    FlutterFlowTheme.of(context).headlineMedium,
                              ),
                              FlutterFlowIconButton(
                                borderColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                borderRadius: 20.0,
                                borderWidth: 1.0,
                                buttonSize: 40.0,
                                fillColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                icon: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: FlutterFlowTheme.of(context).secondary,
                                  size: 24.0,
                                ),
                                onPressed: () {
                                  print('IconButton pressed ...');
                                },
                              ),
                            ].divide(const SizedBox(width: 20.0)),
                          ),
                        ),
                        Divider(
                          height: 1.0,
                          thickness: 2.0,
                          color: FlutterFlowTheme.of(context).primary,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: wrapWithModel(
                      model: _model.smallDataTableModel1,
                      updateCallback: () => setState(() {}),
                      child: SmallDataTableWidget(
                        week: userHomePageGlobalVarRow!.currentWeek,
                        pickType: PickType.NORM,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Binny Buys',
                                style:
                                    FlutterFlowTheme.of(context).headlineMedium,
                              ),
                              FlutterFlowIconButton(
                                borderColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                borderRadius: 20.0,
                                borderWidth: 1.0,
                                buttonSize: 40.0,
                                fillColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                icon: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: FlutterFlowTheme.of(context).secondary,
                                  size: 24.0,
                                ),
                                onPressed: () {
                                  print('IconButton pressed ...');
                                },
                              ),
                            ].divide(const SizedBox(width: 20.0)),
                          ),
                        ),
                        Divider(
                          height: 1.0,
                          thickness: 2.0,
                          color: FlutterFlowTheme.of(context).primary,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: wrapWithModel(
                      model: _model.smallDataTableModel2,
                      updateCallback: () => setState(() {}),
                      child: SmallDataTableWidget(
                        week: userHomePageGlobalVarRow.currentWeek,
                        pickType: PickType.BINNY,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

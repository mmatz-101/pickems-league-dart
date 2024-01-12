import '/auth/supabase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'drawer_model.dart';
export 'drawer_model.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  late DrawerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DrawerModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (responsiveVisibility(
            context: context,
            phone: false,
            desktop: false,
          ))
            Align(
              alignment: const AlignmentDirectional(1.0, -1.0),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    if (Scaffold.of(context).isDrawerOpen ||
                        Scaffold.of(context).isEndDrawerOpen) {
                      Navigator.pop(context);
                    }
                  },
                  child: Icon(
                    Icons.clear,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 120.0,
                  height: 120.0,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    'https://ui-avatars.com/api/?background=0D8ABC&color=fff&name=Jayson+Binion',
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Jayson Binion',
                    style: FlutterFlowTheme.of(context).headlineLarge,
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 1.0,
            color: Color(0xFF94B2DB),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 10.0, 20.0),
              child: Container(
                width: double.infinity,
                height: 200.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                child: ListView(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.home,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 30.0,
                        ),
                        Text(
                          'Home Page',
                          style: FlutterFlowTheme.of(context).titleLarge,
                        ),
                      ].divide(const SizedBox(width: 20.0)),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed('WeekPreview');
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.sports_football,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 30.0,
                          ),
                          Text(
                            'Games',
                            style: FlutterFlowTheme.of(context).titleLarge,
                          ),
                        ].divide(const SizedBox(width: 20.0)),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.message,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 30.0,
                        ),
                        Text(
                          'Messages',
                          style: FlutterFlowTheme.of(context).titleLarge,
                        ),
                      ].divide(const SizedBox(width: 20.0)),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.insert_chart,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 30.0,
                        ),
                        Text(
                          'Results',
                          style: FlutterFlowTheme.of(context).titleLarge,
                        ),
                      ].divide(const SizedBox(width: 20.0)),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed('AdminPage');
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.admin_panel_settings,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 30.0,
                          ),
                          Text(
                            'Admin',
                            style: FlutterFlowTheme.of(context).titleLarge,
                          ),
                        ].divide(const SizedBox(width: 20.0)),
                      ),
                    ),
                  ].divide(const SizedBox(height: 5.0)),
                ),
              ),
            ),
          ),
          const Divider(
            thickness: 1.0,
            color: Color(0xFF94B2DB),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 10.0, 20.0),
            child: Container(
              width: double.infinity,
              height: 100.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
              ),
              child: ListView(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        Icons.settings_sharp,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 30.0,
                      ),
                      Text(
                        'Settings',
                        style: FlutterFlowTheme.of(context).titleLarge,
                      ),
                    ].divide(const SizedBox(width: 20.0)),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      GoRouter.of(context).prepareAuthEvent();
                      await authManager.signOut();
                      GoRouter.of(context).clearRedirectLocation();

                      context.goNamedAuth('SplashPage', context.mounted);
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.logout,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 30.0,
                        ),
                        Text(
                          'Log Out',
                          style: FlutterFlowTheme.of(context).titleLarge,
                        ),
                      ].divide(const SizedBox(width: 20.0)),
                    ),
                  ),
                ].divide(const SizedBox(height: 5.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

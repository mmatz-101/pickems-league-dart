import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'drawer_icon_model.dart';
export 'drawer_icon_model.dart';

class DrawerIconWidget extends StatefulWidget {
  const DrawerIconWidget({super.key});

  @override
  _DrawerIconWidgetState createState() => _DrawerIconWidgetState();
}

class _DrawerIconWidgetState extends State<DrawerIconWidget>
    with TickerProviderStateMixin {
  late DrawerIconModel _model;

  final animationsMap = {
    'iconOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        RotateEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: 0.0,
          end: 0.25,
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DrawerIconModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        Scaffold.of(context).openDrawer();
      },
      child: Icon(
        Icons.menu,
        color: FlutterFlowTheme.of(context).info,
        size: 24.0,
      ),
    ).animateOnActionTrigger(
      animationsMap['iconOnActionTriggerAnimation']!,
    );
  }
}

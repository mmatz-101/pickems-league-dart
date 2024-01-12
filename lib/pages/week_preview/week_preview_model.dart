import '/components/drawer_icon_widget.dart';
import '/components/drawer_widget.dart';
import '/components/game_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'week_preview_widget.dart' show WeekPreviewWidget;
import 'package:flutter/material.dart';

class WeekPreviewModel extends FlutterFlowModel<WeekPreviewWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Models for gameCard dynamic component.
  late FlutterFlowDynamicModels<GameCardModel> gameCardModels1;
  // Models for gameCard dynamic component.
  late FlutterFlowDynamicModels<GameCardModel> gameCardModels2;
  // Model for drawerIcon component.
  late DrawerIconModel drawerIconModel;
  // Model for drawer component.
  late DrawerModel drawerModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    gameCardModels1 = FlutterFlowDynamicModels(() => GameCardModel());
    gameCardModels2 = FlutterFlowDynamicModels(() => GameCardModel());
    drawerIconModel = createModel(context, () => DrawerIconModel());
    drawerModel = createModel(context, () => DrawerModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    gameCardModels1.dispose();
    gameCardModels2.dispose();
    drawerIconModel.dispose();
    drawerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

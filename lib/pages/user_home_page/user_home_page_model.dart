import '/components/drawer_icon_widget.dart';
import '/components/drawer_widget.dart';
import '/components/small_data_table_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'user_home_page_widget.dart' show UserHomePageWidget;
import 'package:flutter/material.dart';

class UserHomePageModel extends FlutterFlowModel<UserHomePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for smallDataTable component.
  late SmallDataTableModel smallDataTableModel1;
  // Model for smallDataTable component.
  late SmallDataTableModel smallDataTableModel2;
  // Model for drawer component.
  late DrawerModel drawerModel;
  // Model for drawerIcon component.
  late DrawerIconModel drawerIconModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    smallDataTableModel1 = createModel(context, () => SmallDataTableModel());
    smallDataTableModel2 = createModel(context, () => SmallDataTableModel());
    drawerModel = createModel(context, () => DrawerModel());
    drawerIconModel = createModel(context, () => DrawerIconModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    smallDataTableModel1.dispose();
    smallDataTableModel2.dispose();
    drawerModel.dispose();
    drawerIconModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

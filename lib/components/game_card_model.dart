import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'game_card_widget.dart' show GameCardWidget;
import 'package:flutter/material.dart';

class GameCardModel extends FlutterFlowModel<GameCardWidget> {
  ///  Local state fields for this component.

  bool homeTeamSelected = false;

  bool awayTeamSelected = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

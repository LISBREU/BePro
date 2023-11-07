import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'change_profile_widget.dart' show ChangeProfileWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChangeProfileModel extends FlutterFlowModel<ChangeProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Number widget.
  FocusNode? numberFocusNode;
  TextEditingController? numberController;
  String? Function(BuildContext, String?)? numberControllerValidator;
  // State field(s) for Name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameController;
  String? Function(BuildContext, String?)? nameControllerValidator;
  // State field(s) for Team widget.
  FocusNode? teamFocusNode;
  TextEditingController? teamController;
  String? Function(BuildContext, String?)? teamControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    numberFocusNode?.dispose();
    numberController?.dispose();

    nameFocusNode?.dispose();
    nameController?.dispose();

    teamFocusNode?.dispose();
    teamController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

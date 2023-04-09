import '/auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for inputEmail widget.
  TextEditingController? inputEmailController;
  String? Function(BuildContext, String?)? inputEmailControllerValidator;
  // State field(s) for inputPass widget.
  TextEditingController? inputPassController;
  late bool inputPassVisibility;
  String? Function(BuildContext, String?)? inputPassControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    inputPassVisibility = false;
  }

  void dispose() {
    inputEmailController?.dispose();
    inputPassController?.dispose();
  }

  /// Additional helper methods are added here.

}

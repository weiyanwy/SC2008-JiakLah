import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateAccModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for displayname widget.
  TextEditingController? displaynameController;
  String? Function(BuildContext, String?)? displaynameControllerValidator;
  // State field(s) for inputEmail widget.
  TextEditingController? inputEmailController;
  String? Function(BuildContext, String?)? inputEmailControllerValidator;
  // State field(s) for inputPass widget.
  TextEditingController? inputPassController;
  late bool inputPassVisibility;
  String? Function(BuildContext, String?)? inputPassControllerValidator;
  // State field(s) for Confirmpassword widget.
  TextEditingController? confirmpasswordController;
  late bool confirmpasswordVisibility;
  String? Function(BuildContext, String?)? confirmpasswordControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    inputPassVisibility = false;
    confirmpasswordVisibility = false;
  }

  void dispose() {
    displaynameController?.dispose();
    inputEmailController?.dispose();
    inputPassController?.dispose();
    confirmpasswordController?.dispose();
  }

  /// Additional helper methods are added here.

}

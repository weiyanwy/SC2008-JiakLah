import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchpageModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  int isincollection = 0;

  String? searchname = '0';

  bool? success = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for searchfield widget.
  TextEditingController? searchfieldController;
  String? Function(BuildContext, String?)? searchfieldControllerValidator;
  // Stores action output result for [Backend Call - API (SearchPlace)] action in IconButton widget.
  ApiCallResponse? apiResult69k;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    searchfieldController?.dispose();
  }

  /// Additional helper methods are added here.

}

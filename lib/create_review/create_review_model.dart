import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateReviewModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  String? review;

  double? rating;

  int wheelchairfriendly = 0;

  int signlanguagetrained = 0;

  int blindfriendly = 0;

  ///  State fields for stateful widgets in this page.

  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // State field(s) for wheelchair widget.
  String? wheelchairValue;
  FormFieldController<List<String>>? wheelchairController;
  // State field(s) for blind widget.
  String? blindValue;
  FormFieldController<List<String>>? blindController;
  // State field(s) for SignLangauge widget.
  String? signLangaugeValue;
  FormFieldController<List<String>>? signLangaugeController;
  // State field(s) for Reviiew widget.
  TextEditingController? reviiewController;
  String? Function(BuildContext, String?)? reviiewControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    reviiewController?.dispose();
  }

  /// Additional helper methods are added here.

}

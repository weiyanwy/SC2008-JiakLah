import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

bool? checktype(dynamic restauranttypes) {
  for (int x = 0; x < restauranttypes.length; x++) {
    if (restauranttypes[x] == "restaurant") {
      return true;
    }
  }
  return false;
}

String? getimg(String? photoref) {
  String apiKey = 'AIzaSyBYBCaEyoxyppr62mEtY4MS2VF4OXuJqjw';
  Uri url = Uri.parse('https://maps.googleapis.com/maps/api/place/photo'
      '?maxwidth=400'
      '&photoreference=$photoref'
      '&key=$apiKey');

  String stringUri = url.toString();
  return stringUri;
}

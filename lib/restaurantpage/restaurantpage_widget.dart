import '/auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'restaurantpage_model.dart';
export 'restaurantpage_model.dart';

class RestaurantpageWidget extends StatefulWidget {
  const RestaurantpageWidget({
    Key? key,
    this.placeid,
    this.rating,
    this.isincollection,
    this.name,
    bool? wheelchairentrance,
    this.imageurl,
    int? pricelevel,
  })  : this.wheelchairentrance = wheelchairentrance ?? false,
        this.pricelevel = pricelevel ?? 0,
        super(key: key);

  final String? placeid;
  final double? rating;
  final int? isincollection;
  final String? name;
  final bool wheelchairentrance;
  final String? imageurl;
  final int pricelevel;

  @override
  _RestaurantpageWidgetState createState() => _RestaurantpageWidgetState();
}

class _RestaurantpageWidgetState extends State<RestaurantpageWidget> {
  late RestaurantpageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RestaurantpageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.isincollection! < 1) {
        final restaurantCreateData = createRestaurantRecordData(
          name: widget.name,
          placeID: widget.placeid,
          wheelChairTag: 0,
          blindFriendlyTag: 0,
          signLanguage: 0,
          wheelChairAccessbileEntrance: widget.wheelchairentrance,
          imageref: widget.imageurl,
          price: widget.pricelevel,
          rating: widget.rating,
        );
        await RestaurantRecord.collection.doc().set(restaurantCreateData);
        return;
      } else {
        return;
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.goNamed(
                'HomePage',
                extra: <String, dynamic>{
                  kTransitionInfoKey: TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.fade,
                    duration: Duration(milliseconds: 0),
                  ),
                },
              );
            },
          ),
          title: Text(
            'Restaurant Page',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: FutureBuilder<ApiCallResponse>(
          future: RestaurantDetailsCall.call(
            placeid: widget.placeid,
          ),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: CircularProgressIndicator(
                    color: FlutterFlowTheme.of(context).primary,
                  ),
                ),
              );
            }
            final columnRestaurantDetailsResponse = snapshot.data!;
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 353.4,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFFDBE2E7), Colors.white],
                        stops: [0.0, 1.0],
                        begin: AlignmentDirectional(0.0, -1.0),
                        end: AlignmentDirectional(0, 1.0),
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 44.0, 16.0, 1.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12.0),
                                  child: Image.network(
                                    widget.imageurl!,
                                    width: 173.4,
                                    height: 180.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Align(
                                            alignment: AlignmentDirectional(
                                                -1.0, -1.0),
                                            child: Text(
                                              getJsonField(
                                                columnRestaurantDetailsResponse
                                                    .jsonBody,
                                                r'''$.result.name''',
                                              ).toString(),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .displaySmall
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: Color(0xFF14181B),
                                                    fontSize: 20.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Container(
                                width: 1000.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  'Address: ',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 15.0,
                                                      ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    getJsonField(
                                                      columnRestaurantDetailsResponse
                                                          .jsonBody,
                                                      r'''$..formatted_address''',
                                                    ).toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 15.0,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                'Contact No: ',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 15.0,
                                                        ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  getJsonField(
                                                    columnRestaurantDetailsResponse
                                                        .jsonBody,
                                                    r'''$..formatted_phone_number''',
                                                  ).toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 15.0,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              if (getJsonField(
                                                    columnRestaurantDetailsResponse
                                                        .jsonBody,
                                                    r'''$..price_level''',
                                                  ) !=
                                                  null)
                                                RatingBarIndicator(
                                                  itemBuilder:
                                                      (context, index) => Icon(
                                                    Icons.attach_money,
                                                    color: Color(0xFF39D28D),
                                                  ),
                                                  direction: Axis.horizontal,
                                                  rating: widget.pricelevel
                                                      .toDouble(),
                                                  unratedColor:
                                                      Color(0xFF9E9E9E),
                                                  itemCount: 5,
                                                  itemSize: 15.0,
                                                ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      FutureBuilder<List<RestaurantRecord>>(
                                        future: queryRestaurantRecordOnce(
                                          queryBuilder: (restaurantRecord) =>
                                              restaurantRecord.where('PlaceID',
                                                  isEqualTo: widget.placeid),
                                          singleRecord: true,
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                ),
                                              ),
                                            );
                                          }
                                          List<RestaurantRecord>
                                              rowRestaurantRecordList =
                                              snapshot.data!;
                                          final rowRestaurantRecord =
                                              rowRestaurantRecordList.isNotEmpty
                                                  ? rowRestaurantRecordList
                                                      .first
                                                  : null;
                                          return Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              if ((rowRestaurantRecord!
                                                          .wheelChairAccessbileEntrance ==
                                                      true) ||
                                                  (rowRestaurantRecord!
                                                          .wheelChairTag! >=
                                                      5))
                                                Icon(
                                                  Icons.wheelchair_pickup,
                                                  color: Colors.black,
                                                  size: 24.0,
                                                ),
                                              if (rowRestaurantRecord!
                                                      .blindFriendlyTag! >=
                                                  5)
                                                Icon(
                                                  Icons.remove_red_eye_sharp,
                                                  color: Colors.black,
                                                  size: 24.0,
                                                ),
                                              if (rowRestaurantRecord!
                                                      .blindFriendlyTag! >=
                                                  5)
                                                FaIcon(
                                                  FontAwesomeIcons.signLanguage,
                                                  color: Colors.black,
                                                  size: 24.0,
                                                ),
                                            ],
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          12.0, 12.0, 12.0, 12.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          StreamBuilder<List<RestaurantRecord>>(
                            stream: queryRestaurantRecord(
                              queryBuilder: (restaurantRecord) =>
                                  restaurantRecord.where('PlaceID',
                                      isEqualTo: widget.placeid),
                              singleRecord: true,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                );
                              }
                              List<RestaurantRecord> rowRestaurantRecordList =
                                  snapshot.data!;
                              // Return an empty Container when the item does not exist.
                              if (snapshot.data!.isEmpty) {
                                return Container();
                              }
                              final rowRestaurantRecord =
                                  rowRestaurantRecordList.isNotEmpty
                                      ? rowRestaurantRecordList.first
                                      : null;
                              return Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(-0.98, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            getJsonField(
                                              columnRestaurantDetailsResponse
                                                  .jsonBody,
                                              r'''$.result.rating''',
                                            ).toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 15.0,
                                                ),
                                          ),
                                          Icon(
                                            Icons.star_sharp,
                                            color: Color(0xFFFFA130),
                                            size: 24.0,
                                          ),
                                          Text(
                                            getJsonField(
                                              columnRestaurantDetailsResponse
                                                  .jsonBody,
                                              r'''$..user_ratings_total''',
                                            ).toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 15.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  if (FFAppState().Authenticaed == true)
                                    Expanded(
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.95, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            context.pushNamed(
                                              'CreateReview',
                                              queryParams: {
                                                'placeid': serializeParam(
                                                  rowRestaurantRecord!.placeID,
                                                  ParamType.String,
                                                ),
                                                'userid': serializeParam(
                                                  currentUserUid,
                                                  ParamType.String,
                                                ),
                                                'restaurantname':
                                                    serializeParam(
                                                  getJsonField(
                                                    columnRestaurantDetailsResponse
                                                        .jsonBody,
                                                    r'''$.result.name''',
                                                  ).toString(),
                                                  ParamType.String,
                                                ),
                                                'docref': serializeParam(
                                                  rowRestaurantRecord!
                                                      .reference,
                                                  ParamType.DocumentReference,
                                                ),
                                                'imagepath': serializeParam(
                                                  widget.imageurl,
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          text: 'Submit Review',
                                          options: FFButtonOptions(
                                            width: 130.0,
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      color: Colors.white,
                                                    ),
                                            elevation: 2.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Builder(
                    builder: (context) {
                      final reviewList = getJsonField(
                        columnRestaurantDetailsResponse.jsonBody,
                        r'''$..reviews''',
                      ).toList();
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: reviewList.length,
                        itemBuilder: (context, reviewListIndex) {
                          final reviewListItem = reviewList[reviewListIndex];
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 12.0, 16.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4.0,
                                    color: Color(0x33000000),
                                    offset: Offset(0.0, 2.0),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    4.0, 4.0, 4.0, 4.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 12.0, 16.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    getJsonField(
                                                      reviewListItem,
                                                      r'''$.author_name''',
                                                    ).toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily:
                                                              'Lexend Deca',
                                                          color:
                                                              Color(0xFF090F13),
                                                          fontSize: 18.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 4.0,
                                                                0.0, 4.0),
                                                    child: RatingBarIndicator(
                                                      itemBuilder:
                                                          (context, index) =>
                                                              Icon(
                                                        Icons.star_rounded,
                                                        color:
                                                            Color(0xFFFFA130),
                                                      ),
                                                      direction:
                                                          Axis.horizontal,
                                                      rating: functions
                                                          .converttodouble(
                                                              getJsonField(
                                                        reviewListItem,
                                                        r'''$.rating''',
                                                      ))!,
                                                      unratedColor:
                                                          Color(0xFF95A1AC),
                                                      itemCount: 5,
                                                      itemSize: 24.0,
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 200.0,
                                                    decoration: BoxDecoration(),
                                                  ),
                                                  Container(
                                                    width: 200.0,
                                                    decoration: BoxDecoration(),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Card(
                                              clipBehavior:
                                                  Clip.antiAliasWithSaveLayer,
                                              color: Color(0xFFF1F4F8),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(40.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        2.0, 2.0, 2.0, 2.0),
                                                child: Container(
                                                  width: 90.0,
                                                  height: 90.0,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Image.network(
                                                    getJsonField(
                                                      reviewListItem,
                                                      r'''$..profile_photo_url''',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 4.0, 16.0, 12.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                getJsonField(
                                                  reviewListItem,
                                                  r'''$.text''',
                                                ).toString(),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodySmall
                                                    .override(
                                                      fontFamily: 'Lexend Deca',
                                                      color: Color(0xFF95A1AC),
                                                      fontSize: 14.0,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                      child: FFButtonWidget(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        text: 'See all reviews',
                        options: FFButtonOptions(
                          width: 130.0,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                          elevation: 2.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

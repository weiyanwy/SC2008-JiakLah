import '/auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({
    Key? key,
    bool? isrestaurantincollection,
  })  : this.isrestaurantincollection = isrestaurantincollection ?? false,
        super(key: key);

  final bool isrestaurantincollection;

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

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
        backgroundColor: Color(0xFFF1F4F8),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: Visibility(
            visible: FFAppState().Authenticaed == false,
            child: FlutterFlowIconButton(
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
                  'Login',
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
          ),
          title: Visibility(
            visible: FFAppState().Authenticaed,
            child: StreamBuilder<List<UsersRecord>>(
              stream: queryUsersRecord(
                queryBuilder: (usersRecord) =>
                    usersRecord.where('email', isEqualTo: currentUserEmail),
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
                        color: FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  );
                }
                List<UsersRecord> textUsersRecordList = snapshot.data!;
                // Return an empty Container when the item does not exist.
                if (snapshot.data!.isEmpty) {
                  return Container();
                }
                final textUsersRecord = textUsersRecordList.isNotEmpty
                    ? textUsersRecordList.first
                    : null;
                return Text(
                  'Hi, ${textUsersRecord!.displayName}',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                );
              },
            ),
          ),
          actions: [
            Visibility(
              visible: FFAppState().Authenticaed,
              child: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.person,
                  color: FlutterFlowTheme.of(context).primaryBtnText,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.goNamed(
                    'UserPage',
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
            ),
          ],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: FutureBuilder<ApiCallResponse>(
          future: GetRestaurantsCall.call(),
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
            final columnGetRestaurantsResponse = snapshot.data!;
            return Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 85.0,
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 4.0, 16.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FlutterFlowDropDown<String>(
                                controller: _model.dropDownController ??=
                                    FormFieldController<String>(
                                  _model.dropDownValue ??= 'None',
                                ),
                                options: [
                                  'None',
                                  'Wheel Chair Friendly',
                                  'Blind Friendly',
                                  'Deaf Friendly'
                                ],
                                optionLabels: [
                                  'None',
                                  'Wheel Chair Friendly',
                                  'Blind Friendly',
                                  'Deaf Friendly'
                                ],
                                onChanged: (val) async {
                                  setState(() => _model.dropDownValue = val);
                                  setState(() {
                                    _model.filter = _model.dropDownValue;
                                  });
                                  if (_model.filter != 'None') {
                                    context.goNamed(
                                      'filterpage',
                                      queryParams: {
                                        'filters': serializeParam(
                                          _model.filter,
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                          duration: Duration(milliseconds: 0),
                                        ),
                                      },
                                    );

                                    return;
                                  } else {
                                    return;
                                  }
                                },
                                width: 180.0,
                                height: 40.0,
                                searchHintTextStyle:
                                    FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                textStyle:
                                    FlutterFlowTheme.of(context).bodyMedium,
                                hintText: 'Filter',
                                searchHintText: 'Search for an item...',
                                icon: Icon(
                                  Icons.filter_alt,
                                  size: 15.0,
                                ),
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                elevation: 2.0,
                                borderColor: Colors.transparent,
                                borderWidth: 0.0,
                                borderRadius: 0.0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 4.0, 12.0, 4.0),
                                hidesUnderline: true,
                                isSearchable: false,
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  context.pushNamed('searchpage');
                                },
                                text: 'Search',
                                icon: Icon(
                                  Icons.search,
                                  size: 15.0,
                                ),
                                options: FFButtonOptions(
                                  width: 130.0,
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
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
                                  borderRadius: BorderRadius.circular(8.0),
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
                  child: Builder(
                    builder: (context) {
                      final restaurantlist = GetRestaurantsCall.results(
                            columnGetRestaurantsResponse.jsonBody,
                          )
                              ?.where((e) =>
                                  getJsonField(
                                    e,
                                    r'''$.rating''',
                                  ) !=
                                  _model.rating0)
                              .toList()
                              ?.toList() ??
                          [];
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: restaurantlist.length,
                        itemBuilder: (context, restaurantlistIndex) {
                          final restaurantlistItem =
                              restaurantlist[restaurantlistIndex];
                          return Container(
                            width: MediaQuery.of(context).size.width * 0.924,
                            height: 271.1,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12.0),
                              shape: BoxShape.rectangle,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: FutureBuilder<int>(
                                    future: queryRestaurantRecordCount(
                                      queryBuilder: (restaurantRecord) =>
                                          restaurantRecord.where('PlaceID',
                                              isEqualTo: getJsonField(
                                                restaurantlistItem,
                                                r'''$.place_id''',
                                              ).toString()),
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
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            ),
                                          ),
                                        );
                                      }
                                      int columnCount = snapshot.data!;
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(4.0, 4.0, 4.0, 4.0),
                                              child: FutureBuilder<
                                                  ApiCallResponse>(
                                                future:
                                                    RestaurantDetailsCall.call(
                                                  placeid: getJsonField(
                                                    restaurantlistItem,
                                                    r'''$.place_id''',
                                                  ).toString(),
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  final columnRestaurantDetailsResponse =
                                                      snapshot.data!;
                                                  return InkWell(
                                                    onTap: () async {
                                                      _model.isrestaurantincollection =
                                                          columnCount;

                                                      context.pushNamed(
                                                        'restaurantpage',
                                                        queryParams: {
                                                          'placeid':
                                                              serializeParam(
                                                            getJsonField(
                                                              restaurantlistItem,
                                                              r'''$.place_id''',
                                                            ).toString(),
                                                            ParamType.String,
                                                          ),
                                                          'rating':
                                                              serializeParam(
                                                            getJsonField(
                                                              restaurantlistItem,
                                                              r'''$.rating''',
                                                            ),
                                                            ParamType.double,
                                                          ),
                                                          'isincollection':
                                                              serializeParam(
                                                            columnCount,
                                                            ParamType.int,
                                                          ),
                                                          'name':
                                                              serializeParam(
                                                            getJsonField(
                                                              columnRestaurantDetailsResponse
                                                                  .jsonBody,
                                                              r'''$..name''',
                                                            ).toString(),
                                                            ParamType.String,
                                                          ),
                                                          'wheelchairentrance':
                                                              serializeParam(
                                                            getJsonField(
                                                              columnRestaurantDetailsResponse
                                                                  .jsonBody,
                                                              r'''$..wheelchair_accessible_entrance''',
                                                            ),
                                                            ParamType.bool,
                                                          ),
                                                          'imageurl':
                                                              serializeParam(
                                                            functions.getimg(
                                                                getJsonField(
                                                              restaurantlistItem,
                                                              r'''$..photos..photo_reference''',
                                                            ).toString()),
                                                            ParamType.String,
                                                          ),
                                                          'pricelevel':
                                                              serializeParam(
                                                            getJsonField(
                                                              restaurantlistItem,
                                                              r'''$.price_level''',
                                                            ),
                                                            ParamType.int,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          kTransitionInfoKey:
                                                              TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .fade,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    0),
                                                          ),
                                                        },
                                                      );
                                                    },
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          child: Image.network(
                                                            functions.getimg(
                                                                getJsonField(
                                                              restaurantlistItem,
                                                              r'''$..photos..photo_reference''',
                                                            ).toString())!,
                                                            width: 425.0,
                                                            height: 150.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      12.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            getJsonField(
                                                              columnRestaurantDetailsResponse
                                                                  .jsonBody,
                                                              r'''$..name''',
                                                            ).toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: Color(
                                                                      0xFF14181B),
                                                                  fontSize:
                                                                      16.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ),
                                                        if (getJsonField(
                                                              restaurantlistItem,
                                                              r'''$.rating''',
                                                            ) !=
                                                            null)
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -0.98, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          2.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child:
                                                                  RatingBarIndicator(
                                                                itemBuilder:
                                                                    (context,
                                                                            index) =>
                                                                        Icon(
                                                                  Icons
                                                                      .star_rounded,
                                                                  color: Color(
                                                                      0xFFD2C839),
                                                                ),
                                                                direction: Axis
                                                                    .horizontal,
                                                                rating: functions
                                                                    .converttodouble(
                                                                        getJsonField(
                                                                  restaurantlistItem,
                                                                  r'''$.rating''',
                                                                ))!,
                                                                unratedColor: Color(
                                                                    0xFF9E9E9E),
                                                                itemCount: 5,
                                                                itemSize: 15.0,
                                                              ),
                                                            ),
                                                          ),
                                                        if (valueOrDefault<
                                                            bool>(
                                                          getJsonField(
                                                                restaurantlistItem,
                                                                r'''$.price_level''',
                                                              ) !=
                                                              null,
                                                          true,
                                                        ))
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -0.98, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          2.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child:
                                                                  RatingBarIndicator(
                                                                itemBuilder:
                                                                    (context,
                                                                            index) =>
                                                                        Icon(
                                                                  Icons
                                                                      .attach_money,
                                                                  color: Color(
                                                                      0xFF55D239),
                                                                ),
                                                                direction: Axis
                                                                    .horizontal,
                                                                rating: functions
                                                                    .converttodouble(
                                                                        getJsonField(
                                                                  restaurantlistItem,
                                                                  r'''$.price_level''',
                                                                ))!,
                                                                unratedColor: Color(
                                                                    0xFF9E9E9E),
                                                                itemCount: 5,
                                                                itemSize: 15.0,
                                                              ),
                                                            ),
                                                          ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            if (getJsonField(
                                                                  columnRestaurantDetailsResponse
                                                                      .jsonBody,
                                                                  r'''$..wheelchair_accessible_entrance''',
                                                                ) ==
                                                                true)
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Icon(
                                                                  Icons
                                                                      .wheelchair_pickup_sharp,
                                                                  color: Colors
                                                                      .black,
                                                                  size: 24.0,
                                                                ),
                                                              ),
                                                            StreamBuilder<
                                                                List<
                                                                    RestaurantRecord>>(
                                                              stream:
                                                                  queryRestaurantRecord(
                                                                queryBuilder: (restaurantRecord) =>
                                                                    restaurantRecord.where(
                                                                        'PlaceID',
                                                                        isEqualTo:
                                                                            getJsonField(
                                                                          restaurantlistItem,
                                                                          r'''$.place_id''',
                                                                        ).toString()),
                                                                singleRecord:
                                                                    true,
                                                              ),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          50.0,
                                                                      height:
                                                                          50.0,
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<RestaurantRecord>
                                                                    rowRestaurantRecordList =
                                                                    snapshot
                                                                        .data!;
                                                                // Return an empty Container when the item does not exist.
                                                                if (snapshot
                                                                    .data!
                                                                    .isEmpty) {
                                                                  return Container();
                                                                }
                                                                final rowRestaurantRecord =
                                                                    rowRestaurantRecordList
                                                                            .isNotEmpty
                                                                        ? rowRestaurantRecordList
                                                                            .first
                                                                        : null;
                                                                return Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    if (rowRestaurantRecord!
                                                                            .blindFriendlyTag! >=
                                                                        5)
                                                                      Icon(
                                                                        Icons
                                                                            .remove_red_eye,
                                                                        color: Colors
                                                                            .black,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                    if (rowRestaurantRecord!
                                                                            .signLanguage! >=
                                                                        5)
                                                                      FaIcon(
                                                                        FontAwesomeIcons
                                                                            .signLanguage,
                                                                        color: Colors
                                                                            .black,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                  ],
                                                                );
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

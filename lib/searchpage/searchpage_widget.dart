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
import 'searchpage_model.dart';
export 'searchpage_model.dart';

class SearchpageWidget extends StatefulWidget {
  const SearchpageWidget({
    Key? key,
    int? isincollection,
  })  : this.isincollection = isincollection ?? 0,
        super(key: key);

  final int isincollection;

  @override
  _SearchpageWidgetState createState() => _SearchpageWidgetState();
}

class _SearchpageWidgetState extends State<SearchpageWidget> {
  late SearchpageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchpageModel());

    _model.searchfieldController ??= TextEditingController();
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
              context.pop();
            },
          ),
          title: Text(
            'Search',
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
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                height: 70.0,
                decoration: BoxDecoration(
                  color: Color(0xFF4B39EF),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5.0,
                      color: Color(0x27000000),
                      offset: Offset(0.0, 3.0),
                    )
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 12.0, 16.0, 0.0),
                                child: TextFormField(
                                  controller: _model.searchfieldController,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.searchfieldController',
                                    Duration(milliseconds: 0),
                                    () async {
                                      setState(() {
                                        _model.searchname =
                                            _model.searchfieldController.text;
                                      });
                                    },
                                  ),
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Search restaurant...',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: Color(0xFF57636C),
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: Color(0xFF14181B),
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  maxLines: null,
                                  validator: _model
                                      .searchfieldControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 10.0,
                                borderWidth: 1.0,
                                buttonSize: 50.0,
                                fillColor:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                                icon: Icon(
                                  Icons.search,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 30.0,
                                ),
                                onPressed: () async {
                                  var _shouldSetState = false;
                                  if (_model.searchname != '0') {
                                    _model.apiResult69k =
                                        await SearchPlaceCall.call(
                                      input: _model.searchname,
                                    );
                                    _shouldSetState = true;
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('You Entered'),
                                          content: Text(_model.searchname!),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                    if ((_model.apiResult69k?.succeeded ??
                                        true)) {
                                      if (getJsonField(
                                            (_model.apiResult69k?.jsonBody ??
                                                ''),
                                            r'''$.status''',
                                          ) ==
                                          'OK') {
                                        if (functions.checktype(getJsonField(
                                          (_model.apiResult69k?.jsonBody ?? ''),
                                          r'''$.candidates..types''',
                                        ))!) {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('Found'),
                                                content: Text(getJsonField(
                                                  (_model.apiResult69k
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.candidates..name''',
                                                ).toString()),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                          _model.success = true;
                                        } else {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('Error'),
                                                content:
                                                    Text('Not a restaurant'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                          _model.success = false;
                                        }

                                        if (_shouldSetState) setState(() {});
                                        return;
                                      } else {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text('Error'),
                                              content:
                                                  Text('Restaurant not found!'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('Ok'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                        _model.success = false;
                                        if (_shouldSetState) setState(() {});
                                        return;
                                      }
                                    } else {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('Error'),
                                            content: Text(
                                                'Restaurant Not Found/Invalid Input'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Ok'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                      _model.success = false;
                                      if (_shouldSetState) setState(() {});
                                      return;
                                    }
                                  } else {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('Error'),
                                          content: Text('No entry'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                    if (_shouldSetState) setState(() {});
                                    return;
                                  }

                                  if (_shouldSetState) setState(() {});
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (_model.success == true)
                Builder(
                  builder: (context) {
                    final restaurantlist = getJsonField(
                      (_model.apiResult69k?.jsonBody ?? ''),
                      r'''$.candidates''',
                    ).toList();
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: restaurantlist.length,
                      itemBuilder: (context, restaurantlistIndex) {
                        final restaurantlistItem =
                            restaurantlist[restaurantlistIndex];
                        return Align(
                          alignment: AlignmentDirectional(0.0, -0.9),
                          child: FutureBuilder<ApiCallResponse>(
                            future: RestaurantDetailsCall.call(
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
                                    child: CircularProgressIndicator(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                );
                              }
                              final containerRestaurantDetailsResponse =
                                  snapshot.data!;
                              return Container(
                                width: MediaQuery.of(context).size.width * 0.92,
                                height: 251.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x230E151B),
                                      offset: Offset(0.0, 2.0),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(12.0),
                                  shape: BoxShape.rectangle,
                                ),
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
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      );
                                    }
                                    int columnrestCount = snapshot.data!;
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: InkWell(
                                            onTap: () async {
                                              _model.isincollection =
                                                  columnrestCount;

                                              context.pushNamed(
                                                'restaurantpage',
                                                queryParams: {
                                                  'placeid': serializeParam(
                                                    getJsonField(
                                                      restaurantlistItem,
                                                      r'''$.place_id''',
                                                    ).toString(),
                                                    ParamType.String,
                                                  ),
                                                  'isincollection':
                                                      serializeParam(
                                                    columnrestCount,
                                                    ParamType.int,
                                                  ),
                                                  'name': serializeParam(
                                                    getJsonField(
                                                      restaurantlistItem,
                                                      r'''$.name''',
                                                    ).toString(),
                                                    ParamType.String,
                                                  ),
                                                  'rating': serializeParam(
                                                    getJsonField(
                                                      restaurantlistItem,
                                                      r'''$.rating''',
                                                    ),
                                                    ParamType.double,
                                                  ),
                                                  'wheelchairentrance':
                                                      serializeParam(
                                                    getJsonField(
                                                      containerRestaurantDetailsResponse
                                                          .jsonBody,
                                                      r'''$..wheelchair_accessible_entrance''',
                                                    ),
                                                    ParamType.bool,
                                                  ),
                                                  'imageurl': serializeParam(
                                                    functions
                                                        .getimg(getJsonField(
                                                      restaurantlistItem,
                                                      r'''$..photo_reference''',
                                                    ).toString()),
                                                    ParamType.String,
                                                  ),
                                                  'pricelevel': serializeParam(
                                                    getJsonField(
                                                      restaurantlistItem,
                                                      r'''$.price_level''',
                                                    ),
                                                    ParamType.int,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            child: SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(4.0, 4.0,
                                                                4.0, 4.0),
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
                                                            width: 400.0,
                                                            height: 150.0,
                                                            fit: BoxFit.contain,
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
                                                              restaurantlistItem,
                                                              r'''$.name''',
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
                                                              )),
                                                              unratedColor: Color(
                                                                  0xFF9E9E9E),
                                                              itemCount: 5,
                                                              itemSize: 15.0,
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
                                                              )),
                                                              unratedColor: Color(
                                                                  0xFF9E9E9E),
                                                              itemCount: 5,
                                                              itemSize: 15.0,
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
                                                                  containerRestaurantDetailsResponse
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
                                                                          r'''$.name''',
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
                                                                      FaIcon(
                                                                        FontAwesomeIcons
                                                                            .signLanguage,
                                                                        color: Colors
                                                                            .black,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                    if (rowRestaurantRecord!
                                                                            .signLanguage! >=
                                                                        5)
                                                                      Icon(
                                                                        Icons
                                                                            .remove_red_eye,
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
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}

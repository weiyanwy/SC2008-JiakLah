import '/auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'filterpage_model.dart';
export 'filterpage_model.dart';

class FilterpageWidget extends StatefulWidget {
  const FilterpageWidget({
    Key? key,
    bool? isrestaurantincollection,
    this.filters,
  })  : this.isrestaurantincollection = isrestaurantincollection ?? false,
        super(key: key);

  final bool isrestaurantincollection;
  final String? filters;

  @override
  _FilterpageWidgetState createState() => _FilterpageWidgetState();
}

class _FilterpageWidgetState extends State<FilterpageWidget> {
  late FilterpageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FilterpageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.pagefilter = widget.filters;
      });
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

    return StreamBuilder<List<RestaurantRecord>>(
      stream: queryRestaurantRecord(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: Image.network(
              '',
            ),
          );
        }
        List<RestaurantRecord> filterpageRestaurantRecordList = snapshot.data!;
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
                    context.goNamed('Login');
                  },
                ),
              ),
              title: Visibility(
                visible: FFAppState().Authenticaed,
                child: AuthUserStreamWidget(
                  builder: (context) => StreamBuilder<List<UsersRecord>>(
                    stream: queryUsersRecord(
                      queryBuilder: (usersRecord) => usersRecord.where('email',
                          isEqualTo: currentUserEmail),
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
                        'Hi,${currentUserDisplayName}',
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                      );
                    },
                  ),
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
            body: Column(
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
                        child: Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
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
                                    _model.dropDownValue ??= widget.filters,
                                  ),
                                  options: [
                                    'Wheel Chair Friendly',
                                    'Blind Friendly',
                                    'Deaf Friendly',
                                    'None'
                                  ],
                                  optionLabels: [
                                    'Wheel Chair Friendly',
                                    'Blind Friendly',
                                    'Deaf Friendly',
                                    'None'
                                  ],
                                  onChanged: (val) async {
                                    setState(() => _model.dropDownValue = val);
                                    setState(() {
                                      _model.pagefilter = _model.dropDownValue;
                                    });
                                    if (_model.pagefilter == 'None') {
                                      context.pushNamed('HomePage');

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
                                  hintText: 'Filters',
                                  searchHintText: '',
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
                                  disabled: false,
                                  isSearchable: false,
                                ),
                                FFButtonWidget(
                                  onPressed: () async {
                                    context.goNamed(
                                      'searchpage',
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                          duration: Duration(milliseconds: 0),
                                        ),
                                      },
                                    );
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
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Builder(
                    builder: (context) {
                      final restaurantlist = filterpageRestaurantRecordList
                          .where((e) => () {
                                if (_model.pagefilter ==
                                    'Wheel Chair Friendly') {
                                  return ((e.wheelChairAccessbileEntrance ==
                                          true) ||
                                      (e.wheelChairTag! >= 5));
                                } else if (_model.pagefilter ==
                                    'Blind Friendly') {
                                  return (e.blindFriendlyTag! >= 5);
                                } else {
                                  return (e.signLanguage! >= 5);
                                }
                              }())
                          .toList();
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
                            height: 251.2,
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
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4.0, 4.0, 4.0, 4.0),
                                        child: InkWell(
                                          onTap: () async {
                                            context.pushNamed(
                                              'restaurantpage',
                                              queryParams: {
                                                'placeid': serializeParam(
                                                  restaurantlistItem.placeID,
                                                  ParamType.String,
                                                ),
                                                'rating': serializeParam(
                                                  restaurantlistItem.rating,
                                                  ParamType.double,
                                                ),
                                                'isincollection':
                                                    serializeParam(
                                                  1,
                                                  ParamType.int,
                                                ),
                                                'name': serializeParam(
                                                  restaurantlistItem.name,
                                                  ParamType.String,
                                                ),
                                                'wheelchairentrance':
                                                    serializeParam(
                                                  restaurantlistItem
                                                      .wheelChairAccessbileEntrance,
                                                  ParamType.bool,
                                                ),
                                                'imageurl': serializeParam(
                                                  restaurantlistItem.imageref,
                                                  ParamType.String,
                                                ),
                                                'pricelevel': serializeParam(
                                                  restaurantlistItem.price,
                                                  ParamType.int,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                child: Image.network(
                                                  restaurantlistItem.imageref!,
                                                  width: 425.0,
                                                  height: 150.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 12.0, 0.0, 0.0),
                                                child: Text(
                                                  restaurantlistItem.name!,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            Color(0xFF14181B),
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                ),
                                              ),
                                              if (restaurantlistItem.rating !=
                                                  0.0)
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -0.98, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(2.0, 0.0,
                                                                0.0, 0.0),
                                                    child: FutureBuilder<
                                                        ApiCallResponse>(
                                                      future:
                                                          RestaurantDetailsCall
                                                              .call(
                                                        placeid:
                                                            restaurantlistItem
                                                                .placeID,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
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
                                                        final ratingBarRestaurantDetailsResponse =
                                                            snapshot.data!;
                                                        return RatingBarIndicator(
                                                          itemBuilder: (context,
                                                                  index) =>
                                                              Icon(
                                                            Icons.star_rounded,
                                                            color: Color(
                                                                0xFFD2C839),
                                                          ),
                                                          direction:
                                                              Axis.horizontal,
                                                          rating: getJsonField(
                                                            ratingBarRestaurantDetailsResponse
                                                                .jsonBody,
                                                            r'''$.result.rating''',
                                                          ),
                                                          unratedColor:
                                                              Color(0xFF9E9E9E),
                                                          itemCount: 5,
                                                          itemSize: 15.0,
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              if (restaurantlistItem.price !=
                                                  null)
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -0.98, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(2.0, 0.0,
                                                                0.0, 0.0),
                                                    child: RatingBarIndicator(
                                                      itemBuilder:
                                                          (context, index) =>
                                                              Icon(
                                                        Icons.attach_money,
                                                        color:
                                                            Color(0xFF55D239),
                                                      ),
                                                      direction:
                                                          Axis.horizontal,
                                                      rating: restaurantlistItem
                                                          .price!
                                                          .toDouble(),
                                                      unratedColor:
                                                          Color(0xFF9E9E9E),
                                                      itemCount: 5,
                                                      itemSize: 15.0,
                                                    ),
                                                  ),
                                                ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  if ((restaurantlistItem
                                                              .wheelChairAccessbileEntrance ==
                                                          true) ||
                                                      (restaurantlistItem
                                                              .wheelChairTag! >=
                                                          5))
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
                                                        color: Colors.black,
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                  if (restaurantlistItem
                                                          .blindFriendlyTag! >=
                                                      5)
                                                    Icon(
                                                      Icons.remove_red_eye,
                                                      color: Colors.black,
                                                      size: 24.0,
                                                    ),
                                                  if (restaurantlistItem
                                                          .signLanguage! >=
                                                      5)
                                                    FaIcon(
                                                      FontAwesomeIcons
                                                          .signLanguage,
                                                      color: Colors.black,
                                                      size: 24.0,
                                                    ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
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
            ),
          ),
        );
      },
    );
  }
}

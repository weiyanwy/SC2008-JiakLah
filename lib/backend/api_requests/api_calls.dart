import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetRestaurantsCall {
  static Future<ApiCallResponse> call({
    List<int>? dfList,
    List<String>? asdfList,
  }) {
    final df = _serializeList(dfList);
    final asdf = _serializeList(asdfList);

    return ApiManager.instance.makeApiCall(
      callName: 'GetRestaurants',
      apiUrl:
          'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=1.3521,103.8198&radius=40000&type=restaurant&type=cafe&keyword=\"Singapore\"&keyword=\"OPERATIONAL\"&key=AIzaSyBYBCaEyoxyppr62mEtY4MS2VF4OXuJqjw',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic results(dynamic response) => getJsonField(
        response,
        r'''$.results''',
        true,
      );
  static dynamic namearray(dynamic response) => getJsonField(
        response,
        r'''$..name''',
        true,
      );
  static dynamic placeidarray(dynamic response) => getJsonField(
        response,
        r'''$..place_id''',
        true,
      );
  static dynamic photoref(dynamic response) => getJsonField(
        response,
        r'''$.results[:].photos[:].photo_reference''',
        true,
      );
}

class RestaurantDetailsCall {
  static Future<ApiCallResponse> call({
    String? placeid = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'RestaurantDetails',
      apiUrl:
          'https://maps.googleapis.com/maps/api/place/details/json?ChIJU4V3LzwX2jERQLLEY4Ccm0A&key=AIzaSyBYBCaEyoxyppr62mEtY4MS2VF4OXuJqjw&',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'placeid': placeid,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class SearchPlaceCall {
  static Future<ApiCallResponse> call({
    String? input = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'SearchPlace',
      apiUrl:
          'https://maps.googleapis.com/maps/api/place/findplacefromtext/json?fields=formatted_address%2Cphotos%2Cplace_id%2Crating%2Cprice_level%2Cname%2Ctypes&inputtype=textquery&locationbais=circle%3A50000%2C1.3521%2C103.8198&&key=AIzaSyBYBCaEyoxyppr62mEtY4MS2VF4OXuJqjw&',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'input': input,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class SerpapiCall {
  static Future<ApiCallResponse> call({
    String? q = 'restaurant',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'serpapi',
      apiUrl:
          'https://serpapi.com/search.json?q=Apple&tbm=isch&ijn=0&engine=google&q=+Restaurant&location=Singapore&google_domain=google.com.sg&gl=sg&hl=en&key=ebec9abfc07af1733b18c5565f8a76a31aac6811963c7946e3249b7801b95ec8&',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'q': q,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic url(dynamic response) => getJsonField(
        response,
        r'''$.images_results[0].thumbnail''',
      );
}

class RestaurantimgCall {
  static Future<ApiCallResponse> call({
    String? photoReference = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'restaurantimg',
      apiUrl:
          'https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&maxheight=150&key=AIzaSyBYBCaEyoxyppr62mEtY4MS2VF4OXuJqjw&',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'photo_reference': photoReference,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}

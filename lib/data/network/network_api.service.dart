import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:forkify/data/app_exceptions.dart';
import 'package:forkify/data/network/base_api.service.dart';
import 'package:forkify/environment.dart';
import 'package:http/http.dart' as http;

class ApiServices extends BaseApiService {
  @override
  Future<dynamic> getApi(String url,
      {Map<String, dynamic>? pathParams,
      Map<String, dynamic>? queryParams}) async {
    final User? currentUser = FirebaseAuth.instance.currentUser;
    final String? idToken = await currentUser?.getIdToken();

    if (pathParams != null) {
      pathParams.forEach((String key, dynamic value) {
        url = url.replaceAll('{$key}', value.toString());
      });
    }

    if (queryParams != null) {
      final String queryString = Uri(queryParameters: queryParams).query;
      if (queryString.isNotEmpty) {
        url = '$url?$queryString';
      }
    }

    final Map<String, String> headers = <String, String>{
      'Accept': 'application/json'
    };

    if (idToken != null) {
      headers[HttpHeaders.authorizationHeader] = idToken;
    }
    dynamic responseJson;

    try {
      final http.Response response = await http
          .get(Uri.parse('${Environment.restApiUrl}$url'), headers: headers)
          .timeout(
            const Duration(seconds: 20),
          );
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  @override
  Future<dynamic> postApi(String url, Map<String, dynamic> body) async {
    final User? currentUser = FirebaseAuth.instance.currentUser;
    final String? idToken = await currentUser?.getIdToken();

    final Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    if (idToken != null) {
      headers[HttpHeaders.authorizationHeader] = idToken;
    }

    try {
      await http
          .post(Uri.parse('${Environment.restApiUrl}$url'),
              body: json.encode(body), headers: headers)
          .timeout(const Duration(seconds: 30));
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    } catch (e) {
      throw Exception();
    }
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
      case 400:
        if (response.bodyBytes.isNotEmpty) {
          final String decoded = utf8.decode(response.bodyBytes);
          dynamic jsonResponse = jsonDecode(decoded);
          return jsonResponse;
        } else {
          return null;
        }

      default:
        throw FetchDataException(
            'Error while Communication ${response.statusCode}');
    }
  }
}

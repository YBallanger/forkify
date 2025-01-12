import 'dart:convert';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:forkify/data/app_exceptions.dart';
import 'package:forkify/data/network/base_api.service.dart';
import 'package:http/http.dart' as http;

class ApiServices extends BaseApiService {
  @override
  Future getApi(String url,
      {Map<String, dynamic>? pathParams,
      Map<String, dynamic>? queryParams}) async {
    if (pathParams != null) {
      pathParams.forEach((key, value) {
        url = url.replaceAll('{$key}', value.toString());
      });
    }

    if (queryParams != null) {
      final queryString = Uri(queryParameters: queryParams).query;
      if (queryString.isNotEmpty) {
        url = '$url?$queryString';
      }
    }

    final headers = {"Accept": "application/json"};
    dynamic responseJson;

    try {
      final response = await http.get(Uri.parse(url), headers: headers).timeout(
            const Duration(seconds: 20),
          );
      responseJson = returnResponse(response);
      debugPrint(responseJson.toString());
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  @override
  Future<dynamic> postApi(String url, Map<String, dynamic> body) async {
    dynamic responseJson;
    final User? currentUser = FirebaseAuth.instance.currentUser;
    final String? idToken = await currentUser?.getIdToken();

    final headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    if (idToken != null) {
      headers[HttpHeaders.authorizationHeader] = idToken;
    }

    try {
      final response = await http
          .post(Uri.parse(url), body: json.encode(body), headers: headers)
          .timeout(const Duration(seconds: 30));
      return responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    } catch (e) {
      debugPrint('error$e');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
      case 400:
        if(response.body.isNotEmpty) {
          var jsonResponse = jsonDecode(response.body);
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

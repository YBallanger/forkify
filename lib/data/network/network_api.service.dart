import 'dart:convert';
import 'dart:io';
import 'package:forkify/data/app_exceptions.dart';
import 'package:forkify/data/network/base_api.service.dart';
import 'package:http/http.dart' as http;

class ApiServices extends BaseApiService {
  @override
  Future get(String url) async {
    dynamic jsonData;
    try {
      var response = await http.get(Uri.parse(url)).timeout(
          const Duration(seconds: 10));
      jsonData = jsonResponse(response);
    } on SocketException {
      throw InternetException('No Internet');
    } on RequestTimeOut {
      throw RequestTimeOut('Request Timeout');
    }
    return jsonData;
  }

  dynamic jsonResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 400:
        var jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      default:
        throw FetchDataException(
            'Error while Communication ${response.statusCode}');
    }
  }


}
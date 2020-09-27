import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'app_exceptions.dart';

typedef CustomResponse = Function(Map<String, dynamic> response, String error);

/// http methods are written here - get,post
/// here in this project we are using only post
class RestAPI {
  ///get method

  Future<T> get<T>(String url, {params}) async {
    var params1 = params;
    print('Api Get, url $url');
    T responseJson;
    print('Params----- $params1');

    Uri uri = Uri.parse(url);

    uri.replace(queryParameters: params1);
    try {
      Response response = await http.get(url, headers: {
        "Accept": "application/json",
        'Content-type': 'application/json',
      });

      print("RESPONSE  :: ${response.body}");
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api get recieved!');
    return responseJson;
  }

  ///post method
  Future<T> post<T>(String url, {params}) async {
    print('Api Post, url $url  and ${json.encode(params)}');
    T responseJson;
    try {
      final response = await http
          .post(url, body: utf8.encode(json.encode(params)), headers: {
        "Accept": "application/json",
        'Content-type': 'application/json',
      });
      print("POST RESPONSE : ${response.statusCode} ${response.body}");
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api post.');
    return responseJson;
  }
}

dynamic _returnResponse<T>(T response) {
  print('respose-------------- $T');
  if (response is http.Response) {
    print(response.body);
    print('statusCode------------- ${response.statusCode}');
    switch (response.statusCode) {
      case 200:
        var responseJson = response.body;
        print("responseJson : $responseJson");

        return responseJson;
      case 404:
      case 400:
        throw BadRequestException(response.body);
      case 401:
      case 403:
        throw UnauthorisedException(response.body);
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  } else if (response is Map<String, dynamic>) {
    print("MAP :::");
    print(response);
    switch (response["code"]) {
      case 200:
        var responseJson = response["response"];
        print("responseJson : $responseJson");
        return responseJson;
      case 404:
      case 400:
        throw BadRequestException(response["response"]);
      case 401:
      case 403:
        throw UnauthorisedException(response["response"]);
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response["code"]}');
    }
  }
}

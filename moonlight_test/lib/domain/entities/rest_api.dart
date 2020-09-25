import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:moonlight_test/config/server_addresses.dart';

import 'package:path/path.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_exceptions.dart';


typedef CustomResponse = Function(Map<String, dynamic> response, String error);

class RestAPI {


  Future checkInternetConnection() async {
    try {
      final result =
      await InternetAddress.lookup(ServerAddresses.baseUrl);

      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
      }
    } on SocketException catch (_) {
      print('not connected');
    }
  }

  Future<T> get<T>(String url, {params} /*[String t]*/) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('accessToken');
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
        "Authorization": "Bearer $token"
      });

      print("token  :: $token");
      print("RESPONSE  :: ${response.body}");
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api get recieved!');
    return responseJson;
  }

  Future<T> post<T>(String url, {params}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('accessToken');
    print('Api Post, url $url  and ${json.encode(params)}');
    T responseJson;
    try {
      final response =
      await http.post(url, body: utf8.encode(json.encode(params)), headers: {
        "Accept": "application/json",
        'Content-type': 'application/json',
        "Authorization": "Bearer $token"
      });
      print("POST RESPONSE : ${response.statusCode} ${response.body}");
      responseJson = _returnResponse(response);
//      throw Exception('Testing');
//      print("RESPONSEJSON : $responseJson");
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api post.');
    return responseJson;
  }

  Future<dynamic> put(String url, {params}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('accessToken');
    print('Api Put, url $url');
    var responseJson;

    try {
      final response = await http.put(url, body: json.encode(params), headers: {
        "Accept": "application/json",
        'Content-type': 'application/json',
        "Authorization": "Bearer $token"
      });
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api put.');
//    print(responseJson.toString());
    return responseJson;
  }

  Future<dynamic> delete(String url) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('accessToken');
    print('Api delete, url $url');
    var apiResponse;
    try {
      final response = await http.delete(url, headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      });
      apiResponse = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api delete.');
    return apiResponse;
  }

  Future<T> multiPart<T>(String url, {Map<String, dynamic> params}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('accessToken');
    print('Api multipart, url $url $params');
    T responseJson;
    if (token != null) {
      try {
        print("MultipartFile call--------------");
        var uri = Uri.parse(url);
        Map<String, String> headers = {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
          "Content-Type": "multipart/form-data"
        };
        http.MultipartRequest request = new http.MultipartRequest("POST", uri);
        request.headers.addAll(headers);
        request.fields.addAll(params["fields"]);
        if (params['file'] != null) {
          Map<String, dynamic> _file = params['file'];
          http.MultipartFile multipartFile;
          _file.entries.forEach((element) async {
            if (element.value != null) {
              var stream = new http.ByteStream(
                  Stream.castFrom(element.value?.openRead()));
              var length = await (element.value as File)?.length();
              multipartFile = new http.MultipartFile(
                  element.key, stream, length,
                  filename: basename(element.value?.path));
              print("VALUE : $length ${element.key}, ${element.value}");
              request.files.add(multipartFile);
            }
          });
          /*  for (var entry in _file.entries) {
            var stream = new http.ByteStream(Stream.castFrom(entry.value?.openRead()));
            var length = await (entry.value as File)?.length();
            multipartFile =
                new http.MultipartFile(entry.key, stream, length, filename: basename(entry.value?.path));
            print("VALUE : $length ${entry.key}, ${entry.value}");
            request.files.add(multipartFile);
          }*/
        }
        var streamResponse = await request.send();
        //Response response = jsonDecode(await streamResponse.stream.transform(utf8.decoder).join());

        var onData = await streamResponse.stream.transform(utf8.decoder).first;
        print("dynamicCallApi RESPONSE : $onData");
        responseJson = onData as T;
        return responseJson;
      } on SocketException {
        print('No Internet');
        throw FetchDataException('No Internet connection');
      }
    } else {
      throw Exception('Your Token has Expired!.Please signin again.');
    }
  }

  Future<T> multiPart2<T>(String url, {Map<String, dynamic> params}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('accessToken');
    print('Api multipart, url $url $params');
    T responseJson;
    if (token != null) {
      try {
        print("MultipartFile call--------------");
        var uri = Uri.parse(url);
        Map<String, String> headers = {
          'Accept': 'application/json',
          'Content-Type': 'multipart/form-data',
          //   'Content-type': 'application/json',
          'Authorization': 'Bearer $token',
        };
        http.MultipartRequest request = new http.MultipartRequest("POST", uri);
        request.headers.addAll(headers);
        request.fields.addAll(params["fields"]);
        if (params['file'] != null) {
          Map<String, dynamic> _file = params['file'];
          List test= params['file']['shopimages'];
          //http.MultipartFile multipartFile;

          for(File element in test){

            String fileName = element.path.split("/").last;
            var stream = new http.ByteStream(Stream.castFrom(element.openRead()));
            // get file length
            var length = await element.length(); //imageFile is your image file
            // multipart that takes file
            var multipartFileSign = new http.MultipartFile('shopimages[]', stream, length, filename: fileName);
            request.files.add(multipartFileSign);





            /* for (Asset asset in _file) {
              ByteData byteData = await asset.getByteData();
              List<int> fileData = byteData.buffer.asUint8List();

              MultipartFile multipartFile = MultipartFile.fromBytes(
                'ff',
                fileData,
                filename: 'serv4uPhoto.jpg',
                contentType: MediaType("image", "jpg"),
              );
              print("VALUE :: ${multipartFile.contentType} ${multipartFile.field} */


            /*  if (element != null) {
              var stream = new http.ByteStream(
                  Stream.castFrom(element?.openRead()));
              var length = await (element as File)?.length();
              multipartFile = new http.MultipartFile(
                  'shopimages', stream, length,
                  filename: basename(element.path));
              print("VALUE : $length , ${element}");
              request.files.add(multipartFile);
              print(request.files);
            }*/


          }
          if (request.files is List) {
            print("Yes");
          }

          /* _file.entries.forEach((element) async {

            if (element.value != null) {
              var stream = new http.ByteStream(
                  Stream.castFrom(element.value?.openRead()));
              var length = await (element.value as File)?.length();
              multipartFile = new http.MultipartFile(
                  element.key, stream, length,
                  filename: basename(element.value?.path));
              print("VALUE : $length ${element.key}, ${element.value}");
              request.files.add(multipartFile);
              print(request.files);
            }

          });*/
          /*  for (var entry in _file.entries) {
            var stream = new http.ByteStream(Stream.castFrom(entry.value?.openRead()));
            var length = await (entry.value as File)?.length();
            multipartFile =
                new http.MultipartFile(entry.key, stream, length, filename: basename(entry.value?.path));
            print("VALUE : $length ${entry.key}, ${entry.value}");
            request.files.add(multipartFile);
          }*/
        }
        var streamResponse = await request.send();
        // var response = jsonDecode(await streamResponse.stream.transform(utf8.decoder).join());

        //var onData = await streamResponse.stream.transform(utf8.decoder).first;
        print("dynamicCallApi RESPONSE : ${streamResponse.statusCode}");
        streamResponse.stream.transform(utf8.decoder).listen((value) {
          print('value--------------');
          print(value);
        });
        //responseJson = onData as T;
        return responseJson;
      } on SocketException {
        print('No Internet');
        throw FetchDataException('No Internet connection');
      }
    } else {
      throw Exception('Your Token has Expired!.Please signin again.');
    }
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

Future getData(String url, {String authorization}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = prefs.getString('accessToken');
  var data;
  try {
    http.Response response = await http.get(Uri.encodeFull(url), headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    });
//      GlobalWidgets().printMsg(json.decode(response.body));
    data = json.decode(response.body); /*JSON.decode(response.body);*/
  } on TimeoutException catch (error) {
    print('TimeoutException : $error');
  } on SocketException catch (error) {
    print('SocketException : $error');
  } on HttpException catch (error) {
    print('HttpException : $error');
  }
  return data;
}

///[MEDIA] get full size image without crop
///[THUMB] get cropped size image
enum ImageConversion { MEDIA, THUMB }
enum ImageFolder { PROFILE, DOCUMENT, TOL }



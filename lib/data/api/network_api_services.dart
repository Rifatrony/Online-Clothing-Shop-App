// ignore_for_file: file_names

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cloth_shop_app/data/api/base_api_services.dart';
import 'package:cloth_shop_app/data/error/AppException.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future getApi(String url) async {
    dynamic responseJson;
    var uri = Uri.parse(url);
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('access_token');

    try {

      final response = await http.get(uri, headers: {
        'Authorization': 'Bearer $token'
      }).timeout(const Duration(seconds: 20));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No internet connection", uri.toString());
    } on TimeoutException {
      APiNotRespondingException("Api not Responing", uri.toString());
    }

    return responseJson;
  }

  @override
  Future getApiWithoutHeader(String url) async {
    dynamic responseJson;
    var uri = Uri.parse(url);
    try {
      final response = await http.get(uri,).timeout(
        const Duration(seconds: 20),
      );
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No internet connection", uri.toString());
    } on TimeoutException {
      APiNotRespondingException("Api not Responing", uri.toString());
    }

    return responseJson;
  }

  @override
  Future loginApi(data, String url) async {
    dynamic responseJson;
    var uri = Uri.parse(url);

    try {
      final response = await http
          .post(
        uri,
        body: data,
      )
          .timeout(const Duration(seconds: 20));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No internet connection", uri.toString());
    } on TimeoutException {
      APiNotRespondingException("Api not Responding", uri.toString());
    }

    return responseJson;
  }

  @override
  Future postApi(data, String url) async {
    dynamic responseJson;
    var uri = Uri.parse(url);

    try {
      var token = "await UserPrefernceController().getAccessToken()";
      final response = await http.post(
        uri,
        body: data,
        headers: {
          'Authorization': 'Bearer $token',
        },
      ).timeout(const Duration(seconds: 20));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No internet connection", uri.toString());
    } on TimeoutException {
      APiNotRespondingException("Api not Responding", uri.toString());
    }

    return responseJson;
  }



  @override
  Future postApiWithRawData(data, String url) async {
    dynamic responseJson;
    var uri = Uri.parse(url);

    try {
      var token = "await UserPrefernceController().getAccessToken()";
      final response = await http.post(uri, body: json.encode(data), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      }).timeout(const Duration(seconds: 20));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No internet connection", uri.toString());
    } on TimeoutException {
      APiNotRespondingException("Api not Responing", uri.toString());
    }

    return responseJson;
  }


  @override
  Future putApi(data, String url) async {
    dynamic responseJson;
    var uri = Uri.parse(url);

    try {
      var token = await "UserPrefernceController().getAccessToken()";
      final response = await http.put(
        uri,
        body: data,
        headers: {
          'Authorization': 'Bearer $token',
        },
      ).timeout(
        const Duration(seconds: 20),
      );
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No internet connection", uri.toString());
    } on TimeoutException {
      APiNotRespondingException("Api not Responing", uri.toString());
    }

    return responseJson;
  }

  @override
  Future deleteApi(String url) async {
    dynamic responseJson;
    var uri = Uri.parse(url);

    try {
      var token = "await UserPrefernceController().getAccessToken()";
      final response = await http.delete(
        uri,
        headers: {
          'Authorization': 'Bearer $token',
        },
      ).timeout(
        const Duration(seconds: 20),
      );
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No internet connection", uri.toString());
    } on TimeoutException {
      APiNotRespondingException("Api not Responing", uri.toString());
    }

    return responseJson;
  }

  returnResponse(http.Response response) {
    if (kDebugMode) {
      print(response.body);
    }
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body);
        return responseJson;

      case 400:
        throw BadRequestException(
            json.decode(response.body), response.request!.url.toString());

      case 401:
      case 403:
        throw UnAuthorizedException(
            json.decode(response.body), response.request!.url.toString());

      case 500:
        throw FetchDataException(
            'Error occured with status code : ${response.statusCode}',
            response.request!.url.toString());
      default:
    }
  }
}

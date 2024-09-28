import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:getx_mvvm/data/app_exceptions.dart';
import 'package:getx_mvvm/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

import '../../resource/app_url/app_url.dart';

class NetworkApiServices extends BaseApiServices{

  @override
  Future<dynamic>getApi(String url)async{
    if(kDebugMode){
      print(url);
    }

    dynamic responseJson;
    try{
      final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson= returnResponse(response);

    }on SocketException{
      throw InternetExceptions("");
    }on TimeoutException{
      throw RequestTimeOutExceptions("");

    }
    if(kDebugMode){
      print(responseJson);

    }

    return responseJson;
  }

  @override
  Future<dynamic>postApi(var data,String url)async{
    if(kDebugMode){
      print(url);
      print(data);
    }
    dynamic responseJson;
    var _headers={
      "Content-Type": "application/json",
      'x-API-Key': "${AppUrl.apiKey}"

    };
    try{
      final response = await http.post(Uri.parse(url),body: jsonEncode(data),headers: _headers).timeout(const Duration(seconds: 10));
      responseJson= returnResponse(response);

    }on SocketException{
      throw InternetExceptions("");
    }on TimeoutException{
      throw RequestTimeOutExceptions("");

    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response){

    switch(response.statusCode){
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw InvalidUrlExceptions();
      default:
        throw FetchDataExceptions("Error occured while communicate with server"+ response.statusCode.toString());
    }

  }




}
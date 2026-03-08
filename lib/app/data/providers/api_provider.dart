import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:e_librairie_front/app/config/env.dart';
import 'package:e_librairie_front/app/core/api/client.dart';
import 'package:e_librairie_front/app/core/api/exception.dart';
import 'package:http/http.dart' as http;

abstract class ApiProvider {
  
  static Future<dynamic> get({bool auth=true, required String route}) async {
    try{
      var response = await http.get(Uri.parse(Env.apiUrl + route), headers: AppClient.headers(auth: auth)).timeout(Duration(seconds: 120));
      return AppClient.processResponse(response);
    }on SocketException{
      throw FecthDataException('Pas de d\'internet', '');
    }on TimeoutException{
      throw ApiNotRespondingException('Pas de reponse');
    }
  }

  static Future<dynamic> post({bool auth=true, required String route, required Map<String, dynamic> data}) async {
    try{
      var response = await http.post(Uri.parse(Env.apiUrl + route), headers: AppClient.headers(auth: auth), body: jsonEncode(data)).timeout(Duration(seconds: 120));
      return AppClient.processResponse(response);
    }on ApiException{
       throw FecthDataException('Pas de d\'internet', '');
    }on TimeoutException{
      throw ApiNotRespondingException('Pas de reponse');
    }
  }

  static Future<dynamic> put({bool auth=true, required String route, required Map<String, dynamic> data}) async {
    try{
      var response = await http.put(Uri.parse(Env.apiUrl + route), headers: AppClient.headers(auth: auth), body: jsonEncode(data)).timeout(Duration(seconds: 120));
      return AppClient.processResponse(response);
    }on ApiException{
       throw FecthDataException('Pas de d\'internet', '');
    }on TimeoutException{
      throw ApiNotRespondingException('Pas de reponse');
    }
  }

  static Future<dynamic> delete({bool auth=true, required String route}) async {
    try{
      var response = await http.delete(Uri.parse(Env.apiUrl + route), headers: AppClient.headers(auth: auth)).timeout(Duration(seconds: 120));
      return AppClient.processResponse(response);
    }on SocketException{
      throw FecthDataException('Pas de d\'internet', '');
    }on TimeoutException{
      throw ApiNotRespondingException('Pas de reponse');
    }
  }
}
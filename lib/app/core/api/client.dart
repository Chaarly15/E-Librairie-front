import 'dart:convert';

import 'package:e_librairie_front/app/core/api/exception.dart';
import 'package:get/utils.dart';
import 'package:http/http.dart' as http;

class AppClient{

  static Map<String, String> headers({bool auth=false}){

    String? lang = Get.locale?.languageCode;
    String? token = 'Token.token';

    Map<String, String> headerData = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'accept-language': lang?? 'Fr'
    };

    if(auth){
      headerData['Authorization'] = 'Bearer $token';
    }

    return headerData;
  }

  static dynamic processResponse(http.Response response){

    dynamic decodeData = jsonDecode(utf8.decode(response.bodyBytes));

    switch(response.statusCode){
      case 200 || 201: 
        return decodeData;
      case 500: 
        return 'Ereur de serveur';
      default : 
        print(decodeData['message']);
        throw ApiException(decodeData['message']);
    }
  }
  
}
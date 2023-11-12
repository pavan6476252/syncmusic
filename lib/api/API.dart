import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class API {
  static Future<Response> getRequest({required String url}) async {
    Response response = await http.get(Uri.parse(url));
    debugPrint(response.statusCode.toString());
    debugPrint("[GET] $url");
    debugPrint("REsposne :  + ${await jsonDecode(response.body)}");
    return response;
  }
}

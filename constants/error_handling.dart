import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:amazon_shop_on/constants/utils.dart';
import 'dart:convert';
void httpErrorHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}){
  switch(response.statusCode){
    case 200:
    onSuccess();

      break;
      case 400:
      showSnackBar(context, jsonDecode(response.body)['msg']);
      break;
      case 500:
      showSnackBar(context, jsonDecode(response.body)['error']);
      break;
      default:
      showSnackBar(context, response.body);
      break;
  }
}
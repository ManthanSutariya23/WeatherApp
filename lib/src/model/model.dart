import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../config/api_endpoints.dart';


// postData ({
//   @required String? filename,
//   @required Map<String, dynamic>? data,
// }) async {
//   var dio = Dio();
//     final response = await dio.post(
//       APIEndpoints.baseURL + filename!,
//       data: data
//     );
//   if (response.statusCode == 200) {
//     return jsonDecode(response.toString());
//   }
//   else {
//     return null;
//   }
// }


// getData ({
//   @required String? filename,
//   @required Map<String, dynamic>? data,
// }) async {
//   var dio = Dio();
//     final response = await dio.post(
//       APIEndpoints.baseURL + filename!,
//       data: data
//     );
//   if (response.statusCode == 200) {
//     return jsonDecode(response.toString());
//   }
//   else {
//     return null;
//   }
// }


getData ({
  @required String? city,
}) async {
  var dio = Dio();
    final response = await dio.get(APIEndpoints.url(city),);
  if (response.statusCode == 200) {
    return jsonDecode(response.toString());
  }
  else {
    return null;
  }
}

getHistoryData ({
  @required String? date,
  @required String? city,
}) async {
  var dio = Dio();
  print(APIEndpoints.history(date,city));
    final response = await dio.post(
      APIEndpoints.history(date,city),
    );
  if (response.statusCode == 200) {
    return jsonDecode(response.toString());
  }
  else {
    return null;
  }
}

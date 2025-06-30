import 'dart:convert';

import 'package:http/http.dart';

class ApiBaseHelper {
  static const Duration timeoutDuration = Duration(seconds: 50);
  final apiKey = "";

  Future<dynamic> getApiCall(Uri endPoint, Map<String, dynamic>? param) async {
    dynamic responseJson;
    try {
      final finalEndpoint = param != null
          ? endPoint.replace(queryParameters: param)
          : endPoint;

      final response = await get(
        finalEndpoint,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $apiKey",
        },
      ).timeout(timeoutDuration);

      responseJson = _response(response);
    } catch (e) {
      print("GET Error: $e");
      throw Exception('GET request failed');
    }
    return responseJson;
  }

  Future<dynamic> postAPICall(Uri apiEndPoint, Map param) async {
    dynamic responseJson;
    try {
      final response = await post(
        apiEndPoint,
        body: param.isNotEmpty ? jsonEncode(param) : null,
        headers: {
          "Authorization": 'Bearer $apiKey',
          "Content-Type": "application/json",
        },
      ).timeout(timeoutDuration);
      print(param);

      responseJson = _response(response);
      print("POST Response: $responseJson");
    } catch (e) {
      print("POST Error: $e");
      throw Exception('POST request failed');
    }
    return responseJson;
  }

  dynamic _response(Response response) {
    switch (response.statusCode) {
      case 200:
        return json.decode(response.body.toString());
      default:
        throw Exception('Error occurred : ${response.statusCode}');
    }
  }
}

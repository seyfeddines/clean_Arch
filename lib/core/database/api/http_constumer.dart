import 'dart:convert';

import 'package:clean_arch/core/database/api/endpoint.dart';
import 'package:http/http.dart' as http;
import 'api_constumer.dart';

class HttpConsumer extends ApiConsumer {
  final http.Client client;

  HttpConsumer({required this.client});

  // Set the base URL for the API
  final String baseUrl = EndPoint().BaeUrl;

  //! POST request
  @override
  Future post(String path, {dynamic data, Map<String, dynamic>? queryParameters, bool isFormData = false}) async {
    try {
      final uri = Uri.parse('$baseUrl$path').replace(queryParameters: queryParameters);
      final headers = {'Content-Type': 'application/json'};

      // Make the POST request
      final response = await client.post(
        uri,
        headers: headers,
        body: isFormData ? data : jsonEncode(data), // If isFormData is true, handle the form data differently
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        handleHttpException(response);
      }
    } catch (e) {
      handleHttpException(e);
    }
  }

  //! GET request
  @override
  Future get(String path, {Object? data, Map<String, dynamic>? queryParameters}) async {
    try {
      final uri = Uri.parse('$baseUrl$path').replace(queryParameters: queryParameters);
      print("$baseUrl$path");

      // Make the GET request
      final response = await http.get(uri);
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        handleHttpException(response);
      }
    } catch (e) {
      handleHttpException(e);
    }
  }

  //! DELETE request
  @override
  Future delete(String path, {Object? data, Map<String, dynamic>? queryParameters}) async {
    try {
      final uri = Uri.parse('$baseUrl$path').replace(queryParameters: queryParameters);

      // Make the DELETE request
      final response = await client.delete(
        uri,
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        handleHttpException(response);
      }
    } catch (e) {
      handleHttpException(e);
    }
  }

  //! PATCH request
  @override
  Future patch(String path, {dynamic data, Map<String, dynamic>? queryParameters, bool isFormData = false}) async {
    try {
      final uri = Uri.parse('$baseUrl$path').replace(queryParameters: queryParameters);
      final headers = {'Content-Type': 'application/json'};

      // Make the PATCH request
      final response = await client.patch(
        uri,
        headers: headers,
        body: isFormData ? data : jsonEncode(data), // If isFormData is true, handle the form data differently
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        handleHttpException(response);
      }
    } catch (e) {
      handleHttpException(e);
    }
  }

  // Handle exceptions or errors from the HTTP request
  void handleHttpException(dynamic error) {
    // Handle the error based on your requirements
    print("Error: $error");
  }

// Optionally, you can implement other helper methods for the HTTP client, such as handling timeouts, retries, etc.
}

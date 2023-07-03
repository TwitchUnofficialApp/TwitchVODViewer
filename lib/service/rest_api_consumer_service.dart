import 'dart:convert';
import 'package:http/http.dart' as http;

class RestApiConsumerService {

  final String baseUrl;
  final String endpoint;
  final Map<String, String> headers;

  RestApiConsumerService({required this.baseUrl, required this.endpoint, required this.headers});

  Future<String> get() async {
    final response = await http.get(Uri.parse('$baseUrl/$endpoint'), headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<String> post(Map<String, dynamic> body) async {
    final response = await http.post(Uri.parse('$baseUrl/$endpoint'), headers: headers, body: jsonEncode(body));
    if (response.statusCode == 201) {
      return response.body;
    } else {
      throw Exception('Failed to post data');
    }
  }

  Future<String> put(Map<String, dynamic> body) async {
    final response = await http.put(Uri.parse('$baseUrl/$endpoint'), headers: headers, body: jsonEncode(body));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to update data');
    }
  }

  Future<void> delete() async {
    final response = await http.delete(Uri.parse('$baseUrl/$endpoint'), headers: headers);
    if (response.statusCode != 204) {
      throw Exception('Failed to delete data');
    }
  }
}
import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String url, required String? token}) async {
    Map<String, String> headers = {};

    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode}');
    }
  }

  Future<dynamic> post(
      {required String url,
      required dynamic body,
       String? token}) async {
    Map<String, String> headers = {};

    if (token != null) {
      headers.addAll(
          {
            'Authorization': 'Bearer $token'
            // 'Host' :'localhost:8000',
            // 'Date' :'Sat, 29 Oct 2022 10:30:43 GMT',
            // 'Date' :'Sat, 29 Oct 2022 10:30:43 GMT',
            // 'Connection' :'close',
            // 'X-Powered-By' :'PHP/7.4.30',
            // 'Cache-Control' :'no-cache, private',
            // 'Content-Type' :'application/json',
            // 'X-RateLimit-Limit' :'60',
            // 'X-RateLimit-Remaining' :'59',
            // 'Access-Control-Allow-Origin' :'*',
          });
    }
    http.Response response =
        await http.post(Uri.parse(url), body: body, headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      print(data);
      return data;
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode} with body ${jsonDecode(response.body)}');
    }
  }

  Future<dynamic> put(
      {required String url,
      required dynamic body,
      required String? token}) async {
    Map<String, String> headers = {};
    headers.addAll({'Content-Type': 'application/x-www-form-urlencoded'});
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }

    print('url = $url body = $body token = $token ');
    http.Response response =
        await http.put(Uri.parse(url), body: body, headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      print(data);
      return data;
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode} with body ${jsonDecode(response.body)}');
    }
  }
}

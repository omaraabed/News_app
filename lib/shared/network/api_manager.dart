import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news/models/sourcsResponse.dart';

class ApiManager {
  static Future<SourcesResponse> getSources() async {
    Uri URL = Uri.https("newsapi.org", "/v2/top-headlines/sources",
        {"apiKey": "ad670b5f74214407bda99e38054bb2ff"});

    Response response = await http.get(URL);
    var jsonResponse = jsonDecode(response.body);
    SourcesResponse sourcsResponse = SourcesResponse.fromJson(jsonResponse);
    return sourcsResponse;
  }
}

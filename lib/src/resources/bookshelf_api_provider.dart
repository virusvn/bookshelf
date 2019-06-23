import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show Client;
import '../models/response_model.dart';

class BookshelfApiProvider {
    Client client = Client();
    final _apiUrl = 'http://bookshelf.brangista.com/api/v2.0/index.json';

    Future<ResponseModel> fetchGroupList() async {
        final response = await client.get(_apiUrl);
        print(response.body.toString());
        if (response.statusCode == 200) {
            // If the call to the server was successful, parse the JSON, decode from utf8
            return ResponseModel.fromJson(json.decode(utf8.decode(response.bodyBytes)));
        } else {
            // If that call was not successful, throw an error.
            throw Exception('Failed to load api');
        }
    }
}

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show Client;
import '../models/response_model.dart';
import '../models/media.dart';

class BookshelfApiProvider {
  Client client = Client();
  final _apiUrl = 'http://bookshelf.brangista.com/api/v2.0/index.json';
  String _apiMediaUrl = 'http://bookshelf.brangista.com/api/v2.0/media/view/';

  Future<ResponseModel> fetchGroupList() async {
    final response = await client.get(_apiUrl);
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON, decode from utf8
      return ResponseModel.fromJson(
          json.decode(utf8.decode(response.bodyBytes)));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load api');
    }
  }

  Future<MediaModel> fetchMedia(MediaModel media) async {
    final url = _apiMediaUrl + media.id.toString() + ".json";
    final response = await client.get(url);
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON, decode from utf8
      media.magazinesFromJson(json.decode(utf8.decode(response.bodyBytes)));
      return media;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load api');
    }
  }
}

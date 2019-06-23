import 'dart:async';
import 'bookshelf_api_provider.dart';
import '../models/response_model.dart';

class Repository {
  final bookshelfApiProvider = BookshelfApiProvider();

  Future<ResponseModel> fetchAllGroups() => bookshelfApiProvider.fetchGroupList();
}
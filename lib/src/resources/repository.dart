import 'dart:async';
import 'package:bookshelf/src/models/media.dart';

import 'bookshelf_api_provider.dart';
import '../models/response_model.dart';

class Repository {
  final bookshelfApiProvider = BookshelfApiProvider();

  Future<ResponseModel> fetchAllGroups() =>
      bookshelfApiProvider.fetchGroupList();
  Future<MediaModel> fetchMedia(MediaModel media) =>
      bookshelfApiProvider.fetchMedia(media);
}

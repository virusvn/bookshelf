import 'media.dart';

class MediaGroupModel {
  String _separator;
  List<MediaModel> _media_list;

  MediaGroupModel(domain, result) {
    _separator = result["separator"];
    List<MediaModel> _tmp_list = [];
    for (int i = 0; i < result["data"].length; i++) {
      MediaModel media = MediaModel(domain, result["data"][i]);
      _tmp_list.add(media);
    }
    _media_list = _tmp_list;
  }
  String get separator => _separator;
  List<MediaModel> get media_list => _media_list;
}

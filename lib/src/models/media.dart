import 'magazine.dart';

class MediaModel {
  int _id;
  String _name;
  String _image;
  String _updated;
  String _created;
  String _description;
  int _order;
  String _url_test;
  String _url_stg;
  String _url_prod;
  String _analytic_params;
  bool _is_active;
  int _group_id;
  List<int> _magazine_ids = [];
  List<Magazine> _magazines = [];
  String _image_heading;
  String _detail_api;
  String _latest_published_date;

  MediaModel(result) {
    _id = int.parse(result["media"]["id"]);
    _name = result["media"]["name"];
    _image = result["media"]["image"];
    _updated = result["media"]["updated"];
    _created = result["media"]["created"];
    _description = result["media"]["description"];
    _order = int.parse(result["media"]["order"]);
    _url_test = result["media"]["url_test"];
    _url_stg = result["media"]["url_stg"];
    _url_prod = result["media"]["url_prod"];
    _analytic_params = result["media"]["analytics_uri"];
    _is_active = result["media"]["is_active"] == "1";
    _group_id = int.parse(result["media"]["selection_id"]);
    _image_heading = result["media"]["image_heading"];
    _detail_api = result["media"]["StagingMedia"]["_api"];
    _latest_published_date = result["media"]["latest_publish_date"];
    List<int> _tmp_magazine_ids = [];
    for (int i = 0; i < result["magazines"].length; i++) {
      _tmp_magazine_ids.add(int.parse(result["magazines"][i]));
    }
    _magazine_ids = _tmp_magazine_ids;
  }
  List<Magazine> magazinesFromJson(result) {
    List<Magazine> _tmp_magazines = [];
    for (int i = 0; i < result["response"]["magazines"].length; i++) {
      Magazine magazine = Magazine(result["response"]["magazines"][i]);
      _tmp_magazines.add(magazine);
    }
    _magazines = _tmp_magazines;
    return _tmp_magazines;
  }

  int get id => _id;
  String get name => _name;
  String get image => _image;
  String get updated => _updated;
  String get created => _created;
  String get description => _description;
  int get order => _order;
  String get url_test => _url_test;
  String get url_stg => _url_stg;
  String get url_prod => _url_prod;
  String get analytic_params => _analytic_params;
  bool get is_active => _is_active;
  int get group_id => _group_id;
  List<int> get magazine_ids => _magazine_ids;
  List<Magazine> get magazines => _magazines;
  void set magazines(data) {
    _magazines = data;
  }

  String get image_heading => _image_heading;
  String get detail_api => _detail_api;
  String get latest_published_date => _latest_published_date;
}

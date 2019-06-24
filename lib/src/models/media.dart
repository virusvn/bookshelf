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
  List<int> _magazines = [];
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
  List<int> get magazines => _magazines;
  String get image_heading => _image_heading;
  String get detail_api => _detail_api;
  String get latest_published_date => _latest_published_date;
}
